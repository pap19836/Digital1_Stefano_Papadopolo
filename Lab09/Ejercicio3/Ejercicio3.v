module JK_Flip_Flop (input clk, enable, reset, j, k,
                     output q);
  wire q1, q2, w1, w2, d;

  assign q1 = ~q;
  assign q2 = q;

  assign w1 = j & q1;
  assign w2 = ~k & q2;

  assign d = w1|w2;

  D_Flip_Flop JK(clk, enable, reset, d, q);

endmodule
