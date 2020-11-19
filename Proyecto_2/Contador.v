module contador (input clk, reset, enable, a,
                 input [0:11] load,
                 output reg [0:11] out);


  always @(posedge clk, posedge reset, posedge enable, posedge a)
    if (~enable)
      out <= out;
    else if (reset)
      out <= 12'b000000000000;
    else if (a&enable)
      out <= load;
    else if (enable)
      out <= out + 12'b000000000001;
endmodule // contador
