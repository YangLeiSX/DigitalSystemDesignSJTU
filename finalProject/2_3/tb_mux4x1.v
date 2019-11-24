`timescale 10ns / 1ns
`include "mux4x1.v"
module tb_mux4x1();
    reg [3:0] p_din;
    reg [1:0] p_sel;
    wire p_dout;

    mux4x1 mux(.dout(p_dout), .sel(p_sel), .din(p_din));

    integer k;
    initial
    begin
        p_din = 4'b1xx0;
        p_sel = 2'b0;
        for(k = 0; k < 4; k = k + 1)
            #10 p_sel = p_sel + 1;
        #10 $finish;
    end

    initial
    begin
        $monitor($time, " din = %b, sel = %b,  dout = %b",
                        p_din, p_sel, p_dout);
        $dumpfile("tb_mux4x1.vcd");
        $dumpvars(0, tb_mux4x1);
    end
endmodule