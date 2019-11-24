`include "fwd_adder_4b.v"
module fwd_adder_8b(output cout, output [7:0] sum, input [7:0] a,b, input cin);
    wire c3,c7;
    wire [3:0] s0,s1,a0,a1,b0,b1;

    assign a0 = a[3:0], a1 = a[7:4], b0 = b[3:0], b1 = b[7:4];

    fwd_adder_4b add1(.cout(c3), .sum(s0), .a(a0), .b(b0), .cin(cin));
    fwd_adder_4b add2(.cout(c7), .sum(s1), .a(a1), .b(b1), .cin(c3) );

    assign {cout, sum} = {c7, s1, s0};
endmodule