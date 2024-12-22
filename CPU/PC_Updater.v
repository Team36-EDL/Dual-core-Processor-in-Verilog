module PC_Updater(
    input wire [31:0] PC,     // 32-bit input current PC
    input wire [31:0] Imm,    // 32-bit immediate value
    input wire CTRL,          // 1-bit control signal
    output wire [31:0] PC_new  // 32-bit output new PC
);

reg [31:0] B_mux;
wire dump_Cout;

bkadder PC_ADD (.A(PC), .B(B_mux), .Cin(1'b0), .Y(PC_new), .Cout(dump_Cout));

    always @(*) begin
        if (CTRL) begin
            // Branch case: PC = PC + Imm (Imm is already doubled)
            B_mux = Imm;
        end else begin
            // Normal case: PC = PC + 2
            B_mux = 32'd2;
        end
    end

endmodule
