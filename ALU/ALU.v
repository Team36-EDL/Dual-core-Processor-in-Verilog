module ALU (ALU_a, ALU_b, CTRL, ALU_c, Cout);

input [31:0] ALU_a,ALU_b;
input [2:0] CTRL;

output reg [31:0] ALU_c;
output reg Cout;

wire [31:0] bk_result;
wire bk_Cout;
reg bk_Cin;
reg [31:0] ALU_b_mux;

//Instantiation 

//optimised using only 1 bkadder
bkadder ADD_SUB (.A(ALU_a), .B(ALU_b_mux), .Cin(bk_Cin), .Y(bk_result), . Cout(bk_Cout));

always @(*)
begin
      case(CTRL)
		
		           3'b000:  //ADD using bkadder
					  begin
					        ALU_b_mux = ALU_b;
							  bk_Cin = 1'b0;
							  ALU_c = bk_result;
							  Cout = bk_Cout;
					  end
					  
					  3'b001: //Sub
					  begin
					          ALU_b_mux= ~ALU_b;
							  bk_Cin = 1'b1;
							  ALU_c = bk_result;
							  Cout = bk_Cout;							  			         
					  end
					  
					  3'b010: //XOR
					  begin 
					        ALU_b_mux = 32'bz;
							  bk_Cin = 1'bz;
					        Cout = 1'bz;
							  ALU_c = ALU_a ^ ALU_b;
					  end 
					  
					  3'b011: //OR
					  begin
					        ALU_b_mux = 32'bz;
							  bk_Cin = 1'bz;
					        Cout= 1'bz;
							  ALU_c = ALU_a | ALU_b;
					  end
					  
					  3'b100: //AND
					  begin
					        ALU_b_mux = 32'bz;
							  bk_Cin = 1'bz;
					        Cout = 1'bz;
							  ALU_c = ALU_a & ALU_b;
					  end
					  
					  3'b101: // equality 
					  begin
					        ALU_b_mux = 32'bz;
							  bk_Cin = 1'bz;
					        Cout = 1'bz;
							  ALU_c = (ALU_a ^ ALU_b)?1'b0:1'b1; 
					  end
					  
					  3'b110: //non-equlaity
					  begin
					        ALU_b_mux = 32'bz;
							  bk_Cin = 1'bz;
					        Cout = 1'bz;
							  ALU_c = (ALU_a ^ ALU_b)?1'b1:1'b0;
					  end
					  
					  3'b111: //NOP for lui and sign checker 
					  begin 
					        ALU_b_mux = 32'bz;
							  bk_Cin = 1'bz;
					        Cout = (ALU_a[31])?1'b0:1'b1;
							  ALU_c = ALU_a;
					  end 					  
		endcase
end

endmodule

