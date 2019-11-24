module mux2to1(output reg y, input s,b,a);
    always @(*)
        y = (s) ? b : a;
endmodule
