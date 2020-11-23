module D_Flip_Flop_1(input clk, reset, enable, d,
									   output reg q);
	always@(posedge clk, posedge reset)
	if (reset) q <= 0;
	else if (enable) q <= d;
	else q <= q;
endmodule

module D_Flip_Flop_2(input clk, reset, enable,
										 input [1:0] d,
									   output reg [1:0] q);
	always@(posedge clk, posedge reset)
	if (reset) q <= 2'b0;
	else if (enable) q <= d;
	else q <= q;
endmodule

module D_Flip_Flop_4(input clk, reset, enable,
									   input [3:0] d,
									   output reg [3:0] q);
	always@(posedge clk, posedge reset)
	if (reset) q <= 3'b0;
	else if (enable) q <= d;
	else q <= q;
endmodule

module D_Flip_Flop_8(input clk, reset, enable,
									   input [7:0] d,
									   output reg [7:0] q);
	always@(posedge clk, posedge reset)
	if (reset) q <= 8'b0;
	else if (enable) q <= d;
	else q <= q;
endmodule
