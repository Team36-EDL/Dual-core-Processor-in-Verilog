module RF_32_TB();

    // Testbench signals
    reg [4:0] Ra, Rb, Add;
    reg [31:0] D;
    reg RD_en, WR_en, CLK;
    wire [31:0] Qa, Qb;

    // Instantiate the RF_32 module
    RF_32 dut (
        .Ra(Ra),
        .Rb(Rb),
        .Add(Add),
        .CLK(CLK),
        .D(D),
        .RD_en(RD_en),
        .WR_en(WR_en),
        .Qa(Qa),
        .Qb(Qb)
    );

    // Clock generation
    initial CLK = 0;
    always #5 CLK = ~CLK; // 10 ns clock period

    // Testbench logic
    initial begin
        // Initialize signals
        Ra = 0;
        Rb = 0;
        Add = 0;
        D = 0;
        RD_en = 0;
        WR_en = 0;

        // Test case 1: Write data to register 5
        #10;
        WR_en = 1;
        Add = 5;
        D = 32'hA5A5A5A5; // Write value
        #10; // Wait for clock edge
        WR_en = 0;

        // Test case 2: Write data to register 10
        #10;
        WR_en = 1;
        Add = 10;
        D = 32'h5A5A5A5A; // Write value
        #10; // Wait for clock edge
        WR_en = 0;

        // Test case 3: Read data from registers 5 and 10
        #10;
        RD_en = 1;
        Ra = 5; // Read from register 5
        Rb = 10; // Read from register 10
        #10;
       //  (Expected: A5A5A5A5)", Qa);
       // (Expected: 5A5A5A5A)", Qb);

        // Test case 4: Read from an uninitialized register
        #10;
        Ra = 15; // Read from register 15
        Rb = 20; // Read from register 20
        #10;
       // (Expected: x)", Qa);
       //(Expected: x)", Qb);

        // End simulation
        #10;
    end

endmodule
