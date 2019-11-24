module moore(output reg q, qn, input clk, rst, j, k);
    parameter A = 2'b01, B = 2'b10;
    reg [1:0] state;

    always @(posedge clk) begin
        if(!rst) begin {q, qn} <= 2'b01; state <= A; end 
        else begin    
            case (state)
                A:  begin
                    {q, qn} <= 2'b01;
                    state <= (j == 1'b1) ? B : A;
                    end
                B:  begin
                    {q, qn} <= 2'b10;
                    state <= (k == 1'b1) ? A : B;
                    end
                default: ;
            endcase 
        end
    end
endmodule