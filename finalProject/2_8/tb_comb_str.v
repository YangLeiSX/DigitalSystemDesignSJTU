`include "comb_str.v"
`timescale 10ns / 1ns 
module tb_comb_str();
    reg p_A, p_B, p_C, p_D;
    reg p_sel;
    wire p_y;

    comb_str comb(.y(p_y), .sel(p_sel), .A(p_A), .B(p_B), .C(p_C), .D(p_D));

    initial
    begin
        {p_A, p_B, p_C, p_D} = 4'bx;
        p_sel = 1'b0;
        forever 
        begin
            #10;
            {p_A, p_B, p_C, p_D} = {$random} % 256;
            p_sel = {$random}%2;
        end
    end

    initial
    begin
        $monitor($time, "ABCD=%b%b%b%b, sel = %b, y = %b",
                        p_A, p_B, p_C, p_D, p_sel, p_y);
        $dumpfile("tb_comb_str.vcd");
        $dumpvars(0, tb_comb_str);
        #120 $finish;
    end
endmodule