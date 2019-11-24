module reg_dff  #(parameter N = 8)
                (output reg [N-1:0] q,input [N-1:0] d, input clk, rst_n);

    always @(posedge clk, negedge rst_n) begin
        if(~rst_n) 
            q <= 1'b0;
        else
            q <= d;
    end
endmodule