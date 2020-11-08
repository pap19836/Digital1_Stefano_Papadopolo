module ejercicio1(input clk, reset, enable_counter, enable_fetch, load_counter,
                   input [11:0] in_counter,
                   output [7:0] program_byte,
                   output [3:0] inst, oprnd);

  wire [11:0]out_counter;
  contador counter(clk, reset, enable_counter, load_counter, in_counter, out_counter);

  wire [7:0] rom_out;
  ROM ROM(out_counter, rom_out);

  assign program_byte = rom_out;

  D_Flip_Flop_8 fetch(clk, reset, enable_fetch, rom_out, {inst,oprnd});
endmodule
