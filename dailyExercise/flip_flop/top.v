`include "dff_psr_asyn.v"
`timescale 1ns /100ps
// 触发器
module top;
    wire p_q,p_qbar;
    reg p_d, p_clk;
    reg p_r, p_s;
    reg p_en;
    reg p_t;

    // dff_p dff(.q(p_q), .qbar(p_qbar), .d(p_d), .clk(p_clk));
    // dff_pen dff(.q(p_q), .qbar(p_bar), .d(p_d), .clk(p_clk), .en(p_en));
    // tff_p tff(.q(p_q), .qbar(p_qbar), .clk(p_clk), .t(p_t), .rst_n(p_r));
    dff_psr_asyn dff(.q(p_q), .qbar(p_qbar), .clk(p_clk), .d(p_d), .set(p_s), .reset(p_r));

    initial
    begin
        p_d = 0;
        p_r = 1'b0;
        p_s = 1'b0;
        forever 
        begin
            #8   p_d = ~p_d;
        end
    end   

    initial 
    begin
        #30 p_r = 1'b1;
        #2  p_r = 1'b0;
        #23 p_r = 1'b1;
        #2  p_r = 1'b0;
    end
    initial
    begin
        #14 p_s = 1'b1;
        #7  p_s = 1'b0;
    end

    initial
    begin
        p_clk = 0;
        forever 
        begin
            #5.5 p_clk = 1'b1;
            #8   p_clk = 1'b0;
        end
    end   


    initial 
        #100 $finish;

    initial
        $monitor($time, " q=%b",
                        dff.q);

    initial
    begin
        $dumpfile("top.vcd");
        $dumpvars(0, top);
    end
endmodule