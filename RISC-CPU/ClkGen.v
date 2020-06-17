`timescale 1ns / 100ps
module ClkGen(
    input CLOCK,
    input RESET,
    output reg CLK_FETCH,
    output reg CLK_ALU,
    output CLK_CTRL
    );
	reg [7:0] state;
	parameter
		idle = 8'b0000_0000,
		cycle0 = 8'b0000_0001,
		cycle1 = 8'b0000_0010,
		cycle2 = 8'b0000_0100,
		cycle3 = 8'b0000_1000,
		cycle4 = 8'b0001_0000,
		cycle5 = 8'b0010_0000,
		cycle6 = 8'b0100_0000,
		cycle7 = 8'b1000_0000;
	
	assign CLK_CTRL = ~CLOCK;
	always @(negedge CLOCK)
		if (RESET)
		begin
			CLK_FETCH <= 1'b0;
			CLK_ALU <= 1'b0;
			state <= idle;
		end
		else
			case(state)
				idle:		state <= cycle0;
				cycle0:	begin CLK_ALU <= ~CLK_ALU; state <= cycle1; end
				cycle1:	begin CLK_ALU <= ~CLK_ALU; state <= cycle2; end
				cycle2:	state <= cycle3;
				cycle3:	begin CLK_FETCH <= ~CLK_FETCH; state <= cycle4; end
				cycle4:	state <= cycle5;
				cycle5:  state <= cycle6;
				cycle6:	state <= cycle7;
				cycle7: 	begin CLK_FETCH <= ~CLK_FETCH; state <= cycle0; end
				default: state <= idle;
			endcase
	
endmodule
