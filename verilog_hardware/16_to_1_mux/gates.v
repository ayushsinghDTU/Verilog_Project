module not_gate2to1(f,A);
input A;
output f;

assign f = ~A;
endmodule

module or_gate2to1(f,A,B);
input A,B;
output f;

assign f = A | B;
endmodule

module and_gate2to1(f,A,B);
input A,B;
output f;

assign f = A & B;
endmodule
