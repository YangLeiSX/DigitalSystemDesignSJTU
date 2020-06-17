`timescale 1ns / 100ps
module machine(
	// 输出端口声明
	output reg halt,
	output reg inc_pc,
	output reg load_pc,
	output reg load_ir,
	output reg load_acc,
	output reg bus_enable,
	output reg mem_rd,
	output reg mem_wr,

	// 输入端口声明
	input enable,
	input clk_ctrl,
	input alu_zero_flag,
	input [2:0] opcode
	);
	
	// 定义 RISC CPU 指令
	parameter 
		HALT = 3'b000,
		JRZ = 3'b001,
		ADD = 3'b010,
		AND = 3'b011,
		XOR = 3'b100,
		LOAD = 3'b101,
		STORE = 3'b110,
		JUMP = 3'b111;

	// 定义状态机的 8 个状态，每个状态对应一个时钟周期
	parameter 	
		CYCLE0 = 3'b000,
		CYCLE1 = 3'b001,
		CYCLE2 = 3'b010,
		CYCLE3 = 3'b011,
		CYCLE4 = 3'b100,
		CYCLE5 = 3'b101,
		CYCLE6 = 3'b110,
		CYCLE7 = 3'b111;

	reg [2:0] state;

	// 使用控制时钟的负边沿触发状态机的状态转换
	always @(negedge clk_ctrl)
		if (!enable)
		begin
			{ load_acc, load_ir, load_pc, inc_pc } <= 4'b0000;
			{ halt, bus_enable, mem_wr, mem_rd } <= 4'b0000;
			state <= CYCLE0;
		end
		else instruction_cycle; // CPU begin to run

	// 使用任务 instruction_cycle 描述状态机的行为
	task instruction_cycle;
		case (state)
			CYCLE0: // Load high 8 bits instruction
			begin
				{ load_acc, load_ir, load_pc, inc_pc } <= 4'b0100;
				{ halt, bus_enable, mem_wr, mem_rd } <= 4'b0001;
				state <= CYCLE1;
			end
			CYCLE1: // PC increased by one then load low 8 bits instruction
			begin
				{ load_acc, load_ir, load_pc, inc_pc } <= 4'b0101;
				{ halt, bus_enable, mem_wr, mem_rd } <= 4'b0001;
				state <= CYCLE2;
			end
			CYCLE2: // Idle
			begin
				{ load_acc, load_ir, load_pc, inc_pc } <= 4'b0000;
				{ halt, bus_enable, mem_wr, mem_rd } <= 4'b0000;
				state <= CYCLE3;
			end
			CYCLE3: // Next instruction address setup
			begin
				if (opcode == HALT)
					begin
					{ load_acc, load_ir, load_pc, inc_pc } <= 4'b0001;
					{ halt, bus_enable, mem_wr, mem_rd } <= 4'b1000;
					end
				else
					begin
					{ load_acc, load_ir, load_pc, inc_pc } <= 4'b0001;
					{ halt, bus_enable, mem_wr, mem_rd } <= 4'b0000;
					end
				state <= CYCLE4;
			end
			CYCLE4: // Fetch operand
			begin
				if (opcode == JUMP)
				begin
					{ load_acc, load_ir, load_pc, inc_pc } <= 4'b0010;
					{ halt, bus_enable, mem_wr, mem_rd } <= 4'b0000;
				end
				else
					if ((opcode == ADD) || (opcode == AND) ||
						(opcode == XOR) || (opcode == LOAD) )
					begin
						{ load_acc, load_ir, load_pc, inc_pc } <= 4'b0010;
						{ halt, bus_enable, mem_wr, mem_rd } <= 4'b0001;
					end
					else
						if (opcode == STORE)
						begin
							{ load_acc, load_ir, load_pc, inc_pc } <= 4'b0000;
							{ halt, bus_enable, mem_wr, mem_rd } <= 4'b0100;
						end
						else
						begin
							{ load_acc, load_ir, load_pc, inc_pc } <= 4'b0000;
							{ halt, bus_enable, mem_wr, mem_rd } <= 4'b0000;
						end
				state <= CYCLE5;
			end
			CYCLE5: // Operation
			begin
				if ((opcode == ADD) || (opcode == AND) ||
					(opcode == XOR) || (opcode == LOAD) )
				begin
					{ load_acc, load_ir, load_pc, inc_pc } <= 4'b1000;
					{ halt, bus_enable, mem_wr, mem_rd } <= 4'b0001;
				end
				else
					if ((opcode == JRZ) && (alu_zero_flag))
					begin
						{ load_acc, load_ir, load_pc, inc_pc } <= 4'b0001;
						{ halt, bus_enable, mem_wr, mem_rd } <= 4'b0000;
					end
					else
						if (opcode == JUMP)
						begin
							{ load_acc, load_ir, load_pc, inc_pc } <= 4'b0011;
							{ halt, bus_enable, mem_wr, mem_rd } <= 4'b0000;
						end
						else
							if (opcode == STORE)
							begin
								{ load_acc, load_ir, load_pc, inc_pc } <= 4'b0000;
								{ halt, bus_enable, mem_wr, mem_rd } <= 4'b0110;
							end
							else
							begin
								{ load_acc, load_ir, load_pc, inc_pc } <= 4'b0000;
								{ halt, bus_enable, mem_wr, mem_rd } <= 4'b0000;
							end
				state <= CYCLE6;
			end
			CYCLE6: // Idle
			begin
				if (opcode == STORE)
				begin
					{ load_acc, load_ir, load_pc, inc_pc } <= 4'b0000;
					{ halt, bus_enable, mem_wr, mem_rd } <= 4'b0100;
				end
				else
					if ((opcode == ADD) || (opcode == AND) ||
						(opcode == XOR) || (opcode == LOAD) )
					begin
						{ load_acc, load_ir, load_pc, inc_pc } <= 4'b0000;
						{ halt, bus_enable, mem_wr, mem_rd } <= 4'b0001;
					end
					else
					begin
						{ load_acc, load_ir, load_pc, inc_pc } <= 4'b0000;
						{ halt, bus_enable, mem_wr, mem_rd } <= 4'b0000;
					end
				state <= CYCLE7;
			end
			CYCLE7:
			begin
				if ((opcode == JRZ) && (alu_zero_flag == 1))
				begin
					{ load_acc, load_ir, load_pc, inc_pc } <= 4'b0001;
					{ halt, bus_enable, mem_wr, mem_rd } <= 4'b0000;
				end
				else
				begin
					{ load_acc, load_ir, load_pc, inc_pc } <= 4'b0000;
					{ halt, bus_enable, mem_wr, mem_rd } <= 4'b0000;
				end
				state <= CYCLE0;
			end
			default:
			begin
				{ load_acc, load_ir, load_pc, inc_pc } <= 4'b0000;
				{ halt, bus_enable, mem_wr, mem_rd } <= 4'b0000;
				state <= CYCLE0;
			end
		endcase
	endtask
endmodule