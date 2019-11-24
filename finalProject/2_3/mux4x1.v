`include "mux2x1.v"
module mux4x1(output dout, input [1:0] sel, input [3:0] din);

    wire [1:0] s;

    mux2x1 u10(.dout(s[0]), .sel(sel[0]), .din(din[1:0]));
    mux2x1 u11(.dout(s[1]), .sel(sel[0]), .din(din[3:2]));

    mux2x1 u20(.dout(dout), .sel(sel[1]), .din(s));

endmodule