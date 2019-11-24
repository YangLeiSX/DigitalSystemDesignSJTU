`include "ALU.v"
`timescale 10ns / 1ns

module tb_ALU();
    wire p_c_out;
    wire [7:0] p_sum;
    reg [2:0] p_oper;
    reg [7:0] p_a, p_b;
    reg p_c_in;

    ALU alu(.c_out(p_c_out), .sum(p_sum), .oper(p_oper), .a(p_a), .b(p_b), .c_in(p_c_in));

    integer k;
    initial
    begin
        p_oper = 3'bx;
        for(k = 0; k < 8; k = k + 1)
        begin
            #10;
            p_oper = k;
            {p_a, p_b, p_c_in} = {$random} % (1 << 19);
        end
    end

    initial
    begin
        $monitor($time, " oper=%b, a=%b, b=%b, cin=%b, cout=%b, sum=%b",
                        p_oper, p_a, p_b, p_c_in, p_c_out, p_sum);
        $dumpfile("tb_ALU.vcd");
        $dumpvars(0, tb_ALU);
    end
endmodule