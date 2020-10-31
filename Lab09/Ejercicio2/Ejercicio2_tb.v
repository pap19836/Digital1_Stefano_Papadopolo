module ejercicio2_tb ();
  reg clk, enable, reset;
  wire q;

  T_Flip_Flop T_Flip_Flop(clk, enable, reset, q);

  always begin
    #5 clk = ~clk;
  end

  initial begin
  $display("Flip Flop Tipo T");
  $display("time\t\tclk\tenable\treset\t|\tq");
  $display("-----------------------------------");
  $monitor("%g\t\t%b\t%b\t%b\t|\t%b",
    $time, clk, enable, reset, q);
  clk = 1;
  enable = 1;
  reset = 0;
  #5 reset = 1;
  #5 reset = 0;
  #50 enable = 0;
  #20 enable = 1;
  #50 $finish;
  end

  initial begin
  $dumpfile("ejercicio2_tb.vcd");
  $dumpvars(0, ejercicio2_tb);
  end

endmodule // ejercicio2_tb
