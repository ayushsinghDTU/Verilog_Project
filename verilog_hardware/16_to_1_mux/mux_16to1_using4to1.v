module mux_16to1_using4to1(in,sel,out);

input[15:0] in;
input[3:0] sel;
output out;
wire [3:0] t;
// using structural design using 4to1 mux
mux_4to_1 M0 (in[3:0],sel[1:0],t[0]);
mux_4to_1 M1 (in[7:4],sel[1:0],t[1]);
mux_4to_1 M2 (in[11:8],sel[1:0],t[2]);
mux_4to_1 M3 (in[15:12],sel[1:0],t[3]);
mux_4to_1 M4 (t,sel[3:2],out);
endmodule

// module mux_16to_1(in,sel,out);

// input[15:0] in;
// input[3:0] sel;
// output out;

// assign out = in[sel];

// endmodule
// 4*1mux behavioral 

module mux_4to_1(in,sel,out);

input[3:0] in;
input[1:0] sel;
output out;
// behavioral 

// assign out = in[sel];

// using structural design using 2to1 mux
 wire [1:0] t;
 mux_2to_1 M0(in[1:0],sel[0:0],t[0]);
 mux_2to_1 M1(in[3:2],sel[0:0],t[1]);
 mux_2to_1 M2(t,sel[1:1],out);
endmodule

// 2 to 1 mux 
module mux_2to_1(in,sel,out);

input [1:0] in;
input sel;
output out;
// assign out = in[sel];
// structural 
wire [2:0]t;
not_gate2to1 d  (t[0], sel);
and_gate2to1 O  (t[1],in[0],t[0]);
and_gate2to1 n  (t[2],in[1],sel);
or_gate2to1  e  (out,t[2],t[1]);

endmodule
