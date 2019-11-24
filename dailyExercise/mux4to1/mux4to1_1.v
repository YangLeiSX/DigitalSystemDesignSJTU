module mux4to1(output y, input s1,s0,d,c,b,a);
    assign y = (s1) ? ((s0) ? d : c) : ((s0) ? b : a);
endmodule