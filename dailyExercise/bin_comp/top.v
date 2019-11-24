`include "bin_comp_1b.v"
`timescale 1ns / 100ps
// 二进制比较器
module top;
    reg [1:0] in;
    wire eq, gt, lt;

    bin_comp_1b comp(.A_EQ_B(eq), .A_GT_B(gt), .A_LT_B(lt), .A(in[1]), .B(in[0]));

    integer k;
    initial
    begin
        in = 2'b0;
        for(k=0;k < 4;k = k+1)
            #5 in = k;
    end

    initial 
        $monitor($time, " a=%b, b=%b, eq=%b,gt=%b,lt=%b",
                        in[1], in[0], eq,gt,lt);

    initial
    begin 
        $dumpfile("top.vcd");
        $dumpvars(0, top);
    end
endmodule