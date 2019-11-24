module DFF(output reg q, input d, clk, rst_n);
    always @(posedge clk) begin
        if(~rst_n)
            q <= 1'b0;
        else
            q <= d;
    end
endmodule