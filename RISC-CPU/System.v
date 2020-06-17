`timescale 1ns / 100ps
`include "Core.v"
`include "ROM.v"
`include "RAM.v"
`include "AddrDec.v"

module System(
    input CLOCK,
    input RESET,
    output HALT
    );
	
	wire [7:0] DATA;
	wire [12:0] ADDRESS;
	wire MEM_RD;
	wire MEM_WR;
	wire ROM_EN;
	wire RAM_EN;
	
	Core m_core(
		.SYS_CLK(CLOCK),
		.SYS_RST(RESET),
		.HALT(HALT),
		.MEM_WR(MEM_WR),
		.MEM_RD(MEM_RD),
		.DATA(DATA),
		.ADDRESS(ADDRESS));
	
	AddrDec m_addrdec(
		.ADDRESS(ADDRESS),
		.ROM_EN(ROM_EN),
		.RAM_EN(RAM_EN));
	
	RAM m_ram(
		.ENABLE(RAM_EN),
		.ADDRESS(ADDRESS),
		.DATA(DATA),
		.MEM_RD(MEM_RD),
		.MEM_WR(MEM_WR));
	
	ROM m_rom(
		.ENABLE(ROM_EN),
		.ADDRESS(ADDRESS),
		.DATA(DATA),
		.MEM_RD(MEM_RD));
		
endmodule
