module MUX2 (output wire y,
			input wire x0, x1, s);
	assign y = s ? x1:x0;
endmodule

module MUX4 (output wire y,
			 input wire x0, x1, x2, x3, s0, s1);
	wire w1, w2;
	MUX2 S0(w1, x0, x1, s0);
	MUX2 S1(w2, x2, x3, s0);
	MUX2 S2(y, w1, w2, s1);
endmodule

module MUX8 (output wire y,
			 input wire x0, x1, x2, x3, x4, x5, x6, x7, s0, s1, s2);
	wire w1, w2;
	MUX4 S0(w1, x0, x1, x2, x3, s0, s1);
	MUX4 S1(w2, x4, x5, x6, x7, s0, s1);
	MUX2 S2(y, w1, w2, s2);
endmodule

// Tabla 1 MUX8:1
module Tabla18(output wire Y,
			   input wire A, B, C);

	wire H, L;
	assign H = 1;
	assign L = 0;
	MUX8 T18(Y, L, H, H, L, H, L, L, H, C, B, A);
endmodule

// Tabla 1 MUX4:1
module Tabla14(output wire Y,
			   input wire A, B, C);
	wire H, L;
	assign H = 1;
	assign L = 0;
	MUX4 T14(Y, C, ~C, ~C, C, B, A);
endmodule
			   
// Tabla 1 MUX2:1
module Tabla12(output wire Y,
			   input wire A, B, C);
	wire w1, w2;
	assign w1 = B^C;
	assign w2 = ~w1;
	MUX2 T12(Y, w1, w2, A);
	
endmodule
	
// Tabla 2 MUX8:1
module Tabla28(output wire Y,
			   input wire A, B, C);

	wire H, L;
	assign H = 1;
	assign L = 0;
	MUX8 T28(Y, H, L, L, L, H, H, H, L, C, B, A);
endmodule

//Tabla 2 MUX4:1
module Tabla24(output wire Y,
			   input wire A, B, C);
	wire H, L;
	assign H = 1;
	assign L = 0;
	MUX4 T24(Y, ~C, L, H, ~C, B, A);
endmodule

//Tabla 2 Mux2:1
module Tabla22(output wire Y,
			   input wire A, B, C);
	wire w1, w2;
	assign w1 = ~(B|C);
	assign w2 = ~(B&C);
	MUX2 T22(Y, w1, w2, A);
endmodule