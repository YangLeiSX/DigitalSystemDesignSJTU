module decoder3x8( output [7:0] YL, input EN, C ,B ,A);
    wire [7:0] YH;
    assign  YH[7] = EN & ( C & B & A ),
            YH[6] = EN & ( C & B &~A ),
            YH[5] = EN & ( C &~B & A ),
            YH[4] = EN & ( C &~B &~A ),
            YH[3] = EN & (~C & B & A ),
            YH[2] = EN & (~C & B &~A ),
            YH[1] = EN & (~C &~B & A ),
            YH[0] = EN & (~C &~B &~A );

    assign YL = ~YH;
endmodule