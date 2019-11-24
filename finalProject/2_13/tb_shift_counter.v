`include "shift_counter.v"
`timescale 10ns / 1ns
module tb_shift_counter();
    wire [7:0] p_count;
    reg p_clk;
    reg p_reset;

    shift_counter ctr(.count(p_count), .clk(p_clk), .reset(p_reset));

    initial begin
        p_clk = 1'b0;
        forever #5 p_clk = ~p_clk;
    end

    initial begin
        p_reset = 1'b1;
        #15 p_reset = 1'b0;
        #200 p_reset = 1'b1;
        #15 p_reset = 1'b0;
        #200 $finish;
    end

    initial begin
        $monitor($time, "reset=%b, count=%b",
                        p_reset, p_count);
        $dumpfile("tb_shift_counter.vcd");
        $dumpvars(0, tb_shift_counter);
    end
endmodule