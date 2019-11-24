module decoder3x8(output reg [7:0] YL, input EN, C, B ,A);
    always @(*) 
    begin
        if(EN)
            case({C, B, A})
                0:  YL = 8'b1111_1110;
                1:  YL = 8'b1111_1101;
                2:  YL = 8'b1111_1011;
                3:  YL = 8'b1111_0111;
                4:  YL = 8'b1110_1111;
                5:  YL = 8'b1101_1111;
                6:  YL = 8'b1011_1111;
                7:  YL = 8'b0111_1111;
                default:    YL = 8'HFF;
            endcase
        else
            YL = 8'b1111_1111;
    end
endmodule