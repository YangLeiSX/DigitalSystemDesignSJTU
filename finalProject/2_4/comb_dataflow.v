module comb_dataflow(output Y, input A, B, C, D);
    wire Dbar, ORv, ANDv, ORvbar;

    assign  Dbar = ~D,
            ORv  = A | D,
            ANDv = B & C & Dbar,
            ORvbar = ~ORv,
            Y = ORvbar & ANDv;
endmodule