/*Problema11*/
module Problema11(input wire A, B, C, output wire out);

	wire w1, w2, w3, w4, w5 ,w6;
	not N1(w1, A);
	not N2(w2, B);
	not N3(w3, C);
	and A1(w4, w1, w3);
	and A2(w5, A, w2);
	and A3(w6, A, C);
	or O1(out, w4, w5, w6);
	
endmodule

/*Problema12*/
module Problema12(input wire A, B, C, output wire Y);

	assign Y= ~B;
	
endmodule

/*Problema13*/
module Problema13(input wire A, B, C, D, output wire out);

	wire w1, w2 , w3, w4, w5, w6, w7, w8, w9, w10, w11, w12;
	not N1(w1, A);
	not N2(w2, B);
	not N3(w3, C);
	not N4(w4, D);
	and A1(w5, w1, w2, w3, w4);
	and A2(w6, w1, w2, C, D);
	and A3(w7,w1, B, w3, D);
	and A4(w8,w1, B, C, w4);
	and A5(w9, A, B, w3, w4);
	and A6(w10,A, B, C, D);
	and A7(w11,A, w2, w3, D);
	and A8(w12,A, w2, C, w4);
	or O1(out, w5, w6, w7, w8, w9, w10, w11, w12);
	
	
endmodule

/*Problema14*/
module Problema14(input wire A, B, C, D, output wire Y);

	assign Y = (B&D)|(A&C)|(A&~D);

endmodule

/*Problema21*/
module Problema21(input wire A, B, C, D, output wire Y);

	assign Y = (~B&~C&~D)|(A&~D)|(A&~C)|(A&~B);

endmodule

/*Problema22*/
module Problema22(input wire A, B, C, output wire Y);

	assign Y = C | ~B;
	
endmodule

/*Problema23*/
module Problema23(input wire A, B, C, D, output wire out);

	wire w3, w5, w6;
	not N3(w3, C);
	and A1(w5, w3, D);
	and A2(w6, A, D);
	or O1(out, B, w5, w6);
	
endmodule

/*Problema24*/
module Problema24(input wire A, B, C, output wire out);

	wire w1, w3, w4;
	not N1(w1, A);
	not N3(w3, C);
	and A1(w4, w1, w3);
	or O1(out, B, w4);
	
endmodule