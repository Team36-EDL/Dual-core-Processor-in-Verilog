module mux4to1 (
    input wire A,   // Input line A
    input wire B,   // Input line B
    input wire C,   // Input line C
    input wire D,   // Input line D
    input wire [1:0] sel, // 2-bit select line
    output wire Y         // Output Y
);

    assign Y = (sel == 2'b00) ? A :
               (sel == 2'b01) ? B :
               (sel == 2'b10) ? C : D;

endmodule
