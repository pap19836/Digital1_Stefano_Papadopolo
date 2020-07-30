module Tabla1_SOP();
	reg A, B, C;
	wire w1, w2, w3, w4, w5, w6, w7, w8, out;

	not N1(w1, A);
	not N3(w2, B);
	not N4(w3, C);
	and A1(w4, w1, w2, w3);
	and A2(w5, w1, B, w3);
	and A3(w6, A, w2, w3);
	and A4(w7, A, w2, C);
	and A5(w8, A, B, C);
	or O1(out, w4, w5, w6, w7, w8);

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
			$dumpfile("Tabla1_SOP_tb.vcd");
			$dumpvars(0, Tabla1_SOP);
		end

endmodule
