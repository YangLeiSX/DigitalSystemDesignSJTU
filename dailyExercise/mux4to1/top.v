`include "mux4to1_3.v"
// 四选一多路选择器
module top;

reg s1,s0;
reg a,b,c,d;
wire y;

mux4to1 mux(y,s1,s0,d,c,b,a);

initial
begin
    s1 = 0;
    s0 = 0;
    a = 0;
    b = 1;
    c = 0;
    d = 1;
end

initial
    forever #5 {s1,s0} = {s1,s0} + 1;

initial
    #25 $finish;

initial
    $monitor($time, " {s1 s0} = %b %b, y = %b",s1,s0,y);

initial
begin
    $dumpfile("top.vcd");
    $dumpvars(0,top);
end
endmodule
