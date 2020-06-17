`timescale 1ns / 100ps
module ACC(
    input CLK_CTRL,
    input RESET,
    input ENABLE,
    input [7:0] DATA_BUS,
    output reg [7:0] ACC_OUT
    );
	
	always @(posedge CLK_CTRL)
		if(RESET)
			ACC_OUT <= 8'b0;
		else
			if(ENABLE)
				ACC_OUT <= DATA_BUS;
endmodule
