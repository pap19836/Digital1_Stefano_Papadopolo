module ROM (input [11:0] addr,
            output [7:0] y);

reg [7:0] rom [0:4095];

initial begin
  $readmemh ("memory.list", rom);
  end

  assign y = rom[addr];

endmodule
