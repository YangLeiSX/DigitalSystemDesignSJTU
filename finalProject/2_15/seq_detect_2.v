/*module seq_detect(output reg flag, input din, clk, rst_n);
    reg [8:0] state;
    parameter   IDLE = 9'b0_0000_0001, 
                A0 = 9'b0_0000_0010, A1 = 9'b0_0000_0100,
                A2 = 9'b0_0000_1000, A3 = 9'b0_0001_0000,
                B0 = 9'b0_0010_0000, B1 = 9'b0_0100_0000,
                B2 = 9'b0_1000_0000, B3 = 9'b1_0000_0000;
    always @(negedge clk) begin
        if (!rst_n ) begin state <= IDLE;   flag <= 1'b0; end
        else begin
            case(state)
                IDLE:   if(din) begin state <= A0;  flag <= 1'b0;   end
                        else    begin state <= B0;  flag <= 1'b0;   end
                  A0:   if(din) begin state <= A1;  flag <= 1'b0;   end
                        else    begin state <= B0;  flag <= 1'b0;   end
                  A1:   if(din) begin state <= A1;  flag <= 1'b0;   end
                        else    begin state <= A2;  flag <= 1'b0;   end
                  A2:   if(din) begin state <= A3;  flag <= 1'b1;   end
                        else    begin state <= B0;  flag <= 1'b0;   end
                  A3:   if(din) begin state <= B2;  flag <= 1'b0;   end
                        else    begin state <= B0;  flag <= 1'b0;   end
                  B0:   if(din) begin state <= B1;  flag <= 1'b0;   end
                        else    begin state <= B0;  flag <= 1'b0;   end
                  B1:   if(din) begin state <= B2;  flag <= 1'b0;   end
                        else    begin state <= B0;  flag <= 1'b0;   end
                  B2:   if(din) begin state <= A1;  flag <= 1'b0;   end
                        else    begin state <= B3;  flag <= 1'b1;   end
                  B3:   if(din) begin state <= A3;  flag <= 1'b1;   end
                        else    begin state <= B0;  flag <= 1'b0;   end
                default:        begin state <= IDLE;flag <= 1'b0;   end
            endcase
        end
    end
endmodule
*/
module seq_detect(output reg flag, input din, clk, rst_n);
    reg [8:0] state;
    parameter   IDLE = 9'b0_0000_0001, 
                A0 = 9'b0_0000_0010, A1 = 9'b0_0000_0100,
                A2 = 9'b0_0000_1000, A3 = 9'b0_0001_0000,
                B0 = 9'b0_0010_0000, B1 = 9'b0_0100_0000,
                B2 = 9'b0_1000_0000, B3 = 9'b1_0000_0000;
    always @(negedge clk) begin
        if (!rst_n ) begin state <= IDLE;   flag <= 1'b0; end
        else begin
            case(state)
              IDLE:   state <= (din)? A0: B0;
              A0:       state <= (din)? A1: B0;
              A1:   	state <= (din)? A1: A2;
              A2:   	state <= (din)? A3: B0;
              A3:   	state <= (din)? B2: B0;
              B0:   	state <= (din)? B1: B0;
              B1:   	state <= (din)? B2: B0;
              B2:   	state <= (din)? A1: B3;
              B3:   	state <= (din)? A3: B0;
            default:	state <= IDLE;
            endcase
                    end
    end
    always @(*) begin
	if(state == B3 || state == A3)
            	flag <= 1'b1;
        else flag <= 1'b0;
	end

endmodule
