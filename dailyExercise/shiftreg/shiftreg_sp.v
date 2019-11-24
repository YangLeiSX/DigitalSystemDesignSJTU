module shiftreg_sp(output reg [3:0] dout, input clk, reset, din);
    always @(posedge clk, posedge reset)
    begin
        if(reset)
            dout <= 4'b0;
        else
            dout <= {dout[2:0], din};
    end
endmodule