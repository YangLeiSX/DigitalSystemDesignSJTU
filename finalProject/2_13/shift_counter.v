module shift_counter(output reg [7:0] count, input clk, reset);
    reg [9:0] internal;
    reg dir;
    always @(posedge clk) begin
        if(reset) begin
            internal <= 10'b1;
            dir <= 1'b1;
        end
        else begin
            if(dir) begin   
                if(internal == 10'b10_0000_0000)
                    dir <= 1'b0;
                else
                    internal <= internal << 1;
            end
            else begin
                if(internal == 10'b00_0000_0100)
                    dir <= 1'b1;
                else
                    internal <= internal >> 1;
            end
            if(internal <= 10'b00_0000_0100)
                count <= 8'b0000_0001;
            else
                count <= internal[9:2];
        end
    end
endmodule