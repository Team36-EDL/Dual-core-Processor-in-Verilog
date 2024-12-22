module DFF_pos (D, CLK, Q);

input [31:0]D;
input CLK;
output reg [31:0] Q;

always @(posedge CLK)
     Q <= D; 
endmodule 