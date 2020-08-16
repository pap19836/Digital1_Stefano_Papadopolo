module testbench();
	reg  S180, S181, S182, S142, S141, S140, S122, S121, S120,
		 S282, S281, S280, S242, S241, S240, S222, S221, S220;
	wire Y18, Y14, Y12, Y28, Y24, Y22;
	Tabla18 T18(Y18, S182, S181, S180);
	Tabla14 T14(Y14, S142, S141, S140);
	Tabla12 T12(Y12, S122, S121, S120);
	Tabla28 T28(Y28, S282, S281, S280);
	Tabla24 T24(Y24, S242, S241, S240);
	Tabla22 T22(Y22, S222, S221, S220);
	
// Tabla 1 MUX8:1	
	initial begin
		$display("Tabla 1 MUX8:1");
		$display("A B C | Y");
		$display("---------");
		$monitor("%b %b %b | %b", S182, S181, S180, Y18);
		S182=0; S181=0; S180=0;
		#1 S180=1;
		#1 S181=1; S180=0;
		#1 S180=1;
		#1 S182=1; S181=0; S180=0;
		#1 S180=1;
		#1 S181=1; S180=0;
		#1 S180=1;
	end

// Tabla 1 MUX4:1
	initial begin
		#8
		$display("\nTabla 1 MUX4:1");
		$display("A B C | Y");
		$display("---------");
		$monitor("%b %b %b | %b", S142, S141, S140, Y14);
		S142=0; S141=0; S140=0;
		#1 S140=1;
		#1 S141=1; S140=0;
		#1 S140=1;
		#1 S142=1; S141=0; S140=0;
		#1 S140=1;
		#1 S141=1; S140=0;
		#1 S140=1;
	end
	
// Tabla 1 MUX2:1
	initial begin
		#16
		$display("\nTabla 1 MUX2:1");
		$display("A B C | Y");
		$display("---------");
		$monitor("%b %b %b | %b", S122, S121, S120, Y12);
		S122=0; S121=0; S120=0;
		#1 S120=1;
		#1 S121=1; S120=0;
		#1 S120=1;
		#1 S122=1; S121=0; S120=0;
		#1 S120=1;
		#1 S121=1; S120=0;
		#1 S120=1;
	end
	
//Tabla 2 MUX8:1
	initial begin
		#24
		$display("\nTabla 2 MUX8:1");
		$display("A B C | Y");
		$display("---------");
		$monitor("%b %b %b | %b", S282, S281, S280, Y28);
		S282=0; S281=0; S280=0;
		#1 S280=1;
		#1 S281=1; S280=0;
		#1 S280=1;
		#1 S282=1; S281=0; S280=0;
		#1 S280=1;
		#1 S281=1; S280=0;
		#1 S280=1;
	end
	
//Tabla 2 MUX4:1
	initial begin
		#32
		$display("\nTabla 2 MUX4:1");
		$display("A B C | Y");
		$display("---------");
		$monitor("%b %b %b | %b", S242, S241, S240, Y24);
		S242=0; S241=0; S240=0;
		#1 S240=1;
		#1 S241=1; S240=0;
		#1 S240=1;
		#1 S242=1; S241=0; S240=0;
		#1 S240=1;
		#1 S241=1; S240=0;
		#1 S240=1;
	end

//Tabla 2 MUX2:1
	initial begin
		#40
		$display("\nTabla 2 MUX2:1");
		$display("A B C | Y");
		$display("---------");
		$monitor("%b %b %b | %b", S222, S221, S220, Y22);
		S222=0; S221=0; S220=0;
		#1 S220=1;
		#1 S221=1; S220=0;
		#1 S220=1;
		#1 S222=1; S221=0; S220=0;
		#1 S220=1;
		#1 S221=1; S220=0;
		#1 S220=1;
		#1 $finish;
	end
	
	initial begin
		$dumpfile("lab05_tb.vcd");
		$dumpvars(0,testbench);
	end
endmodule