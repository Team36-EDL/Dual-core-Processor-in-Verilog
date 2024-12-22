module RF_32 (Ra,Rb,Add,CLK,D,RD_en,WR_en,Qa,Qb);

input [4:0] Ra, Rb, Add;
input [31:0]  D;
input RD_en,CLK,WR_en;
output [31:0]  Qa,Qb;

wire [31:0] q_reg [31:0];
reg [31:0] d_reg [31:0];

//Instantiating the 32 register 32 times
genvar i;
    generate
        for (i = 0; i < 32; i = i + 1) begin : Instantiation 
                DFF_pos dff_inst (
                .D(d_reg[i]), // Write or retain
                .CLK(CLK),
                .Q(q_reg[i])
            );
        end
    endgenerate

//Synchronous process for Writing data 

always @(posedge CLK)
begin		  
		  if (WR_en == 1'b1)
		     d_reg[Add]<= D;
		  else 
		  begin
		  end
end 

//asynchronous read as time cycle cant be wasted 

    assign Qa = (RD_en == 1'b1) ? q_reg[Ra] : 32'bz;
    assign Qb = (RD_en == 1'b1) ? q_reg[Rb] : 32'bz;

endmodule 
		    

