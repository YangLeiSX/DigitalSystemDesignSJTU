`timescale 10ns / 1ns
module wavegen(output reg sig);
    always begin
        sig <= 1'b0;
        #2  sig <= 1'b1;
        #1  sig <= 1'b0;
        #9  sig <= 1'b1;
        #10 sig <= 1'b0;
        #2  sig <= 1'b1;
        #3  sig <= 1'b0;
        #5  sig <= 1'b1;
    end
    
endmodule