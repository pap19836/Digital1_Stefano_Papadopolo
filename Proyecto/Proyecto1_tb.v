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
    a = 0;
    #5 global.reset = 1;
    #10 global.reset = 0;
    #10 a = 1;
    #100 a = 0;
  end

  initial begin
    $dumpfile("Proyecto1_tb.vcd");
    $dumpvars(0, testbench_alarm);
  end
endmodule

//MOVEMENT
module testbench_movement();
  reg l_in, r_in;
  wire [2:0] state_out;
  movement left_right (global.clk, global.reset, l_in, r_in, state_out, dangerLR);

  initial begin
    #150;
    $display("\ntime\t\tclk\treset\tl_in\tr_in\t|\tstate_out");
    $display("--------------------------------");
    $monitor("%g\t\t%b\t%b\t%b\t%b\t|\t%b",
      $time, global.clk, global.reset, l_in, r_in, state_out);
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
    $dumpfile("Proyecto1_tb.vcd");
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
    #15;
  end

  initial begin
    $dumpfile("Proyecto1_tb.vcd");
    $dumpvars(0,testbench_engine);
  end
endmodule // engine

module full_tb();
  reg l_in, r_in, u_in, d_in, f_in, b_in;
  reg [1:0] auto;
  wire [2:0] left_right, up_down;
  wire [1:0] forward_backward;
  wire alarm;

  full full(global.clk, global.reset, l_in, r_in, u_in, d_in, f_in, b_in, auto,
            left_right, up_down, forward_backward, alarm);

  initial begin
    #550;
    $display("\ntime\tclk\treset\tauto\tleft\tright\tup\tdown\tfwd\tbwd|left_right up_down fwd_bwd alarm");
    $display("---------------------------------------------------------------------------------------------------------------");
    $monitor("%g\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b|\t%b\t%b\t%b\t%b",
      $time, global.clk, global.reset, auto, l_in, r_in, u_in, d_in, f_in, b_in, left_right,
              up_down, forward_backward, alarm);
    auto =2'b00;
    l_in = 0; r_in = 0; u_in = 0; d_in = 0; f_in = 0; b_in = 0;
    //testing left_right
    #5 global.reset = 1;
    #10 global.reset = 0;
    #10 l_in = 1;
    #10 l_in = 0;
    #10 u_in = 1;
    #10 u_in = 0;
    #10 r_in = 1;
    #10 r_in = 0;
    #10 d_in = 1;
    #10 d_in = 0;
    auto[1]=1;
    #10 l_in = 1;
    #10 l_in = 0;
    #10 l_in = 1;
    #10 l_in = 0;
    #10 l_in = 1;
    #10 l_in = 0;
    #10 l_in = 1;
    #10 l_in = 0;
    #50;
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
    #50;

    //testing up_down
    #5 global.reset = 1;
    #10 global.reset = 0;
    #10 d_in = 1;
    #10 d_in = 0;
    #10 d_in = 1;
    #10 d_in = 0;
    #10 d_in = 1;
    #10 d_in = 0;
    #10 d_in = 1;
    #10 d_in = 0;
    #50;
    #10 u_in = 1;
    #10 u_in = 0;
    #10 u_in = 1;
    #10 u_in = 0;
    #10 u_in = 1;
    #10 u_in = 0;
    #10 u_in = 1;
    #10 u_in = 0;
    #10 u_in = 1;
    #10 u_in = 0;
    #10 u_in = 1;
    #10 u_in = 0;
    #10 u_in = 1;
    #10 u_in = 0;
    #50;
    //testing forward_backward
    #10 global.reset = 1;
    #10 global.reset = 0;
    #10 b_in = 1;
    #10 b_in = 0;
    #10 f_in = 1;
    #10 f_in = 0;
    #10 global.reset = 1;
    #10 global.reset = 0;
    #10 auto[0]=1;
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
    #20 $finish;
  end

  initial begin
    $dumpfile("Proyecto1_tb.vcd");
    $dumpvars(0, full_tb);
  end
endmodule
