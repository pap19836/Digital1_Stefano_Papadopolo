module contador (input clk, reset, enable, a,
                 input [0:11] load,
                 output reg [0:11] out);


  always @(posedge clk, posedge reset)
    if (~enable)
      out = out;
    else if (reset)
      out = 12'b000000000000;
    else if (a&enable)
      out = load;
    else if (enable)
      out = out + 12'b000000000001;
endmodule // contador

module ROM (input clk,
            input [11:0] addr,
            output [7:0] y);

reg [7:0] rom [0:4095];

initial begin
  $readmemh ("ejemplo_memoria.list", rom);
  end

  assign y = rom[addr];

endmodule

module alu (input [3:0] a, b,
            input [2:0] f,
            output reg [3:0] y,
            output reg c_out);

  reg [3:0] slt_help;
  parameter AND = 3'b000;
  parameter OR = 3'b001;
  parameter ADD = 3'b010;
  parameter AND_NEG = 3'b100;
  parameter OR_NEG = 3'b101;
  parameter SUBSTRACT = 3'b110;
  parameter  SLT = 3'b111;

  always @(*)
    case(f)
    AND: y = a&b;
    OR:  y = a|b;
    ADD:  {c_out, y} = a+b;
    AND_NEG: y = a&~b;
    OR_NEG: y = a|~b;
    SUBSTRACT:  y = a-b;
    SLT:  begin
          slt_help = a-b;
          y = slt_help[3];
          end
    endcase
endmodule // alu
