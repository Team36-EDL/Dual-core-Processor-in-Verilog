module FA_TB();
  reg A, B, Cin; // Declare inputs as reg
  wire Y, Cout; // Declare outputs as wire

  // Instantiate the Full Adder module
  FA uut (
    .A(A), 
    .B(B), 
    .Cin(Cin), 
    .Y(Y), 
    .Cout(Cout)
  );

  // Test all possible input combinations
  initial begin
    // Apply test vectors sequentially
    A = 0; B = 0; Cin = 0; #10;
    A = 0; B = 0; Cin = 1; #10;
    A = 0; B = 1; Cin = 0; #10;
    A = 0; B = 1; Cin = 1; #10;
    A = 1; B = 0; Cin = 0; #10;
    A = 1; B = 0; Cin = 1; #10;
    A = 1; B = 1; Cin = 0; #10;
    A = 1; B = 1; Cin = 1; #10;

    // End simulation
    $finish;
  end
endmodule
