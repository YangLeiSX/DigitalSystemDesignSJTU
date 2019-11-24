module tristate541(Y, A, G1_L, G2_L);
    parameter SIZE = 8;

    output [SIZE-1:0] Y;
    input [SIZE-1:0] A;
    input G1_L,G2_L;

    wire GL;
    
    nor n1(GL, G1_L, G2_L);

    genvar k;
    generate for( k = 0; k < SIZE; k = k+1)
    begin: LOOP
        bufif1 g1(  Y[k], A[k], GL);
    end
    endgenerate
endmodule
