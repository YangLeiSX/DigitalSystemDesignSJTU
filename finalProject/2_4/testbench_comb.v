`include "comb_str.v"
`include "comb_dataflow.v"
`include "comb_behavior.v"
`include "comb_prim.v"
module testbench_comb();
    reg p_A, p_B, p_C, p_D;
    wire p_Y1, p_Y2, p_Y3, p_Y4;

    comb_str comb1(.Y(p_Y1), .A(p_A), .B(p_B), .C(p_C), .D(p_D));
    comb_dataflow comb2(.Y(p_Y2), .A(p_A), .B(p_B), .C(p_C), .D(p_D));
    comb_behavior comb3(.Y(p_Y3), .A(p_A), .B(p_B), .C(p_C), .D(p_D));
    comb_prim comb4(p_Y4, p_A, p_B, p_C, p_D);

    integer k;
    initial
    begin
        {p_A, p_B, p_C, p_D} = 4'bx;
        #10 {p_A, p_B, p_C, p_D} = 4'b0000;
        for(k = 0; k < 16;k = k + 1)
            #10 {p_A, p_B, p_C, p_D} = {p_A, p_B, p_C, p_D} + 4'd1;
        #10 $finish;
    end

    initial
    begin
        $monitor($time, " ABCD = %b%b%b%b, Y1Y2Y3Y4 = %b%b%b%b",
                        p_A, p_B, p_C, p_D, p_Y1, p_Y2, p_Y3, p_Y4 );
        $dumpfile("testbench_comb.vcd");
        $dumpvars(0, testbench_comb);
    end
endmodule