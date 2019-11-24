module dff_psr_asyn(output reg q, qbar, input d, clk, set, reset);
    always @(posedge clk, posedge reset, posedge set) begin
        if(reset)
            {q, qbar} <= 2'b01;
        else if(set)
            {q, qbar} <= 2'b10;
        else
            {q, qbar} <= {d, ~d}; 
    end
endmodule