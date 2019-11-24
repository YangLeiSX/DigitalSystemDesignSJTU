module dff_psr_sync(output reg q, qbar, input d, clk, reset, set);
    always @(posedge clk) begin
        if(reset)
            {q, qbar} <= 2'b01;
        else if(set)
            {q, qbar} <= 2'B10;
        else
            {q, qbar} <= {d, ~d};
    end
endmodule