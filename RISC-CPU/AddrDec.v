`timescale 1ns / 100ps
module AddrDec(
    input [12:0] ADDRESS,
    output reg ROM_EN,
    output reg RAM_EN
    );
	always @(ADDRESS)
		casex (ADDRESS)
			13'b0_xxxx_xxxx_xxxx:  {RAM_EN, ROM_EN} <= 2'b01;
			13'b1_xxxx_xxxx_xxxx:  {RAM_EN, ROM_EN} <= 2'b10;
			default:	{RAM_EN, ROM_EN} <= 2'b00;
		endcase
endmodule
