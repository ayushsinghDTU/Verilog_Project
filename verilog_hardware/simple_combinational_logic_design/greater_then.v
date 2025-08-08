module greater_then(A,B,F);

input[1:0] A,B;
output F;


//  assign F = A > B;
//  assign F = A[1] & ~B[1] | A[0] & ~B[1] & ~B[0] | A[1] & A[0] & ~B[0] & ~B[1];


assign F = (A[1] & ~B[1]) |                     // MSB comparison
           (~A[1] & ~B[1] & A[0] & ~B[0]) |     // MSBs equal to 0, check LSB
           (A[1] & B[1] & A[0] & ~B[0]); 

endmodule