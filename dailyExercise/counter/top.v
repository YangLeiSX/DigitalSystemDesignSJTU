`include "counter_dec.v"
`timescale 1ns / 100ps
// 计数器
module top;
    wire [3:0] p_cnt;
    wire p_inf, p_sup;
    reg p_clk, p_rst;
    reg p_load, p_dir;
    reg [3:0] p_data;

    // counter_asyn cnt(.count(p_cnt), .clk(p_clk), .rst_n(p_rst));
    counter_dec cnt(.count(p_cnt), .sup(p_sup), .inf(p_inf),
                    .clk(p_clk), .rst_n(p_rst), .load(p_load),
                    .dir(p_dir), .data(p_data));
    initial
    begin
        p_clk = 1'b0;
        forever #5 p_clk = ~p_clk; 
    end

    initial
    begin
        p_rst = 1'b0;
        #12 p_rst = 1'b1;
    end

    initial
    begin
        p_load = 1'b0;
        p_dir = 1'b0;
        p_data = 4'bx;
        #120 p_data = 4'd9;
        #18 p_load = 1'b1;
        #18 p_load = 1'b0;
        #5 p_data = 4'bz; 
        #12 p_dir = 1'b1;
    end

    initial
        #300 $finish;

    initial
        $monitor($time, "rst = %b, count = %b",
                        p_rst, p_cnt);
    
    initial
    begin
        $dumpfile("top.vcd");
        $dumpvars(0, top);
    end
endmodule
