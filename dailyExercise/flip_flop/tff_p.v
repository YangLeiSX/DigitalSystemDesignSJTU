module tff_p(output reg q, qbar, input clk, rst_n, t);
    always @(posedge clk) begin
        if(~rst_n)
            {q, qbar} <= 2'b01;
        else
            if (t)
                {q, qbar} <= {qbar, q};
    end
endmodule