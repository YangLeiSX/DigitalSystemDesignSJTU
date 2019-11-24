`include "decoder2x4_2.v"
`timescale 1ns / 100ps
// 2-4译码器
module top;
    reg [1:0] sel;
    wire [3:0] line;

    initial
    begin
        #5 sel = 0;

        forever #5 sel = sel + 1;
    end

    decoder2x4 dec(line, sel);

    initial 
        #30 $finish;

    initial
        $monitor($time, " sel is %b, outLine is %b",sel,line);

    initial
    begin
        $dumpfile("top.vcd");
        $dumpvars(0,top);
    end
endmodule