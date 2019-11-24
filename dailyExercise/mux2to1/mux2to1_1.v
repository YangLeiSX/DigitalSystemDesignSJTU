module mux2to1(output y,input s,b,a);
    assign y = (s) ? b : a ;
endmodule