`timescale 1ns / 100ps
module PC(
    input RESET,
    input ENABLE,
    input INC,
    input [12:0] ADDR_IR,
    output reg [12:0] ADDR_PC
    );

	always @(posedge INC or posedge RESET)
		if(RESET)
			ADDR_PC <= 13'b0;
		else
			if(ENABLE) 
				ADDR_PC <= ADDR_IR;
			else
				ADDR_PC <= ADDR_PC + 1;
endmodule
