module shiftreg_ss(output reg dout, input clk, reset, din);

    reg [3:0] r;
    always @(posedge clk, posedge reset) begin
        if (reset)
            r <= 4'b0000;
        else begin
            r <= {r[2:0] ,din};
            dout <= r[3];
        end
    end
endmodule