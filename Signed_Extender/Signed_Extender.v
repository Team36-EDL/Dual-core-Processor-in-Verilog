module Signed_Extender(Imm12, Imm20, CTRL, Imm32);

input [11:0] Imm12;
input [19:0] Imm20;
input [1:0] CTRL;

output reg [31:0] Imm32;

always @(*)
begin
      case (CTRL)
		
		        2'b00: //Imm12
				  begin
				  Imm32 =  {{20{Imm12[11]}}, Imm12};
				  end
				  
				  2'b01: //Imm13 -> Imm12+{0}
				  begin
				  Imm32 =  {{19{Imm12[11]}}, Imm12, 1'b0};
				  end
				  
				  2'b10: //Imm20
				  begin 
				  Imm32 =  {{12{Imm20[19]}}, Imm20};
				  end
				  
				  2'b11: //Imm21
				  begin 
				  Imm32 =  {{11{Imm20[19]}}, Imm20, 1'b0};
				  end
				  
		 endcase
end

endmodule 