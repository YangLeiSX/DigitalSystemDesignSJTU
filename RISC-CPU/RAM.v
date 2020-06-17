`timescale 1ns / 100ps
module RAM(
    inout [7:0] DATA,
    input [12:0] ADDRESS,
    input ENABLE,
    input MEM_RD,
    input MEM_WR
    );
	reg [12:0] offset = 13'h1000;
	reg [7:0] memory [13'h0fff:0];
	reg [7:0] data_buf;
	
	assign DATA = (ENABLE && MEM_RD && !MEM_WR) ? data_buf : 8'bz;
	
	always @(posedge MEM_WR)
	begin
		if(ENABLE && MEM_WR)
			memory[ADDRESS - offset] <= DATA;
	end
	
	always @(posedge MEM_RD)
	begin
		if(ENABLE && MEM_RD)
			data_buf <= memory[ADDRESS - offset];
		else
			data_buf <= 8'bz;
	end
	
endmodule
