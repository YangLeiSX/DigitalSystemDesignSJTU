`timescale 1ns / 100ps
module AddrMux(
    input CLK_FETCH,
    input [12:0] ADDR_PC,
    input [12:0] ADDR_IR,
    output [12:0] ADDR
    );
		
	assign ADDR = (CLK_FETCH) ? ADDR_PC : ADDR_IR;

endmodule
