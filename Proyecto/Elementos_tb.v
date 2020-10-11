module global;
  reg clk = 1'b0;
  reg reset = 1'b0;
endmodule
module testbench_alarm();
  reg a;
  wire y;
  alarm alarm(global.clk, global.reset, a, y);

  always begin
    #5 global.clk = ~global.clk;
  end
  initial begin
    $display("time\t\tclk\treset\ta\t|\ty");
    $display("--------------------------------");
    $monitor("%g\t\t%b\t%b\t%b\t|\t%b",
      $time, global.clk, global.reset, a, y);
    global.clk = 1;
    global.reset = 0;
    a = 0;
    #5 global.reset = 1;
    #10 global.reset = 0;
    #10 a = 1;
    #100 a = 0;
  end

  initial begin
    $dumpfile("Elementos_tb.vcd");
    $dumpvars(0, testbench_alarm);
  end
endmodule

//MOVEMENT
module testbench_movement();
  reg l_in, r_in;
  wire [2:0] state_out;
  movement left_right (global.clk, global.reset, l_in, r_in, state_out);

  initial begin
    #150;
    $display("\ntime\t\tclk\treset\tl_in\tr_in\t|\tstate_out");
    $display("--------------------------------");
    $monitor("%g\t\t%b\t%b\t%b\t%b\t|\t%b",
      $time, global.clk, global.reset, l_in, r_in, state_out);
    global.reset = 0;
    l_in = 0;
    r_in = 0;
    #5 global.reset = 1;
    #10 global.reset = 0;
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
  end

  initial begin
    $dumpfile("Elementos_tb.vcd");
    $dumpvars(0, testbench_movement);
  end
endmodule

//engine
module testbench_engine ();
  reg b_in, f_in;
  wire [1:0] state_out;
  engine engine(global.clk, global.reset, b_in, f_in, state_out);

  initial begin
    #400;
    $display("\ntime\t\tclk\treset\tb_in\tf_in\t|\tstate_out");
    $display("--------------------------------");
    $monitor("%g\t\t%b\t%b\t%b\t%b\t|\t%b",
      $time, global.clk, global.reset, b_in, f_in, state_out);
    global.reset = 0;
    b_in = 0;
    f_in = 0;
    #5 global.reset = 1;
    #10 global.reset = 0;
    #10 b_in = 1;
    #10 b_in = 0;
    #10 b_in = 1;
    #10 b_in = 0;
    #10 f_in = 1;
    #10 f_in = 0;
    #10 f_in = 1;
    #10 f_in = 0;
    #10 f_in = 1;
    #10 f_in = 0;
    #10 f_in = 1;
    #10 f_in = 0;
    #30 $finish;
  end

  initial begin
    $dumpfile("Elementos_tb.vcd");
    $dumpvars(0,testbench_engine);
  end
endmodule // engine
