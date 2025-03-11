module Control (
    input [6:0] opcode,         // opcode field of instruction
    output reg memRead,         // memory read signal
    output reg [1:0] memtoReg,  // memory to register signal
    output reg [2:0] ALUOp,     // ALU operation signal
    output reg memWrite,        // memory write signal
    output reg ALUSrc1,         // ALU source 1 signal (for MUX)
    output reg ALUSrc2,         // ALU source 2 signal (for MUX)
    output reg regWrite,        // register write signal
    output reg PCSel            // PC select signal (for MUX PC)
);

always @(*) begin
    // Default values
    memRead = 0;
    memtoReg = 0;
    ALUOp = 3'b000;
    memWrite = 0;
    ALUSrc1 = 0;
    ALUSrc2 = 0;
    regWrite = 0;
    PCSel = 0;

    case (opcode)
        7'b0000011: begin // Load instructions
            memRead = 1;
            memtoReg = 2'b01;
            ALUSrc2 = 1;
            regWrite = 1;
        end
        7'b0100011: begin // Store instructions
            memWrite = 1;
            ALUSrc2 = 1;
        end
        7'b1100011: begin // Branch instructions
            ALUOp = 3'b001;
            PCSel = 1;
        end
        7'b0010011: begin // Immediate instructions
            ALUOp = 3'b010;
            ALUSrc2 = 1;
            regWrite = 1;
        end
        7'b0110011: begin // R-type instructions
            ALUOp = 3'b011;
            regWrite = 1;
        end
        // Add more cases for other opcodes as needed
        default: begin
            // Default values already set
        end
    endcase
end

endmodule
