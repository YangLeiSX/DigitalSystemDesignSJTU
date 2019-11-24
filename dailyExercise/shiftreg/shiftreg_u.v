module shiftreg_u #(parameter N=4)( 
    output reg [N-1:0] q,
    input [N-1:0] d,
    input [1:0] s,
    input Lin, Rin,
    input clk,rst_n);

    always @(posedge clk) begin
        if(~rst_n)
            q <= 0;
        else
            case(s)
                2'b11:  q <= d;
                2'b10:  q <= {q[N-2:0], Rin};
                2'b01:  q <= {Lin, q[N-1:1]};
                default ;
            endcase
    end
endmodule