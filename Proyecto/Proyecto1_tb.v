module testbench_alarm();
  reg clk, reset, a;
  wire y;
  alarm alarm(clk, reset, a, y);

  always begin
    #5 clk = ~clk;
  end
  initial begin
    $display("time\t clk reset state a next y");
    $display("--------------------------------");
    $monitor("%g\t %b %b %b, %b",
      $time, clk, reset, a, y);
    clk = 1;
    reset = 0;
    a = 0;
    #5 reset = 1;
    #10 reset = 0;
    #10 a = 1;
    #100 a = 0;
    #50;
  end

  initial begin
		$dumpfile("Proyecto1_tb.vcd");
		$dumpvars(0,testbench_alarm);
	end
endmodule

//MOVEMENT
module testbench_movement();
  reg clk, reset, l_in, r_in;
  wire state;
  movement left_right (clk, reset, l_in, r_in, state_out);

  always begin
    #5 clk = ~clk;
  end

  initial begin
    $display("time\t clk reset l_in r_in state_out");
    $display("--------------------------------");
    $monitor("%g\t %b %b %b, %b %b",
      $time, clk, reset, l_in, r_in, state_out);
    clk = 1;
    reset = 0;
    l_in = 0;
    r_in = 0;
    #5 reset = 1;
    #10 reset = 0;
    #10 l_in = 1;
    #10 l_in = 0;
    #10 l_in = 1;
    #10 l_in = 0;
    #10 l_in = 1;
    #10 l_in = 0;
    #10 l_in = 1;
    #10 l_in = 0;
    #10 r_in = 1;
    #10 r_in = 0;
    #10 r_in = 1;
    #10 r_in = 0;
    #10 r_in = 1;
    #10 r_in = 0;
    #10 r_in = 1;
    #10 r_in = 0;
    #10 r_in = 1;
    #10 r_in = 0;
    #10 r_in = 1;
    #10 r_in = 0;
    #10 r_in = 1;
    #10 r_in = 0;
    #100 $finish;
  end

  initial begin
    $dumpfile("Proyecto1_tb.vcd");
    $dumpvars(0,testbench_movement);
  end
endmodule
