module ones_count(output reg [3:0] count, input [7:0] dat_in);
    reg [7:0] data;
    integer k;
    always @(*) begin
        count = 1'b0;
        data = dat_in;
        for(k = 0; k < 8; k = k + 1)
        begin  
            count = count + data[0];
            data = data >> 1;
        end
    end
endmodule