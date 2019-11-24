`include "rom_2.v"
`timescale 1ns / 100ps
module top;
    wire [7:0] p_q;
    reg [3:0] p_addr;
    reg p_en, p_ce;
    
    ROM rom(.data(p_q), .address(p_addr), .en(p_en), .ce(p_ce));
    initial
        p_ce = 1'b1;

    integer k;
    initial begin
        p_en = 1'b0;
        p_addr = 4'b0;
        #5 p_en = 1'b1;
        for(k = 0; k < 16; k = k + 1)
            #5 p_addr = p_addr + 1'b1; 
    end

    initial
        $monitor($time, "addr=%b, data=%b",
                        p_addr, p_q);

    initial
    begin
        $dumpfile("top.vcd");
        $dumpvars(0, top);
    end

endmodule