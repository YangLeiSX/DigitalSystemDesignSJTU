`include "mux8to1_5.v"
`timescale 1ns / 100ps
// 八选一多路选择器
module top;
reg p_EN_L, p_A, p_B, p_C;
reg [7:0] p_D;
wire p_Y, p_Y_L;
/*
mux8to1 mux(.Y(p_Y), .Y_L(p_Y_L),
            .D(p_D), .EN_L(p_EN_L),
            .A(p_A), .B(p_B), .C(p_C));
*/
mux8to1 mux(.F(p_Y), .d(p_D), .s({p_A,p_B,p_C}));
integer k;
initial 
begin
    p_EN_L = 1'b1;
    {p_A, p_B, p_C} = 3'b000;
    p_D = 8'b0;

    #5 p_EN_L = 1'b0;

    for( k = 0; k < 16; k = k+1)
    begin
        {p_A, p_B, p_C} = k % 8;
        p_D = { $random } % 256;
        #5;
    end
end

initial 
    $monitor($time, " EN_L = %b, ABC = %b%b%b, D = %b, Y = %b, Y_L = %b",
                        p_EN_L, p_A, p_B, p_C, p_D, p_Y, p_Y_L);

initial
begin  
    $dumpfile("top.vcd");
    $dumpvars(0,top);
end
endmodule