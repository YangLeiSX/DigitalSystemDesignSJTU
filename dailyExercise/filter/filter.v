module filter(output reg y, input clk, rst_n, din);
    reg [3:0] q;

    always @(posedge clk) begin
        if(!rst_n)
        begin
            q <= 4'b0;
            y <= 1'b0;
        end
        else
        begin
            if (&q[3:1])        y <= 1'b1;
            else if (~|q[3:1])  y <= 1'b0;

            q <= {q[2:0], din};
        end
    end 

endmodule