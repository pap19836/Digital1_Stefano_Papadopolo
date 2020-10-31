module ejercicio4_tb ();
  reg [3:0] a;
  reg s;
  wire [3:0] y;

  tri_state tri_state(a, s, y);

  initial begin
  $display("Tristate Buffer");
  $display("time\t\ta\ts\t|\ty");
  $display("------------------");
  $monitor("%g\t\t%b\t%b\t|\t%b",
    $time, a, s, y);
  a = 4'b1010;
  s = 0;
  #5 s = 1;
  #5 s = 0;
  #5 s = 1;
  #5 $finish;
  end

  initial begin
  $dumpfile("ejercicio4_tb.vcd");
  $dumpvars(0, ejercicio4_tb);
  end

endmodule
