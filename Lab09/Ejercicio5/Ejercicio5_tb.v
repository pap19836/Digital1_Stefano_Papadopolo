module ejercicio5_tb ();
  reg [6:0] address;
  wire [12:0] data;

  caseRom caseRom(address, data);

  initial begin
  $display("Tristate Buffer");
  $display("time\t\tadress\t|\tdata");
  $display("------------------");
  $monitor("%g\t\t%b\t|\t%b",
    $time, address, data);
  #5 address = 7'bxxxxxx0;
  #5 address = 7'b00001x1;
  #5 address = 7'b00000x1;
  #5 address = 7'b00011x1;
  #5 address = 7'b00010x1;
  #5 address = 7'b0010xx1;
  #5 address = 7'b0011xx1;
  #5 address = 7'b0100xx1;
  #5 address = 7'b0101xx1;
  #5 address = 7'b0110xx1;
  #5 address = 7'b0111xx1;
  #5 address = 7'b1000x11;
  #5 address = 7'b1000x01;
  #5 address = 7'b1001x11;
  #5 address = 7'b1001x01;
  #5 address = 7'b1010xx1;
  #5 address = 7'b1011xx1;
  #5 address = 7'b1100xx1;
  #5 address = 7'b1101xx1;
  #5 address = 7'b1110xx1;
  #5 address = 7'b1111xx1;
  #5$display("Probando Don't Cares");
  #5 address = 7'b0000000;
  #5 address = 7'b0101010;
  #5 address = 7'b1010100;
  #5 address = 7'b0001101;
  #5 address = 7'b0100101;
  #5 address = 7'b0100101;
  #5 $finish;
  end

  initial begin
  $dumpfile("ejercicio5_tb.vcd");
  $dumpvars(0, ejercicio5_tb);
  end

endmodule
