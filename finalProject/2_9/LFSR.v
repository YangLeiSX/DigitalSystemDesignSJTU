module LFSR(output reg [1:26] q,
            input clk,
            input rst_n,
            input load,
            input [1:26] din
            );
    always @(posedge clk) begin
        if( ~rst_n )
            q <= 8'b0;
        else begin
            if(load)
                q <= (|din) ? din : 8'b0000_0001;
            else begin
                if (q == 8'b0)
                    q <= 8'b0000_0001;
                else begin
                    {q[26], q[25], q[24], q[23]} <= {q[25], q[24], q[23], q[22]};
                    {q[22], q[21], q[20], q[19]} <= {q[21], q[20], q[19], q[18]};
                    {q[18], q[17], q[16], q[15]} <= {q[17], q[16], q[15], q[14]};
                    {q[14], q[13], q[12], q[11]} <= {q[13], q[12], q[11], q[10]};
                    q[10] <= q[9];
                    q[9] <= q[8] ^ q[26];
                    q[8] <= q[7] ^ q[26];
                    q[7] <= q[6];
                    {q[6], q[5], q[4], q[3]} <= {q[5], q[4], q[3], q[2]};
                    q[2] <= q[1] ^ q[26];
                    q[1] <= q[26];
                end
            end
        end
    end
endmodule