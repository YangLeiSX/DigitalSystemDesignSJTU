module counter_asyn #(parameter N=4)(output reg [N-1:0] count, input clk, rst_n);
    always @(posedge clk, posedge rst_n) begin
        if(~rst_n)
            count <= 0;
        else
            count <= count + 1;
    end
endmodule