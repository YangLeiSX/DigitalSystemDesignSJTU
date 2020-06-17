`timescale 1ns / 100ps
module ALU(
    input [7:0] ACC_OUT,
    input CLK_ALU,
    input [2:0] OPCODE,
    input [7:0] DATA_BUS,
    output reg [7:0] ALU_OUT,
    output ALU_ZERO_FLAG
    );

	// ∂®“Â RISC CPU ÷∏¡Ó
	parameter 
		HALT = 3'b000,
		JRZ = 3'b001,
		ADD = 3'b010,
		AND = 3'b011,
		XOR = 3'b100,
		LOAD = 3'b101,
		STORE = 3'b110,
		JUMP = 3'b111;
	
	assign ALU_ZERO_FLAG = !ACC_OUT;

	always @(posedge CLK_ALU)
		casex(OPCODE)
			HALT:		ALU_OUT <= ACC_OUT;
			JRZ:     ALU_OUT <= ACC_OUT;
			ADD:     ALU_OUT <= ACC_OUT + DATA_BUS;
			AND:     ALU_OUT <= ACC_OUT & DATA_BUS;
			XOR:     ALU_OUT <= ACC_OUT ^ DATA_BUS;
			LOAD:    ALU_OUT <= DATA_BUS;
			STORE:   ALU_OUT <= ACC_OUT;
			JUMP:    ALU_OUT <= ACC_OUT;
			default: ALU_OUT <= 8'bx;
		endcase
endmodule
