/*A=Alarma Armada
C= Puerta y ventana Cerrada
M=Sensor de movimiento Movimiento
E=ENCENDIDA*/


module GateLevel(input wire A, C, M, output wire E);
	
	wire w1, w2;
	not N1(w1,C);
	or O1(w2, w1,M);
	and A1(E, w2, A);
	
endmodule

module Behavioral(input wire A, C, M, output wire E);

	assign E = A&(~C|M);

endmodule