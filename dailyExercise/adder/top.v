`include "fwd_adder_8b.v"
`timescale 1ns / 100ps
// 加法器
module top;
    reg [7:0] num1, num2;
    reg cain;
    wire [7:0] sumup; 
    wire caout;

    // fulladd adder(.cout(caout), .sum(sumup), .a(num1), .b(num2), .cin(cain));
    // fwd_adder_4b adder(.sum(sumup), .cout(caout), .a(num1), .b(num2), .cin(cain));
    fwd_adder_8b adder(.sum(sumup), .cout(caout), .a(num1), .b(num2), .cin(cain));
    integer k;

    initial
    begin
        cain = 1'b0;
        {num1,num2} = 16'b0;
        for(k = 0; k < 10; k = k + 1)
        begin
            #5 ;
            {num1,num2} = {$random} % 65535;
            cain = {$random} % 2;
        end
    end

    initial
        $monitor($time, "\t%b + %b + %b = %b%b",
                        adder.a, adder.b, adder.cin, adder.cout, adder.sum);

    initial
    begin
        $dumpfile("top.vcd");
        $dumpvars(0, top);
    end

endmodule                   