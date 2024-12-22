module mux4to1_TB();

    reg A;       // Input line A
    reg B;       // Input line B
    reg C;       // Input line C
    reg D;       // Input line D
    reg [1:0] sel;     // 2-bit select line
    wire Y;            // Output wire

    // Instantiate the multiplexer
    mux4to1 uut (
        .A(A),
        .B(B),
        .C(C),
        .D(D),
        .sel(sel),
        .Y(Y)
    );

    // Stimulus process
    initial begin
        // Test Case 1: sel = 00, A = 0
        A = 1'b0; B = 1'b0; C = 1'b0; D = 1'b0; sel = 2'b00; #10;
        // Expected: Y = A = 0

        // Test Case 2: sel = 01, B = 1
        A = 1'b0; B = 1'b1; C = 1'b0; D = 1'b0; sel = 2'b01; #10;
        // Expected: Y = B = 1

        // Test Case 3: sel = 10, C = 1
        A = 1'b0; B = 1'b0; C = 1'b1; D = 1'b0; sel = 2'b10; #10;
        // Expected: Y = C = 1

        // Test Case 4: sel = 11, D = 1
        A = 1'b0; B = 1'b0; C = 1'b0; D = 1'b1; sel = 2'b11; #10;
        // Expected: Y = D = 1

        // Test Case 5: sel = 00, A = 1
        A = 1'b1; B = 1'b0; C = 1'b0; D = 1'b0; sel = 2'b00; #10;
        // Expected: Y = A = 1

        // Test Case 6: sel = 10, C = 0
        A = 1'b1; B = 1'b1; C = 1'b0; D = 1'b1; sel = 2'b10; #10;
        // Expected: Y = C = 0

        // End simulation
        $stop;
    end

endmodule
