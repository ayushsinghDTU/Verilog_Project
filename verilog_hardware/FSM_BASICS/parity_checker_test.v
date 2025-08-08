`timescale 10ns/1ps
`include "parity_checker.v"

module parity_checker_test;

reg clk,in;
wire f;
parity_gen PAR (.z(f),.clk(clk),.x(in));
initial
 begin
    $dumpfile("parity_checker_test.vcd");
    $dumpvars(0,parity_checker_test);
    $monitor($time,"z:%b",f);
    clk = 1'b0;
end
always  #5 clk = ~clk;
initial 
begin
  #2   in =0; #10 in =1; #10 in =1; #10 in =1;
  #10  in =0; #10 in =1; #10 in =1; #10 in =0;
  #10  in =0; #10 in =1; #10 in =1; #10 in =0;
  $display("test completed!");
  #10 $finish;
end
    
endmodule