module contador (input clk, reset, enable, a,
                 input [0:11] load,
                 output reg [0:11] out);


  always @(posedge clk, posedge reset)
    if (~enable&~a)
      out <= out;
    else if (reset)
      out <= 12'b000000000000;
    else if (a)
      out <= load;
    else if (enable&~a)
      out <= out + 12'b000000000001;
endmodule // contador
