module JKFF(output reg q, input j,k,clk, rst_n);

    always @(posedge clk) begin
        if(!rst_n)
            q <= 1'b0;
        else
            case ({j,k})
                2'b10:  q <= 1'b1;
                2'b01:  q <= 1'b0;
                2'b11:  q <= ~q;
                default:;
            endcase
    end
endmodule