`include "wavegen.v"

module tb_wavegen();
    wire p_sig;

    wavegen u(p_sig);

    initial begin
        $monitor($time, " sig = %b", p_sig);
        $dumpfile("tb_wavegen.vcd");
        $dumpvars(0, tb_wavegen);
    end

    initial 
        #100 $finish;
endmodule