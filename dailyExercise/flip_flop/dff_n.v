module dff_n(output reg q, output qbar, input d, input clk);
    always @(negedge clk) 
    begin
        q <= d;    
    end
    assign qbar = ~q;
endmodule