// Testbench for 2-to-1 Multiplexer
module mux2to1_TB();

    reg A;       // Input line A
    reg B;       // Input line B
    reg sel;     // 1-bit select line
    wire Y;      // Output wire

    // Instantiate the multiplexer
    mux2to1 uut (
        .A(A),
        .B(B),
        .sel(sel),
        .Y(Y)
    );

    // Stimulus process
    initial begin
        // Test Case 1: sel = 0, A = 0
        A = 1'b0; B = 1'b0; sel = 1'b0; #10;
        // Expected: Y = A = 0

        // Test Case 2: sel = 0, A = 1
        A = 1'b1; B = 1'b0; sel = 1'b0; #10;
        // Expected: Y = A = 1

        // Test Case 3: sel = 1, B = 0
        A = 1'b0; B = 1'b0; sel = 1'b1; #10;
        // Expected: Y = B = 0

        // Test Case 4: sel = 1, B = 1
        A = 1'b0; B = 1'b1; sel = 1'b1; #10;
        // Expected: Y = B = 1

        // Test Case 5: sel = 0, A = 1, B = 1
        A = 1'b1; B = 1'b1; sel = 1'b0; #10;
        // Expected: Y = A = 1

        // Test Case 6: sel = 1, A = 1, B = 0
        A = 1'b1; B = 1'b0; sel = 1'b1; #10;
        // Expected: Y = B = 0

        // End simulation
        $stop;
    end

endmodule
