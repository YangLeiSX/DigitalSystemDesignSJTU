`include "mux2to1_2.v"
// 二选一多路选择器
module top;
reg s,a,b;
wire y;

mux2to1_udp mux(y,s,a,b);

initial
begin
    a = 0;
    b = 1;
end

initial
begin
    s = 0;
    #5 s = 1;
end

initial 
    #10 $finish;

initial
begin
    $dumpfile("top.vcd");
    $dumpvars(0, top);
end

initial
    $monitor($time," s = %b,a = %b,b = %b,y = %b",s,a,b,y);

endmodule
