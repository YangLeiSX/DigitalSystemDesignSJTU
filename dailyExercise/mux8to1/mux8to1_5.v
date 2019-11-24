module mux8to1(output reg F, input [2:0] s, input [7:0] d);
    
    task mux2x1(output y2x1, input s, b, a);
        y2x1 = (s) ? b : a;
    endtask

    // 应该定义为自动任务 但是编译不通过emmm
    // task automatic mux4x1(output y4x1, input [1:0] sel, input [3:0] din);
    task mux4x1(output y4x1, input [1:0] sel, input [3:0] din);
        case(sel)
            2'b00:  y4x1 = din[0];
            2'b01:  y4x1 = din[1];
            2'b10:  y4x1 = din[2];
            2'b11:  y4x1 = din[3];
            default:y4x1 = 1'bx;
        endcase
    endtask

    reg w1,w2;

    always @(*)
    begin 
        mux4x1( w1, s[1:0], d[3:0]);
        mux4x1( w2, s[1:0], d[7:4]);
        mux2x1( F,  s[2], w2, w1);
    end
endmodule