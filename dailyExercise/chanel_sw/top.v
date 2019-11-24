`include "chanel_sw_8b.v"
`timescale 1ns / 100ps
// 八位数据通道控制器
module top;
    reg [7:0] in;
    wire [7:0] out;
    reg ctr;

    chanel_sw_8b sw(.y_out(out), .d_in(in), .ctrl(ctr));
    
    initial
    begin 
        ctr = 1'b0;
        forever #7 ctr = ~ctr;
    end

    initial
    begin
        in = {$random} % 256;
        forever #5 in = {$random} % 256;;
    end

    initial 
        $monitor($time, "ctr = %b, in is %b, out = %b", 
                        ctr, in, out);

    initial
        #50 $finish;

    initial
    begin
        $dumpfile("top.vcd");
        $dumpvars(0, top);
    end
endmodule