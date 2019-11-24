module mux4to1(output reg y, input s1,s0,d,c,b,a);
    always @(*)
        if(s1)
            if(s0)  y = d;
            else    y = c;
        else
            if(s0)  y = b;
            else    y = a;
endmodule