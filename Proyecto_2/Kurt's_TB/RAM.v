module RAM(input clk, we, cs,
           input [11:0] addr,
           input [3:0] din,
           output [3:0] dout);

  reg [3:0] mem [0:4095];

  always @ (posedge clk)
    if (cs&we) mem[addr] <= din;

  assign dout = (cs&~we) ? mem[addr] : 4'bzzzz;


endmodule
