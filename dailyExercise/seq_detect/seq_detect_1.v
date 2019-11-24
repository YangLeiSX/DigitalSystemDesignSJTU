module seq_detect(output reg flag, input clk, reset, seq);
    parameter   IDLE = 5'b0_0001, A = 5'b0_0010, B = 5'b0_0010,
                   C = 5'b0_1000, D = 5'b1_0000;
    reg [4:0] state;
    always @(posedge clk, negedge reset) begin
        if(!reset)  begin   flag <= 1'b0;   state <= IDLE;  end
        else begin
            case (state)
                IDLE:   if(seq) begin   flag <= 1'b0;   state <= A; end
                        else    begin   flag <= 1'b0;   state <= IDLE;   end
                   A:   if(seq) begin   flag <= 1'b0;   state <= A; end
                        else    begin   flag <= 1'b0;   state <= B;  end
                   B:   if(seq) begin   flag <= 1'b0;   state <= A; end
                        else    begin   flag <= 1'b0;   state <= C;   end
                   C:   if(seq) begin   flag <= 1'b0;   state <= D; end
                        else    begin   flag <= 1'b0;   state <= IDLE;   end
                   D:   if(seq) begin   flag <= 1'b0;   state <= A; end
                        else    begin   flag <= 1'b1;   state <= B;   end
                default:        begin   flag <= 1'b0;   state <= IDLE;  end
            endcase
        end
    end
endmodule