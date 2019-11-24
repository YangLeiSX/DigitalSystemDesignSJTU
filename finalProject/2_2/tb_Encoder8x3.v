`timescale 10ns / 1ns 
`include "Encoder8x3.v"

module tb_Encoder8x3();
    reg [7:0] p_data;
    wire [2:0] p_code;

    Encoder8x3 enc(.data(p_data), .code(p_code));

    integer k;
    initial
    begin
        p_data = 8'b0;
        #10 p_data = 8'b1;
        for(k = 0; k < 8;k = k + 1)
            #10 p_data = p_data * 2;
    end

    initial
    begin
        $monitor($time, " code = %b, data = %b", p_code, p_data);
        $dumpfile("tb_Encoder8x3.vcd");
        $dumpvars(0, tb_Encoder8x3);
    end
endmodule