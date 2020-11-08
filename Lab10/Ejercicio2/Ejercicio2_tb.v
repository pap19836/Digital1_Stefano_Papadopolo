module ejercicio2_tb();
  reg clk, reset, enable_accu, enable_bus1, enable_bus2;
  reg [3:0] bus1_in;
  reg[2:0] f;
  wire zero;
  wire [3:0] bus2_out;

  ejercicio2 ejercicio2 (clk, reset, enable_accu, enable_bus1, enable_bus2, bus1_in, f, zero, bus2_out);

    always begin
      #5 clk = ~clk;
    end

  initial begin
    $display("Ejercicio 1");
    $display("Time\t\tclk\treset en_accu en_bus1 en_bus2 bus1_in\tf\t|\tzero\tbus2_out");
    $display("------------------------------------------------------------------------| ---------------");
    $monitor("%g\t\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t|\t%b\t%b\t",
      $time, clk, reset, enable_accu, enable_bus1, enable_bus2,
      bus1_in, f, zero, bus2_out);
    clk = 0; reset = 0; enable_accu = 1; enable_bus1 = 0; enable_bus2 = 0; bus1_in = 5; f=0;
    #5 reset = 1; enable_bus1 = 1; enable_bus2 = 1;
    #5 reset = 0;
    #20 f = 3'b010;
    #20 enable_bus1 = 0;
    #20 enable_bus1 = 1;
    #20 f = 3'b001;
    #10 f = 3'b011;
    #20 f = 3'b100;
    #20 enable_bus2 = 0;
    #10 enable_bus2 = 1; f = 3'b000;
    #50 $finish;
  end

  initial begin
    $dumpfile("ejercicio2_tb.vcd");
    $dumpvars(0, ejercicio2_tb);
    end
endmodule
