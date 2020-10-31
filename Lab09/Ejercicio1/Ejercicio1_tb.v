module ejercicio1_tb ();
  reg clk, enable, reset, d;
  reg [1:0] d2;
  reg [3:0] d4;
  wire q;
  wire [1:0] q2;
  wire [3:0] q4;

  D_Flip_Flop D_Flip_Flop(clk, enable, reset, d, q);
  D_Flip_Flop_2bits D_Flip_Flop_2bits(clk, enable, reset, d2, q2);
  D_Flip_Flop_4bits D_Flip_Flop_4bits(clk, enable, reset, d4, q4);

  always begin
    #5 clk = ~clk;
  end

  initial begin
  $display("Flip Flop Tipo D - 1 Bit");
  $display("time\t\tclk\tenable\treset\td\t|\tq");
  $display("-----------------------------------");
  $monitor("%g\t\t%b\t%b\t%b\t%b\t|\t%b",
    $time, clk, enable, reset, d, q);
  clk = 1;
  enable = 1;
  reset = 0;
  d = 0;
  #10 d = 1;
  #20 d = 0;
  #20 d = 1;
  #20 reset = 1;
  #10 reset = 0;
  #20 enable = 0;
  #10 d = 0;
  #10 d = 1;
  #10 d = 0;
  #10 enable = 1;
  #20;

  $display("\nFlip Flop Tipo D - 2 Bit");
  $display("time\t\tclk\tenable\treset\td\t|\tq");
  $display("-----------------------------------");
  $monitor("%g\t\t%b\t%b\t%b\t%b\t|\t%b",
    $time, clk, enable, reset, d2, q2);
  d2 = 0;
  reset = 1;
  #10 reset = 0;
  #10 d2 = 1;
  #20 d2 = 0;
  #20 d2 = 2;
  #20 reset = 1;
  #10 reset = 0;
  #20 enable = 0;
  #10 d2 = 3;
  #10 d2 = 1;
  #10 d2 = 0;
  #10 enable = 1;
  #10 d2 = 3;
  #10 d2 = 1;
  #10 d2 = 0;
  #20;

  $display("\nFlip Flop Tipo D - 4 Bit");
  $display("time\t\tclk\tenable\treset\td\t|\tq");
  $display("-----------------------------------");
  $monitor("%g\t\t%b\t%b\t%b\t%b\t|\t%b",
    $time, clk, enable, reset, d4, q4);
  d4 = 0;
  reset = 1;
  #10 reset = 0;
  #10 d4 = 1;
  #20 d4 = 0;
  #20 d4 = 2;
  #20 reset = 1;
  #10 reset = 0;
  #20 enable = 0;
  #10 d4 = 3;
  #10 d4 = 5;
  #10 d4 = 7;
  #10 enable = 1;
  #10 d4 = 3;
  #10 d4 = 8;
  #10 d4 = 10;
  #10 $finish;
  end

  initial begin
  $dumpfile("ejercicio1_tb.vcd");
  $dumpvars(0, ejercicio1_tb);
  end
endmodule // ejercicio1_tb
