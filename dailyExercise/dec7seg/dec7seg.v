module dec7seg(output reg [0:6] seg, input [3:0] code, input BL_L);
    always @(*)
    begin
        if(BL_L)
            case(code)
                0:      seg = 7'b111_1110;
                1:      seg = 7'b011_0000;
                2:      seg = 7'b110_1101;
                3:      seg = 7'b111_1001;
                4:      seg = 7'b011_0011;
                5:      seg = 7'b101_1011;
                6:      seg = 7'b101_1111;
                7:      seg = 7'b111_0000;
                8:      seg = 7'b111_1111;
                9:      seg = 7'b111_0011;
                default:seg = 7'b000_0000;
            endcase
        else
            seg = 7'b000_0000;
    end
endmodule