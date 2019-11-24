module mealy(output reg yout, input clk, rst, xin);
    parameter A = 2'b01, B=2'b10;
    reg [1:0] state;

    always @(posedge clk) begin
        if (~rst)begin state <= A;yout <= 1'b0;end
        else 
            case (state)
                A:  if(xin) begin   yout <= 1'b1; state <= B;   end
                    else    begin   yout <= 1'b0; state <= A;   end
                B:  if(xin) begin   yout <= 1'b0; state <= A;   end
                    else    begin   yout <= 1'b1; state <= B;   end
                default:    begin   yout <= 1'b0; state <= A;   end
            endcase
    end
endmodule