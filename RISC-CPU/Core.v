`timescale 1ns / 1ps
`include "ClkGen.v"
`include "ACC.v"
`include "ALU.v"
`include "AddrMux.v"
`include "BusCTRL.v"
`include "IR.v"
`include "PC.v"
`include "FSMCtrl.v"
`include "machine.v"

module Core(
    input SYS_CLK,
    input SYS_RST,
    output HALT,
    output MEM_RD,
    output MEM_WR,
    inout [7:0] DATA,
    output [12:0] ADDRESS
    );
	
	wire CLK_FETCH;
	wire CLK_ALU;
	wire CLK_CTRL;
	
	wire LOAD_IR;
	wire LOAD_ACC;
	wire LOAD_PC;
	wire INC_PC;
	wire ALU_ZERO_FLAG;
	wire BUS_ENABLE;
	wire SM_ENABLE;
	
	wire [7:0] ALU_OUT;
	wire [7:0] ACC_OUT;
	wire [2:0] OPCODE;
	wire [12:0] ADDR_IR;
	wire [12:0] ADDR_PC;
	
	
	ClkGen m_clkgen(
		.CLOCK(SYS_CLK),
		.RESET(SYS_RST),
		.CLK_FETCH(CLK_FETCH),
		.CLK_ALU(CLK_ALU),
		.CLK_CTRL(CLK_CTRL));
		
	FSMCtrl m_fsmctrl(
		.CLK_FETCH(CLK_FETCH),
		.RESET(SYS_RST),
		.FSM_EN(SM_ENABLE));
	
	machine m_machine(
		.halt(HALT),
		.inc_pc(INC_PC),
		.load_pc(LOAD_PC),
		.load_ir(LOAD_IR),
		.load_acc(LOAD_ACC),
		.bus_enable(BUS_ENABLE),
		.mem_rd(MEM_RD),
		.mem_wr(MEM_WR),
		.enable(SM_ENABLE),
		.clk_ctrl(CLK_CTRL),
		.alu_zero_flag(ALU_ZERO_FLAG),
		.opcode(OPCODE));
	
	PC m_pc(
		.RESET(SYS_RST),
		.ENABLE(LOAD_PC),
		.INC(INC_PC),
		.ADDR_IR(ADDR_IR),
		.ADDR_PC(ADDR_PC));	
		
	IR m_ir(
		.CLK_CTRL(CLK_CTRL),
		.RESET(SYS_RST),
		.ENABLE(LOAD_IR),
		.OPCODE(OPCODE),
		.ADDR_IR(ADDR_IR),
		.DATA_BUS(DATA));
	
	ACC m_acc(
		.CLK_CTRL(CLK_CTRL),
		.RESET(SYS_RST),
		.ENABLE(LOAD_ACC),
		.DATA_BUS(ALU_OUT),
		.ACC_OUT(ACC_OUT));
		
	ALU m_alu(
		.ACC_OUT(ACC_OUT),
		.CLK_ALU(CLK_ALU),
		.OPCODE(OPCODE),
		.DATA_BUS(DATA),
		.ALU_OUT(ALU_OUT),
		.ALU_ZERO_FLAG(ALU_ZERO_FLAG));
	
	AddrMux m_addrmux(
		.CLK_FETCH(CLK_FETCH),
		.ADDR_PC(ADDR_PC),
		.ADDR_IR(ADDR_IR),
		.ADDR(ADDRESS));
	
	BusCTRL m_busctrl(
		.ALU_OUT(ACC_OUT),
		.ENABLE(BUS_ENABLE),
		.DATA_BUS(DATA));
	
endmodule
