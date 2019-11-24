`include "dec_counter.v"
`timescale 10ns / 1ns
module tb_dec_counter();
    reg p_clk;
    reg p_reset;
    wire [3:0] p_count;

    dec_counter counter(.count(p_count), .clk(p_clk), .reset(p_reset));

    initial
    begin
        p_clk = 1'b0;
        #5 p_clk = 1'b1;
        forever #5 p_clk = ~p_clk;
    end

    initial
    begin
        p_reset = 1'b1;
        #5 p_reset = 1'b0;
        #120 p_reset = 1'b1;
        #5  p_reset = 1'b0;
        #50 $finish;
    end

    initial
    begin
        $monitor($time, "count = %b", p_count);
        $dumpfile("tb_dec_counter.vcd");
        $dumpvars(0, tb_dec_counter);
    end
endmodule