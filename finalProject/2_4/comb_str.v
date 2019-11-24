module comb_str(output Y, input A, B, C, D);
    wire Dbar, ORv, ANDv, ORvbar;

    not u10(Dbar, D);
    
    or  u20(ORv, A, D);
    and u21(ANDv, B, C, Dbar);
    
    not u30(ORvbar, ORv);
    
    and u40(Y, ORvbar, ANDv);

endmodule