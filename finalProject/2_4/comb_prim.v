primitive comb_prim(output Y, input A, input B, input C, input D);
    table
        //  A   B   C   D   :   Y;
            0   0   ?   ?   :   0;
            0   1   0   ?   :   0;
            0   1   1   0   :   1;
            0   1   1   1   :   0;
            1   ?   ?   ?   :   0;
    endtable
endprimitive