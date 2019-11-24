module bin_comp_1b(output A_EQ_B, A_GT_B, A_LT_B, input A, B);
    assign  A_EQ_B = ~(A ^  B),
            A_GT_B =   A & ~B ,
            A_LT_B =  ~A &  B ;

endmodule