`timescale 10ns / 1ns
`include "comb_Y1.v"
module tb_comb_Y1();
    reg p_A, p_B, p_C;
    wire p_Y;

    comb_Y1 comb(.Y(p_Y), .A(p_A), .B(p_B), .C(p_C));

    integer k;
    initial
    begin
        {p_A, p_B, p_C} = 3'bx;
        #10 {p_A, p_B, p_C} = 3'b000;
        for(k = 0; k < 8; k = k +1)
            #10 {p_A, p_B, p_C} = {p_A, p_B, p_C} + 3'b1;
        #10 $finish;
    end

    initial
    begin
        $monitor($time, " ABD = %b%b%b, Y=%b",
                        p_A, p_B, p_C, p_Y);
        $dumpfile("tb_comb_Y1.vcd");
        $dumpvars(0, tb_comb_Y1);
    end
endmodule