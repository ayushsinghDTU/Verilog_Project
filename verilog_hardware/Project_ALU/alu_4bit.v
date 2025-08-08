module alu_4bit(
    input  [3:0] A,
    input  [3:0] B,
    input  [3:0] ALU_Sel,
    output reg [3:0] ALU_Out,
    output reg CarryOut,
    output ZeroFlag
);

reg [4:0] temp_result;

assign ZeroFlag = (ALU_Out == 4'b0000);

always @(*) begin
    CarryOut = 0;
    case (ALU_Sel)
        4'b0000: begin // Addition
            temp_result = A + B;
            ALU_Out = temp_result[3:0];
            CarryOut = temp_result[4];
        end
        4'b0001: begin // Subtraction
            temp_result = A - B;
            ALU_Out = temp_result[3:0];
            CarryOut = temp_result[4]; // Borrow (if any)
        end
        4'b0010: begin // Bitwise AND
            ALU_Out = A & B;
            CarryOut = 0;
        end
        4'b0011: begin // Bitwise OR
            ALU_Out = A | B;
            CarryOut = 0;
        end
        4'b0100: begin // Bitwise XOR
            ALU_Out = A ^ B;
            CarryOut = 0;
        end
        4'b0101: begin // Logical Shift Left
            ALU_Out = A << 1;
            CarryOut = A[3]; // MSB shifted out
        end
        4'b0110: begin // Logical Shift Right
            ALU_Out = A >> 1;
            CarryOut = A[0]; // LSB shifted out
        end
        4'b0111: begin // Rotate Left
            ALU_Out = {A[2:0], A[3]};
            CarryOut = A[3];
        end
        4'b1000: begin // Rotate Right
            ALU_Out = {A[0], A[3:1]};
            CarryOut = A[0];
        end
        default: begin
            ALU_Out = 4'b0000;
            CarryOut = 0;
        end
    endcase
end

endmodule
