module mealy(output reg flag, input din, clk, rst);
    reg [7:0] p_state, n_state;
    parameter   IDLE = 8'b0000_0001,
                A = 8'b0000_0010,
                B = 8'b0000_0100,
                C = 8'b0000_1000,
                D = 8'b0001_0000,
                E = 8'b0010_0000,
                F = 8'b0100_0000,
                G = 8'b1000_0000;

    always @(posedge clk, posedge rst) begin
        if( rst ) p_state <= IDLE;
        else p_state <= n_state;
        flag <= ((p_state == G ) && (din == 1'b1)) ? 1'b1 : 1'b0 ; 

    end     

    always @(*) begin
        case (p_state)
            IDLE:n_state <= (din) ? IDLE  : A ; 
            A:   n_state <= (din) ? B     : A ; 
            B:   n_state <= (din) ? IDLE  : C ; 
            C:   n_state <= (din) ? D     : A ; 
            D:   n_state <= (din) ? IDLE  : E ; 
            E:   n_state <= (din) ? F     : A ; 
            F:   n_state <= (din) ? IDLE  : G ; 
            G:   n_state <= (din) ? F     : A ; 
            default:n_state <= IDLE;
        endcase
    end  

endmodule