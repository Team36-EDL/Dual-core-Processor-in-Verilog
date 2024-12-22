module FA (A, B, Cin, Y, Cout);

input A,B,Cin;

output Y, Cout;

assign Y = A^B^Cin;
assign Cout = (A&B) | (Cin & (A|B));

endmodule   