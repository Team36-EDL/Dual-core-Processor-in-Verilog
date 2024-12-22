module PC_Updater_TB;

    // Inputs
    reg [31:0] PC;
    reg [31:0] Imm;
    reg CTRL;

    // Outputs
    wire [31:0] PC_new;

    // Instantiate the Device Under Test (DUT)
    PC_Updater dut (
        .PC(PC),
        .Imm(Imm),
        .CTRL(CTRL),
        .PC_new(PC_new)
    );

    initial begin
        // Test Case 1: Normal case (CTRL = 0, PC = PC + 2)
        PC = 32'd100;          // Initial PC value
        Imm = 32'd50;          // Immediate value (should not affect this case)
        CTRL = 1'b0;           // Normal mode
        #10;
        // Expected PC_new: 32'd102
        
        // Test Case 2: Branch case (CTRL = 1, PC = PC + Imm)
        CTRL = 1'b1;           // Branch mode
        Imm = 32'd8;           // Example branch offset (already doubled)
        #10;
        // Expected PC_new: 32'd108
        
        // Test Case 3: Normal case again (CTRL = 0, PC = PC + 2)
        CTRL = 1'b0;           // Normal mode
        PC = 32'd256;          // Set PC to a new value
        #10;
        // Expected PC_new: 32'd258
        
        // Test Case 4: Branch case with negative Imm (CTRL = 1, PC + Imm)
        CTRL = 1'b1;           // Branch mode
        Imm = -32'd4;          // Negative immediate for backward branch
        #10;
        // Expected PC_new: PC + (-4) = 32'd254

        // Test Case 5: Edge case (PC = max value, Imm = large positive)
        PC = 32'hFFFFFFFF;     // Max 32-bit value
        Imm = 32'd4;           // Immediate offset
        CTRL = 1'b1;           // Branch mode
        #10;
        // Expected PC_new: Wrap-around addition (32'd3 due to overflow)
    end

endmodule
