module HA_TB();
  reg A, B; // Declare inputs as reg
  wire Y, Cout; // Declare outputs as wire

  // Instantiate the Half Adder module
  HA uut (
    .A(A), 
    .B(B), 
    .Y(Y), 
    .Cout(Cout)
  );

  // Test all possible input combinations
  initial begin
    // Display a header for the output
   
    
    // Apply test vectors
    A = 0; B = 0; #10;
    A = 0; B = 1; #10;
    A = 1; B = 0; #10; 
    A = 1; B = 1; #10; 
    
    // End simulation
    $finish;
  end
endmodule
