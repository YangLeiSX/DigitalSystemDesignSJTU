module mux8to1(output F, input [2:0] s, input [7:0] d);
    wire w1,w2;

    function y_2x1(input s, b, a);
        y_2x1 = (s) ? b : a;
    endfunction

    function automatic y_4x1(input [1:0] sel, input [3:0] data);
        case (sel)
            2'b00:  y_4x1 = data[0];
            2'b01:  y_4x1 = data[1];
            2'b10:  y_4x1 = data[2];
            2'b11:  y_4x1 = data[3];
            default:y_4x1 = 1'bx;
        endcase
    endfunction

    assign  w1 = y_4x1(s[1:0], d[3:0]),
            w2 = y_4x1(s[1:0], d[7:4]),
            F  = y_2x1(s[2], w2, w1);
endmodule
