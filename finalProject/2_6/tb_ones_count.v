`include "ones_count.v"
`timescale 10ns / 1ns
module tb_ones_count();
    reg [7:0] p_dat_in;
    wire [3:0] p_count;

    ones_count count(.count(p_count), .dat_in(p_dat_in));

    integer k;
    initial
    begin
        p_dat_in = 8'bx;
        #10 p_dat_in = {$random} & 256;
        for(k = 0; k < 8;k = k + 1)
            #10 p_dat_in = {$random} % 256;
        #10 $finish;
    end

    initial
    begin
        $monitor($time,"data = %b, count = %b",
                        p_dat_in, p_count);
        $dumpfile("tb_ones_count.vcd");
        $dumpvars(0, tb_ones_count);
    end
endmodule