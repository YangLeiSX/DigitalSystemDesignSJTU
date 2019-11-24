`include "seq_detect.v"
`timescale 10ns/ 1ns
module tb_seq_detect();
    wire p_flag;
    reg p_din, p_clk, p_rst_n;

    reg [35:0] data = 36'b0000_1100_0010_0110_1001_1011_0010_0001_1101;

    seq_detect dec(.flag(p_flag), .clk(p_clk), .din(p_din), .rst_n(p_rst_n));

    initial begin
        p_clk = 1'b1;
        forever #5 p_clk = ~p_clk;
    end

    integer k;
    initial 
    begin
        p_rst_n = 1'b0;
        p_din = 1'bx;
        #7 p_rst_n = 1'b1;
        for(k = 0; k < 36; k = k + 1)
        begin
            #10;
            p_din = data[35];
            data = data << 1;
        end
        #20 $finish;
    end

    initial begin
        $monitor($time, " rst = %b, din = %b, flag = %b",
                        p_rst_n, p_din, p_flag);
        $dumpfile("tb_seq_detect.vcd");
        $dumpvars(0, tb_seq_detect);
    end
endmodule