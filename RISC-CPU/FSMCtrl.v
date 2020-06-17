`timescale 1ns / 100ps
module FSMCtrl(
    input CLK_FETCH,
    input RESET,
    output reg FSM_EN
    );
	
	always @(posedge CLK_FETCH or posedge RESET)
		if (RESET)
			FSM_EN <= 1'b0;
		else
			FSM_EN <= 1'b1;

endmodule
