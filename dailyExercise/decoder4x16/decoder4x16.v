`include "../decoder3x8/decoder3x8_1.v"
module decoder4x16(output [15:0] y, input d, c, b, a);
    wire dbar;
    assign dbar = ~d;
    decoder3x8  dec1(y[7:0], dbar, c, b, a),
                dec2(y[15:8],d, c, b ,a);
endmodule