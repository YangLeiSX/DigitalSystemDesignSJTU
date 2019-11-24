`include "sr_latch.v"
`include "d_latch.v"
`timescale 1ns / 100ps
// 锁存器
module top;
    wire p_q, p_qbar;
    reg p_s, p_r;
    reg p_en;
    // sr_latch latch(.q(p_q), .qbar(p_qbar), .s(p_s), .r(p_r));
    d_latch latch(.q(p_q), .qbar(p_qbar), .d(p_s), .en(p_en));
    
    initial
    begin 
        p_en = 1'b0;
        #12 p_en = 1'b1;
        #8  p_en = 1'b0;
        #30  p_en = 1'b1;
    end

    initial
    begin
        p_s = 0;
        forever 
        begin
            #8 p_s = 1'b1;
            #2 p_s = 1'b0;
        end
    end

    initial
    begin
        #4 p_r = 0;
        forever
        begin
            #8 p_r = 1'b1;
            #2 p_r = 1'b0;
        end
    end 

    initial
        //$monitor($time, "{r,s} = %b%b, q = %b",
        //               p_r, p_s, p_q);
        $monitor($time, "en = %b,s = %b, q = %b",
                      latch.en, latch.d, latch.q);
    initial 
        #80 $finish;

    initial
    begin 
        $dumpfile("top.vcd");
        $dumpvars(0, top);
    end

endmodule 
