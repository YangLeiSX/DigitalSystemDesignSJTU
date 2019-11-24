module decoder2x4(output [3:0] y, input [1:0] a);
    function [3:0] d2x4(input [1:0] c);
        case(a)
            0:  d2x4 = 1;
            1:  d2x4 = 2;
            2:  d2x4 = 4;
            3:  d2x4 = 8;
            default:    d2x4 = 4'bx;
        endcase
    endfunction

    assign y = d2x4(a);
endmodule