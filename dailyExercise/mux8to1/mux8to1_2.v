`include "../mux2to1/mux2to1_1.v"
`include "../mux4to1/mux4to1_1.v"
module mux8to1(output F, input [2:0] s, input [7:0] d);
    wire net1,net2;

    mux4to1 mux1(net1, s[1], s[0], d[3], d[2], d[1], d[0]);
    mux4to1 mux2(net2, s[1], s[0], d[7], d[6], d[5], d[4]);
    mux2to1 mux3(F, s[2], net2, net1);
endmodule