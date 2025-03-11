module BranchComp(
    input signed [31:0] rs1,   // First register value (signed)
    input signed [31:0] rs2,   // Second register value (signed)
    output brLt,               // Output for less than condition
    output brEq                // Output for equality condition
);
    // Implement branch comparator for checking if value in register
    // is less than or equal to another register

    assign brEq = (rs1 == rs2);  // Check for equality
    assign brLt = (rs1 < rs2);   // Check for less than (signed)

endmodule
