module ALU_TB;

// Inputs
reg [31:0] ALU_a;
reg [31:0] ALU_b;
reg [2:0] CTRL;

// Outputs
wire [31:0] ALU_c;
wire Cout;

// Instantiate the ALU module
ALU uut (
    .ALU_a(ALU_a), 
    .ALU_b(ALU_b), 
    .CTRL(CTRL), 
    .ALU_c(ALU_c), 
    .Cout(Cout)
);

initial begin
    // Test Case 1: ADD (CTRL = 3'b000)
    ALU_a = 32'h0000000F; ALU_b = 32'h00000001; CTRL = 3'b000;
    #10; // Expected: ALU_c = 0x00000010, Cout = 0

    // Test Case 2: SUB (CTRL = 3'b001)
    ALU_a = 32'h0000000F; ALU_b = 32'h00000001; CTRL = 3'b001;
    #10; // Expected: ALU_c = 0x0000000E, Cout = 0

    // Test Case 3: XOR (CTRL = 3'b010)
    ALU_a = 32'hA5A5A5A5; ALU_b = 32'h5A5A5A5A; CTRL = 3'b010;
    #10; // Expected: ALU_c = 0xFFFFFFFF, Cout = Z

    // Test Case 4: OR (CTRL = 3'b011)
    ALU_a = 32'h0000FFFF; ALU_b = 32'hFFFF0000; CTRL = 3'b011;
    #10; // Expected: ALU_c = 0xFFFFFFFF, Cout = Z

    // Test Case 5: AND (CTRL = 3'b100)
    ALU_a = 32'h0000FFFF; ALU_b = 32'hFFFF0000; CTRL = 3'b100;
    #10; // Expected: ALU_c = 0x00000000, Cout = Z

    // Test Case 6: Equality (CTRL = 3'b101)
    ALU_a = 32'h12345678; ALU_b = 32'h12345678; CTRL = 3'b101;
    #10; // Expected: ALU_c = 1, Cout = Z

    // Test Case 7: Non-Equality (CTRL = 3'b110)
    ALU_a = 32'h12345678; ALU_b = 32'h87654321; CTRL = 3'b110;
    #10; // Expected: ALU_c = 1, Cout = Z

    // Test Case 8: NOP (CTRL = 3'b111)
    ALU_a = 32'h0EADBEEF; ALU_b = 32'h00000000; CTRL = 3'b111;
    #10; // Expected: ALU_c = 0xDEADBEEF, Cout = Z

    // Add more test cases if necessary...

    // Finish simulation
    $stop;
end

endmodule
