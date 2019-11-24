module decoder2x4(output reg [3:0] y, input [1:0] a);
    always@(*)
        case (a)
            0:  y = 1;
            1:  y = 2;
            2:  y = 4;
            3:  y = 8; 
            default: y = 4'bx;
        endcase
endmodule