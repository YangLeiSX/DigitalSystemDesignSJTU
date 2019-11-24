`include "counter8b_updown.v"
`timescale 10ns / 1ns
module tb_counter8b_updown();
    wire [7:0] p_count;
    reg p_clk, p_reset, p_dir;

    counter8b_updown counter(.count(p_count), .clk(p_clk), .reset(p_reset), .dir(p_dir));

    initial
    begin
        p_clk = 1'b0;
        forever #5 p_clk = ~p_clk;
    end

    initial
    begin
        p_reset = 1'b1;
        #5 p_reset = 1'b0;
        #400 $finish;
    end

    initial
    begin
        p_dir = 1'b1;
        #80 p_dir = 1'b0;
        #40 p_dir = 1'b1;
    end

    initial 
    begin
        $monitor($time," dir=%b, reset = %b, count=%x",
                        p_dir, p_reset, p_count);
        $dumpfile("tb_counter8b_updown.vcd");
        $dumpvars(0, tb_counter8b_updown);
    end
endmodule