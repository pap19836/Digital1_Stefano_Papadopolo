//D_Flip_Flop
module D_Flip_Flop(input clk, reset, enable
				   input [3:0] d,
				   output reg [3:0] q)
	always@(posedge clk, posedge reset)
	if (reset) q <= 4'b0;
	else if (enable) q <= d;
endmodule

module FSM(input a, b,
		   output y);
		   
	reg [1:0] state, nextstate;
	parameter S0 = 2'b00;
	parameter S1 = 2'b01;
	parameter S2 = 2'b10;
	
	always @ (posedge clk, posedge reset)
		if (reset) state <= 0;
		else state <= nextstate;
		
	always @ (*)
		case(state)
			S0: if (a) nextstate = S1;
				else   nextstate = S0;
			S1: if (b) nextstate = S1;
				else   nextstate = S0;
			S2: if (a&b) nextstate = S2;
				else   nextstate = S0;
			default:   nextstate = S0;
		endcase
		
	assign y = (A&B&state == S2);
endmodule

module Gray (input a,
			 output [2:0] y)
	reg [2:0] state, nextstate;
	parameter S0 = 3'b000;
	parameter S1 = 3'b001;
	parameter S2 = 3'b011;
	parameter S3 = 3'b010;
	parameter S4 = 3'b110;
	parameter S5 = 3'b111;
	parameter S6 = 3'b101;
	parameter S7 = 3'b100;
	
	always @ (posedge clk, posedge reset)
		if (reset) state <= 0;
		else state <= nextstate;
	
	always @ (*)
		case(state)
			S0: if (a) nextstate = S1;
				else   nextstate = S7;
			S1: if (a) nextstate = S2;
				else   nextstate = S0;
			S2: if (a) nextstate = S3;
				else   nextstate = S1;
			S3: if (a) nextstate = S4;
				else   nextstate = S2;
			S4: if (a) nextstate = S5;
				else   nextstate = S3;
			S5: if (a) nextstate = S6;
				else   nextstate = S4;
			S6: if (a) nextstate = S7;
				else   nextstate = S5;
			S7: if (a) nextstate = S0;
				else   nextstate = S6;
			default:   nextstate = S0;
			
		endcase
	assign y = state;
endmodule