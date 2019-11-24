module sram(output  [7:0] dout,
            input   [7:0] din,
            input   [7:0] addr,
            input   wr,
            input   rd,
            input   cs
            );
    reg [7:0] mem [255:0];
    reg [7:0] data;

    assign dout = (cs && ~wr && rd )? data : 8'bz;
    always @(*) begin
        if(cs)  // chip select
            case ({wr,rd})
                2'b10:  mem[addr] <= din;   // write
                2'b01:  data <= mem[addr];  // read
                default:;
            endcase
    end
endmodule