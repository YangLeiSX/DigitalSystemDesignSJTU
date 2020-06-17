`timescale 1ns / 100ps
module IR(
    input CLK_CTRL,
    input RESET,
    input ENABLE,
	 input [7:0] DATA_BUS,
    output reg [2:0] OPCODE,
    output reg [12:0] ADDR_IR
    );
	
	reg state;
	always @(posedge CLK_CTRL)
		if(RESET)
		begin
			OPCODE <= 3'b0;
			ADDR_IR <= 13'b0;
			state <= 1'b0;
		end
		else 
			if(ENABLE)
				case(state)
					1'b0: begin
								OPCODE <= DATA_BUS[7:5];
								ADDR_IR[12:8] <= DATA_BUS[4:0];
								state <= 1'b1;
							end
					1'b1: begin
								ADDR_IR[7:0] <= DATA_BUS;
								state <= 1'b0;
							end
					default: begin
								OPCODE <= 3'bx;
								ADDR_IR <=13'bx;
								state <= 1'bx;
							end
				endcase
			else
				state <= 1'b0;

endmodule
