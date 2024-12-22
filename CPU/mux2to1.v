module mux2to1 (
    input wire A,      // Input line A
    input wire B,      // Input line B
    input wire sel,    // 1-bit select line
    output wire Y      // Output Y
);

    assign Y = sel ? B : A;

endmodule