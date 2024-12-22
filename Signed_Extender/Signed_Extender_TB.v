module Signed_Extender_TB;

    // Inputs
    reg [11:0] Imm12;
    reg [19:0] Imm20;
    reg [1:0] CTRL;

    // Output
    wire [31:0] Imm32;

    // Instantiate the DUT (Device Under Test)
    Signed_Extender uut (
        .Imm12(Imm12),
        .Imm20(Imm20),
        .CTRL(CTRL),
        .Imm32(Imm32)
    );

    initial begin
        // Test Case 1: CTRL = 2'b00 (Imm12)
        Imm12 = 12'b100000000001; // Example: -2047 in signed 12-bit
        Imm20 = 20'b0;            // Not used in this case
        CTRL = 2'b00;
        #10;
        // Expected Imm32: 32'b11111111111111111111000000000001
        
        // Test Case 2: CTRL = 2'b01 (Imm13)
        Imm12 = 12'b011111111111; // Example: +2047 in signed 12-bit
        CTRL = 2'b01;
        #10;
        // Expected Imm32: 32'b00000000000011111111111111111110

        // Test Case 3: CTRL = 2'b10 (Imm20)
        Imm20 = 20'b10000000000000000001; // Example: -524287 in signed 20-bit
        CTRL = 2'b10;
        #10;
        // Expected Imm32: 32'b11111111000000000000000000000001

        // Test Case 4: CTRL = 2'b11 (Imm21)
        CTRL = 2'b11;
        #10;
        // Expected Imm32: 32'b11111110000000000000000000000010

        // Finish simulation
        $stop;
    end

endmodule
