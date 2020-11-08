module ejercicio2(input clk, reset, enable_accu, enable_bus1, enable_bus2,
                   input [3:0] bus1_in,
                   input [2:0] f,
                   output zero,
                   output[3:0] bus2_out);
  wire [3:0] alu_out;
  wire c_out;
  wire [3:0] a, b;

  D_Flip_Flop_4 accumulator(clk, reset, enable_accu, alu_out, a);
  alu alu(reset, a, b, f, alu_out, c_out, zero);
  tri_state bus1(bus1_in, enable_bus1, b);
  tri_state bus2(alu_out, enable_bus2, bus2_out);
endmodule
