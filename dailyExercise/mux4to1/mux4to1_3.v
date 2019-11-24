module mux4to1(output reg y, input s1,s0 ,d,c,b,a);
    always @(*) 
        case({s1,s0})
            2'b00:  y = a;
            2'b01:  y = b;
            2'b10:  y = c;
            2'b11:  y = d;
            default:    y = 1'bx;
        endcase
endmodule
