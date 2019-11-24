`include "LFSR.v"
`timescale 10ns / 1ns
module tb_LFSR();
    reg p_clk;
    reg p_rst_n;
    reg p_load;
    reg [1:26] p_din;
    wire [1:26] p_q;

    LFSR sr(.q(p_q), .clk(p_clk), .rst_n(p_rst_n), .load(p_load), .din(p_din));

    initial 
    begin
        p_clk = 1'b0;
        forever #5 p_clk = ~p_clk;
    end

    initial 
    begin
        p_rst_n = 1'b0;
        p_din = {$random} % (1 << 26);
        #4 p_rst_n = 1'b1;
        #4 p_load = 1'b1;
        #8 p_load = 1'b0;
        #200 $finish; 
    end

    initial
    begin
        $monitor($time, " num is %b",p_q);
        $dumpfile("tb_LFSR.vcd");
        $dumpvars(0, tb_LFSR);
    end
endmodule