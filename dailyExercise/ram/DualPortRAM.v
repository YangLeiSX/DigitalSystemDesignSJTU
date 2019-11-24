module DualPortRAM #( parameter DATA_WIDTH = 8, ADDR_WIDTH = 8)(
        output [DATA_WIDTH-1:0] dout0,
        input [ADDR_WIDTH-1:0] address0,
        input [DATA_WIDTH-1:0] din0,
        input cs0,
        input we0,
        input oe0,
        //////////
        output [DATA_WIDTH-1:0] dout1,
        input [ADDR_WIDTH-1:0] address1,
        input [DATA_WIDTH-1:0] din1,
        input cs1,
        input we1,
        input oe1,
        //////////
        input clk
);
    parameter RAM_DEPTH = 1 << ADDR_WIDTH;
    
    reg [DATA_WIDTH-1:0] mem [0:RAM_DEPTH-1];

    reg [DATA_WIDTH-1:0] data0;
    reg [DATA_WIDTH-1:0] data1;

    // 防止同时写
    always @(posedge clk) begin : MEM_WRITE
        if (cs0 && we0) begin
            mem[address0] <= din0;
        end
        else if( cs1 && we1) begin
            mem[address1] <= din1;
        end
    end

    wire we = we0 | we1;
    // 防止写时读

    assign dout0 = (cs0 && oe0 && !we) ? data0 : 8'bz;
    assign dout1 = (cs1 && oe1 && !we) ? data1 : 8'bz;

    always @(posedge clk) begin: MEM_READ_0
        if( cs0 && oe0 && !we) begin
            data0 <= mem[address0];
        end
        else begin
            data0 <= 8'b0;
        end
    end
    always @(posedge clk) begin: MEM_READ_1
        if( cs1 && oe1 && !we) begin
            data1 <= mem[address1];
        end
        else begin
            data1 <= 8'b0;
        end
    end
endmodule