module Data_Memory(RD_en, WR_en, mode, Add, Rd, D, Q, CLK);

input [31:0]Add, D, Rd;
input RD_en, WR_en, CLK;
input [1:0] mode;  //determines both read and write modes

//assuming rd and wr not together we can have a common mode input 

output reg [31:0] Q;

reg [31:0] memory [0:4294967295] ; 	//2^32 rows each of 32 bits

//synchronous write process
always @(posedge CLK)
begin 
      if(WR_en == 1'b1)
		begin
		      case(mode)
				   
					2'b00: //write only lower byte 
					begin 
					      memory[Add]<={memory[Add][31:8],D[7:0]};
					end 
					
					2'b01: //half word
					begin 
					      memory[Add]<={memory[Add][31:16],D[15:0]};
					end 
					
					2'b11: //full word
					begin
					      memory[Add]<=D;
					end	
		         
		         default: ;			
				endcase
		end
		
		else
		begin
		end		
end

//asynchronous read operations
always @(*)
begin
      if(RD_en == 1'b1) 
		begin
		      case (mode)
				
				   2'b00: //read only lower byte 
					begin 
					    Q <= {{24{memory[Rd][7]}}, memory[Rd][7:0]};			  
					end 
					
					2'b01: //half word
					begin 
					     Q <= {{16{memory[Rd][15]}}, memory[Rd][15:0]};
					end 
					
					2'b11: //full word
					begin
					      Q<=memory[Rd];
					end				
					default: Q <=32'bz;
				endcase
		 end 
		 else
		 begin
		       Q<=32'bz;
		 end
end 

endmodule

				     



