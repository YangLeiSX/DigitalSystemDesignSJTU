module FSM( output reg [1:0] Y,
            input clk, ctrl, reset
            );
    reg [3:0] state;
    parameter IDLE = 4'b0001, START = 4'b0010, STOP = 4'b0100, CLEAR = 4'b1000;

    always @(posedge clk) begin
        if(!reset) begin
            state <= IDLE;
            Y <= 2'b00;
        end
        else
            case (state)
                IDLE:   begin
                            if(ctrl) begin
                                state <= START; Y <= 2'b01;
                            end
                            else
                                state <= IDLE;
                        end
                START:  begin
                            if(!ctrl) begin
                                state <= STOP;  Y <= 2'b10;
                            end
                            else 
                                state <= START;
                        end
                STOP:   begin   
                            if(ctrl) begin  
                                state <= CLEAR; Y <= 2'b11;
                            end
                            else
                                state <= STOP;
                        end
                CLEAR:  begin
                            if(!ctrl) begin
                                state <= IDLE;  Y <= 2'b00;
                            end
                            else    
                                state <= CLEAR;
                        end
                default:    state <= IDLE;
            endcase
    end
endmodule