`timescale 10ns / 1ns
`include "mux2x1.v"
module tb_mux2x1();
    reg [1:0] p_din;
    reg p_sel;
    wire p_dout;

    mux2x1 mux(.dout(p_dout), .sel(p_sel), .din(p_din));

    initial
    begin
        p_din = 2'b01;
        p_sel = 1'b1;
        #10 p_sel = 1'b0;
        #10 p_sel = 1'b1;
        #10 $finish;
    end

    initial
    begin
        $monitor($time, " din = %b, sel = %b, dout = %b",
                        p_din, p_sel, p_dout);
        $dumpfile("tb_mux2x1.vcd");
        $dumpvars(0, tb_mux2x1);
    end
endmodule