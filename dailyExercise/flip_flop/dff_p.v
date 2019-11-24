module dff_p(output reg q, output qbar, input d, input clk);
    always @(posedge clk) 
    begin
        q <= d;    
    end
    assign qbar = ~q;
endmodule