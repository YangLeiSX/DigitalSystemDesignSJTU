`include "shiftreg_u.v"
`timescale 1ns / 100ps
// 移位寄存器
module top;
    reg p_clk;
    reg p_reset, p_set;
    reg [1:0] p_sel;
    reg p_in, p_lin, p_rin;
    wire [3:0] p_out;
    reg [3:0] p_pin;

    // shiftreg_ss shreg(.dout(p_out), .clk(p_clk), .reset(p_reset), .din(p_in));
    // shiftreg_sp shreg(.dout(p_out), .clk(p_clk), .reset(p_reset), .din(p_in));
    shiftreg_u sreg(.q(p_out), .d(p_pin), .s(p_sel), .Lin(p_lin), .Rin(p_rin), .clk(p_clk), .rst_n(p_reset));
    initial 
    begin
        p_clk = 1'b0;
        forever
            #5 p_clk = ~p_clk;  
    end

    initial 
    begin
        p_pin = 4'b0101;
        p_reset = 1'b0;
        #3 p_reset = 1'b1;
        #5 p_sel = 2'b11;
        #10 p_sel = 2'b10;
        forever 
            #10 p_sel = {$random} % 2 + 1;
    end
    
    initial
    begin
        p_lin = {$random}%2;
        p_rin = ~p_lin;
        forever
        begin
            #10;
            p_lin = {$random}%2;
            p_rin = ~p_lin;
        end
    end

    initial
        #180 $finish;
    
    initial
        $monitor($time, "sel = %b, dout = %b",
                        p_sel, p_out);
    
    initial 
    begin
        $dumpfile("top.vcd");
        $dumpvars(0, top);
    end
endmodule