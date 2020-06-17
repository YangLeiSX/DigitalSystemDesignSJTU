`timescale 1ns / 100ps
`include "System.v"

module test_System;

	// Inputs
	reg CLOCK;
	reg RESET;

	// Outputs
	wire HALT;

	// Instantiate the Unit Under Test (UUT)
	System uut (
		.CLOCK(CLOCK), 
		.RESET(RESET), 
		.HALT(HALT)
	);

	initial begin
		CLOCK = 0;
		forever #5 CLOCK = ~CLOCK;
	end
      
	initial begin
		#10500 $finish;
	end

	initial begin
		RESET = 1;
		#100;
		RESET = 0;
	end
endmodule

