module parity_gen(z,clk,x);
input clk,x;
output reg z;
parameter EVEN = 0,ODD = 1;
reg even_odd;
always @(posedge clk )
 case (even_odd)
    EVEN : even_odd <= x  ? ODD :EVEN;
    ODD  : even_odd <=  x ? EVEN:ODD;
    default: even_odd <= EVEN;
 endcase
 always @(even_odd)
case (even_odd)
     EVEN:  z = 0;
     ODD: z = 1;
   
endcase

endmodule