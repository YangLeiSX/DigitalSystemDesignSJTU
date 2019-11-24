`include "moore.v"
`include "mealy.v"
`timescale 10ns/ 1ns
module top();
    wire p_flag_moore, p_flag_mealy;
    reg p_din, p_clk, p_rst;

    reg [35:0] data = 36'b1010_1010_0010_1010_1001_1010_0010_1010_1000;

    moore mo(.flag(p_flag_moore), .din(p_din), .clk(p_clk), .rst(p_rst));
    mealy me(.flag(p_flag_mealy), .din(p_din), .clk(p_clk), .rst(p_rst));

    initial begin
        p_clk = 1'b0;
        forever #5 p_clk = ~p_clk;
    end

    integer k;
    initial 
    begin
        p_rst = 1'b1;
        p_din = 1'bx;
        #12 p_rst = 1'b0;
        for(k = 0; k < 36; k = k + 1)
        begin
            p_din = data[0];
            data = data >> 1;
            #10;
        end
        #20 $finish;
    end

    initial begin
        $monitor($time, " rst = %b, din = %b, flag_moore = %b, flag_mealy = %b",
                        p_rst, p_din, p_flag_moore, p_flag_mealy);
        $dumpfile("top.vcd");
        $dumpvars(0, top);
    end
endmodule