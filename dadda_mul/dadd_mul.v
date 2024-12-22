module dadd_mul (A, B, Y, Cout); //D=19 

input [23:0] A,B;
output [46:0] Y; 
output Cout;

wire [23:0] product_terms [23:0]; 
 
//wires for layer-1   
wire Y19_19, Y20_19, Y20_18, Y20_22, Y21_23, Y21_24, Y21_19, Y21_18, Y21_17; 
wire Y22_24, Y22_25, Y22_26, Y22_19, Y22_18, Y22_17, Y22_16;
wire Y23_25, Y23_26, Y23_27, Y23_28, Y23_19, Y23_18, Y23_17, Y23_16, Y23_15; 
wire Y24_24, Y24_25, Y24_26, Y24_27, Y24_28, Y24_19, Y24_18, Y24_17, Y24_16, Y24_15; 
wire Y25_23, Y25_24, Y25_25, Y25_26, Y25_27, Y25_19, Y25_18, Y25_17, Y25_16; 
wire Y26_22, Y26_23, Y26_24, Y26_25, Y26_19, Y26_18, Y26_17; 
wire Y27_21, Y27_22, Y27_23, Y27_19, Y27_18; 
wire Y28_20, Y28_21, Y28_19; 
wire Y29_19; 

 
// Wires for Layer 2
wire Y13_13, Y14_16; // Column 13
wire Y14_13, Y15_17, Y15_18; // Column 14
wire Y15_13, Y16_18, Y15_12, Y16_19, Y15_11, Y16_20; // Column 15
wire Y16_13, Y17_19, Y17_20, Y16_11, Y17_21, Y16_12; // Column 16
wire Y17_13, Y18_20, Y18_21, Y17_11, Y18_22, Y17_10, Y18_23; // Column 17
wire Y18_13, Y19_20, Y19_21, Y18_11, Y19_22, Y18_10, Y19_23, Y18_9, Y19_24; // Column 18
wire Y19_13, Y20_20, Y20_21, Y19_11, Y19_10, Y20_23, Y19_9, Y20_24; // Column 19
wire Y20_13, Y21_20, Y21_21, Y20_11, Y21_22, Y20_10; // Column 20
wire Y21_13, Y22_20, Y22_21, Y21_11, Y22_22, Y21_10, Y22_23; // Column 21
wire Y22_13, Y23_20, Y23_21, Y22_11, Y23_22, Y22_10, Y23_23, Y23_24; // Column 22
wire Y23_13, Y24_20, Y24_21, Y23_11, Y24_22, Y23_10, Y24_23; // Column 23
wire Y24_13, Y25_20, Y25_21, Y24_11, Y25_22, Y24_10; // Column 24
wire Y25_13, Y26_20, Y26_21, Y25_11, Y25_10; // Column 25
wire Y26_13, Y27_20, Y26_11, Y26_10; // Column 26
wire Y27_13, Y27_11, Y28_22, Y27_10, Y28_23; // Column 27
wire Y14_12, Y17_22, Y17_12, Y17_9, Y18_24, Y18_12, Y18_8, Y19_25;
wire Y19_12, Y19_8, Y20_25, Y20_12, Y20_9, Y20_8, Y21_25;
wire Y21_12, Y21_9, Y21_8, Y22_12, Y22_9, Y22_8, Y23_12, Y23_9;
wire Y23_8, Y24_12, Y24_9, Y24_8, Y25_12, Y25_9, Y25_8, Y26_12;
wire Y26_9, Y27_24, Y26_8, Y27_25, Y27_12, Y27_9, Y28_24, Y27_8;
wire Y28_25, Y28_13, Y29_20, Y28_12, Y29_21, Y28_11, Y29_22;
wire Y28_10, Y29_23, Y28_9, Y29_24, Y28_8, Y29_25, Y30_18, Y29_12;
wire Y30_19, Y29_11, Y30_20, Y29_10, Y30_21, Y29_9, Y30_22, Y29_8;
wire Y30_23, Y30_13, Y31_17, Y30_12, Y31_18, Y30_11, Y31_19, Y30_10;
wire Y31_20, Y30_9, Y31_21, Y30_8, Y32_16, Y31_12, Y32_17, Y31_11;
wire Y32_18, Y31_10, Y32_19, Y32_13, Y33_15, Y32_12, Y33_16, Y32_11;
wire Y33_17, Y34_15, Y33_12, Y34_16, Y34_13, Y35_13, Y29_13, Y31_13;

//layer-3 wire

wire Y16_10, Y9_9, Y10_12, Y10_9, Y11_13, Y10_8, Y11_14, Y11_9, Y12_14, Y11_8;
wire Y12_15, Y11_7, Y12_16, Y12_9, Y13_14, Y12_8, Y13_15, Y12_7, Y13_16, Y12_6;
wire Y13_17, Y13_9, Y14_14, Y13_8, Y14_15, Y13_7, Y13_6, Y14_17, Y14_9, Y15_14;
wire Y14_8, Y15_15, Y14_7, Y15_16, Y14_6, Y15_9, Y16_14, Y15_8, Y16_15, Y15_7;
wire Y16_16, Y15_6, Y16_17, Y16_9, Y17_14, Y16_8, Y17_15, Y16_7, Y17_16, Y16_6;
wire Y17_17, Y18_14, Y17_8, Y18_15, Y17_7, Y18_16, Y17_6, Y18_17, Y19_14, Y19_15;
wire Y18_7, Y19_16, Y18_6, Y19_17, Y20_14, Y20_15, Y19_7, Y20_16, Y19_6, Y20_17;
wire Y21_14, Y21_15, Y20_7, Y21_16, Y20_6, Y22_14, Y22_15, Y21_7, Y21_6, Y23_14;
wire Y22_7, Y22_6, Y24_14, Y23_7, Y23_6, Y25_14, Y25_15, Y24_7, Y24_6, Y26_14;
wire Y26_15, Y25_7, Y26_16, Y25_6, Y27_14, Y27_15, Y26_7, Y27_16, Y26_6, Y27_17;
wire Y28_14, Y28_15, Y27_7, Y28_16, Y27_6, Y28_17, Y29_14, Y29_15, Y28_7, Y29_16;
wire Y28_6, Y29_17, Y30_14, Y30_15, Y29_7, Y30_16, Y29_6, Y30_17, Y31_14, Y31_15;
wire Y30_7, Y31_16, Y30_6, Y31_9, Y32_14, Y31_8, Y32_15, Y31_7, Y31_6, Y32_9;
wire Y33_14, Y32_8, Y32_7, Y32_6, Y33_13, Y33_9, Y34_14, Y33_8, Y33_7, Y33_6;
wire Y34_17, Y34_9, Y35_14, Y34_8, Y35_15, Y34_7, Y35_16, Y34_6, Y35_17, Y36_12;
wire Y35_9, Y36_13, Y35_8, Y36_14, Y35_7, Y36_15, Y35_6, Y36_9, Y37_11, Y36_8;
wire Y37_12, Y36_7, Y37_13, Y37_9, Y38_10, Y37_8, Y38_11, Y38_9, Y39_9;

//layer-4 wire 

// Group 1: Y1 to Y8
wire Y1_1, Y1_2, Y1_3, Y1_4, Y1_5, Y1_6, Y1_7, Y1_8, Y1_9, Y1_10;
wire Y2_1, Y2_2, Y2_3, Y2_4, Y2_5, Y2_6, Y2_7, Y2_8, Y2_9, Y2_10;
wire Y3_1, Y3_2, Y3_3, Y3_4, Y3_5, Y3_6, Y3_7, Y3_8, Y3_9, Y3_10;
wire Y4_1, Y4_2, Y4_3, Y4_4, Y4_5, Y4_6, Y4_7, Y4_8, Y4_9, Y4_10;
wire Y5_1, Y5_2, Y5_3, Y5_4, Y5_5, Y5_6, Y5_7, Y5_8, Y5_9, Y5_10;
wire Y6_1, Y6_2, Y6_3, Y6_4, Y6_5, Y6_6, Y6_7, Y6_8, Y6_9, Y6_10;
wire Y7_1, Y7_2, Y7_3, Y7_4, Y7_5, Y7_6, Y7_7, Y7_8, Y7_9, Y7_10;
wire Y8_1, Y8_2, Y8_3, Y8_4, Y8_5, Y8_6, Y8_7, Y8_8, Y8_9, Y8_10, Y8_11;

// Group 2: Y9 to Y16
wire Y9_1, Y9_2, Y9_3, Y9_4, Y9_5, Y9_6, Y9_7, Y9_8, Y9_10, Y9_11, Y9_12;
wire Y10_1, Y10_2, Y10_3, Y10_4, Y10_5, Y10_6, Y10_7, Y10_10, Y10_11;
wire Y11_1, Y11_2, Y11_3, Y11_4, Y11_5, Y11_6, Y11_10, Y11_11, Y11_12;
wire Y12_1, Y12_2, Y12_3, Y12_4, Y12_5, Y12_10, Y12_11, Y12_12;
wire Y13_1, Y13_2, Y13_3, Y13_4, Y13_5, Y13_10, Y13_11, Y13_12;
wire Y14_1, Y14_2, Y14_3, Y14_4, Y14_5, Y14_10, Y14_11;
wire Y15_1, Y15_2, Y15_3, Y15_4, Y15_5, Y15_10;
wire Y16_1, Y16_2, Y16_3, Y16_4, Y16_5;

// Group 3: Y17 to Y24
wire Y17_1, Y17_2, Y17_3, Y17_4, Y17_5;
wire Y18_1, Y18_2, Y18_3, Y18_4, Y18_5;
wire Y19_1, Y19_2, Y19_3, Y19_4, Y19_5;
wire Y20_1, Y20_2, Y20_3, Y20_4, Y20_5;
wire Y21_1, Y21_2, Y21_3, Y21_4, Y21_5;
wire Y22_1, Y22_2, Y22_3, Y22_4, Y22_5;
wire Y23_1, Y23_2, Y23_3, Y23_4, Y23_5;
wire Y24_1, Y24_2, Y24_3, Y24_4, Y24_5;

// Group 4: Y25 to Y32
wire Y25_1, Y25_2, Y25_3, Y25_4, Y25_5;
wire Y26_1, Y26_2, Y26_3, Y26_4, Y26_5;
wire Y27_1, Y27_2, Y27_3, Y27_4, Y27_5;
wire Y28_1, Y28_2, Y28_3, Y28_4, Y28_5;
wire Y29_1, Y29_2, Y29_3, Y29_4, Y29_5;
wire Y30_1, Y30_2, Y30_3, Y30_4, Y30_5;
wire Y31_1, Y31_2, Y31_3, Y31_4, Y31_5;
wire Y32_1, Y32_2, Y32_3, Y32_4, Y32_5, Y32_10;

// Group 5: Y33 to Y40
wire Y33_1, Y33_2, Y33_3, Y33_4, Y33_5, Y33_10, Y33_11;
wire Y34_1, Y34_2, Y34_3, Y34_4, Y34_5, Y34_10, Y34_11, Y34_12;
wire Y35_1, Y35_2, Y35_3, Y35_4, Y35_5, Y35_10, Y35_11, Y35_12;
wire Y36_1, Y36_2, Y36_3, Y36_4, Y36_5, Y36_6, Y36_10, Y36_11;
wire Y37_1, Y37_2, Y37_3, Y37_4, Y37_5, Y37_6, Y37_7, Y37_10;
wire Y38_1, Y38_2, Y38_3, Y38_4, Y38_5, Y38_6, Y38_7, Y38_12;
wire Y39_1, Y39_2, Y39_3, Y39_4, Y39_5, Y39_6, Y39_7, Y39_8, Y39_10, Y39_11, Y39_12;
wire Y40_1, Y40_5, Y40_6, Y40_8, Y40_9, Y40_10;

// Group 6: Y41 to Y42
wire Y41_6, Y41_7, Y41_8;
wire Y42_6;



genvar i,j;

generate
    for (i = 0; i < 24; i = i + 1) begin : row_loop 
	 
        for (j = 0; j < 24; j = j + 1) begin : column_loop
		  
            assign product_terms[i][j] = A[i] & B[j]; 
				
        end // End of column_loop
    end // End of row_loop
	 
endgenerate 

/* layer -1 detailing:

1)collumn 0 -> 1 term -> product_terms[0][0]
  collumn 1 -> 2 terms -> product_terms[0][1], product_terms[1][0]
  collumn 2 -> 3 terms  
  |
  |
  |
  collumn 18 -> 19 terms 

all above collumns will be passed on forward 

2)collumn 19 -> 20 terms // 1 HA for the last 2 terms net 19 terms forwarded
  collumn 20 -> 21 terms // 1 FA +1 HA for the last 3 terms and 1 carry from collumn 19, net 19 terms forwarded
  collumn 21 -> 22 terms // 2 FA + 1 HA net 19 terms forwarded
  collumn 22 -> 23 terms // 3 FA + 1 HA net 19 terms forwarded
  
  collumn 23 -> 24 terms // 4 FA + 1 HA
  
  collumn 24 -> 23 terms // 4 FA + 1 HA net 19 terms forwarded
  collumn 25 -> 22 terms // 4 FA  net 19 terms forwarded 
  collumn 26 -> 21 terms // 3 FA for the last 3 terms net 19 terms forwarded
  collumn 27 -> 20 terms // 2 FA for the last 2 terms + carry net 19 terms forwarded
  collumn 28 -> 19 terms + 2 carry terms //1FA  
  
3)collumn 29 -> 18 terms + 1 carry term
  |
  |
  collumn 46 -> 1 term
  
  All the above collumns are forwarded
*/

//code for layer 1:

//col 19: product_terms[0][19] .... product_terms[19][0]

HA HA_1 (product_terms[19][0], product_terms[18][1], Y19_19, Y20_22); //Y19_19 => in collumn 19 but number 19

//col 20: product_terms[0][20] ... product_terms[20][0]

FA FA_1 (product_terms[20][0], product_terms[19][1], Y20_22, Y20_19, Y21_23);
HA HA_2 (product_terms[18][2], product_terms[17][3], Y20_18, Y21_24);


//col 21: product_terms[0][21] ... product_terms[21][0]

FA FA_2 (product_terms[21][0], product_terms[20][1], product_terms[19][2], Y21_19, Y22_24);
FA FA_3 (product_terms[18][3], product_terms[17][4], product_terms[16][5], Y21_18, Y22_25);
HA HA_3 (Y21_23, Y21_24, Y21_17, Y22_26);
 
//col 22: product_terms[0][22] .... product_terms[22][0]

FA FA_4 (product_terms[22][0], product_terms[21][1], product_terms[20][2], Y22_19, Y23_25);
FA FA_5 (product_terms[19][3], product_terms[18][4], product_terms[17][5], Y22_18, Y23_26);
FA FA_6 (Y22_24, Y22_25, Y22_26, Y22_17, Y23_27);
HA HA_4 (product_terms[16][6], product_terms[15][7], Y22_16, Y23_28);

//col 23: product_terms[0][23] ... product_terms[23][0]

FA FA_7 (product_terms[23][0], product_terms[22][1], product_terms[21][2], Y23_19, Y24_24);
FA FA_8 (product_terms[20][3], product_terms[19][4], product_terms[18][5], Y23_18, Y24_25);
FA FA_9 (Y23_25, Y23_26, Y23_27, Y23_17, Y24_26);
FA FA_10 (product_terms[17][6], product_terms[16][7], product_terms[15][8], Y23_16, Y24_27);
HA HA_5 (product_terms[14][9], Y23_28, Y23_15, Y24_28);

//col 24: product_terms[1][23] ... product_terms[23][1]

FA FA_11 (product_terms[23][1], product_terms[22][2], product_terms[21][3], Y24_19, Y25_23);
FA FA_12 (product_terms[20][4], product_terms[19][5], product_terms[18][6], Y24_18, Y25_24);
FA FA_13 (Y24_24, Y24_25, Y24_26, Y24_17, Y25_25);
FA FA_14 (product_terms[17][7], product_terms[16][8], product_terms[15][9], Y24_16, Y25_26);
HA HA_6 (Y24_27, Y24_28, Y24_15, Y25_27);

//col 25: product_terms[2][23] ... product_terms[23][2]

FA FA_15 (product_terms[23][2], product_terms[22][3], product_terms[21][4], Y25_19, Y26_22);
FA FA_16 (product_terms[20][5], product_terms[19][6], product_terms[18][7], Y25_18, Y26_23);
FA FA_17 (Y25_23, Y25_24, Y25_25, Y25_17, Y26_24);
FA FA_18 (Y25_26, Y25_27, product_terms[17][8], Y25_16, Y26_25);

//col 26: product_terms[3][23] ... product_terms[23][3]

FA FA_19 (product_terms[23][3], product_terms[22][4], product_terms[21][5], Y26_19, Y27_21);
FA FA_20 (product_terms[20][6], product_terms[19][7], Y26_25, Y26_18, Y27_22);
FA FA_21 (Y26_22, Y26_23, Y26_24, Y26_17, Y27_23);
 
//col 27: product_terms[4][23] ... product_terms[23][4]

FA FA_22 (product_terms[23][4], product_terms[22][5], product_terms[21][6], Y27_19, Y28_20);
FA FA_23 (Y27_21, Y27_23, Y27_22, Y27_18, Y28_21);

//col 28: product_terms[5][23] ... product_terms[23][5]

FA FA_24 (Y28_20, Y28_21, product_terms[23][5], Y28_19, Y29_19);

//layer-1 completed 


/*layer-2 detailing : (d=13)

1) collumn 0 -> 1 term
   collumn 1 -> 2 terms
   |
   | 
   |	
   collumn 12 -> 13 terms 
	
	All above collumns are forwarded to next layer 

2) collumn 13 -> 14 terms -> 1 HA 
   collumn 14 -> 15 (+1) terms -> 1 FA + 1 HA
   collumn 15 -> 16 (+2) terms -> 2 FA + 1HA  
   collumn 16 -> 17 (+3) terms -> 3 FA + 1 HA 
	collumn 17 -> 18 (+4) terms -> 4 FA + 1 HA
	
3) collumn 18 -> 19 (+5) terms -> 5 FA + 1 HA  
	collumn 19 -> 19 (+6) terms -> 6 FA
   collumn 20 -> 19 (+6) terms -> 6 FA
	| 
   |
   collumn 29 -> 19 terms -> 6 FA 

4)	collumn 30 -> 17 (+6) terms -> 5 FA
   collumn 31 -> 16 (+5) terms -> 4 FA
	collumn 32 -> 15 (+4) terms -> 3 FA
	collumn 33 -> 14 (+3) terms -> 2 FA 
	collumn 34 -> 13 (+2) terms -> 1 FA
	
5) collumn 35 -> 12 (+1) terms
   |
	|
	collumn 46 -> 1 term 
	
	All the above collumns are forwarded to the next layer 
*/ 

//code of layer 2 :

//col 13: products_term[0][13] .. product_terms[13][0]

HA HA_7 (product_terms[13][0], product_terms[12][1], Y13_13, Y14_16);

//col 14: product_terms[0][14] ... product_terms[14][0]

FA FA_25 (product_terms[14][0], product_terms[13][1], product_terms[12][2], Y14_13, Y15_17);
HA HA_8 (product_terms[11][3],Y14_16, Y14_12, Y15_18); 

//col 15: product_terms[0][15] ... product_terms[15][0]

FA FA_26 (product_terms[15][0], product_terms[14][1], product_terms[13][2], Y15_13, Y16_18);
FA FA_27 (product_terms[12][3], product_terms[11][4], product_terms[10][5], Y15_12, Y16_19);
HA HA_9 (Y15_17, Y15_18, Y15_11, Y16_20); 

//col 16: product_terms[0][16] ... product_terms[16][0]

FA FA_28 (product_terms[16][0], product_terms[15][1], product_terms[14][2], Y16_13, Y17_19);
FA FA_29 (product_terms[13][3], product_terms[12][4], product_terms[11][5], Y16_12, Y17_20);
FA FA_30 (Y16_19, Y16_20, Y16_18, Y16_11, Y17_21);
HA HA_10 (product_terms[10][6], product_terms[9][7], Y16_10, Y17_22);

//col 17: product_terms[0][17] ... product_terms[17][0]

FA FA_31 (product_terms[17][0], product_terms[16][1], product_terms[15][2], Y17_13, Y18_20);
FA FA_32 (product_terms[14][3], product_terms[13][4], product_terms[12][5], Y17_12, Y18_21);
FA FA_33 (Y17_19, Y17_20, Y17_21, Y17_11, Y18_22);
FA FA_34 (product_terms[11][6], product_terms[10][7], product_terms[9][8], Y17_10, Y18_23);
HA HA_11 (product_terms[8][9], Y17_22, Y17_9, Y18_24);

//col 18: product_terms[0][18] ... product_terms[18][0]

FA FA_35 (product_terms[18][0], product_terms[17][1], product_terms[16][2], Y18_13, Y19_20);
FA FA_36 (product_terms[15][3], product_terms[14][4], product_terms[13][5], Y18_12, Y19_21);
FA FA_37 (Y18_20, Y18_21, Y18_22, Y18_11, Y19_22);
FA FA_38 (product_terms[12][6], product_terms[11][7], product_terms[10][8], Y18_10, Y19_23);
FA FA_39 (product_terms[9][9], product_terms[8][10], product_terms[7][11], Y18_9, Y19_24);
HA HA_12 (Y18_24, Y18_23, Y18_8, Y19_25);

//col 19: product_terms[0][19] ... product_terms[18][1], Y19_19

FA FA_40 (product_terms[17][2], product_terms[16][3], Y19_19, Y19_13, Y20_20);
FA FA_41 (product_terms[15][4], product_terms[14][5], product_terms[13][6], Y19_12, Y20_21);
FA FA_42 (Y19_20, Y19_21, Y19_22, Y19_11, Y20_22);
FA FA_43 (Y19_23, Y19_24, Y19_25, Y19_10, Y20_23);
FA FA_44 (product_terms[12][7], product_terms[11][8], product_terms[10][9], Y19_9, Y20_24);
FA FA_45 (product_terms[9][10], product_terms[8][11], product_terms[7][12], Y19_8, Y20_25);

//col 20: product_terms[0][20] ... product_terms[16][4], Y20_19, Y20_18

FA FA_46 (product_terms[16][4], Y20_19, Y20_18, Y20_13, Y21_20);
FA FA_47 (product_terms[15][5], product_terms[14][6], product_terms[13][7], Y20_12, Y21_21);
FA FA_48 (Y20_20, Y20_21, Y20_22, Y20_11, Y21_22);
FA FA_49 (Y20_23, Y20_24, Y20_25, Y20_10, Y21_23);
FA FA_50 (product_terms[12][8], product_terms[11][9], product_terms[10][10], Y20_9, Y21_24);
FA FA_51 (product_terms[9][11], product_terms[8][12], product_terms[7][13], Y20_8, Y21_25);

//col 21: product_terms[0][21] ... product_terms[16][5], Y21_19, Y21_18, Y21_17

FA FA_52 (product_terms[16][5], product_terms[15][6], product_terms[14][7], Y21_13, Y22_20);
FA FA_53 (product_terms[13][8], product_terms[12][9], product_terms[11][10], Y21_12, Y22_21);
FA FA_54 (Y21_20, Y21_21, Y21_22, Y21_11, Y22_22);
FA FA_55 (Y21_23, Y21_24, Y21_25, Y21_10, Y22_23);
FA FA_56 (product_terms[10][11], product_terms[9][12], product_terms[8][13], Y21_9, Y22_24);
FA FA_57 (Y21_19, Y21_18, Y21_17, Y21_8, Y22_25);

//col 22: product_terms[0][22] ... product_terms[14][8], Y22_19 -> Y22_16

FA FA_58 (product_terms[14][8], product_terms[13][9], product_terms[12][10], Y22_13, Y23_20);
FA FA_59 (product_terms[11][11], product_terms[10][12], product_terms[9][13], Y22_12, Y23_21);
FA FA_60 (Y22_20, Y22_21, Y22_22, Y22_11, Y23_22);
FA FA_61 (Y22_23, Y22_24, Y22_25, Y22_10, Y23_23);
FA FA_62 (product_terms[8][14], product_terms[7][15], Y22_16, Y22_9, Y23_24);
FA FA_63 (Y22_19, Y22_18, Y22_17, Y22_8, Y23_25);

//col 23: product_terms[0][23] ... product_terms[13][10], Y23_19 -> Y23_15 

FA FA_64 (product_terms[13][10], product_terms[12][11], product_terms[11][12], Y23_13, Y24_20);
FA FA_65 (product_terms[10][13], product_terms[9][14], product_terms[8][15], Y23_12, Y24_21);
FA FA_66 (Y23_20, Y23_21, Y23_22, Y23_11, Y24_22);
FA FA_67 (Y23_23, Y23_24, Y23_25, Y23_10, Y24_23);
FA FA_68 (product_terms[7][16], Y23_16, Y23_15, Y23_9, Y24_24);
FA FA_69 (Y23_19, Y23_18, Y23_17, Y23_8, Y24_25);

//col 24: product_terms[1][23] ... product_terms[14][10], Y24_19 -> Y24_15

FA FA_70 (product_terms[14][10], product_terms[13][11], product_terms[12][12], Y24_13, Y25_20);
FA FA_71 (product_terms[11][13], product_terms[10][14], product_terms[9][15], Y24_12, Y25_21);
FA FA_72 (Y24_20, Y24_21, Y24_22, Y24_11, Y25_22);
FA FA_73 (Y24_23, Y24_24, Y24_25, Y24_10, Y25_23);
FA FA_74 (product_terms[8][16], Y24_16, Y24_15, Y24_9, Y25_24);
FA FA_75 (Y24_19, Y24_18, Y24_17, Y24_8, Y25_25);

//col 25: product_terms[2][23] ... product_terms[16][9], Y25_19 -> Y25_16

FA FA_76 (product_terms[16][9], product_terms[15][10], product_terms[14][11], Y25_13, Y26_20);
FA FA_77 (product_terms[13][12], product_terms[12][13], product_terms[11][14], Y25_12, Y26_21);
FA FA_78 (Y25_20, Y25_21, Y25_22, Y25_11, Y26_22);
FA FA_79 (Y25_23, Y25_24, Y25_25, Y25_10, Y26_23);
FA FA_80 (product_terms[10][15], product_terms[9][16], Y25_16, Y25_9, Y26_24);
FA FA_81 (Y25_19, Y25_18, Y25_17, Y25_8, Y26_25);

//col 26: product_terms[3][23] ... product_terms[18][8], Y26_19 -> Y26_17

FA FA_82 (product_terms[18][8], product_terms[17][9], product_terms[16][10], Y26_13, Y27_20);
FA FA_83 (product_terms[15][11], product_terms[14][12], product_terms[13][13], Y26_12, Y27_21);
FA FA_84 (Y26_20, Y26_21, Y26_22, Y26_11, Y27_22);
FA FA_85 (Y26_23, Y26_24, Y26_25, Y26_10, Y27_23);
FA FA_86 (product_terms[12][14], product_terms[11][15], product_terms[10][16], Y26_9, Y27_24);
FA FA_87 (Y26_19, Y26_18, Y26_17, Y26_8, Y27_25);

//col 27: product_terms[4][23] ... product_terms[20][7], Y27_19->Y27_18

FA FA_88 (product_terms[20][7], product_terms[19][8], product_terms[18][17], Y27_13, Y28_20);
FA FA_89 (product_terms[17][10], product_terms[16][11], product_terms[15][12], Y27_12, Y28_21);
FA FA_90 (Y27_20, Y27_21, Y27_22, Y27_11, Y28_22);
FA FA_91 (Y27_23, Y27_24, Y27_25, Y27_10, Y28_23);
FA FA_92 (product_terms[14][13], product_terms[13][14], product_terms[12][15], Y27_9, Y28_24);
FA FA_93 (Y27_19, Y27_18, product_terms[11][16], Y27_8, Y28_25);

//col 28: product_terms[5][23] ... product_terms[22][6], Y28_19

FA FA_94 (product_terms[22][6], product_terms[21][7], product_terms[20][8], Y28_13, Y29_20);
FA FA_95 (product_terms[19][9], product_terms[18][10], product_terms[17][11], Y28_12, Y29_21);
FA FA_96 (Y28_20, Y28_21, Y28_22, Y28_11, Y29_22);
FA FA_97 (Y28_23, Y28_24, Y28_25, Y28_10, Y29_23);
FA FA_98 (product_terms[16][12], product_terms[15][13], product_terms[14][14], Y28_9, Y29_24);
FA FA_99 (Y28_19, product_terms[13][15], product_terms[12][16], Y28_8, Y29_25);

//col 29: product_terms[6][23] ... product_terms[23][6] ; Y29_19

FA FA_100 (product_terms[23][6], product_terms[22][7], product_terms[21][8], Y29_13, Y30_18);
FA FA_101 (product_terms[20][9], product_terms[19][10], product_terms[18][11], Y29_12, Y30_19);
FA FA_102 (Y29_20, Y29_21, Y29_22, Y29_11, Y30_20);
FA FA_103 (Y29_23, Y29_24, Y29_25, Y29_10, Y30_21);
FA FA_104 (product_terms[17][12], product_terms[16][13], product_terms[15][14], Y29_9, Y30_22);
FA FA_105 (product_terms[14][15], product_terms[13][16], Y29_19, Y29_8, Y30_23); 

//col 30: product_terms[7][23] ... product_terms[23][7]

FA FA_106 (product_terms[23][7], product_terms[22][8], product_terms[21][9], Y30_13, Y31_17);
FA FA_107 (product_terms[20][10], product_terms[19][11], product_terms[18][12], Y30_12, Y31_18);
FA FA_108 (Y30_18, Y30_19, Y30_20, Y30_11, Y31_19);
FA FA_109 (Y30_23, Y30_22, Y30_21, Y30_10, Y31_20);
FA FA_110 (product_terms[17][13], product_terms[16][14], product_terms[15][15], Y30_9, Y31_21);

//col 31: product_terms[8][23] ... product_terms[23][8]

FA FA_111 (product_terms[23][8], product_terms[22][9], product_terms[21][10], Y31_13, Y32_16);
FA FA_112 (product_terms[20][11], product_terms[19][12], product_terms[18][13], Y31_12, Y32_17);
FA FA_113 (Y31_17, Y31_18, Y31_19, Y31_11, Y32_18);
FA FA_114 (product_terms[17][14], Y31_21, Y31_20, Y31_10, Y32_19);

//col 32: product_terms[9][23] ... product_terms[23][9]

FA FA_115 (product_terms[23][9], product_terms[22][10], product_terms[21][11], Y32_13, Y33_15);
FA FA_116 (product_terms[20][12], product_terms[19][13], Y32_16, Y32_12, Y33_16);
FA FA_117 (Y32_17, Y32_18, Y31_19, Y32_11, Y33_17);

//col 33: product_terms[10][23] ... product_terms[23][10]

FA FA_118 (product_terms[23][10], product_terms[22][11], product_terms[21][12], Y32_13, Y34_15);
FA FA_119 (Y33_15, Y33_16, Y33_17, Y33_12, Y34_16);

//col 34: product_terms[11][23] ... product_terms[23][11]

FA FA_120 (product_terms[23][11], Y34_16, Y34_15, Y34_13, Y35_13);

//END of layer 2

/*layer-3 detailing: (d=9)

1) collumn 0 -> 1 term
   collumn 1 -> 2 terms
   |
   | 
   |	
   collumn 8 -> 9 terms 
	
	All above collumns are forwarded to the next layer 

2) collumn 9  -> 10 terms -> 1 HA
   collumn 10 -> 11 (+1) terms -> 1 FA + 1 HA 
	collumn 11 -> 12 (+2) terms -> 2 FA + 1HA 
	collumn 12 -> 13 (+3) terms -> 3 FA + 1 HA 
	
3)	collumn 13 -> 13 (+4) terms -> 4 FA 
	collumn 14 -> 13 (+4) terms -> 4 FA  
   |
   |
   collumn 35 -> 13 (+4) terms -> 4 FA	

3) collumn 36 -> 11 (+4) terms -> 3 FA
   collumn 37 -> 10 (+3) terms -> 2 FA
   collumn 38 -> 9 (+2) terms -> 1 FA
	
4) collumn 39 -> 8 (+1) terms 	
   |
	|
	collumn 46 -> 1 term 
  
   All above collumns are forwarded to the next layer  
*/

//code for layer-3

//col 9: product_terms[0][9] ... product_terms[9][0]

HA HA_13 (product_terms[9][0], product_terms[8][1], Y9_9, Y10_12);

//col 10: product_terms[0][10] ... product_terms[10][0]

FA FA_121 (product_terms[10][0], product_terms[9][1], product_terms[8][2], Y10_9, Y11_13);
HA HA_14 (product_terms[7][3], Y10_12, Y10_8, Y11_14);

//col 11: product_terms[0][11] ... product_terms[11][0]

FA FA_122 (product_terms[11][0], product_terms[10][1], product_terms[9][2], Y11_9, Y12_14);
FA FA_123 (product_terms[8][3], product_terms[7][4], product_terms[6][5], Y11_8, Y12_15);
HA HA_15 (Y11_13, Y11_14, Y11_7, Y12_16);

//col 12: product_terms[0][12] ... product_terms[12][0]

FA FA_124 (Y12_14, Y12_15, Y12_16, Y12_9, Y13_14);
FA FA_125 (product_terms[12][0], product_terms[11][1], product_terms[10][2], Y12_8, Y13_15);
FA FA_126 (product_terms[9][3], product_terms[8][4], product_terms[7][5], Y12_7, Y13_16);
HA HA_16 (product_terms[6][6], product_terms[5][7], Y12_6, Y13_17);

//col 13: product_terms[0][13] ... product_terms[11][2], Y13_13

FA FA_127 (Y13_14, Y13_15, Y13_16, Y13_9, Y14_14);
FA FA_128 (product_terms[11][2], Y13_17, Y13_13, Y13_8, Y14_15);
FA FA_129 (product_terms[10][3], product_terms[9][4], product_terms[8][5], Y13_7, Y14_16);
FA FA_130 (product_terms[6][7], product_terms[5][8], product_terms[7][6], Y13_6, Y14_17);

//col 14: product_terms[0][14] .. product_terms[10][4], Y14_13 -> Y14_12 

FA FA_131 (Y14_14, Y14_15, Y14_16, Y14_9, Y15_14);
FA FA_132 (Y14_17, Y14_12, Y14_13, Y14_8, Y15_15);
FA FA_133 (product_terms[10][4], product_terms[9][5], product_terms[8][6], Y14_7, Y15_16);
FA FA_134 (product_terms[7][7], product_terms[6][8], product_terms[5][9], Y14_6, Y15_17);

//col 15: product_terms[0][15] ... product_terms[9][6], Y15_13->Y15_11

FA FA_135 (Y15_14, Y15_15, Y15_16, Y15_9, Y16_14);
FA FA_136 (Y15_17, Y15_12, Y15_13, Y15_8, Y16_15);
FA FA_137 (Y15_11, product_terms[9][6], product_terms[8][7], Y15_7, Y16_16);
FA FA_138 (product_terms[7][8], product_terms[6][9], product_terms[5][10], Y15_6, Y16_17);


//col 16: product_terms[0][16] ... product_terms[8][8], Y16_13->Y16_10

FA FA_139 (Y16_13, Y16_12, Y16_11, Y16_9, Y17_14);
FA FA_140 (Y16_10, Y16_14, Y16_15, Y16_8, Y17_15);
FA FA_141 (Y16_16, Y16_17, product_terms[8][8], Y16_7, Y17_16);
FA FA_142 (product_terms[7][9], product_terms[6][10], product_terms[5][11], Y16_6, Y17_17);

//col 17	: product_terms[0][17] ... product_terms[7][10]; Y17_13 -> Y17_9

FA FA_143 (Y17_13, Y17_12, Y17_11, Y17_9, Y18_14);
FA FA_144 (Y17_10, Y17_9, Y17_14, Y17_8, Y18_15);
FA FA_145 (Y17_15, Y17_16, Y17_17, Y17_7, Y18_16);
FA FA_146 (product_terms[7][10], product_terms[6][11], product_terms[5][12], Y17_6, Y18_17);

//col 18: product_terms[0][18] ... product_terms[6][12]; Y18_13->Y18_8 

FA FA_147 (Y18_13, Y18_12, Y18_11, Y18_9, Y19_14);
FA FA_148 (Y18_10, Y18_9, Y18_8, Y18_8, Y19_15);
FA FA_149 (Y18_14, Y18_15, Y18_16, Y18_7, Y19_16);
FA FA_150 (Y18_17, product_terms[6][12], product_terms[5][13], Y18_6, Y19_17);

//col 19: product_terms[0][19] ... product_terms[6][13]; Y19_13->Y19_8 

FA FA_151 (Y19_13, Y19_12, Y19_11, Y19_9, Y20_14);
FA FA_152 (Y19_10, Y19_9, Y19_8, Y19_8, Y20_15);
FA FA_153 (Y19_17, Y19_14, Y19_15, Y19_7, Y20_16);
FA FA_154 (Y19_16, product_terms[5][14], product_terms[6][13], Y19_6, Y20_17);

//col 20: product_terms[0][20] ... product_terms[6][14]; Y20_13->Y20_8

FA FA_155 (Y20_13, Y20_12, Y20_11, Y20_9, Y21_14);
FA FA_156 (Y20_10, Y20_9, Y20_8, Y20_8, Y21_15);
FA FA_157 (Y20_17, Y20_14, Y20_15, Y20_7, Y21_16);
FA FA_158 (Y20_16, product_terms[5][15], product_terms[6][14], Y20_6, Y21_17);

//col 21: product_terms[0][21] ... product_terms[7][14]; Y21_13->Y21_8

FA FA_159 (Y21_13, Y21_12, Y21_11, Y21_9, Y22_14);
FA FA_160 (Y21_10, Y21_9, Y21_8, Y21_8, Y22_15);
FA FA_161 (Y21_17, Y21_14, Y21_15, Y21_7, Y22_16);
FA FA_162 (Y21_16, product_terms[6][15], product_terms[7][14], Y21_6, Y22_17);

//col 22: product_terms[0][22] ... product_terms[6][16]; Y22_13 -> Y22_8

FA FA_163 (Y22_13, Y22_12, Y22_11, Y22_9, Y23_14);
FA FA_164 (Y22_10, Y22_9, Y22_8, Y22_8, Y23_15);
FA FA_165 (Y22_17, Y22_14, Y22_15, Y22_7, Y23_16);
FA FA_166 (Y22_16, product_terms[5][17], product_terms[6][16], Y22_6, Y23_17);

//col 23: product_terms[0][23] ... product_terms[6][17]; Y23_13 -> Y23_8

FA FA_167 (Y23_13, Y23_12, Y23_11, Y23_9, Y24_14);
FA FA_168 (Y23_10, Y23_9, Y23_8, Y23_8, Y24_15);
FA FA_169 (Y23_17, Y23_14, Y23_15, Y23_7, Y24_16);
FA FA_170 (Y23_16, product_terms[5][18], product_terms[6][17], Y23_6, Y24_17);

//col 24: product_terms[1][23] ... product_terms[7][17]; Y24_13 -> Y24_8

FA FA_171 (Y24_13, Y24_12, Y24_11, Y24_9, Y25_14);
FA FA_172 (Y24_10, Y24_9, Y24_8, Y24_8, Y25_15);
FA FA_173 (Y24_17, Y24_14, Y24_15, Y24_7, Y25_16);
FA FA_174 (Y24_16, product_terms[6][18], product_terms[7][17], Y24_6, Y25_17);


//col 25: product_terms[2][23] ... product_terms[8][17]; Y25_13 -> Y25_8

FA FA_175 (Y25_13, Y25_12, Y25_11, Y25_9, Y26_14);
FA FA_176 (Y25_10, Y25_9, Y25_8, Y25_8, Y26_15);
FA FA_177 (Y25_17, Y25_14, Y25_15, Y25_7, Y26_16);
FA FA_178 (Y25_16, product_terms[8][17], product_terms[7][18], Y25_6, Y26_17);
 

//col 26: product_terms[3][23] ... product_terms[9][17]; Y26_13 -> Y26_8 

FA FA_179 (Y26_13, Y26_12, Y26_11, Y26_9, Y27_14);
FA FA_180 (Y26_10, Y26_9, Y26_8, Y26_8, Y27_15);
FA FA_181 (Y26_17, Y26_14, Y26_15, Y26_7, Y27_16);
FA FA_182 (Y26_16, product_terms[9][17], product_terms[8][18], Y26_6, Y27_17);

//col 27: product_terms[4][23] ... product_terms[10][17]; Y27_13 -> Y27_8

FA FA_183 (Y27_13, Y27_12, Y27_11, Y27_9, Y28_14);
FA FA_184 (Y27_10, Y27_9, Y27_8, Y27_8, Y28_15);
FA FA_185 (Y27_17, Y27_14, Y27_15, Y27_7, Y28_16);
FA FA_186 (Y27_16, product_terms[10][17], product_terms[9][18], Y27_6, Y28_17);

//col 28: product_terms[5][23] ... product_terms[11][17]; Y28_13 -> Y28_8

FA FA_187 (Y28_13, Y28_12, Y28_11, Y28_9, Y29_14);
FA FA_188 (Y28_10, Y28_9, Y28_8, Y28_8, Y29_15);
FA FA_189 (Y28_17, Y28_14, Y28_15, Y28_7, Y29_16);
FA FA_190 (Y28_16, product_terms[11][17], product_terms[10][18], Y28_6, Y29_17);

//col 29: product_terms[6][23] ... product_terms[12][17]; Y29_13 -> Y29_8

FA FA_191 (Y29_13, Y29_12, Y29_11, Y29_9, Y30_14);
FA FA_192 (Y29_10, Y29_9, Y29_8, Y29_8, Y30_15);
FA FA_193 (Y29_17, Y29_14, Y29_15, Y29_7, Y30_16);
FA FA_194 (Y29_16, product_terms[12][17], product_terms[11][18], Y29_6, Y30_17);

//col 30: product_terms[7][23] ... product_terms[14][16]; Y30_13 -> Y30_9

FA FA_195 (Y30_13, Y30_12, Y30_11, Y30_9, Y31_14);
FA FA_196 (Y30_10, Y30_9, Y30_17, Y30_8, Y31_15);
FA FA_197 (Y30_16, Y30_14, Y30_15, Y30_7, Y31_16);
FA FA_198 (product_terms[14][16], product_terms[13][17], product_terms[12][18], Y30_6, Y31_17); 

//col 31: product_terms[8][23] ... product_terms[16][15]; Y31_13 -> Y31_10

FA FA_199 (Y31_13, Y31_12, Y31_11, Y31_9, Y32_14);
FA FA_200 (Y31_10, Y31_17, Y31_14, Y31_8, Y32_15);
FA FA_201 (Y31_15, Y31_16, product_terms[16][15], Y31_7, Y32_16);
FA FA_202 (product_terms[15][16], product_terms[14][17], product_terms[13][18], Y31_6, Y32_17); 

//col 32: product_terms[9][23] ... product_terms[18][14]; Y32_13 -> Y32_11

FA FA_203 (Y32_13, Y32_12, Y32_11, Y32_9, Y33_14);
FA FA_204 (Y32_14, Y32_15, Y32_16, Y32_8, Y33_15);
FA FA_205 (Y32_17, product_terms[18][14], product_terms[17][15], Y32_7, Y33_16);
FA FA_206 (product_terms[16][16], product_terms[15][17], product_terms[14][18], Y32_6, Y33_17);

//col 33: product_terms[10][23] ... product_terms[20][13]; Y323_13 -> Y33_12

FA FA_207 (Y33_13, Y33_12, Y33_14, Y33_9, Y34_14);
FA FA_208 (Y33_15, Y33_16, Y33_17, Y33_8, Y34_15);
FA FA_209 (product_terms[20][13], product_terms[19][14], product_terms[18][15], Y33_7, Y34_16);
FA FA_210 (product_terms[17][16], product_terms[16][17], product_terms[15][18], Y33_6, Y34_17);

//col 34: product_terms[11][23] ... product_terms[22][12]; Y34_13

FA FA_211 (Y34_13, Y34_15, Y34_14, Y34_9, Y35_14);
FA FA_212 (Y34_16, Y34_17, product_terms[22][12], Y34_8, Y35_15);
FA FA_213 (product_terms[21][13], product_terms[20][14], product_terms[19][15], Y34_7, Y35_16);
FA FA_214 (product_terms[18][16], product_terms[17][17], product_terms[16][18], Y34_6, Y35_17);

//col 35: product_terms[12][23] ... product_terms[23][12]; Y35_13

FA FA_215 (Y35_13, Y35_15, Y35_14, Y35_9, Y36_12);
FA FA_216 (Y35_16, Y35_17, product_terms[23][12], Y35_8, Y36_13);
FA FA_217 (product_terms[22][13], product_terms[21][14], product_terms[20][15], Y35_7, Y36_14);
FA FA_218 (product_terms[19][16], product_terms[18][17], product_terms[17][18], Y35_6, Y36_15);

//col 36: product_terms[13][23] ...product_terms[23][13];

FA FA_219 (Y36_12, Y36_13, Y36_14, Y36_9, Y37_11);
FA FA_220 (Y36_15, product_terms[23][13], product_terms[22][14], Y36_8, Y37_12);
FA FA_221 (product_terms[20][16], product_terms[19][17], product_terms[18][18], Y36_7, Y37_13);

//col 37: product_terms[14][23] ...product_terms[23][14];

FA FA_222 (Y37_11, Y37_12, Y37_13, Y37_9, Y38_10);
FA FA_223 (product_terms[23][14], product_terms[22][15], product_terms[21][16], Y37_8, Y38_11);

//col 38: product_terms[15][23] ...product_terms[23][15];

FA FA_224 (Y38_10, Y38_11, product_terms[23][15], Y38_9, Y39_9);

//layer 3 completed 

/* layer-4 detailing: d=6

1) collumn 0 -> 1 term
   collumn 1 -> 2 terms
   |
   | 
   collumn 5 -> 6 terms  

   All the above collumns are forwarded
	
2) collumn 6 -> 7 terms -> 1 HA 
   collumn 7 -> 8 (+1) terms -> 1 FA + 1 HA
	collumn 8 -> 9 (+) terms -> 2 FA + 1 HA 
	collumn 9 -> 9 (+3) terms -> 3 FA
	|
	|
	collumn 38 -> 9 terms -> 3 FA
	collumn 39 -> 9 (8+1) terms -> 3 FA 
	collumn 40 -> 7 (+3) terms -> 2 FA
	collumn 41 -> 6 (+2) terms -> 1 FA
	
3)	collumn 42 -> 5 (+1) terms
   |
	collumn 46 -> 1 term
	
	All the above collumns are forwarded
*/

//code for layer 4 :

//col 6 product_terms[0][6] ... product_terms[6][0]

HA HA_17 (product_terms[6][0], product_terms[5][1], Y6_6, Y7_9);

//col 7 product_terms[0][7] ... prodcut_terms[7][0]

FA FA_225 (product_terms[7][0], product_terms[6][1], Y7_9, Y7_6, Y8_10);
HA HA_18 (product_terms[5][2], product_terms[4][3], Y7_5, Y8_11);

//col 8 product_terms[0][8] ... product_terms[8][0]

FA FA_226 (product_terms[8][0], Y8_10, Y8_11, Y8_6, Y9_10);
FA FA_227 (product_terms[7][1], product_terms[6][2], product_terms[5][3], Y8_5, Y9_11);
HA HA_19 (product_terms[4][4], product_terms[3][5], Y8_4, Y9_12);

//col 9 product_terms[0][9] ... product_terms[7][2]; y9_9

FA FA_228 (Y9_10, Y9_11, Y9_12, Y9_6, Y10_10);
FA FA_229 (Y9_9, product_terms[7][2], product_terms[6][3], Y9_5, Y10_11);
FA FA_230 (product_terms[5][4], product_terms[4][5], product_terms[3][6], Y9_4, Y10_12);

//col 10 product_terms[0][10] ... product_terms[6][4]; Y10_9 -> Y10_8

FA FA_231 (Y10_9, Y10_8, Y10_10, Y10_6, Y11_10);
FA FA_232 (Y10_11, Y10_12, product_terms[6][4], Y10_5, Y11_11);
FA FA_233 (product_terms[5][5], product_terms[4][6], product_terms[3][7], Y10_4, Y11_12);

//col 11 product_terms[0][11] ... product_terms[5][6]; Y11_9 -> Y11_7 

FA FA_234 (Y11_9, Y11_8, Y11_7, Y11_6, Y12_10);
FA FA_235 (Y11_10, Y11_11, Y11_12, Y11_5, Y12_11);
FA FA_236 (product_terms[5][6], product_terms[4][7], product_terms[3][8], Y11_4, Y12_12);

//col 12 product_terms[0][12] ... product_terms[4][8]; Y12_9->Y12_6

FA FA_237 (Y12_9, Y12_8, Y12_7, Y12_6, Y13_10);
FA FA_238 (Y12_6, Y12_10, Y12_11, Y12_5, Y13_11);
FA FA_239 (Y12_12, product_terms[4][8], product_terms[3][9], Y12_4, Y13_12);

//col 13 product_terms[0][13] ... product_terms[4][9]; y13_9->y13_6 

FA FA_240 (Y13_9, Y13_8, Y13_7, Y13_6, Y14_10);
FA FA_241 (Y13_6, Y13_10, Y13_11, Y13_5, Y14_11);
FA FA_242 (Y13_12, product_terms[4][9], product_terms[3][10], Y13_4, Y14_12);

//col 14 product_terms[0][14] ... product_terms[4][10]; y14_9->y14_6

FA FA_243 (Y14_9, Y14_8, Y14_7, Y14_6, Y15_10);
FA FA_244 (Y14_6, Y14_10, Y14_11, Y14_5, Y15_11);
FA FA_245 (Y14_12, product_terms[4][10], product_terms[3][11], Y14_4, Y15_12);

//col 15 product_terms[0][15] ... product_terms[4][11];  y15_9->y15_6

FA FA_246 (Y15_9, Y15_8, Y15_7, Y15_6, Y16_10);
FA FA_247 (Y15_6, Y15_10, Y15_11, Y15_5, Y16_11);
FA FA_248 (Y15_12, product_terms[4][11], product_terms[3][12], Y15_4, Y16_12);

//col 16 product_terms[0][16] ... product_terms[4][12]; y16_9->y16_6

FA FA_249 (Y16_9, Y16_8, Y16_7, Y16_6, Y17_10);
FA FA_250 (Y16_6, Y16_10, Y16_11, Y16_5, Y17_11);
FA FA_251 (Y16_12, product_terms[4][12], product_terms[3][13], Y16_4, Y17_12);

//col 17 product_terms[0][17] ... product_terms[4][13]; y17_9->y17_6

FA FA_252 (Y17_9, Y17_8, Y17_7, Y17_6, Y18_10);
FA FA_253 (Y17_6, Y17_10, Y17_11, Y17_5, Y18_11);
FA FA_254 (Y17_12, product_terms[4][13], product_terms[3][14], Y17_4, Y18_12);

//col 18 product_terms[0][18] ... product_terms[4][14]; y18_9->y18_6

FA FA_255 (Y18_9, Y18_8, Y18_7, Y18_6, Y19_10);
FA FA_256 (Y18_6, Y18_10, Y18_11, Y18_5, Y19_11);
FA FA_257 (Y18_12, product_terms[4][14], product_terms[3][15], Y18_4, Y19_12);

//col 19 product_terms[0][19] ... product_terms[4][15]; y19_9->y19_6

FA FA_258 (Y19_9, Y19_8, Y19_7, Y19_6, Y20_10);
FA FA_259 (Y19_6, Y19_10, Y19_11, Y19_5, Y20_11);
FA FA_260 (Y19_12, product_terms[4][15], product_terms[3][16], Y19_4, Y20_12);

//col 20 product_terms[0][20] ... product_terms[4][16]; y20_9->y20_6

FA FA_261 (Y20_9, Y20_8, Y20_7, Y20_6, Y21_10);
FA FA_262 (Y20_6, Y20_10, Y20_11, Y20_5, Y21_11);
FA FA_263 (Y20_12, product_terms[4][16], product_terms[3][17], Y20_4, Y21_12); 

//col 21 product_terms[0][21] ... product_terms[5][16]; y21_9->y21_6

FA FA_264 (Y21_9, Y21_8, Y21_7, Y21_6, Y22_10);
FA FA_265 (Y21_6, Y21_10, Y21_11, Y21_5, Y22_11);
FA FA_266 (Y21_12, product_terms[5][16], product_terms[4][17], Y21_4, Y22_12); 

//col 22 product_terms[0][22] ... product_terms[4][18]; y22_9->y22_6

FA FA_267 (Y22_9, Y22_8, Y22_7, Y22_6, Y23_10);
FA FA_268 (Y22_6, Y22_10, Y22_11, Y22_5, Y23_11);
FA FA_269 (Y22_12, product_terms[4][18], product_terms[3][19], Y22_4, Y23_12); 

//col 23 product_terms[0][23] ... product_terms[4][19]; y23_9->y23_6

FA FA_270 (Y23_9, Y23_8, Y23_7, Y23_6, Y24_10);
FA FA_271 (Y23_6, Y23_10, Y23_11, Y23_5, Y24_11);
FA FA_272 (Y23_12, product_terms[4][19], product_terms[3][20], Y23_4, Y24_12); 

//col 24 product_terms[1][23] ... product_terms[5][19]; y24_9->y24_6

FA FA_273 (Y24_9, Y24_8, Y24_7, Y24_6, Y25_10);
FA FA_274 (Y24_6, Y24_10, Y24_11, Y24_5, Y25_11);
FA FA_275 (Y24_12, product_terms[5][19], product_terms[4][20], Y24_4, Y25_12);

//col 25 product_terms[2][23] ... product_terms[6][19]; y25_9->y25_6

FA FA_276 (Y25_9, Y25_8, Y25_7, Y25_6, Y26_10);
FA FA_277 (Y25_6, Y25_10, Y25_11, Y25_5, Y26_11);
FA FA_278 (Y25_12, product_terms[6][19], product_terms[5][20], Y25_4, Y26_12);

//col 26 product_terms[3][23] ... product_terms[7][19]; y26_9->y26_6

FA FA_279 (Y26_9, Y26_8, Y26_7, Y26_6, Y27_10);
FA FA_280 (Y26_6, Y26_10, Y26_11, Y26_5, Y27_11);
FA FA_281 (Y26_12, product_terms[7][19], product_terms[6][20], Y26_4, Y27_12);

//col 27 product_terms[4][23] ... product_terms[8][19]; y27_9->y27_6

FA FA_282 (Y27_9, Y27_8, Y27_7, Y27_6, Y28_10);
FA FA_283 (Y27_6, Y27_10, Y27_11, Y27_5, Y28_11);
FA FA_284 (Y27_12, product_terms[8][19], product_terms[7][20], Y26_4, Y27_12);

//col 28 product_terms[5][23] ... product_terms[9][19]; y28_9->y28_6

FA FA_285 (Y28_9, Y28_8, Y28_7, Y28_6, Y29_10);
FA FA_286 (Y28_6, Y28_10, Y28_11, Y28_5, Y29_11);
FA FA_287 (Y28_12, product_terms[9][19], product_terms[8][20], Y28_4, Y29_12);

//col 29 product_terms[6][23] ... product_terms[10][19]; y29_9->y29_6

FA FA_288 (Y29_9, Y29_8, Y29_7, Y29_6, Y30_10);
FA FA_289 (Y29_6, Y29_10, Y29_11, Y29_5, Y30_11);
FA FA_290 (Y29_12, product_terms[10][19], product_terms[9][20], Y29_4, Y30_12);

//col 30 product_terms[7][23] ... product_terms[11][19]; Y30_9 -> Y30_6

FA FA_291 (Y30_9, Y30_8, Y30_7, Y30_6, Y31_10);
FA FA_292 (Y30_6, Y30_10, Y30_11, Y30_5, Y31_11);
FA FA_293 (Y30_12, product_terms[11][19], product_terms[10][20], Y30_4, Y31_12);

//col 31 product_terms[8][23] ... product_terms[12][19]; Y31_9 -> Y31_6

FA FA_294 (Y31_9, Y31_8, Y31_7, Y31_6, Y32_10);
FA FA_295 (Y31_6, Y31_10, Y31_11, Y31_5, Y32_11);
FA FA_296 (Y31_12, product_terms[12][19], product_terms[11][20], Y31_4, Y32_12);

//col 32 product_terms[9][23] ... product_terms[13][19]; Y32_9 -> Y32_6

FA FA_297 (Y32_9, Y32_8, Y32_7, Y32_6, Y33_10);
FA FA_298 (Y32_6, Y32_10, Y32_11, Y32_5, Y33_11);
FA FA_299 (Y32_12, product_terms[13][19], product_terms[12][20], Y32_4, Y33_12);

//col 33 product_terms[10][23] ... product_terms[14][19]; Y33_9 -> Y33_6

FA FA_300 (Y33_9, Y33_8, Y33_7, Y33_6, Y34_10);
FA FA_301 (Y33_6, Y33_10, Y33_11, Y33_5, Y34_11);
FA FA_302 (Y33_12, product_terms[14][19], product_terms[13][20], Y33_4, Y34_12);

//col 34 product_terms[11][23] ... product_terms[15][19]; Y34_9 -> Y34_6

FA FA_303 (Y34_9, Y34_8, Y34_7, Y34_6, Y35_10);
FA FA_304 (Y34_6, Y34_10, Y34_11, Y34_5, Y35_11);
FA FA_305 (Y34_12, product_terms[15][19], product_terms[14][20], Y34_4, Y35_12);

//col 35 product_terms[12][23] ... product_terms[16][19]; Y35_9 -> Y35_6

FA FA_306 (Y35_9, Y35_8, Y35_7, Y35_6, Y36_10);
FA FA_307 (Y35_6, Y35_10, Y35_11, Y35_5, Y36_11);
FA FA_308 (Y35_12, product_terms[16][19], product_terms[15][20], Y35_4, Y36_12);

//col 36 product_terms[13][23] ... product_terms[17][19]; Y36_9 -> Y36_7

FA FA_309 (Y36_9, Y36_8, Y36_7, Y36_6, Y37_10);
FA FA_310 (Y35_12, Y35_10, Y36_11, Y36_5, Y37_11);
FA FA_311 (product_terms[17][19], product_terms[16][20], product_terms[15][21], Y36_4, Y37_12);

//col 37 product_terms[14][23] ... product_terms[20][17]; Y37_9 -> Y37_8

FA FA_312 (Y37_9, Y37_8, Y37_10, Y37_6, Y38_10);
FA FA_313 (product_terms[20][17], Y37_12, Y37_11, Y37_5, Y38_11);
FA FA_314 (product_terms[19][18], product_terms[18][19], product_terms[17][20], Y37_4, Y38_12);

//col 38 product_terms[15][23] ... product_terms[22][16]; Y38_9

FA FA_315 (Y38_9, Y38_10, Y38_11, Y38_6, Y39_10);
FA FA_316 (product_terms[22][16], Y38_12, product_terms[21][17], Y38_5, Y39_11);
FA FA_317 (product_terms[20][18], product_terms[18][19], product_terms[17][20], Y38_4, Y39_12);

//col 39 product_terms[16][23] ... product_terms[23][16]; Y39_9

FA FA_318 (Y39_9, Y39_10, Y39_11, Y39_6, Y40_8);
FA FA_319 (product_terms[23][16], Y39_12, product_terms[22][17], Y39_5, Y40_9);
FA FA_320 (product_terms[21][18], product_terms[20][19], product_terms[19][20], Y39_4, Y40_10);

//col 40 product_terms[17][23] ... product_terms[23][17];

FA FA_321 (Y40_8, Y40_9, Y40_10, Y40_6, Y41_7);
FA FA_322 (product_terms[23][17], product_terms[22][18], product_terms[21][19], Y40_5, Y41_8);

//col 41 product_terms[18][23] ... product_terms[23][18];

FA FA_323 (Y41_7, Y41_8, product_terms[23][18], Y41_6, Y42_6);

//End of layer 4 

//detailing of layer 5:


endmodule



