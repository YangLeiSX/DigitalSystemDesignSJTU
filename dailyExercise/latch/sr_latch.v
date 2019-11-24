module sr_latch(output reg q, qbar, input s, r);
    always @(*) begin
        case ({s,r})
            2'b01:  {q, qbar} <= 2'b01;
            2'b10:  {q, qbar} <= 2'b10;
            2'b11:  {q, qbar} <= 2'bx;
            default ;
        endcase
    end
endmodule