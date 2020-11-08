module D_Flip_Flop_8(input clk, reset, enable,
									   input [7:0] d,
									   output reg [7:0] q);
	always@(posedge clk, posedge reset)
	if (reset) q <= 8'b0;
	else if (enable) q <= d;
endmodule

module D_Flip_Flop_4(input clk, reset, enable,
									   input [3:0] d,
									   output reg [3:0] q);
	always@(posedge clk, posedge reset)
	if (reset) q <= 3'b0;
	else if (enable) q <= d;
endmodule
