`include "mux2x1.v"
`timescale 10ns / 1ns 
module comb_str(output y, input sel, A, B, C, D);
    wire u1v, u2v;

    nand #(3) u1(u1v, A, B);
    nand #(4) u2(u2v, C, D);

    mux2x1 mux(.dout(y), .sel(sel), .din({u2v, u1v}));

endmodule