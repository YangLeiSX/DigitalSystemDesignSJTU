`include "sram.v"
`timescale 10ns / 1ns 
module tb_sram();
    reg [7:0] p_din;
    reg [7:0] p_addr;
    reg p_wr,p_rd,p_cs;
    wire [7:0] p_dout;

    sram ram(.din(p_din), .addr(p_addr), .wr(p_wr), .rd(p_rd), .cs(p_cs), .dout(p_dout));

    integer k;
    initial begin
        p_cs = 1'b1;
        p_wr = 1'b1;
        p_rd = 1'b0;
        for(k = 0; k < 256;k = k + 1) begin:WRITE
            #10;
            p_addr = k;
            p_din = {$random} % 256;
        end
        #20 p_cs = 1'b0;
        #20 p_cs = 1'b1;
        p_wr = 1'b0;
        p_rd = 1'b1;
        p_din = 8'bz;
        for(k = 0; k < 8; k = k + 1 )begin:READ
            #10;
            p_addr = {$random} % 256;
        end
        #20 $finish;
    end

    initial begin
        $monitor($time, " en=%b%b%b, addr=%d, din=%d, dout=%d",
                        p_cs, p_wr, p_rd, p_addr, p_din, p_dout);
        $dumpfile("tb_sram.vcd");
        $dumpvars(0, tb_sram);
    end
endmodule