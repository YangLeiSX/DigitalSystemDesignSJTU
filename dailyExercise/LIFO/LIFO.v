module LIFO(output reg [7:0] dout,
            output reg full,
            output reg empty,
            input clk,
            input clr,
            input [7:0] din,
            input push,
            input pop
            );
    reg [7:0] stack [0:7];
    reg [3:0] addr;

    always @(posedge clk) begin
        if(clr) begin
            dout <= 8'h0;
            addr <= 4'h0;
            full <= 1'b0;
            empty <= 1'b1;
        end
        else begin
            case ({pop, push})
                2'b01:  begin
                        if (! full) begin
                            if(addr < 4'h8) begin
                                stack[addr] <= din;
                                addr <= addr + 1'b1;
                                empty <= 1'b0;
                            end
                            else begin
                                full <= 1'b1;
                            end
                        end
                    end
                2'b10:  begin
                        if(!empty) begin
                            if(addr > 4'h0) begin
                                dout <= stack[addr-1];
                                addr <= addr - 1'h1;
                                full <= 1'b0;
                            end
                            else begin 
                                empty <= 1'b1;
                                dout <= 8'h0;
                            end
                        end
                    end
                default: ;
            endcase
        end
    end
endmodule