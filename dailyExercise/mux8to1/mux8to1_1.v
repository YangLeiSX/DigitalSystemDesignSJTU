module mux8to1( output Y, Y_L,
                input [7:0] D,
                input EN_L, A, B, C);
    reg f;
    always @(*) 
    begin
        if(EN_L)    f = 1'b0;
        else
            case ({A,B,C})
                3'b000: f = D[0];
                3'b001: f = D[1];
                3'b010: f = D[2];
                3'b011: f = D[3];
                3'b100: f = D[4];
                3'b101: f = D[5];
                3'b110: f = D[6];
                3'b111: f = D[7];
                default:f = 1'b0;
            endcase
    end
    assign  Y = f,
            Y_L = ~f;
endmodule