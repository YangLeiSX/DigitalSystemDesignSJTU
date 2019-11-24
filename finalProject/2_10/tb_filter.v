`include "filter.v"
// `include "filter_2.v"

module tb_filter();
    wire p_sig_out;
    wire p_sig_out2;
    reg p_sig_in;
    reg p_clock;
    reg p_reset;
    reg [40:0] data;

    filter fil(.sig_out(p_sig_out), .sig_in(p_sig_in), .clock(p_clock), .reset(p_reset));
    // filter2 fil2(.sig_out(p_sig_out2), .sig_in(p_sig_in), .clock(p_clock), .reset(p_reset));

    integer k;
    initial
    begin
        data = 40'b1101_1000_0011_1101_1011_0000_1111_1111_0011_1110;
        p_sig_in = 1'bx;
        #20;
        for(k = 0; k < 40;k = k+1)
        begin
            #10;
            p_sig_in = data[40];
            data = data << 1;
        end
        #10 $finish;
    end

    initial
    begin
        p_reset = 1'b0;
        #15 p_reset = 1'b1;
    end

    initial
    begin   
        p_clock = 1'b0;
        forever #5 p_clock = ~p_clock;
    end

    initial
    begin
        $monitor($time, " reset=%b, sig_in=%b, sig_out=%b",//%b",
                        p_reset, p_sig_in, p_sig_out);//, p_sig_out2);
        $dumpfile("tb_filter.vcd");
        $dumpvars(0, tb_filter);
    end
endmodule
