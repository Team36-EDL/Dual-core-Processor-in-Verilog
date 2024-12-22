

module Data_Memory_TB();

    // Inputs
    reg [31:0] Add;
    reg [31:0] D;
    reg [31:0] Rd;
    reg RD_en;
    reg WR_en;
    reg [1:0] mode;
    reg CLK;

    // Outputs
    wire [31:0] Q;

    // Instantiate the Unit Under Test (UUT)
    Data_Memory uut (
        .RD_en(RD_en), 
        .WR_en(WR_en), 
        .mode(mode), 
        .Add(Add), 
        .Rd(Rd), 
        .D(D), 
        .Q(Q), 
        .CLK(CLK)
    );

    // Clock generation
    initial begin
        CLK = 0;
        forever #5 CLK = ~CLK; // 10 ns clock period
    end

    // Testbench logic
    initial begin
        // Initialize inputs
        Add = 32'h00000000;
        Rd = 32'h00000000;
        D = 32'h00000000;
        RD_en = 0;
        WR_en = 0;
        mode = 2'b00;

        // Wait for global reset
        #10;

        // Test Mode 00: Write lower byte
        WR_en = 1;
        mode = 2'b00;
        D = 32'h000000AA;
        #10;
        WR_en = 0;

        // Test Mode 00: Read lower byte
        RD_en = 1;
        #10;
        RD_en = 0;

        // Test Mode 01: Write half word
        WR_en = 1;
        mode = 2'b01;
        D = 32'h00001234;
        #10;
        WR_en = 0;

        // Test Mode 01: Read half word
        RD_en = 1;
        #10;
        RD_en = 0;

        // Test Mode 11: Write full word
        WR_en = 1;
        mode = 2'b11;
        D = 32'hDEADBEEF;
        #10;
        WR_en = 0;

        // Test Mode 11: Read full word
        RD_en = 1;
        #10;
        RD_en = 0;

        // End of test
        #20;
        
    end

endmodule
