`include "FSM.v"
`timescale 1ns / 100ps
module top;
    wire [1:0] p_y;
    reg p_c, p_rst, p_clk;
    reg [7:0] p_data;

    initial begin
        p_clk = 1'b0;
        forever begin
            p_clk = #6  1;
            p_clk = #4  0;
        end 
    end

    initial begin
        p_c = 0;
        forever begin
            #6 p_c = ~p_c;
            p_data = {$random} %256;
            #1 p_rst = p_data[3];
        end
    end

    initial begin
        $monitor($time, " p_y=%b, p_c=%b, p_rst=%b, u0.state=%b",
                        p_y, p_c, p_rst, u0.state);
        $dumpfile("top.vcd");
        $dumpvars(0, top);
        #300 $finish;
    end

    FSM u0(.Y(p_y), .clk(p_clk), .ctrl(p_c), .reset(p_rst));
endmodule