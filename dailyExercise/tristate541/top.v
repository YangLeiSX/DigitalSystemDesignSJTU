`include "tristate541.v"
`timescale 1ns / 100ps
// 74x541 8-三态缓冲器
module top;
    wire [7:0] out;
    reg [7:0] in;
    reg en1, en2;

    tristate541 tr1(out, in, en1, en2);

    initial
    begin
        en1 = 1'b1;
        forever #5 en1 = ~en1;
    end

    initial 
    begin
        en2 = 1'b0;
        #5 en2 = 1'b1;
        #5 en2 = 1'b0;
    end

    initial
        forever #6 in = { $random } % 256;

    initial 
        #100 $finish;
    
    initial
        $monitor($time, "in=%b, out=%b, enable=%b%b",
                        in, out, en1, en2);
    
    initial 
    begin
        $dumpfile("top.vcd");
        $dumpvars(0,top);
    end
endmodule