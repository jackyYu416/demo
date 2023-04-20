module top ( D , C);  //count
	input [31:0] D ;
	output [5:0] C;
	wire [3:0] out[0:7] ;
	wire [5:0] sum [0:5];
	count4 u0 (.A(D[0]) ,  .B(D[1]),   .C(D[2]) , .D(D[3]) ,   .out(out[0]));
	count4 u1 (.A(D[4]) ,  .B(D[5]),   .C(D[6]) , .D(D[7]) ,   .out(out[1]));
	
	count4 u2 (.A(D[8]) ,  .B(D[9]),   .C(D[10]) , .D(D[11]) , .out(out[2]));
	count4 u3 (.A(D[12]), .B(D[13]), .C(D[14]) , .D(D[15]) ,   .out(out[3]));
	
	count4 u4 (.A(D[16]), .B(D[17]), .C(D[18]) , .D(D[19]) ,   .out(out[4]));
	count4 u5 (.A(D[20]), .B(D[21]), .C(D[22]) , .D(D[23]) ,   .out(out[5]));
	
	count4 u6 (.A(D[24]) , .B(D[25]), .C(D[26]) , .D(D[27])  , .out(out[6]));
	count4 u7 (.A(D[28]) , .B(D[29]), .C(D[30]) , .D(D[31])  , .out(out[7]));
	
	
	RCA u8(.a(out[0]) , .b(out[1])  , .sum(sum[0]) );
	RCA u9(.a(out[2]) , .b(out[3])  , .sum(sum[1]) );
	RCA u10(.a(out[4]) , .b(out[5])  , .sum(sum[2]) );
	RCA u11(.a(out[6]) , .b(out[7])  , .sum(sum[3]) );

	RCA u12(.a(sum[0]) , .b(sum[1])  , .sum(sum[4]) );
	RCA u13(.a(sum[2]) , .b(sum[3])  , .sum(sum[5]) );
	RCA u14(.a(sum[4]) , .b(sum[5])  , .sum(C) );
	
endmodule





module count4 (A , B, C , D , out);  //count4

input A ,B , C, D ;
	output [2:0] out;
	
	assign out[0] = ((~A) & (~B) & (~C) & D ) | ((~A) & (~B) & C & (~D)) | ((~A) & B & (~C) & (~D)) | ((~A) & B & C & D) | (A & (~B) & (~C) & (~D))| (A & (~B) & C & D ) | (A & B & (~C) & D ) | (A & B & C & (~D));
	
	assign out[1] = ((~A) & (~B) & C & D ) | ((~A) & B & (~C) & D) | ((~A) & B & C & (~D)) | ((~A) & B & C & D) |(A & (~B) & (~C) & D) | (A & (~B) & C & (~D)) | (A & (~B) & C & D) | (A & B & (~C) & (~D)) | (A & B & (~C) & D )| (A & B & C & (~D)) ;

	assign out[2] = (A & B & C & D);
	
	
	
endmodule


module HA (HA_a,HA_b,HA_c,HA_s);   //HA
	input 	 HA_a;
	input 	 HA_b;
	output	 HA_c;
	output	 HA_s;
	
	xor u0(HA_s, HA_a, HA_b);
	and u1(HA_c, HA_a, HA_b);
	
	
endmodule

module FA (A, B , Cin , Cout , Sum);  //FA
	input A , B ,Cin ;
	output Cout , Sum;
	wire c_wire , s_wire ,c_wire2;
	HA u0 (.HA_a(A)  , .HA_b(B)        , .HA_c(c_wire),  .HA_s(s_wire));
	HA u1 (.HA_a(Cin), .HA_b(s_wire)   , .HA_c(c_wire2), .HA_s(Sum));
   or u2 (Cout , c_wire , c_wire2 );
endmodule


module RCA (a , b , sum );  //RCA
	input [4:0]  a , b ;

	output [5:0] sum ;

	wire cout_w1 , cout_w2 , cout_w3 , cout_w4 , cout_w5;
	FA u1 (.A(a[0]), .B(b[0]) , .Cin(0) , .Cout(cout_w1) ,     .Sum(sum[0]));
	FA u2 (.A(a[1]), .B(b[1]) , .Cin(cout_w1) , .Cout(cout_w2) , .Sum(sum[1]));
	FA u3 (.A(a[2]), .B(b[2]) , .Cin(cout_w2) , .Cout(cout_w3) , .Sum(sum[2]));
	FA u4 (.A(a[3]), .B(b[3]) , .Cin(cout_w3) , .Cout(cout_w4) , .Sum(sum[3]));
	FA u5 (.A(a[4]), .B(b[4]) , .Cin(cout_w4) , .Cout(sum[5]) , .Sum(sum[4]));
	
	
endmodule