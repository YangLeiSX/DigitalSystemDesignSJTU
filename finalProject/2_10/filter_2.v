`include "DFF.v"
`include "JKFF.v"
module filter2(output sig_out, input sig_in, clock, reset);
    wire q0,q1,q2,q3;
    wire q1n,q2n,q3n;
    wire j,k;
    
    DFF ff0(.q(q0), .d(sig_in), .clk(clock), .rst_n(reset)),
        ff1(.q(q1), .d(q0),     .clk(clock), .rst_n(reset)),
        ff2(.q(q2), .d(q1),     .clk(clock), .rst_n(reset)),
        ff3(.q(q3), .d(q2),     .clk(clock), .rst_n(reset));
    
    not u10(q1n, q1),
        u11(q2n, q2),
        u12(q3n, q3);
    
    and u20(j, q1,  q2,  q3),
        u21(k, q1n, q2n, q3n);

    JKFF ff4(.q(sig_out), .j(j), .k(k), .clk(clock), .rst_n(reset));

endmodule