module counter8b_updown(output reg [7:0] count, input clk, reset, dir);
    always @(posedge clk, posedge reset) begin // 异步复位
        if(reset)// 复位
            count <= 8'b0;
        else begin
            if(dir) begin // 递增
                if(count == 8'b1111_1111)
                    count <= 8'b0;  // 循环
                else
                    count <= count + 8'd1;
            end
            else begin  // 递减
                if(count == 8'b0000_0000)
                    count <= 8'b1111_1111;  // 循环
                else
                    count <= count - 8'd1;
            end
        end
    end
endmodule