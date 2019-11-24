`include "decoder3x8_3.v"
`timescale 1ns /100ps
// 3-8译码器
module top;
    reg [2:0] sel;
    wire [7:0] line;
    reg enable;

    initial
    begin
        #5 sel= 0;
        forever #5 sel = sel + 1;
    end

    decoder3x8 dec(line, enable, sel[2], sel[1], sel[0]);
    // decoder3x8 dec(line, enable, sel);

    initial 
    begin
        enable = 0;
        #3  enable = 1;
        #11 enable = 0;
        #12 enable = 1;
    end

    initial
        #60 $finish;
    
    initial
        $monitor($time, " en=%b, sel=%b, line=%b", enable, sel, line);

    initial
    begin
        $dumpfile("top.vcd");
        $dumpvars(0,top);
    end

endmodule