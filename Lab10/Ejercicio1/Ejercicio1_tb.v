module Ejercicio1_tb();
  reg clk, reset, enable_counter, enable_fetch, load_counter;
  reg [11:0] in_counter;
  wire [7:0] program_byte;
  wire [3:0] inst, oprnd;

  ejercicio1 ejercicio1 (clk, reset, enable_counter, enable_fetch, load_counter, in_counter, program_byte, inst, oprnd);

  always begin
    #5 clk = ~clk;
  end

  initial begin
    $display("Ejercicio 1");
    $display("Time\t\tclk\treset en_count en_fetch\tload\tin_count\t|\tprgm_byte\tinst\toprnd");
    $display("------------------------------------------------------------------------------");
    $monitor("%g\t\t%b\t%b\t%b\t%b\t%b\t%b\t|\t%b\t%b\t%b\t",
      $time, clk, reset, enable_counter, enable_fetch, load_counter,
      in_counter, program_byte, inst, oprnd);
    clk = 0; reset = 0; enable_counter = 0; enable_fetch = 0; load_counter = 0; in_counter = 2;
    #5 reset = 1; enable_counter = 1; enable_fetch = 1;
    #5 reset = 0;
    #50 load_counter=1;
    #5 load_counter=0;
    #5 enable_counter=0;
    #20 enable_counter=1;
    #5 enable_fetch=0;
    #20 enable_fetch=1;
    #5 $finish;

  end

  initial begin
    $dumpfile("Ejercicio1_tb.vcd");
    $dumpvars(0, Ejercicio1_tb);
    end
endmodule
