module T_Flip_Flop (input clk, reset, enable,
                    output q);
  wire d;
  assign d = ~q;

      D_Flip_Flop_1 t(clk, reset, enable, d, q);

endmodule // T_Flip_Flop
