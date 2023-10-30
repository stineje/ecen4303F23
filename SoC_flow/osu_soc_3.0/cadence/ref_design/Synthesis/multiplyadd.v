// 16-Bit Multiply Add Unit, test design for Standard Cell/Custom Design
// F = Accumulation ( A * B )
// Author: Ivan Castellanos
// email: ivan.castellanos@okstate.edu
// VLSI Computer Architecture Research Group,
// Oklahoma Stata University

// This chip has 40 pins (10 on each side) and 4 corners
// PADNC can be used to fill unused pins
//
// For Pads: DO   is the "Data Out" pin
//           DI   is the "Data In" pin
//           YPAD is the bonding-pad (IC package)

//
// The core, here goes your regular main module code:
//
module multiplyadd_core(result, a, b, reset, clk);

   output [16:0] result;
   input  [7:0] a;
   input  [7:0] b;
   input  reset;
   input  clk;
   
   wire [15:0] multiplication;
   wire [16:0] sum;

// Custom cell block:
   multi multi_module(.P(multiplication), .A(a), .B(b));

   cla16 cla16_module(sum, multiplication, result[15:0]);

// Output register is 17-bits long to include Carry out in the result.
   dffr_17 accu_output(result, sum, clk, reset);

endmodule

//
// Toplevel module which includes the main module (core) and surrounding pads.
// 

module multiplyadd(result, a, b, reset, clk);
   output [16:0] result;
   input  [7:0] a;
   input  [7:0] b;
   input  reset;
   input  clk;

   wire [16:0] result_i;
   wire [7:0] a_i, b_i;
   wire reset_i, clk_i;

   multiplyadd_core my_core(result_i, a_i, b_i, reset_i, clk_i);

   PADOUT p00(.DO(result_i[0]), .YPAD(result[0]));
   PADOUT p01(.DO(result_i[1]), .YPAD(result[1]));
   PADOUT p02(.DO(result_i[2]), .YPAD(result[2]));
   PADOUT p03(.DO(result_i[3]), .YPAD(result[3]));
   PADOUT p04(.DO(result_i[4]), .YPAD(result[4]));
   PADOUT p05(.DO(result_i[5]), .YPAD(result[5]));
   PADOUT p06(.DO(result_i[6]), .YPAD(result[6]));
   PADOUT p07(.DO(result_i[7]), .YPAD(result[7]));
   PADOUT p08(.DO(result_i[8]), .YPAD(result[8]));
   PADOUT p09(.DO(result_i[9]), .YPAD(result[9]));
   PADOUT p10(.DO(result_i[10]), .YPAD(result[10]));
   PADOUT p11(.DO(result_i[11]), .YPAD(result[11]));
   PADOUT p12(.DO(result_i[12]), .YPAD(result[12]));
   PADOUT p13(.DO(result_i[13]), .YPAD(result[13]));
   PADOUT p14(.DO(result_i[14]), .YPAD(result[14]));
   PADOUT p15(.DO(result_i[15]), .YPAD(result[15]));
   PADOUT p16(.DO(result_i[16]), .YPAD(result[16]));

   PADINC p17(.DI(a_i[0]), .YPAD(a[0]));
   PADINC p18(.DI(a_i[1]), .YPAD(a[1]));
   PADINC p19(.DI(a_i[2]), .YPAD(a[2]));
   PADINC p20(.DI(a_i[3]), .YPAD(a[3]));
   PADINC p21(.DI(a_i[4]), .YPAD(a[4]));
   PADINC p22(.DI(a_i[5]), .YPAD(a[5]));
   PADINC p23(.DI(a_i[6]), .YPAD(a[6]));
   PADINC p24(.DI(a_i[7]), .YPAD(a[7]));

   PADINC p25(.DI(b_i[0]), .YPAD(b[0]));
   PADINC p26(.DI(b_i[1]), .YPAD(b[1]));
   PADINC p27(.DI(b_i[2]), .YPAD(b[2]));
   PADINC p28(.DI(b_i[3]), .YPAD(b[3]));
   PADINC p29(.DI(b_i[4]), .YPAD(b[4]));
   PADINC p30(.DI(b_i[5]), .YPAD(b[5]));
   PADINC p31(.DI(b_i[6]), .YPAD(b[6]));
   PADINC p32(.DI(b_i[7]), .YPAD(b[7]));

   PADINC p33(.DI(clk_i), .YPAD(clk));
   PADINC p34(.DI(reset_i), .YPAD(reset));

// Power Pads
   PADGND p35();
   PADVDD p36();

// Filler Pads, to complete 40 pads total, unused pins
   PADNC p37();
   PADNC p38();
   PADNC p39();

// Corner Pads
   PADFC	 c01();
   PADFC	 c02();
   PADFC	 c03();
   PADFC	 c04();

endmodule
