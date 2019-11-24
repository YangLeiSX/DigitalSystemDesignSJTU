module ROM( output reg [7:0] data,
            input [3:0] address,
            input en,
            input ce);
    always @(*) begin
        if(en && ce)
            case (address)
                0 :     data = 8'ha;
                1 :     data = 8'h37;
                2 :     data = 8'hf4;
                3 :     data = 8'h0;
                4 :     data = 8'h9;
                5 :     data = 8'hff;
                6 :     data = 8'h11;
                7 :     data = 8'h1;
                8 :     data = 8'h10;
                9 :     data = 8'h15;
                10:     data = 8'h1d;
                11:     data = 8'h25;
                12:     data = 8'h60;
                13:     data = 8'h90;
                14:     data = 8'h70;
                15:     data = 8'h91;
                default:data = 8'hx;
            endcase
        else
            data = 8'hz;
    end
endmodule