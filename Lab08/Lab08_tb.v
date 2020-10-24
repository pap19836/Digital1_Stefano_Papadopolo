module testbench_contador();
  reg clk, reset, enable, a;
  reg [0:11] load;
  wire [0:11] out;
  contador contador(clk, reset, enable, a, load, out);

  always begin
    #5 clk = ~clk;
  end

  initial begin
    $display("time\t\tclk\treset\tenable\t\tload\ta\t|\tout");
    $display("--------------------------------");
    $monitor("%g\t\t%b\t%b\t%b\t%b\t%b\t|\t%b",
      $time, clk, reset, enable, load, a, out);
    clk = 1;
    enable = 1;
    a = 0;
    load = 12'b000001100100;
    #5 reset = 1;
    #5 reset = 0;
    #20 enable = 0;
    #25 a = 1;
    #25 a = 0;
    #50 enable = 1;
    #120 a = 1;
    #50 a = 0;
    #100;
  end

  initial begin
  $dumpfile("Lab08_tb.vcd");
  $dumpvars(0, testbench_contador);
  end
endmodule

module testbench_alu();
  reg [3:0] a, b;
  reg [2:0] f;
  wire [3:0] y;
  wire c_out ;

  alu alu(a, b, f, y, c_out);

  initial begin
    #450;
    $display("\ntime\t\ta\tb\tf\t|\ty");
    $display("---------------------");
    $monitor("%g\t\t%b\t%b\t%b\t|\t%b",
            $time, a, b, f, y);
    a = 3;
    b = 1;
    f = 0;
    #5 f = 1;
    #5 f = 2;
    #5 f = 4;
    #5 f = 5;
    #5 f = 6;
    #5 f = 7;
    #5 a = 0;
    b = 0;
    f = 0;
    #5 a = 2;
    b = 5;
    #5 f = 1;
    #5 f = 2;
    #5 f = 4;
    #5 f = 5;
    #5 f = 6;
    #5 f = 7;

    end

    initial begin
      $dumpfile("Lab08_tb.vcd");
      $dumpvars(0, testbench_alu);
    end
endmodule

module testbench_rom();
  reg clk;
  wire [7:0] y;
  reg [11:0] addr;
  ROM rom(clk, addr, y);

  always begin
    #5 clk = ~clk;
  end
  integer i;
  initial begin
  #525;
    $display("\nMemoria");
    addr = 0;
    $monitor("%b",y);
    for (i = 0; i < 10; i = i + 1) begin
      addr = i;
      #5;
    end
    #5 $finish;
  end

    initial begin
      $dumpfile("Lab08_tb.vcd");
      $dumpvars(0, testbench_rom);
    end
endmodule
