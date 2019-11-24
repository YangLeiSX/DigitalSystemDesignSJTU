module fulladd(output cout, sum, input a, b, cin);
    wire s1, s2, c1;

    xor u10(s1, a, b);
    and u11(c1, a, b);
    xor u20(sum, s1, cin);
    and u21(s2,  s1, cin);
    or  u30(cout,s2, c1);
endmodule