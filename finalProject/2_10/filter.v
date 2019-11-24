
module filter(output reg sig_out, input sig_in, clock, reset);
    reg [3:0] buff;
    always @(posedge clock) begin
        if(!reset)
            buff <= 4'b0;
        else begin
            buff  <= buff << 1;
            buff[0] <= sig_in;
        end
    end
    always @(posedge clock) begin
        if( &buff[3:1] )
            sig_out <= 1'b1;
        else if ( ~|buff[3:1] )
            sig_out <= 1'b0; 
    end
endmodule