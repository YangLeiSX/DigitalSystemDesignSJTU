`timescale 10ns / 1ns
`include "comb_Y2.v"
module tb_comb_Y2();
    reg p_A, p_B, p_C, p_D;
    wire p_Y;

    comb_Y2 comb(.Y(p_Y), .A(p_A), .B(p_B), .C(p_C), .D(p_D));

    integer k;
    initial
    begin
        {p_A, p_B, p_C, p_D} = 4'bx;
        #10 {p_A, p_B, p_C, p_D} = 4'b0;
        for(k = 0; k < 16; k = k +1)
            #10 {p_A, p_B, p_C, p_D} = {p_A, p_B, p_C, p_D} + 4'b1;
        #10 $finish;
    end

    initial
    begin
        $monitor($time, " ABCD = %b%b%b%b, Y=%b",
                        p_A, p_B, p_C, p_D, p_Y);
        $dumpfile("tb_comb_Y2.vcd");
        $dumpvars(0, tb_comb_Y2);
    end
endmodule