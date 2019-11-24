module jkff_p(output reg p, pbar, input j, k, clk);
    always @(posedge clk) begin
        case({j,k})
            2'b01:  {q, qbar} <= 2'b01;
            2'b10:  {q, qbar} <= 2'b10;
            2'b11:  {q, qbar} <= {qn, q};
            default ;
        endcase 
    end
endmodule