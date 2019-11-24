module LFSR(output reg [0:7] q,
            input clk,
            input rst_n,
            input load,
            input [0:7] din
);
    always @(posedge clk) begin
        if(~rst_n)
            q <= 8'b0;
        else begin
            if(load)
                q <= (|din) ? din : 8'b0000_0001;
            else begin
                if( q == 8'b0)
                    q <= 8'b0000_0001;
                else begin
                    q[7] <= q[6];
                    q[6] <= q[5] ^ q[7];
                    q[5] <= q[4] ^ q[7];
                    {q[4], q[3], q[2]} <= {q[3], q[2], q[1]};
                    q[1] <= q[0] ^ q[7];
                    q[0] <= q[7];
                end
            end
        end
    end
endmodule