`include "lfsr.v"
`timescale 1ns / 100ps
// 线性反馈移位寄存器
module top;
    wire [0:7] p_q;
    reg [0:7] p_din;
    reg p_clk, p_rst, p_load;

    LFSR shreg(.q(p_q), .clk(p_clk), .rst_n(p_rst), .load(p_load), .din(p_din));

    initial
    begin
        p_clk = 0;
        forever #5 p_clk = ~p_clk;
    end

    initial
    begin
        p_load = 0;
        p_din = 8'b0;
        #88 p_load = 1'b1;
        p_din = 8'b1100_1000;
        #10 p_load = 1'b0;

        #50 p_load = 1'b1;
        p_din = 8'b0;
        #10 p_load = 1'b0;
    end

    initial 
        #200 $finish;

    initial 
        $monitor($time, "load=%b, din=%b, q=%b",
                        p_load, p_din, p_q);

    initial 
    begin   
        $dumpfile("top.vcd");
        $dumpvars(0, top);
    end

endmodule