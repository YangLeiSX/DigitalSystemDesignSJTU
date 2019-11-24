`include "filter.v"
`timescale 1ns / 100ps
// 移位寄存器数字滤波器
module top;
    wire p_y;
    reg p_clk, p_rst, p_d;

    filter flt(.y(p_y), .clk(p_clk), .rst_n(p_rst), .din(p_d));

    initial
    begin
        p_clk = 0;
        forever #5 p_clk = ~p_clk;
    end

    initial
    begin
        p_rst = 1'b0;
        #20 p_rst = 1'b1;
    end

    localparam N=40;
    reg [N-1:0] sig = 40'b1101_0010_0000_0111_1001_1111_0000_0001_1100_0010;
    integer k;
    initial 
    begin
        p_d = 1'b0;
        #30;
        for(k = 0; k < N; k = k + 1)
        begin
            #10 p_d = sig[N-1];
            sig = sig << 1;
        end
        $finish;
    end 

    initial
        $monitor($time, "rst = %b, din = %b, y = %b",
                        p_rst, p_d, p_y);

    initial
    begin 
        $dumpfile("top.vcd");
        $dumpvars(0, top);
    end

endmodule