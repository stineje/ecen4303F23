/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : R-2020.09-SP5
// Date      : Mon Oct 30 16:23:14 2023
/////////////////////////////////////////////////////////////


module mult_pad ( result, a, b, reset, clk );
  output [15:0] result;
  input [7:0] a;
  input [7:0] b;
  input reset, clk;
  wire   clk_i, reset_i, N0, \intadd_0/B[13] , \intadd_0/B[12] ,
         \intadd_0/B[11] , \intadd_0/B[10] , \intadd_0/B[9] , \intadd_0/B[8] ,
         \intadd_0/B[7] , \intadd_0/B[6] , \intadd_0/B[5] , \intadd_0/B[4] ,
         \intadd_0/B[3] , \intadd_0/B[2] , \intadd_0/B[1] , \intadd_0/B[0] ,
         \intadd_0/CI , \intadd_0/n14 , \intadd_0/n13 , \intadd_0/n12 ,
         \intadd_0/n11 , \intadd_0/n10 , \intadd_0/n9 , \intadd_0/n8 ,
         \intadd_0/n7 , \intadd_0/n6 , \intadd_0/n5 , \intadd_0/n4 ,
         \intadd_0/n3 , \intadd_0/n2 , \intadd_0/n1 , \intadd_1/A[10] ,
         \intadd_1/A[8] , \intadd_1/A[6] , \intadd_1/A[5] , \intadd_1/A[4] ,
         \intadd_1/A[3] , \intadd_1/A[2] , \intadd_1/A[1] , \intadd_1/A[0] ,
         \intadd_1/B[9] , \intadd_1/B[7] , \intadd_1/B[6] , \intadd_1/B[5] ,
         \intadd_1/B[4] , \intadd_1/B[3] , \intadd_1/B[2] , \intadd_1/B[1] ,
         \intadd_1/B[0] , \intadd_1/CI , \intadd_1/SUM[5] , \intadd_1/SUM[4] ,
         \intadd_1/SUM[3] , \intadd_1/SUM[2] , \intadd_1/SUM[1] ,
         \intadd_1/SUM[0] , \intadd_1/n11 , \intadd_1/n10 , \intadd_1/n9 ,
         \intadd_1/n8 , \intadd_1/n7 , \intadd_1/n6 , \intadd_1/n5 ,
         \intadd_1/n4 , \intadd_1/n3 , \intadd_1/n2 , \intadd_1/n1 ,
         \intadd_2/A[5] , \intadd_2/A[4] , \intadd_2/A[3] , \intadd_2/A[2] ,
         \intadd_2/A[1] , \intadd_2/A[0] , \intadd_2/B[5] , \intadd_2/B[4] ,
         \intadd_2/B[3] , \intadd_2/B[2] , \intadd_2/B[1] , \intadd_2/B[0] ,
         \intadd_2/CI , \intadd_2/SUM[4] , \intadd_2/SUM[3] ,
         \intadd_2/SUM[2] , \intadd_2/SUM[1] , \intadd_2/SUM[0] ,
         \intadd_2/n6 , \intadd_2/n5 , \intadd_2/n4 , \intadd_2/n3 ,
         \intadd_2/n2 , \intadd_2/n1 , \intadd_3/A[0] , \intadd_3/B[5] ,
         \intadd_3/B[4] , \intadd_3/B[3] , \intadd_3/B[2] , \intadd_3/B[1] ,
         \intadd_3/B[0] , \intadd_3/CI , \intadd_3/SUM[4] , \intadd_3/SUM[3] ,
         \intadd_3/SUM[2] , \intadd_3/SUM[1] , \intadd_3/SUM[0] ,
         \intadd_3/n6 , \intadd_3/n5 , \intadd_3/n4 , \intadd_3/n3 ,
         \intadd_3/n2 , \intadd_3/n1 , \intadd_4/A[0] , \intadd_4/B[5] ,
         \intadd_4/B[4] , \intadd_4/B[3] , \intadd_4/B[2] , \intadd_4/B[1] ,
         \intadd_4/B[0] , \intadd_4/CI , \intadd_4/SUM[4] , \intadd_4/SUM[3] ,
         \intadd_4/SUM[2] , \intadd_4/SUM[1] , \intadd_4/SUM[0] ,
         \intadd_4/n6 , \intadd_4/n5 , \intadd_4/n4 , \intadd_4/n3 ,
         \intadd_4/n2 , \intadd_4/n1 , \intadd_5/A[0] , \intadd_5/B[5] ,
         \intadd_5/B[4] , \intadd_5/B[3] , \intadd_5/B[2] , \intadd_5/B[1] ,
         \intadd_5/B[0] , \intadd_5/CI , \intadd_5/n6 , \intadd_5/n5 ,
         \intadd_5/n4 , \intadd_5/n3 , \intadd_5/n2 , \intadd_5/n1 ,
         \intadd_6/A[0] , \intadd_6/B[5] , \intadd_6/B[4] , \intadd_6/B[3] ,
         \intadd_6/B[2] , \intadd_6/B[1] , \intadd_6/B[0] , \intadd_6/CI ,
         \intadd_6/n6 , \intadd_6/n5 , \intadd_6/n4 , \intadd_6/n3 ,
         \intadd_6/n2 , \intadd_6/n1 , \intadd_7/A[4] , \intadd_7/A[3] ,
         \intadd_7/A[2] , \intadd_7/A[1] , \intadd_7/A[0] , \intadd_7/B[4] ,
         \intadd_7/B[3] , \intadd_7/B[2] , \intadd_7/B[1] , \intadd_7/B[0] ,
         \intadd_7/CI , \intadd_7/n5 , \intadd_7/n4 , \intadd_7/n3 ,
         \intadd_7/n2 , \intadd_7/n1 , n240, n241, n242, n243, n244, n245,
         n246, n247, n248, n249, n250, n251, n252, n253, n254, n255, n256,
         n257, n258, n259, n260, n261, n262, n263, n264, n265, n266, n267,
         n268, n269, n270, n271, n272, n273, n274, n275, n276, n277, n278,
         n279, n280, n281, n282, n283, n284, n285;
  wire   [7:0] a_i;
  wire   [7:0] b_i;
  wire   [16:0] sum;
  wire   [15:0] result_i;

  PADOUT p19 ( .DO(result_i[15]), .YPAD(result[15]) );
  PADOUT p18 ( .DO(result_i[14]), .YPAD(result[14]) );
  PADOUT p17 ( .DO(result_i[13]), .YPAD(result[13]) );
  PADOUT p16 ( .DO(result_i[12]), .YPAD(result[12]) );
  PADOUT p15 ( .DO(result_i[11]), .YPAD(result[11]) );
  PADOUT p14 ( .DO(result_i[10]), .YPAD(result[10]) );
  PADOUT p13 ( .DO(result_i[9]), .YPAD(result[9]) );
  PADOUT p12 ( .DO(result_i[8]), .YPAD(result[8]) );
  PADOUT p11 ( .DO(result_i[7]), .YPAD(result[7]) );
  PADOUT p10 ( .DO(result_i[6]), .YPAD(result[6]) );
  PADOUT p09 ( .DO(result_i[5]), .YPAD(result[5]) );
  PADOUT p08 ( .DO(result_i[4]), .YPAD(result[4]) );
  PADOUT p07 ( .DO(result_i[3]), .YPAD(result[3]) );
  PADOUT p06 ( .DO(result_i[2]), .YPAD(result[2]) );
  PADOUT p05 ( .DO(result_i[1]), .YPAD(result[1]) );
  PADOUT p04 ( .DO(result_i[0]), .YPAD(result[0]) );
  PADINC p39 ( .YPAD(a[7]), .DI(a_i[7]) );
  PADINC p38 ( .YPAD(a[6]), .DI(a_i[6]) );
  PADINC p37 ( .YPAD(a[5]), .DI(a_i[5]) );
  PADINC p36 ( .YPAD(a[4]), .DI(a_i[4]) );
  PADINC p35 ( .YPAD(a[3]), .DI(a_i[3]) );
  PADINC p34 ( .YPAD(a[2]), .DI(a_i[2]) );
  PADINC p33 ( .YPAD(a[1]), .DI(a_i[1]) );
  PADINC p32 ( .YPAD(a[0]), .DI(a_i[0]) );
  PADINC p31 ( .YPAD(b[7]), .DI(b_i[7]) );
  PADINC p30 ( .YPAD(b[6]), .DI(b_i[6]) );
  PADINC p29 ( .YPAD(b[5]), .DI(b_i[5]) );
  PADINC p28 ( .YPAD(b[4]), .DI(b_i[4]) );
  PADINC p27 ( .YPAD(b[3]), .DI(b_i[3]) );
  PADINC p26 ( .YPAD(b[2]), .DI(b_i[2]) );
  PADINC p25 ( .YPAD(b[1]), .DI(b_i[1]) );
  PADINC p24 ( .YPAD(b[0]), .DI(b_i[0]) );
  PADINC p23 ( .YPAD(reset), .DI(reset_i) );
  PADINC p22 ( .YPAD(clk), .DI(clk_i) );
  PADNC p03 (  );
  PADNC p02 (  );
  PADNC p01 (  );
  PADNC p00 (  );
  PADVDD p21 (  );
  PADGND p20 (  );
  PADFC c04 (  );
  PADFC c03 (  );
  PADFC c02 (  );
  PADFC c01 (  );
  DFFSR \q_reg[0]  ( .D(N0), .CLK(clk_i), .R(reset_i), .S(1'b1), .Q(
        result_i[0]) );
  DFFSR \q_reg[1]  ( .D(sum[1]), .CLK(clk_i), .R(reset_i), .S(1'b1), .Q(
        result_i[1]) );
  DFFSR \q_reg[2]  ( .D(sum[2]), .CLK(clk_i), .R(reset_i), .S(1'b1), .Q(
        result_i[2]) );
  DFFSR \q_reg[3]  ( .D(sum[3]), .CLK(clk_i), .R(reset_i), .S(1'b1), .Q(
        result_i[3]) );
  DFFSR \q_reg[4]  ( .D(sum[4]), .CLK(clk_i), .R(reset_i), .S(1'b1), .Q(
        result_i[4]) );
  DFFSR \q_reg[5]  ( .D(sum[5]), .CLK(clk_i), .R(reset_i), .S(1'b1), .Q(
        result_i[5]) );
  DFFSR \q_reg[6]  ( .D(sum[6]), .CLK(clk_i), .R(reset_i), .S(1'b1), .Q(
        result_i[6]) );
  DFFSR \q_reg[7]  ( .D(sum[7]), .CLK(clk_i), .R(reset_i), .S(1'b1), .Q(
        result_i[7]) );
  DFFSR \q_reg[8]  ( .D(sum[8]), .CLK(clk_i), .R(reset_i), .S(1'b1), .Q(
        result_i[8]) );
  DFFSR \q_reg[9]  ( .D(sum[9]), .CLK(clk_i), .R(reset_i), .S(1'b1), .Q(
        result_i[9]) );
  DFFSR \q_reg[10]  ( .D(sum[10]), .CLK(clk_i), .R(reset_i), .S(1'b1), .Q(
        result_i[10]) );
  DFFSR \q_reg[11]  ( .D(sum[11]), .CLK(clk_i), .R(reset_i), .S(1'b1), .Q(
        result_i[11]) );
  DFFSR \q_reg[12]  ( .D(sum[12]), .CLK(clk_i), .R(reset_i), .S(1'b1), .Q(
        result_i[12]) );
  DFFSR \q_reg[13]  ( .D(sum[13]), .CLK(clk_i), .R(reset_i), .S(1'b1), .Q(
        result_i[13]) );
  DFFSR \q_reg[14]  ( .D(sum[14]), .CLK(clk_i), .R(reset_i), .S(1'b1), .Q(
        result_i[14]) );
  DFFSR \q_reg[15]  ( .D(sum[15]), .CLK(clk_i), .R(reset_i), .S(1'b1), .Q(
        result_i[15]) );
  FAX1 \intadd_0/U15  ( .A(\intadd_0/B[0] ), .B(result_i[1]), .C(\intadd_0/CI ), .YC(\intadd_0/n14 ), .YS(sum[1]) );
  FAX1 \intadd_0/U14  ( .A(\intadd_0/B[1] ), .B(result_i[2]), .C(
        \intadd_0/n14 ), .YC(\intadd_0/n13 ), .YS(sum[2]) );
  FAX1 \intadd_0/U13  ( .A(\intadd_0/B[2] ), .B(result_i[3]), .C(
        \intadd_0/n13 ), .YC(\intadd_0/n12 ), .YS(sum[3]) );
  FAX1 \intadd_0/U12  ( .A(\intadd_0/B[3] ), .B(result_i[4]), .C(
        \intadd_0/n12 ), .YC(\intadd_0/n11 ), .YS(sum[4]) );
  FAX1 \intadd_0/U11  ( .A(\intadd_0/B[4] ), .B(result_i[5]), .C(
        \intadd_0/n11 ), .YC(\intadd_0/n10 ), .YS(sum[5]) );
  FAX1 \intadd_0/U10  ( .A(\intadd_0/B[5] ), .B(result_i[6]), .C(
        \intadd_0/n10 ), .YC(\intadd_0/n9 ), .YS(sum[6]) );
  FAX1 \intadd_0/U9  ( .A(\intadd_0/B[6] ), .B(result_i[7]), .C(\intadd_0/n9 ), 
        .YC(\intadd_0/n8 ), .YS(sum[7]) );
  FAX1 \intadd_0/U8  ( .A(\intadd_0/B[7] ), .B(result_i[8]), .C(\intadd_0/n8 ), 
        .YC(\intadd_0/n7 ), .YS(sum[8]) );
  FAX1 \intadd_0/U7  ( .A(\intadd_0/B[8] ), .B(result_i[9]), .C(\intadd_0/n7 ), 
        .YC(\intadd_0/n6 ), .YS(sum[9]) );
  FAX1 \intadd_0/U6  ( .A(\intadd_0/B[9] ), .B(result_i[10]), .C(\intadd_0/n6 ), .YC(\intadd_0/n5 ), .YS(sum[10]) );
  FAX1 \intadd_0/U5  ( .A(\intadd_0/B[10] ), .B(result_i[11]), .C(
        \intadd_0/n5 ), .YC(\intadd_0/n4 ), .YS(sum[11]) );
  FAX1 \intadd_0/U4  ( .A(\intadd_0/B[11] ), .B(result_i[12]), .C(
        \intadd_0/n4 ), .YC(\intadd_0/n3 ), .YS(sum[12]) );
  FAX1 \intadd_0/U3  ( .A(\intadd_0/B[12] ), .B(result_i[13]), .C(
        \intadd_0/n3 ), .YC(\intadd_0/n2 ), .YS(sum[13]) );
  FAX1 \intadd_0/U2  ( .A(\intadd_0/B[13] ), .B(result_i[14]), .C(
        \intadd_0/n2 ), .YC(\intadd_0/n1 ), .YS(sum[14]) );
  FAX1 \intadd_1/U12  ( .A(\intadd_1/B[0] ), .B(\intadd_1/A[0] ), .C(
        \intadd_1/CI ), .YC(\intadd_1/n11 ), .YS(\intadd_1/SUM[0] ) );
  FAX1 \intadd_1/U11  ( .A(\intadd_1/B[1] ), .B(\intadd_1/A[1] ), .C(
        \intadd_1/n11 ), .YC(\intadd_1/n10 ), .YS(\intadd_1/SUM[1] ) );
  FAX1 \intadd_1/U10  ( .A(\intadd_1/B[2] ), .B(\intadd_1/A[2] ), .C(
        \intadd_1/n10 ), .YC(\intadd_1/n9 ), .YS(\intadd_1/SUM[2] ) );
  FAX1 \intadd_1/U9  ( .A(\intadd_1/B[3] ), .B(\intadd_1/A[3] ), .C(
        \intadd_1/n9 ), .YC(\intadd_1/n8 ), .YS(\intadd_1/SUM[3] ) );
  FAX1 \intadd_1/U8  ( .A(\intadd_1/B[4] ), .B(\intadd_1/A[4] ), .C(
        \intadd_1/n8 ), .YC(\intadd_1/n7 ), .YS(\intadd_1/SUM[4] ) );
  FAX1 \intadd_1/U7  ( .A(\intadd_1/B[5] ), .B(\intadd_1/A[5] ), .C(
        \intadd_1/n7 ), .YC(\intadd_1/n6 ), .YS(\intadd_1/SUM[5] ) );
  FAX1 \intadd_1/U6  ( .A(\intadd_1/B[6] ), .B(\intadd_1/A[6] ), .C(
        \intadd_1/n6 ), .YC(\intadd_1/n5 ), .YS(\intadd_0/B[8] ) );
  FAX1 \intadd_1/U5  ( .A(\intadd_1/B[7] ), .B(\intadd_5/n1 ), .C(
        \intadd_1/n5 ), .YC(\intadd_1/n4 ), .YS(\intadd_0/B[9] ) );
  FAX1 \intadd_1/U4  ( .A(\intadd_4/n1 ), .B(\intadd_1/A[8] ), .C(
        \intadd_1/n4 ), .YC(\intadd_1/n3 ), .YS(\intadd_0/B[10] ) );
  FAX1 \intadd_1/U3  ( .A(\intadd_1/B[9] ), .B(\intadd_3/n1 ), .C(
        \intadd_1/n3 ), .YC(\intadd_1/n2 ), .YS(\intadd_0/B[11] ) );
  FAX1 \intadd_1/U2  ( .A(\intadd_2/n1 ), .B(\intadd_1/A[10] ), .C(
        \intadd_1/n2 ), .YC(\intadd_1/n1 ), .YS(\intadd_0/B[12] ) );
  FAX1 \intadd_2/U7  ( .A(\intadd_2/B[0] ), .B(\intadd_2/A[0] ), .C(
        \intadd_2/CI ), .YC(\intadd_2/n6 ), .YS(\intadd_2/SUM[0] ) );
  FAX1 \intadd_2/U6  ( .A(\intadd_2/B[1] ), .B(\intadd_2/A[1] ), .C(
        \intadd_2/n6 ), .YC(\intadd_2/n5 ), .YS(\intadd_2/SUM[1] ) );
  FAX1 \intadd_2/U5  ( .A(\intadd_2/B[2] ), .B(\intadd_2/A[2] ), .C(
        \intadd_2/n5 ), .YC(\intadd_2/n4 ), .YS(\intadd_2/SUM[2] ) );
  FAX1 \intadd_2/U4  ( .A(\intadd_2/B[3] ), .B(\intadd_2/A[3] ), .C(
        \intadd_2/n4 ), .YC(\intadd_2/n3 ), .YS(\intadd_2/SUM[3] ) );
  FAX1 \intadd_2/U3  ( .A(\intadd_2/B[4] ), .B(\intadd_2/A[4] ), .C(
        \intadd_2/n3 ), .YC(\intadd_2/n2 ), .YS(\intadd_2/SUM[4] ) );
  FAX1 \intadd_2/U2  ( .A(\intadd_2/B[5] ), .B(\intadd_2/A[5] ), .C(
        \intadd_2/n2 ), .YC(\intadd_2/n1 ), .YS(\intadd_1/B[9] ) );
  FAX1 \intadd_3/U7  ( .A(\intadd_3/B[0] ), .B(\intadd_3/A[0] ), .C(
        \intadd_3/CI ), .YC(\intadd_3/n6 ), .YS(\intadd_3/SUM[0] ) );
  FAX1 \intadd_3/U6  ( .A(\intadd_3/B[1] ), .B(\intadd_2/SUM[0] ), .C(
        \intadd_3/n6 ), .YC(\intadd_3/n5 ), .YS(\intadd_3/SUM[1] ) );
  FAX1 \intadd_3/U5  ( .A(\intadd_3/B[2] ), .B(\intadd_2/SUM[1] ), .C(
        \intadd_3/n5 ), .YC(\intadd_3/n4 ), .YS(\intadd_3/SUM[2] ) );
  FAX1 \intadd_3/U4  ( .A(\intadd_3/B[3] ), .B(\intadd_2/SUM[2] ), .C(
        \intadd_3/n4 ), .YC(\intadd_3/n3 ), .YS(\intadd_3/SUM[3] ) );
  FAX1 \intadd_3/U3  ( .A(\intadd_3/B[4] ), .B(\intadd_2/SUM[3] ), .C(
        \intadd_3/n3 ), .YC(\intadd_3/n2 ), .YS(\intadd_3/SUM[4] ) );
  FAX1 \intadd_3/U2  ( .A(\intadd_3/B[5] ), .B(\intadd_2/SUM[4] ), .C(
        \intadd_3/n2 ), .YC(\intadd_3/n1 ), .YS(\intadd_1/A[8] ) );
  FAX1 \intadd_4/U7  ( .A(\intadd_4/B[0] ), .B(\intadd_4/A[0] ), .C(
        \intadd_4/CI ), .YC(\intadd_4/n6 ), .YS(\intadd_4/SUM[0] ) );
  FAX1 \intadd_4/U6  ( .A(\intadd_4/B[1] ), .B(\intadd_3/SUM[0] ), .C(
        \intadd_4/n6 ), .YC(\intadd_4/n5 ), .YS(\intadd_4/SUM[1] ) );
  FAX1 \intadd_4/U5  ( .A(\intadd_4/B[2] ), .B(\intadd_3/SUM[1] ), .C(
        \intadd_4/n5 ), .YC(\intadd_4/n4 ), .YS(\intadd_4/SUM[2] ) );
  FAX1 \intadd_4/U4  ( .A(\intadd_4/B[3] ), .B(\intadd_3/SUM[2] ), .C(
        \intadd_4/n4 ), .YC(\intadd_4/n3 ), .YS(\intadd_4/SUM[3] ) );
  FAX1 \intadd_4/U3  ( .A(\intadd_4/B[4] ), .B(\intadd_3/SUM[3] ), .C(
        \intadd_4/n3 ), .YC(\intadd_4/n2 ), .YS(\intadd_4/SUM[4] ) );
  FAX1 \intadd_4/U2  ( .A(\intadd_4/B[5] ), .B(\intadd_3/SUM[4] ), .C(
        \intadd_4/n2 ), .YC(\intadd_4/n1 ), .YS(\intadd_1/B[7] ) );
  FAX1 \intadd_5/U7  ( .A(\intadd_5/B[0] ), .B(\intadd_5/A[0] ), .C(
        \intadd_5/CI ), .YC(\intadd_5/n6 ), .YS(\intadd_1/A[1] ) );
  FAX1 \intadd_5/U6  ( .A(\intadd_5/B[1] ), .B(\intadd_4/SUM[0] ), .C(
        \intadd_5/n6 ), .YC(\intadd_5/n5 ), .YS(\intadd_1/A[2] ) );
  FAX1 \intadd_5/U5  ( .A(\intadd_5/B[2] ), .B(\intadd_4/SUM[1] ), .C(
        \intadd_5/n5 ), .YC(\intadd_5/n4 ), .YS(\intadd_1/A[3] ) );
  FAX1 \intadd_5/U4  ( .A(\intadd_5/B[3] ), .B(\intadd_4/SUM[2] ), .C(
        \intadd_5/n4 ), .YC(\intadd_5/n3 ), .YS(\intadd_1/A[4] ) );
  FAX1 \intadd_5/U3  ( .A(\intadd_5/B[4] ), .B(\intadd_4/SUM[3] ), .C(
        \intadd_5/n3 ), .YC(\intadd_5/n2 ), .YS(\intadd_1/A[5] ) );
  FAX1 \intadd_5/U2  ( .A(\intadd_5/B[5] ), .B(\intadd_4/SUM[4] ), .C(
        \intadd_5/n2 ), .YC(\intadd_5/n1 ), .YS(\intadd_1/A[6] ) );
  FAX1 \intadd_6/U7  ( .A(\intadd_6/B[0] ), .B(\intadd_6/A[0] ), .C(
        \intadd_6/CI ), .YC(\intadd_6/n6 ), .YS(\intadd_0/B[1] ) );
  FAX1 \intadd_6/U6  ( .A(\intadd_6/B[1] ), .B(\intadd_1/SUM[0] ), .C(
        \intadd_6/n6 ), .YC(\intadd_6/n5 ), .YS(\intadd_0/B[2] ) );
  FAX1 \intadd_6/U5  ( .A(\intadd_6/B[2] ), .B(\intadd_1/SUM[1] ), .C(
        \intadd_6/n5 ), .YC(\intadd_6/n4 ), .YS(\intadd_0/B[3] ) );
  FAX1 \intadd_6/U4  ( .A(\intadd_6/B[3] ), .B(\intadd_1/SUM[2] ), .C(
        \intadd_6/n4 ), .YC(\intadd_6/n3 ), .YS(\intadd_0/B[4] ) );
  FAX1 \intadd_6/U3  ( .A(\intadd_6/B[4] ), .B(\intadd_1/SUM[3] ), .C(
        \intadd_6/n3 ), .YC(\intadd_6/n2 ), .YS(\intadd_0/B[5] ) );
  FAX1 \intadd_6/U2  ( .A(\intadd_6/B[5] ), .B(\intadd_1/SUM[4] ), .C(
        \intadd_6/n2 ), .YC(\intadd_6/n1 ), .YS(\intadd_0/B[6] ) );
  FAX1 \intadd_7/U6  ( .A(\intadd_7/B[0] ), .B(\intadd_7/A[0] ), .C(
        \intadd_7/CI ), .YC(\intadd_7/n5 ), .YS(\intadd_2/B[2] ) );
  FAX1 \intadd_7/U5  ( .A(\intadd_7/B[1] ), .B(\intadd_7/A[1] ), .C(
        \intadd_7/n5 ), .YC(\intadd_7/n4 ), .YS(\intadd_2/A[3] ) );
  FAX1 \intadd_7/U4  ( .A(\intadd_7/B[2] ), .B(\intadd_7/A[2] ), .C(
        \intadd_7/n4 ), .YC(\intadd_7/n3 ), .YS(\intadd_2/A[4] ) );
  FAX1 \intadd_7/U3  ( .A(\intadd_7/B[3] ), .B(\intadd_7/A[3] ), .C(
        \intadd_7/n3 ), .YC(\intadd_7/n2 ), .YS(\intadd_2/A[5] ) );
  FAX1 \intadd_7/U2  ( .A(\intadd_7/B[4] ), .B(\intadd_7/A[4] ), .C(
        \intadd_7/n2 ), .YC(\intadd_7/n1 ), .YS(\intadd_1/A[10] ) );
  INVX1 U178 ( .A(n243), .Y(\intadd_2/A[0] ) );
  INVX1 U179 ( .A(a_i[7]), .Y(n278) );
  INVX1 U180 ( .A(b_i[2]), .Y(n256) );
  NOR2X1 U181 ( .A(n278), .B(n256), .Y(\intadd_7/A[0] ) );
  INVX1 U182 ( .A(b_i[1]), .Y(n240) );
  INVX1 U183 ( .A(a_i[6]), .Y(n244) );
  NOR2X1 U184 ( .A(n240), .B(n244), .Y(n273) );
  INVX1 U185 ( .A(b_i[0]), .Y(n241) );
  NOR2X1 U186 ( .A(n278), .B(n241), .Y(n242) );
  NAND2X1 U187 ( .A(n273), .B(n242), .Y(n274) );
  OAI21X1 U188 ( .A(n273), .B(n242), .C(n274), .Y(n243) );
  AND2X2 U189 ( .A(\intadd_1/SUM[5] ), .B(\intadd_6/n1 ), .Y(\intadd_1/B[6] )
         );
  INVX1 U190 ( .A(b_i[7]), .Y(n277) );
  NOR2X1 U191 ( .A(n277), .B(n244), .Y(\intadd_7/B[4] ) );
  INVX1 U192 ( .A(b_i[6]), .Y(n247) );
  NOR2X1 U193 ( .A(n278), .B(n247), .Y(\intadd_7/A[4] ) );
  INVX1 U194 ( .A(a_i[5]), .Y(n246) );
  NOR2X1 U195 ( .A(n277), .B(n246), .Y(\intadd_2/B[5] ) );
  INVX1 U196 ( .A(b_i[5]), .Y(n249) );
  NOR2X1 U197 ( .A(n278), .B(n249), .Y(\intadd_7/B[3] ) );
  NOR2X1 U198 ( .A(n244), .B(n247), .Y(\intadd_7/A[3] ) );
  INVX1 U199 ( .A(a_i[4]), .Y(n248) );
  NOR2X1 U200 ( .A(n277), .B(n248), .Y(\intadd_3/B[5] ) );
  NOR2X1 U201 ( .A(n246), .B(n247), .Y(\intadd_2/B[4] ) );
  NOR2X1 U202 ( .A(n244), .B(n249), .Y(\intadd_7/B[2] ) );
  INVX1 U203 ( .A(b_i[4]), .Y(n251) );
  NOR2X1 U204 ( .A(n278), .B(n251), .Y(\intadd_7/A[2] ) );
  INVX1 U205 ( .A(a_i[3]), .Y(n250) );
  NOR2X1 U206 ( .A(n277), .B(n250), .Y(\intadd_4/B[5] ) );
  NOR2X1 U207 ( .A(n248), .B(n247), .Y(\intadd_3/B[4] ) );
  NOR2X1 U208 ( .A(n246), .B(n249), .Y(\intadd_2/B[3] ) );
  INVX1 U209 ( .A(b_i[3]), .Y(n253) );
  NOR2X1 U210 ( .A(n278), .B(n253), .Y(\intadd_7/B[1] ) );
  NOR2X1 U211 ( .A(n244), .B(n251), .Y(\intadd_7/A[1] ) );
  INVX1 U212 ( .A(a_i[2]), .Y(n252) );
  NOR2X1 U213 ( .A(n277), .B(n252), .Y(\intadd_5/B[5] ) );
  NOR2X1 U214 ( .A(n250), .B(n247), .Y(\intadd_4/B[4] ) );
  NOR2X1 U215 ( .A(n248), .B(n249), .Y(\intadd_3/B[3] ) );
  NOR2X1 U216 ( .A(n244), .B(n253), .Y(\intadd_7/CI ) );
  NOR2X1 U217 ( .A(n246), .B(n251), .Y(\intadd_2/A[2] ) );
  NOR2X1 U218 ( .A(\intadd_1/SUM[5] ), .B(\intadd_6/n1 ), .Y(n245) );
  NOR2X1 U219 ( .A(\intadd_1/B[6] ), .B(n245), .Y(\intadd_0/B[7] ) );
  INVX1 U220 ( .A(a_i[1]), .Y(n254) );
  NOR2X1 U221 ( .A(n277), .B(n254), .Y(\intadd_1/B[5] ) );
  NOR2X1 U222 ( .A(n252), .B(n247), .Y(\intadd_5/B[4] ) );
  NOR2X1 U223 ( .A(n250), .B(n249), .Y(\intadd_4/B[3] ) );
  NOR2X1 U224 ( .A(n248), .B(n251), .Y(\intadd_3/B[2] ) );
  NOR2X1 U225 ( .A(n246), .B(n253), .Y(\intadd_2/B[1] ) );
  INVX1 U226 ( .A(a_i[0]), .Y(n255) );
  NOR2X1 U227 ( .A(n277), .B(n255), .Y(\intadd_6/B[5] ) );
  NOR2X1 U228 ( .A(n254), .B(n247), .Y(\intadd_1/B[4] ) );
  NOR2X1 U229 ( .A(n252), .B(n249), .Y(\intadd_5/B[3] ) );
  NOR2X1 U230 ( .A(n250), .B(n251), .Y(\intadd_4/B[2] ) );
  NOR2X1 U231 ( .A(n248), .B(n253), .Y(\intadd_3/B[1] ) );
  NOR2X1 U232 ( .A(n256), .B(n246), .Y(\intadd_2/CI ) );
  NOR2X1 U233 ( .A(n255), .B(n247), .Y(\intadd_6/B[4] ) );
  NOR2X1 U234 ( .A(n254), .B(n249), .Y(\intadd_1/B[3] ) );
  NOR2X1 U235 ( .A(n252), .B(n251), .Y(\intadd_5/B[2] ) );
  NOR2X1 U236 ( .A(n250), .B(n253), .Y(\intadd_4/B[1] ) );
  NOR2X1 U237 ( .A(n256), .B(n248), .Y(\intadd_3/CI ) );
  NAND2X1 U238 ( .A(b_i[1]), .B(a_i[5]), .Y(n269) );
  NAND2X1 U239 ( .A(a_i[6]), .B(b_i[0]), .Y(n268) );
  NOR2X1 U240 ( .A(n269), .B(n268), .Y(\intadd_2/B[0] ) );
  NOR2X1 U241 ( .A(n255), .B(n249), .Y(\intadd_6/B[3] ) );
  NOR2X1 U242 ( .A(n254), .B(n251), .Y(\intadd_1/B[2] ) );
  NOR2X1 U243 ( .A(n252), .B(n253), .Y(\intadd_5/B[1] ) );
  NOR2X1 U244 ( .A(n256), .B(n250), .Y(\intadd_4/CI ) );
  NAND2X1 U245 ( .A(b_i[1]), .B(a_i[4]), .Y(n267) );
  NAND2X1 U246 ( .A(b_i[0]), .B(a_i[5]), .Y(n266) );
  NOR2X1 U247 ( .A(n267), .B(n266), .Y(\intadd_3/A[0] ) );
  NOR2X1 U248 ( .A(n255), .B(n251), .Y(\intadd_6/B[2] ) );
  NOR2X1 U249 ( .A(n254), .B(n253), .Y(\intadd_1/B[1] ) );
  NOR2X1 U250 ( .A(n256), .B(n252), .Y(\intadd_5/CI ) );
  NAND2X1 U251 ( .A(b_i[1]), .B(a_i[3]), .Y(n265) );
  NAND2X1 U252 ( .A(b_i[0]), .B(a_i[4]), .Y(n264) );
  NOR2X1 U253 ( .A(n265), .B(n264), .Y(\intadd_4/A[0] ) );
  NOR2X1 U254 ( .A(n255), .B(n253), .Y(\intadd_6/B[1] ) );
  NOR2X1 U255 ( .A(n256), .B(n254), .Y(\intadd_1/CI ) );
  NAND2X1 U256 ( .A(b_i[1]), .B(a_i[2]), .Y(n263) );
  NAND2X1 U257 ( .A(b_i[0]), .B(a_i[3]), .Y(n262) );
  NOR2X1 U258 ( .A(n263), .B(n262), .Y(\intadd_5/A[0] ) );
  NOR2X1 U259 ( .A(n256), .B(n255), .Y(\intadd_6/CI ) );
  NAND2X1 U260 ( .A(b_i[1]), .B(a_i[1]), .Y(n261) );
  NAND2X1 U261 ( .A(b_i[0]), .B(a_i[2]), .Y(n260) );
  NOR2X1 U262 ( .A(n261), .B(n260), .Y(\intadd_1/A[0] ) );
  NAND2X1 U263 ( .A(b_i[0]), .B(a_i[0]), .Y(n259) );
  NOR2X1 U264 ( .A(n259), .B(n261), .Y(\intadd_6/A[0] ) );
  AOI22X1 U265 ( .A(b_i[1]), .B(a_i[0]), .C(b_i[0]), .D(a_i[1]), .Y(n257) );
  NOR2X1 U266 ( .A(\intadd_6/A[0] ), .B(n257), .Y(\intadd_0/B[0] ) );
  INVX1 U267 ( .A(result_i[0]), .Y(n258) );
  NOR2X1 U268 ( .A(n259), .B(n258), .Y(\intadd_0/CI ) );
  AOI21X1 U270 ( .A(n259), .B(n258), .C(\intadd_0/CI ), .Y(N0) );
  AOI21X1 U271 ( .A(n261), .B(n260), .C(\intadd_1/A[0] ), .Y(\intadd_6/B[0] )
         );
  AOI21X1 U272 ( .A(n263), .B(n262), .C(\intadd_5/A[0] ), .Y(\intadd_1/B[0] )
         );
  AOI21X1 U273 ( .A(n265), .B(n264), .C(\intadd_4/A[0] ), .Y(\intadd_5/B[0] )
         );
  AOI21X1 U274 ( .A(n267), .B(n266), .C(\intadd_3/A[0] ), .Y(\intadd_4/B[0] )
         );
  AOI21X1 U275 ( .A(n269), .B(n268), .C(\intadd_2/B[0] ), .Y(\intadd_3/B[0] )
         );
  AOI22X1 U276 ( .A(a_i[7]), .B(b_i[1]), .C(a_i[6]), .D(b_i[2]), .Y(n270) );
  AOI21X1 U277 ( .A(\intadd_7/A[0] ), .B(n273), .C(n270), .Y(n272) );
  NAND2X1 U278 ( .A(n274), .B(n272), .Y(n271) );
  OAI21X1 U279 ( .A(n272), .B(n274), .C(n271), .Y(\intadd_2/A[1] ) );
  INVX1 U280 ( .A(n273), .Y(n276) );
  INVX1 U281 ( .A(\intadd_7/A[0] ), .Y(n275) );
  OAI21X1 U282 ( .A(n276), .B(n275), .C(n274), .Y(\intadd_7/B[0] ) );
  NOR2X1 U283 ( .A(n278), .B(n277), .Y(n282) );
  NAND2X1 U284 ( .A(\intadd_7/n1 ), .B(n282), .Y(n279) );
  OAI21X1 U285 ( .A(\intadd_7/n1 ), .B(n282), .C(n279), .Y(n281) );
  NAND2X1 U286 ( .A(\intadd_1/n1 ), .B(n281), .Y(n280) );
  OAI21X1 U287 ( .A(\intadd_1/n1 ), .B(n281), .C(n280), .Y(\intadd_0/B[13] )
         );
  XOR2X1 U288 ( .A(result_i[15]), .B(\intadd_0/n1 ), .Y(n285) );
  OAI21X1 U289 ( .A(\intadd_1/n1 ), .B(\intadd_7/n1 ), .C(n282), .Y(n284) );
  NAND2X1 U290 ( .A(n284), .B(n285), .Y(n283) );
  OAI21X1 U291 ( .A(n285), .B(n284), .C(n283), .Y(sum[15]) );
endmodule

