module chanel_sw_8b(output [7:0] y_out, input [7:0] d_in, input ctrl);
    assign y_out = (ctrl == 1'b1) ?  d_in : 8'h00;
endmodule