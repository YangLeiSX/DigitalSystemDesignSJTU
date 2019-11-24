module RAM #(parameter DATA_WIDTH = 8, ADDR_WIDTH = 8)(
    output [DATA_WIDTH-1:0] data_out,
    input [ADDR_WIDTH-1:0] address,
    input [DATA_WIDTH-1:0] data_in,
    input clk,
    input cs,
    input we,
    input oe
);
    parameter RAM_DEPTH = 1 << ADDR_WIDTH;

    reg [DATA_WIDTH-1:0] mem [0:RAM_DEPTH-1];
    reg [DATA_WIDTH-1:0] data;
    
    assign data_out = (cs && !we && oe )? data : 8'bz;

    always @(posedge clk) begin
        if(cs)
            case({we, oe})
                2'b01:  data <= mem[address];
                2'b10:  mem[address] <= data_in;
                default ;
            endcase
    end
endmodule