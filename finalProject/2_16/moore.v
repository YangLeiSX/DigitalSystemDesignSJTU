module moore(output reg flag, input din, clk, rst);
    reg [8:0] state;
    parameter   IDLE = 9'b1_0000_0000,
                A = 9'b0_0000_0001, 
                B = 9'b0_0000_0010,
                C = 9'b0_0000_0100, 
                D = 9'b0_0000_1000,
                E = 9'b0_0001_0000, 
                F = 9'b0_0010_0000,
                G = 9'b0_0100_0000, 
                H = 9'b0_1000_0000;
    
    always @(posedge clk, posedge rst) begin
        if( rst ) begin state <= IDLE; flag <= 1'b0;    end
        else begin
            flag <= (state == H) ? 1'b1 : 1'b0;
            case (state)
                IDLE:state <= (din) ? IDLE  : A ; 
                A:   state <= (din) ? B     : A ; 
                B:   state <= (din) ? IDLE  : C ; 
                C:   state <= (din) ? D     : A ; 
                D:   state <= (din) ? IDLE  : E ; 
                E:   state <= (din) ? F     : A ; 
                F:   state <= (din) ? IDLE  : G ; 
                G:   state <= (din) ? H     : A ; 
                H:   state <= (din) ? IDLE  : G ; 
                default:    state <= IDLE;
            endcase
        end
    end
endmodule