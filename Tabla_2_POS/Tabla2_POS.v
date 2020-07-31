module Tabla2_POS();
	reg A, B, C;
	wire w1, w2, w3, w4, w5, w6, w7, w8, out;

	not N1(w1, A);
	not N2(w2, B);
	not N3(w3, C);
	or O1(w4, A, B, C);
	or O2(w5, A, w2, C);
	or O3(w6, A, w2, w3);
	or O4(w7, w1, B, C);
	or O5(w8, w1, B, w3);
	and A1(out, w4, w5, w6, w7, w8);


	initial begin
		$display("A B C | Y");
		$display("---------");
		$monitor("%b %b %b | %b", A, B, C, out);
		A=0; B=0; C=0;
		#1 C=1;
		#1 B=1; C=0;
		#1 C=1;
		#1 A=1; B=0; C=0;
		#1 B=0; C=1;
		#1 B=1; C=0;
		#1 C=1;
		#1 $finish;
	end
	initial 
		begin
			$dumpfile("Tabla2_POS_tb.vcd");
			$dumpvars(0, Tabla2_POS);
		end
endmodule