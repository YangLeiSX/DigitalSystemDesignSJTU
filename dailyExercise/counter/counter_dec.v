module counter_dec #(parameter N = 4)(
    output reg [N-1:0] count,
    output reg sup, inf,
    input clk, rst_n, load, dir,
    input [N-1:0] data 
);
    always @(posedge clk) begin
        if(~rst_n)
        begin
            count <= 4'b0;
            {inf, sup} <= 2'b00;
        end
        else
            if(!dir)
                if( count < 4'd9)
                begin   
                    count <= count + 4'd1;
                    {inf, sup} = 2'b0;
                end
                else
                begin 
                    count <= 4'b0;
                    {inf,sup} = 2'b01;
                end
            else
                if( count > 4'b0)
                begin
                    count <= count - 4'd1;
                    {inf, sup} <= 2'b0;
                end
                else
                begin
                    count <= 4'd9;
                    {inf, sup} <= 2'b10;
                end
    end
endmodule