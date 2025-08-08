`timescale 10ns/10ns
`include "mux_16to1_using4to1.v"

module mux_16to1_using4to1_tb;
 reg[15:0]A;
 reg[3:0]s;
 wire f;

 mux_16to1_using4to1 uut(.in(A),.sel(s),.out(f));
 
initial
begin
  $dumpfile("mux_16to1_using4to1_tb.vcd");
  $dumpvars(0, mux_16to1_using4to1_tb);
  $monitor ($time,"A=%h,s=%h,f=%b",A,s,f);

        A = 16'h3f0a; s = 4'h0;#5;
        s = 4'h1; #5;
        s = 4'h6; #5;
        s = 4'hc; #5;
    $display("test completed!");
    $finish;
end
endmodule