module bkadder_TB;

// Parameters
parameter N = 32;

// Inputs
reg [N-1:0] A, B;
reg Cin;

// Outputs
wire [N-1:0] Y;
wire Cout;

// Instantiate the Unit Under Test (UUT)
bkadder uut (
    .A(A),
    .B(B),
    .Cin(Cin),
    .Y(Y),
    .Cout(Cout)
);

// Testbench logic
initial begin
    // Test case 1: All inputs are zero
    A = 32'h0000000A; B = 32'h0000000B; Cin = 1'b0;
    #10;
    // Expected: Y = 0, Cout = 0

    // Test case 2: Maximum values
    A = 32'hFFFFFFFF; B = 32'hFFFFFFFF; Cin = 1'b1;
    #10;
    // Expected: Y = 0xFFFFFFFE, Cout = 1

    // Test case 3: Alternating bits
    A = 32'hAAAAAAAA; B = 32'h55555555; Cin = 1'b0;
    #10;
    // Expected: Y = 0xFFFFFFFF, Cout = 0

    // Test case 4: Random values
    A = 32'h12345678; B = 32'h87654321; Cin = 1'b1;
    #10;
    // Expected: Y = 0x9999999A, Cout = 0

    // Test case 5: Carry propagation
    A = 32'hFFFFFFF0; B = 32'h0000000F; Cin = 1'b1;
    #10;
    // Expected: Y = 0x00000000, Cout = 1

    // Test case 6: Mixed bits
    A = 32'h0F0F0F0F; B = 32'hF0F0F0F0; Cin = 1'b0;
    #10;
    // Expected: Y = 0xFFFFFFFF, Cout = 0

    // End simulation
    #10;
end

endmodule
