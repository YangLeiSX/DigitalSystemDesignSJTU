module mux2to1(output reg y, input s, b, a);
    always @(*)
        if (s) y = b;
        else y = a;
endmodule
