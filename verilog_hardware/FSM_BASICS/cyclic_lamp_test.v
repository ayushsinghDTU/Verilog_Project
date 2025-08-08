`timescale 10ns/1ps
`include "lamp.v"

module cyclic_lamp_test;
reg clk;
wire [2:0] light;
cyclic_lamp lamp (.clock(clk),.light(light));
always #5 clk = ~clk;
initial 
begin
    clk = 1'b0;
    #100 $finish;
end
initial
 begin
    $dumpfile("cyclic_lamp_test.vcd");
    $dumpvars(0,cyclic_lamp_test);
    $monitor($time,"RGY:%b",light);
 end

endmodule