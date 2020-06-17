`timescale 1ns / 100ps
module ROM(
    input [12:0] ADDRESS,
    inout [7:0] DATA,
    input ENABLE,
    input MEM_RD
    );
	
	reg [7:0] data_buf;
	assign DATA = (ENABLE && MEM_RD) ? data_buf : 8'hzz;

	always @*
	begin
		if(MEM_RD && ENABLE)
			case (ADDRESS)
				// LOAD [0]
				13'H0000:	data_buf <= 8'ha0;
				13'H0001:	data_buf <= 8'h20;
				// STORE 1000
				13'H0002:	data_buf <= 8'hd0;
				13'H0003:	data_buf <= 8'h00;
				// LOAD [1]
				13'H0004:	data_buf <= 8'ha0;
				13'H0005:	data_buf <= 8'h21;
				// STORE 1001
				13'H0006:	data_buf <= 8'hd0;
				13'H0007:	data_buf <= 8'h01;
				// LOAD [ff]
				13'H0008:	data_buf <= 8'ha0;
				13'H0009:	data_buf <= 8'h22;
				// STORE 1002
				13'H000a:	data_buf <= 8'hd0;
				13'H000b:	data_buf <= 8'h02;
				// LOAD R2 : LOOP
				13'H000c:	data_buf <= 8'hb0;
				13'H000d:	data_buf <= 8'h01;
				// STORE TEMP
				13'H000e:	data_buf <= 8'hd0;
				13'H000f:	data_buf <= 8'h03;
				// ADD R1
				13'H0010:	data_buf <= 8'h50;
				13'H0011:	data_buf <= 8'h00;
				// STORE R2
				13'H0012:	data_buf <= 8'hd0;
				13'H0013:	data_buf <= 8'h01;
				// LOAD TEMP
				13'H0014:	data_buf <= 8'hb0;
				13'H0015:	data_buf <= 8'h03;
				// STORE R1
				13'H0016:	data_buf <= 8'hd0;
				13'H0017:	data_buf <= 8'h00;
				// XOR LIMIT
				13'H0018:	data_buf <= 8'h90;
				13'H0019:	data_buf <= 8'h02;
				// JRZ
				13'H001a:	data_buf <= 8'h20;
				13'H001b:	data_buf <= 8'h00;
				// JUMP LOOP
				13'H001c:	data_buf <= 8'he0;
				13'H001d:	data_buf <= 8'h0c;
				// HALT
				13'H001e:	data_buf <= 8'h10;
				13'H001f:	data_buf <= 8'h00;
				// 0
				13'H0020:	data_buf <= 8'h00;
				// 1
				13'H0021:	data_buf <= 8'h01;
				// FF
				13'H0022:	data_buf <= 8'h62;
				default: 	data_buf <= 8'bzz;
			endcase
	end

endmodule
