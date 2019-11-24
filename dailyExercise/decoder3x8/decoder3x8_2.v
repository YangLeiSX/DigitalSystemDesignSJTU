module decoder3x8(output reg [7:0] YL, input EN, input [2:0] DIN);
    always @(*) 
    begin
        if(EN)
        begin
            if(DIN == 0) YL = 8'b1111_1110; else
            if(DIN == 1) YL = 8'b1111_1101; else
            if(DIN == 2) YL = 8'b1111_1011; else
            if(DIN == 3) YL = 8'b1111_0111; else
            if(DIN == 4) YL = 8'b1110_1111; else
            if(DIN == 5) YL = 8'b1101_1111; else
            if(DIN == 6) YL = 8'b1011_1111; else
            if(DIN == 7) YL = 8'b0111_1111; else
            YL = 8'hff;
        end
        else
            YL = 8'b1111_1111;
    end
endmodule