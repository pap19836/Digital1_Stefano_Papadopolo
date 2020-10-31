module T_Flip_Flop (input clk, enable, reset,
                    output q);
  wire d;
  assign d = ~q;

      D_Flip_Flop t(clk, enable, reset, d, q);

endmodule // T_Flip_Flop
