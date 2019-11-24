primitive mux2to1_udp(f, s, I0, I1);
output f;
input s, I0, I1;
table
//  s   I0  I1  :   f
    0   0   ?   :   0;
    0   1   ?   :   1;
    1   ?   0   :   0;
    1   ?   1   :   1;
    ?   0   0   :   0;
    ?   1   1   :   1;
endtable
endprimitive