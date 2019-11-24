module dff_pen(output reg q, output qbar, input d, input en ,input clk);
    always @(posedge clk) begin
        if( en )
            q<= d;
    end
    assign qn = ~q;
endmodule