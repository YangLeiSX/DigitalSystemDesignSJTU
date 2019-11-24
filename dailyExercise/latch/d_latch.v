module d_latch(output reg q, output qbar, input d, input en);
    always @(*) 
    begin
        if(en)
            q <= d;    
    end
    assign qbar = ~q;
endmodule