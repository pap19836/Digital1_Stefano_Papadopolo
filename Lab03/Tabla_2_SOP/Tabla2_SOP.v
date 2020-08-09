module Tabla2_SOP();
	reg A, B, C;
	wire w1, w2, w3, w4, w5, w6, out;

	not N1(w1, A);
	not N2(w2, B);
	not N3(w3, C);
	and A1(w4, w1, w2, C);
	and	A2(w5, A, B, w3);
	and A3(w6, A, B, C);
	or O1(out, w4, w5, w6);


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
			$dumpfile("Tabla2_SOP_tb.vcd");
			$dumpvars(0, Tabla2_SOP);
		end

endmodule