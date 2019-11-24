`include "decoder4x16.v"
`timescale 1ns / 100ps
// 4-16译码器
module top;
    reg [3:0] sel;
    wire [15:0] line;

    decoder4x16 dec(line, sel[3], sel[2], sel[1], sel[0]);

    initial
    begin
        #5 sel = 4'b0000;
        forever #5 sel = sel + 1;
    end 

    initial 
        $monitor($time, " sel = %b, line = %b", sel, line);

    initial 
        #90 $finish;

    initial
    begin  
        $dumpfile("top.vcd");
        $dumpvars(0, top);
    end
endmodule