module alu (input reset,
            input [3:0] a, b,
            input [2:0] f,
            output reg [3:0] y,
            output reg c_out, zero);

  reg [4:0] overflow_aid;

  parameter pass_a = 3'b000;
  parameter pass_b = 3'b010;
  parameter compare = 3'b001;
  parameter ADD = 3'b011;
  parameter NOR = 3'b100;

  always @(*) begin
    case(f)
      pass_a: y = a;
      pass_b: y = b;
      compare: begin
                overflow_aid = a-b;
                y = overflow_aid[3:0];
                c_out = overflow_aid[4];
                end
      ADD: begin
            overflow_aid = a+b;
            y = overflow_aid[3:0];
            c_out = overflow_aid[4];
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
