`include "full_adder.v"
module carry_adder(output [3:0] sum, output cout, input [3:0] a, input [3:0] b, input cin);
    wire in[3:0];
    wire out[3:0];
    fulladd u0(out[0], sum[0], a[0], b[0], in[0]),
            u1(out[1], sum[1], a[1], b[1], in[1]),
            u2(out[2], sum[2], a[2], b[2], in[2]),
            u3(out[3], sum[3], a[3], b[3], in[3]);

    assign  in[0] = cin,
            in[1] = out[0],
            in[2] = out[1],
            in[3] = out[2],
            cout = out[3];
endmodule