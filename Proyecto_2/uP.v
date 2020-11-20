module uP(input clock, reset,
          input [3:0] pushbuttons,
          output phase, c_flag, z_flag,
          output [3:0] instr, oprnd, accu, data_bus, FF_out,
          output [7:0] program_byte,
          output [11:0] PC, address_RAM);

//Program Counter
  wire [11:0] PC;
  wire enable_counter, load_counter;
  contador counter(clock, reset, enable_counter, load_counter, address_RAM, PC);

//ROM
  wire [7:0] program_byte;
  ROM ROM(PC, program_byte);

//Fetch
  wire [3:0] instr, oprnd;
  D_Flip_Flop_8 fetch(clock, reset, ~phase, program_byte, {instr, oprnd});


//RAM
  wire [11:0] address_RAM;
  wire we, cs;
  assign address_RAM = {oprnd, program_byte};
  RAM RAM(clock, we, cs, address_RAM, data_bus, data_bus);

//Bus1
  wire [3:0] data_bus;
  wire enable_bus1;
  tri_state bus1(oprnd, enable_bus1, data_bus);

//ALU
  wire [3:0] accu, alu_out;
  wire [2:0] f;
  wire c, zero;
  D_Flip_Flop_4 accumulator(clock, reset, enable_accu, alu_out, accu);
  alu alu (reset, accu, data_bus, f, alu_out, c, zero);

//bus2
  wire enable_bus2;
  tri_state bus2(alu_out, enable_bus2, data_bus);

//inputs
  wire enable_in;
  tri_state in(pushbuttons, enable_in, data_bus);

//outputs
wire enable_out;
  D_Flip_Flop_4 out(clock, reset, enable_out, data_bus, FF_out);

//phase
  wire phase;
  wire enable_phase;
  T_Flip_Flop PHASE(clock, reset, 1'b1, phase);

//decoder
  wire [1:0] flags;
  wire enable_flags, c_flag, z_flag;
  assign c_flag = flags[1];
  assign z_flag = flags[0];
  D_Flip_Flop_2 FLAGS(clock, reset, enable_flags, {c, zero}, flags);
  decoder decoder({instr, flags, phase}, {enable_counter, load_counter, enable_accu,
                  enable_flags, f[2], f[1], f[0], cs, we, enable_bus2,
                  enable_in, enable_bus1, enable_out});
endmodule
