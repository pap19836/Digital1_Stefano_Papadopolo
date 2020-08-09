module testbench();
	
	reg A1, C1, M1, A2, C2, M2;
	wire E1, E2;
	
	GateLevel GL(A1, C1, M1, E1);
	Behavioral B(A2, C2, M2, E2);
	
/*GateLevel*/
	initial begin
		$display("GateLevel");
		$display("Armada Cerradas Movimiento |  ENCENCIDA");
		$display("---------------------------------------");
		$monitor("\t %b     %b        %b      |     %b", A1, C1, M1, E1);
		A1=0; C1=0; M1=0;
		#1 M1=1;
		#1 C1=1; M1=0;
		#1 M1=1;
		#1 A1=1; C1=0; M1=0;
		#1 M1=1;
		#1 C1=1; M1=0;
		#1 M1=1;
	end
	
/*Behavioral*/
	initial begin
		#8
		$display("Behavioral");
		$display("Armada Cerradas Movimiento |   E");
		$display("--------------------------------");
		$monitor("\t %b     %b        %b      | %b", A2, C2, M2, E2);
		A2=0; C2=0; M2=0;
		#1 M2=1;
		#1 C2=1; M2=0;
		#1 M2=1;
		#1 A2=1; C2=0; M2=0;
		#1 M2=1;
		#1 C2=1; M2=0;
		#1 M2=1;
	end

	initial begin
		$dumpfile("Alarma_Problema_5_tb.vcd");
		$dumpvars(0,testbench);
	end
endmodule