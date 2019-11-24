`include "encoder8x3.v"
`timcale 1ns / 100ps
// 8输入优先编码器
module top;
    parameter S0 = 0, S1 = 16;

    wire [2:0] p_code;
    wire p_idle;
    reg [7:0] p_data;
    reg p_en;
    reg [15:0] p_din0, p_din1;

    encoder8x3 enc(.idle(p_idle), .code(p_code), .data(p_data), .en(p_en));

    integer k;
    initial
    begin
        p_en = 1'b0;
        p_data = 8'b1111_1111;
        p_din0 = 16'bxxxx_xxxx_0000_0001;

        #5 p_en = 1'b1;
        p_data = p_din0[15:8];
        for( k= S0; k < S1; k = k + 1)
        begin
            #5;
            p_din1 = {p_din0[14:0], p_din0[15]};
            p_din0 = p_din1;
            p_data = p_din0[15:8];
        end
    end

    initial
        $monitor($time, "en = %b, data = %b, code = %b, idel = %b",
                        enc.en, enc.data, enc.code, enc.idle);

endmodule