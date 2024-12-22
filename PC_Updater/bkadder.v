module bkadder (A, B, Cin, Y, Cout);

input [31:0] A,B;
input Cin;

output Cout;
output [31:0] Y;

//PG LAYERS
wire [31:0] P0, G0;
wire [15:0] P1,G1;
wire [7:0] P2,G2;
wire [3:0] P3,G3;
wire [1:0] P4,G4;

//essential PG terms
wire P31_0, G31_0, P2_0, G2_0, P5_0, G5_0, P11_0, G11_0, P23_0, G23_0, P4_0, G4_0, P8_0, G8_0, P16_0, G16_0, 
     P6_0, G6_0, P9_0, G9_0, P12_0, G12_0, P17_0, G17_0, P3_0, G3_0, P7_0, G7_0, P10_0, G10_0, P13_0, G13_0, 
     P14_0, G14_0, P15_0, G15_0, P18_0, G18_0, P19_0, G19_0, P20_0, G20_0, P21_0, G21_0, P22_0, G22_0, P24_0, G24_0, 
     P25_0, G25_0, P26_0, G26_0, P27_0, G27_0, P28_0, G28_0, P29_0, G29_0, P30_0, G30_0;


//Initial P G generation (Layer-0)
genvar i;

generate 

for (i=0;i<32;i=i+1) begin : loop0
    assign P0[i] = A[i] | B[i];
	 assign G0[i] = A[i] & B[i];
end

endgenerate

//Layer-1 

generate 

for(i=0;i<=30;i=i+2)begin : loop1
    assign P1[i/2] = P0[i] & P0[i+1];
	 assign G1[i/2] = G0[i+1] | (G0[i] & P0[i+1]);
end

endgenerate

//Layer-2

generate 

for(i=0;i<=14;i=i+2) begin : loop2
    assign P2[i/2] = P1[i] & P1[i+1];
	 assign G2[i/2] = G1[i+1] | (G1[i] & P1[i+1]);
end

endgenerate

//Layer-3 

generate

for(i=0;i<=6;i=i+2) begin : loop3
    assign P3[i/2] = P2[i] & P2[i+1];
	 assign G3[i/2] = G2[i+1] | (G2[i] & P2[i+1]);
end

endgenerate

//Layer-4

generate 
for(i=0;i<=2;i=i+2) begin : loop4
    assign P4[i/2] = P3[i] & P3[i+1];
	 assign G4[i/2] = G3[i+1] | (G3[i] & P3[i+1]);
end 

endgenerate

//Computing P15:0 and G15:0
assign P31_0 = P4[0] & P4[1];
assign G31_0 = G4[1] | (G4[0] & P4[1]);

assign Cout = G31_0 | (P31_0 & Cin); //computing the Cout

//Optimisation for intermediate terms

//2^n terms
assign Y[16] = A[16] ^ B[16] ^ (G4[0] | (P4[0] & Cin));
assign Y[8] = A[8] ^ B[8] ^ (G3[0] | (P3[0] & Cin));
assign Y[4] = A[4] ^ B[4] ^ (G2[0] | (P2[0] & Cin));
assign Y[2] = A[2] ^ B[2] ^ (G1[0] | (P1[0] & Cin));
assign Y[0] = A[0] ^ B[0] ^ Cin;
  
//3*2^n-1 terms 
assign P2_0 = P0[2] & P1[0];
assign G2_0 = G0[2] | (P0[2] & G1[0]);

assign P5_0 = P1[2] & P2[0];
assign G5_0 = G1[2] | (P1[2] & G2[0]);

assign P11_0 = P2[2] & P3[0];
assign G11_0 = G2[2] | (P2[2] & G3[0]);

assign P23_0 = P3[2] & P4[0];
assign G23_0 = G3[2] | (P3[2] & G4[0]);

assign Y[3] = A[3] ^ B[3] ^ (G2_0 | (P2_0 & Cin));
assign Y[6] = A[6] ^ B[6] ^ (G5_0 | (P5_0 & Cin));
assign Y[12] = A[12] ^ B[12] ^ (G11_0 | (P11_0 & Cin));
assign Y[24] = A[24] ^ B[24] ^ (G23_0 | (P23_0 & Cin));

//2^n +1 terms

assign P4_0 = P0[4] & P2[0];
assign G4_0 = G0[4] | (P0[4] & G2[0]);

assign P8_0 = P0[8] & P3[0];
assign G8_0 = G0[8] | (P0[8] & G3[0]);

assign P16_0 = P0[16] & P4[0];
assign G16_0 = G0[16] | (P0[16] & G4[0]);

assign Y[1] = A[1] ^ B[1] ^  (G0[0] | (P0[0] & Cin));
assign Y[5] = A[5] ^ B[5] ^  (G4_0 | (P4_0 & Cin));
assign Y[9] = A[9] ^ B[9] ^  (G8_0 | (P8_0 & Cin));
assign Y[17] = A[17] ^ B[17] ^  (G16_0 | (P16_0 & Cin));

//next set of terms {7, 10, 13, 18}
assign P6_0 = P0[6] & P5_0;
assign G6_0 = G0[6] | ((G5_0) & P0[6]);

assign P9_0 = P0[9] & P8_0;
assign G9_0 = G0[9] | ((G8_0) & P0[9]);

assign P12_0 = P0[12] & P11_0;
assign G12_0 = G0[12] | ((G11_0) & P0[12]);

assign P17_0 = P0[17] & P16_0;
assign G17_0 = G0[17] | ((G16_0) & P0[17]);

assign Y[7] = A[7] ^ B[7] ^ (G6_0 | (P6_0 & Cin));
assign Y[10] = A[10] ^ B[10] ^ (G9_0 | (P9_0 & Cin));
assign Y[13] = A[13] ^ B[13] ^ (G12_0 | (P12_0 & Cin));
assign Y[18] = A[18] ^ B[18] ^ (G17_0 | (P17_0 & Cin));

//next set of terms {11, 14, 19}
assign P10_0 = P0[10] & P9_0;
assign G10_0 = G0[10] | (G9_0 & P0[10]);

assign P13_0 = P0[13] & P12_0;
assign G13_0 = G0[13] | (G12_0 & P0[13]);

assign P18_0 = P0[18] & P17_0;
assign G18_0 = G0[18] | (G17_0 & P0[18]);

assign Y[11] = A[11] ^ B[11] ^ (G10_0 | (P10_0 & Cin));
assign Y[14] = A[14] ^ B[14] ^ (G13_0 | (P13_0 & Cin));
assign Y[19] = A[19] ^ B[19] ^ (G18_0 | (P18_0 & Cin));

//next set of terms {15,20}

assign P14_0 = P0[14] & P13_0;
assign G14_0 = G0[14] | (G13_0 & P0[14]);

assign P19_0 = P0[19] & P18_0;
assign G19_0 = G0[19] | (G18_0 & P0[19]);

assign Y[15] = A[15] ^ B[15] ^ (G14_0 | (P14_0 & Cin));
assign Y[20] = A[20] ^ B[20] ^ (G19_0 | (P19_0 & Cin));

//next set of terms {21, 22, 25}

assign P20_0 = P0[20] & P19_0;
assign G20_0 = G0[20] | (G19_0 & P0[20]);

assign P24_0 = P0[24] & P23_0;
assign G24_0 = G0[24] | (G23_0 & P0[24]);

assign P21_0 = P1[10] & P19_0;
assign G21_0 = G1[10] | (G19_0 & P1[10]);

assign Y[21] = A[21] ^ B[21] ^ (G20_0 | (P20_0 & Cin));
assign Y[22] = A[22] ^ B[22] ^ (G21_0 | (P21_0 & Cin));
assign Y[25] = A[25] ^ B[25] ^ (G24_0 | (P24_0 & Cin));

//NEXT SET OF TERMS {23, 26, 28}

assign P25_0 = P0[25] & P24_0;
assign G25_0 = G0[25] | (G24_0 & P0[25]);

assign P22_0 = P0[22] & P21_0;
assign G22_0 = G0[22] | (G21_0 & P0[22]);

assign P27_0 = P1[6] & P23_0;
assign G27_0 =  G1[6] | (G23_0 & P1[6]);

assign Y[23] = A[23] ^ B[23] ^ (G22_0 | (P22_0 & Cin));
assign Y[26] = A[26] ^ B[26] ^ (G25_0 | (P25_0 & Cin));
assign Y[28] = A[28] ^ B[28] ^ (G27_0 | (P27_0 & Cin));

//NEXT SET OF TERMS {27,29}

assign P26_0 = P0[26] & P25_0;
assign G26_0 = G0[26] | (G25_0 & P0[26]);

assign P28_0 = P0[28] & P27_0;
assign G28_0 = G0[28] | (G27_0 & P0[28]);

assign Y[27] = A[27] ^ B[27] ^ (G26_0 | (P26_0 & Cin));
assign Y[29] = A[29] ^ B[29] ^ (G28_0 | (P28_0 & Cin));

//next set of terms {30,31}

assign P29_0 = P0[29] & P28_0;
assign G29_0 = G0[29] | (G28_0 & P0[29]);

assign P30_0 = P0[30] & P29_0;
assign G30_0 = G0[30] | (G29_0 & P0[30]);

assign Y[30] = A[30] ^ B[30] ^ (G29_0 | (P29_0 & Cin));
assign Y[31] = A[31] ^ B[31] ^ (G30_0 | (P30_0 & Cin));

endmodule 

 


