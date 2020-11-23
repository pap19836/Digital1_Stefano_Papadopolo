module alu (input reset,
            input [3:0] a, b,
            input [2:0] f,
            output reg [3:0] y,
            output reg c_out, zero);


  parameter pass_a = 3'b000;
  parameter pass_b = 3'b010;
  parameter compare = 3'b001;
  parameter ADD = 3'b011;
  parameter NOR = 3'b100;

  always @(*) begin
    c_out = 0;
    case(f)
      pass_a: y = a;
      pass_b: y = b;
      compare: begin
            {c_out, y} = a-b;
                end
      ADD: begin
            {c_out, y} = a+b;
           end
      NOR: y = a~|b;
      default: y = 3'b000;
    endcase

  if (y == 0)
    zero = 1;
    else
      zero = 0;

  if (reset == 1)
    c_out = 0;
      end
endmodule // alu
