module D_Flip_Flop (input clk, enable, reset, d,
                    output reg q);
  always @ (posedge clk, posedge reset, posedge enable)
    if (~enable)
      q = q;
    else if (reset)
      q = 0;
    else
      q = d;
endmodule // DFlip-Flop

module D_Flip_Flop_2bits (input clk, enable, reset,
                         input [1:0] d,
                         output [1:0] q);
  D_Flip_Flop B1(clk, enable, reset, d[1], q[1]);
  D_Flip_Flop B0(clk, enable, reset, d[0], q[0]);
endmodule // 2_Bit_D_Flip_Flop

module D_Flip_Flop_4bits (input  clk, enable, reset,
                          input [3:0] d,
                          output [3:0] q);
  D_Flip_Flop_2bits B32(clk, enable, reset, d[3:2], q[3:2]);
  D_Flip_Flop_2bits B10(clk, enable, reset, d[1:0], q[1:0]);
endmodule // D_Flip_Flop_4bits
