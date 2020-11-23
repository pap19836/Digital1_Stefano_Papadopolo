module tri_state (input [3:0] a,
                  input s,
                  output [3:0] y);

    assign y = s ? a : 4'bzzzz;

endmodule
