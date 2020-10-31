module ejercicio3_tb ();
  reg clk, enable, reset, j, k;
  wire q;

  JK_Flip_Flop JK_Flip_Flop(clk, enable, reset, j, k, q);

  always begin
    #5 clk = ~clk;
  end

  initial begin
  $display("Flip Flop Tipo JK");
  $display("time\t\tclk\tenable\treset\tj\tk\t|\tq");
  $display("---------------------------------------");
  $monitor("%g\t\t%b\t%b\t%b\t%b\t%b\t|\t%b",
    $time, clk, enable, reset, j, k, q);
  clk = 1;
  enable = 1;
  reset = 1;
  j = 0;
  k = 0;
  #5 reset = 0;
  #10 j = 1;
  #50 k = 1;
  #50 j = 0;
  #10 j = 1; k = 0;
  #10 j = 0;
  #30 k = 1;
  #50 $finish;
  end

  initial begin
  $dumpfile("ejercicio3_tb.vcd");
  $dumpvars(0, ejercicio3_tb);
  end

endmodule // ejercicio2_tb
