module dec_counter(output reg [3:0] count, input clk, reset);
    always @(posedge clk) begin
        if( reset )
            count = 4'b0;
        else if(count < 4'd9)
            count = count + 1'd1;
        else
            count = 4'b0;
    end
endmodule