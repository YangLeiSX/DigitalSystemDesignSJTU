module ALU( output reg c_out, 
            output reg [7:0] sum, 
            input [2:0] oper, 
            input [7:0] a, 
            input [7:0] b, 
            input c_in
            );
    always @(*) begin
        case (oper)
            3'b000:     {c_out, sum} <=  a +  b +  c_in;    // and
            3'b001:     {c_out, sum} <=  a + ~b +  c_in;    // subtract 
            3'b010:     {c_out, sum} <=  b + ~a + ~c_in;    // subtract_a
            3'b011:     {c_out, sum} <= {1'b0, a | b  };    // or_ab
            3'b100:     {c_out, sum} <= {1'b0, a & b  };    // and_ab
            3'b101:     {c_out, sum} <= {1'b0, (~a)& b};    // not_ab
            3'b110:     {c_out, sum} <= {1'b0, a ^ b  };    // exor
            3'b111:     {c_out, sum} <= {1'b0, a ~^ b };    //exno
            default:    {c_out, sum} <= 9'bx;
        endcase
    end
endmodule