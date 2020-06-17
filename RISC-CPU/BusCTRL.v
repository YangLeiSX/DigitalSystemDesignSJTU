`timescale 1ns / 100ps
module BusCTRL(
    input [7:0] ALU_OUT,
    input ENABLE,
    output [7:0] DATA_BUS
    );

	assign DATA_BUS = (ENABLE)? ALU_OUT : 8'bz;
	
endmodule
