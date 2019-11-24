`include "seq_detect_1.v"
`timescale 1ns / 100ps
module top;
    wire p_flag;
    reg p_clk, p_rst, p_s;

    initial begin 
        p_rst = 1'b0; 
        #25 p_rst = 1'b1; 
    end

    initial begin 
        p_clk = 0;
        forever #5 p_clk = ~p_clk; 
    end

    parameter SIZE = 32;
    reg [SIZE-1:0] data = 32'b0110_0100_1000_0100_1010_1011_0001_0100;

    initial begin: SERIES
        integer i;
        #1 p_s = 0;
        #30;
        for(i = 0;i < SIZE; i = i + 1) begin
            p_s = data[SIZE-1];
            data = data << 1;
            #20;
        end
        #30 $finish;
    end

    seq_detect u(.flag(p_flag), .clk(p_clk), .reset(p_rst), .seq(p_s));

    initial begin
        $monitor($time, " reset=%b, flag=%b, seq=%b, state=%b",
                        p_rst, p_flag, u.seq, u.state);
        $dumpfile("top.vcd");
        $dumpvars(0, top);
    end
endmodule