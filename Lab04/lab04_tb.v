module testbench();

	reg p111, p112, p113, p121, p122, p123, p131, p132, p133, p134,
		p141, p142, p143, p144, p211, p212, p213, p214, p221, p222,
		p223, p231, p232, p233, p234, p241, p242, p243;
	wire Y11, Y12, Y13, Y14, Y21, Y22, Y23, Y24;
	
	Problema11 P11(p111, p112, p113, Y11);
	Problema12 P12(p121, p122, p123, Y12);
	Problema13 P13(p131, p132, p133, p134, Y13);
	Problema14 P14(p141, p142, p143, p144, Y14);
	Problema21 P21(p211, p212, p213, p214, Y21);
	Problema22 P22(p221, p222, p223, Y22);
	Problema23 P23(p231, p232, p233, p234, Y23);
	Problema24 P24(p241, p242, p243, Y24);

/*Problema11*/
	initial begin
		$display("Problema1.1");
		$display("A B C | Y");
		$display("---------");
		$monitor("%b %b %b | %b", p111, p112, p113, Y11);
		p111=0; p112=0; p113=0;
		#1 p113=1;
		#1 p112=1; p113=0;
		#1 p113=1;
		#1 p111=1; p112=0; p113=0;
		#1 p113=1;
		#1 p112=1; p113=0;
		#1 p113=1;
	end
	
/*Problema12*/
	initial begin
		#8
		$display("\nProblema1.2");
		$display("A B C | Y");
		$display("---------");
		$monitor("%b %b %b | %b", p121, p122, p123, Y12);
		p121=0; p122=0; p123=0;
		#1 p123=1;
		#1 p122=1; p123=0;
		#1 p123=1;
		#1 p121=1; p122=0; p123=0;
		#1 p122=0; p123=1;
		#1 p122=1; p123=0;
		#1 p123=1;
	end 
	
/*Problema13*/
	initial begin
		#16
		$display("\nProblema1.3");
		$display("A B C D | Y");
		$display("-----------");
		$monitor("%b %b %b %b | %b", p131, p132, p133, p134, Y13);
		p131=0; p132=0; p133=0; p134=0;
		#1 p134=1;
		#1 p133=1; p134=0;
		#1 p134=1;
		#1 p132=1; p133=0; p134=0;
		#1 p134=1;
		#1 p133=1; p134=0;
		#1 p134=1;
		#1 p131=1; p132=0; p133=0; p134=0;
		#1 p134=1;
		#1 p133=1; p134=0;
		#1 p134=1;
		#1 p132=1; p133=0; p134=0;
		#1 p134=1;
		#1 p133=1; p134=0;
		#1 p134=1;
	end
	
/*Problema14*/
	initial begin
		#32
		$display("\nProblema1.4");
		$display("A B C D | Y");
		$display("-----------");
		$monitor("%b %b %b %b | %b", p141, p142, p143, p144, Y14);
		p141=0; p142=0; p143=0; p144=0;
		#1 p144=1;
		#1 p143=1; p144=0;
		#1 p144=1;
		#1 p142=1; p143=0; p144=0;
		#1 p144=1;
		#1 p143=1; p144=0;
		#1 p144=1;
		#1 p141=1; p142=0; p143=0; p144=0;
		#1 p144=1;
		#1 p143=1; p144=0;
		#1 p144=1;
		#1 p142=1; p143=0; p144=0;
		#1 p144=1;
		#1 p143=1; p144=0;
		#1 p144=1;
	end
	
/*Problema21*/
	initial begin
		#48
		$display("\nProblema2.1");
		$display("A B C D | Y");
		$display("-----------");
		$monitor("%b %b %b %b | %b", p211, p212, p213, p214, Y21);
		p211=0; p212=0; p213=0; p214=0;
		#1 p214=1;
		#1 p213=1; p214=0;
		#1 p214=1;
		#1 p212=1; p213=0; p214=0;
		#1 p214=1;
		#1 p213=1; p214=0;
		#1 p214=1;
		#1 p211=1; p212=0; p213=0; p214=0;
		#1 p214=1;
		#1 p213=1; p214=0;
		#1 p214=1;
		#1 p212=1; p213=0; p214=0;
		#1 p214=1;
		#1 p213=1; p214=0;
		#1 p214=1;
	end
	
/*Problema22*/
	initial begin
		#64
		$display("\nProblema2.2");
		$display("A B C | Y");
		$display("---------");
		$monitor("%b %b %b | %b", p221, p222, p223, Y22);
		p221=0; p222=0; p223=0;
		#1 p223=1;
		#1 p222=1; p223=0;
		#1 p223=1;
		#1 p221=1; p222=0; p223=0;
		#1 p223=1;
		#1 p222=1; p223=0;
		#1 p223=1;
	end 

/*Problema23*/
	initial begin
		#72
		$display("\nProblema2.3");
		$display("A B C D | Y");
		$display("-----------");
		$monitor("%b %b %b %b | %b", p231, p232, p233, p234, Y23);
		p231=0; p232=0; p233=0; p234=0;
		#1 p234=1;
		#1 p233=1; p234=0;
		#1 p234=1;
		#1 p232=1; p233=0; p234=0;
		#1 p234=1;
		#1 p233=1; p234=0;
		#1 p234=1;
		#1 p231=1; p232=0; p233=0; p234=0;
		#1 p234=1;
		#1 p233=1; p234=0;
		#1 p234=1;
		#1 p232=1; p233=0; p234=0;
		#1 p234=1;
		#1 p233=1; p234=0;
		#1 p234=1;
	end
	
/*Problema24*/
	initial begin
		#88
		$display("\nProblema2.4");
		$display("A B C | Y");
		$display("---------");
		$monitor("%b %b %b | %b", p241, p242, p243, Y24);
		p241=0; p242=0; p243=0;
		#1 p243=1;
		#1 p242=1; p243=0;
		#1 p243=1;
		#1 p241=1; p242=0; p243=0;
		#1 p243=1;
		#1 p242=1; p243=0;
		#1 p243=1;
		#1 $finish;
	end
	
	initial begin
		$dumpfile("lab04_tb.vcd");
		$dumpvars(0,testbench);
	end
endmodule