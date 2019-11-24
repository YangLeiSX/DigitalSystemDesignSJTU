module comb_behavior(output Y, input A, B, C, D);
    reg Dbar, ORv, ANDv, ORvbar;
    reg Y;
    always @(*) begin
        Dbar = ~D;
        ORv  = A | D;
        ANDv = B & C & Dbar;
        ORvbar = ~ORv;
        Y = ORvbar & ANDv;
    end
endmodule