`timescale 1ns/1ps

module tb_alu_4bit;
    reg [3:0] A, B;
    reg [3:0] ALU_Sel;
    wire [3:0] ALU_Out;
    wire CarryOut;
    wire ZeroFlag;

    alu_4bit uut (
        .A(A),
        .B(B),
        .ALU_Sel(ALU_Sel),
        .ALU_Out(ALU_Out),
        .CarryOut(CarryOut),
        .ZeroFlag(ZeroFlag)
    );

    initial begin
        $dumpfile("alu_4bit.vcd");
        $dumpvars(0, tb_alu_4bit);

        // Test Addition
        A = 4'd7; B = 4'd8; ALU_Sel = 4'b0000; #10;
        $display("Add: %d + %d = %d, Carry = %b, ZeroFlag = %b", A, B, ALU_Out, CarryOut, ZeroFlag);

        // Test Subtraction
        A = 4'd9; B = 4'd3; ALU_Sel = 4'b0001; #10;
        $display("Sub: %d - %d = %d, Borrow = %b, ZeroFlag = %b", A, B, ALU_Out, CarryOut, ZeroFlag);

        // Test AND
        A = 4'b1010; B = 4'b1100; ALU_Sel = 4'b0010; #10;
        $display("AND: %b & %b = %b", A, B, ALU_Out);

        // Test OR
        A = 4'b1010; B = 4'b0101; ALU_Sel = 4'b0011; #10;
        $display("OR: %b | %b = %b", A, B, ALU_Out);

        // Test XOR
        A = 4'b1111; B = 4'b1010; ALU_Sel = 4'b0100; #10;
        $display("XOR: %b ^ %b = %b", A, B, ALU_Out);

        // Test Shift Left
        A = 4'b1001; ALU_Sel = 4'b0101; #10;
        $display("Shift Left: %b << 1 = %b, Carry = %b", A, ALU_Out, CarryOut);

        // Test Shift Right
        A = 4'b1001; ALU_Sel = 4'b0110; #10;
        $display("Shift Right: %b >> 1 = %b, Carry = %b", A, ALU_Out, CarryOut);

        // Test Rotate Left
        A = 4'b1001; ALU_Sel = 4'b0111; #10;
        $display("Rotate Left: %b rol 1 = %b, Carry = %b", A, ALU_Out, CarryOut);

        // Test Rotate Right
        A = 4'b1001; ALU_Sel = 4'b1000; #10;
        $display("Rotate Right: %b ror 1 = %b, Carry = %b", A, ALU_Out, CarryOut);

        $finish;
    end
endmodule
