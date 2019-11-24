`include "dec7seg.v"
// 七段数码管译码器
module top;
    reg [3:0] bcd;
    wire [0:6] led;
    reg enable;

    dec7seg dec(led, bcd, enable);

    initial
    begin 
        enable = 0;
        #3 enable = 1;
        #85 enable = 0;
    end

    initial
    begin
        #5 bcd = 0;
        forever #5 bcd = (bcd + 1) % 10;
    end

    initial 
        $monitor($time, "en = %b, bcd is %b, seg = %b", enable, bcd, led);

    initial
        #100 $finish;

    initial
    begin
        $dumpfile("top.vcd");
        $dumpvars(0, top);
    end
endmodule