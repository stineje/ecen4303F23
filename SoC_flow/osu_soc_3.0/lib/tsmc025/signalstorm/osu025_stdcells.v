`timescale 1ns/10ps
`celldefine
module AND2X1 (A, B, Y);
input  A ;
input  B ;
output Y ;

   and (Y, A, B);

   specify
     // delay parameters
     specparam
       tpllh$B$Y = 0.081:0.081:0.081,
       tphhl$B$Y = 0.11:0.11:0.11,
       tpllh$A$Y = 0.085:0.085:0.085,
       tphhl$A$Y = 0.1:0.1:0.1;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);
     (B *> Y) = (tpllh$B$Y, tphhl$B$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module AND2X2 (A, B, Y);
input  A ;
input  B ;
output Y ;

   and (Y, A, B);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.1:0.1:0.1,
       tphhl$A$Y = 0.13:0.13:0.13,
       tpllh$B$Y = 0.1:0.1:0.1,
       tphhl$B$Y = 0.14:0.14:0.14;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);
     (B *> Y) = (tpllh$B$Y, tphhl$B$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module AOI21X1 (A, B, C, Y);
input  A ;
input  B ;
input  C ;
output Y ;

   and (I0_out, A, B);
   or  (I1_out, I0_out, C);
   not (Y, I1_out);

   specify
     // delay parameters
     specparam
       tplhl$A$Y = 0.06:0.06:0.06,
       tphlh$A$Y = 0.084:0.084:0.084,
       tplhl$B$Y = 0.06:0.06:0.06,
       tphlh$B$Y = 0.072:0.072:0.072,
       tplhl$C$Y = 0.053:0.056:0.059,
       tphlh$C$Y = 0.047:0.059:0.072;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);
     (C *> Y) = (tphlh$C$Y, tplhl$C$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module AOI22X1 (A, B, C, D, Y);
input  A ;
input  B ;
input  C ;
input  D ;
output Y ;

   and (I0_out, A, B);
   and (I1_out, C, D);
   or  (I2_out, I0_out, I1_out);
   not (Y, I2_out);

   specify
     // delay parameters
     specparam
       tplhl$C$Y = 0.052:0.054:0.056,
       tphlh$C$Y = 0.065:0.08:0.094,
       tplhl$D$Y = 0.052:0.054:0.056,
       tphlh$D$Y = 0.057:0.069:0.082,
       tplhl$A$Y = 0.069:0.075:0.081,
       tphlh$A$Y = 0.087:0.1:0.11,
       tplhl$B$Y = 0.069:0.075:0.08,
       tphlh$B$Y = 0.077:0.088:0.098;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);
     (C *> Y) = (tphlh$C$Y, tplhl$C$Y);
     (D *> Y) = (tphlh$D$Y, tplhl$D$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module BUFX2 (A, Y);
input  A ;
output Y ;

   buf (Y, A);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.11:0.11:0.11,
       tphhl$A$Y = 0.12:0.12:0.12;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module BUFX4 (A, Y);
input  A ;
output Y ;

   buf (Y, A);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.12:0.12:0.12,
       tphhl$A$Y = 0.13:0.13:0.13;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module CLKBUF1 (A, Y);
input  A ;
output Y ;

   buf (Y, A);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.19:0.19:0.19,
       tphhl$A$Y = 0.2:0.2:0.2;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module CLKBUF2 (A, Y);
input  A ;
output Y ;

   buf (Y, A);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.28:0.28:0.28,
       tphhl$A$Y = 0.28:0.28:0.28;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module CLKBUF3 (A, Y);
input  A ;
output Y ;

   buf (Y, A);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.36:0.36:0.36,
       tphhl$A$Y = 0.37:0.37:0.37;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module DFFNEGX1 (CLK, D, Q);
input  CLK ;
input  D ;
output Q ;
reg NOTIFIER ;

   not (I0_CLOCK, CLK);
   udp_dff (DS0000, D, I0_CLOCK, 1'B0, 1'B0, NOTIFIER);
   not (P0002, DS0000);
   buf (Q, DS0000);

   specify
     // delay parameters
     specparam
       tphlh$CLK$Q = 0.16:0.16:0.16,
       tphhl$CLK$Q = 0.16:0.16:0.16,
       tminpwh$CLK = 0.05:0.12:0.19,
       tminpwl$CLK = 0.1:0.13:0.16,
       tsetup_negedge$D$CLK = 0.26:0.26:0.26,
       thold_negedge$D$CLK = -0.069:-0.069:-0.069,
       tsetup_posedge$D$CLK = 0.26:0.26:0.26,
       thold_posedge$D$CLK = -0.069:-0.069:-0.069;

     // path delays
     (CLK *> Q) = (tphlh$CLK$Q, tphhl$CLK$Q);
     $setup(negedge D, negedge CLK, tsetup_negedge$D$CLK, NOTIFIER);
     $hold (negedge D, negedge CLK, thold_negedge$D$CLK,  NOTIFIER);
     $setup(posedge D, negedge CLK, tsetup_posedge$D$CLK, NOTIFIER);
     $hold (posedge D, negedge CLK, thold_posedge$D$CLK,  NOTIFIER);
     $width(posedge CLK, tminpwh$CLK, 0, NOTIFIER);
     $width(negedge CLK, tminpwl$CLK, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module DFFPOSX1 (CLK, D, Q);
input  CLK ;
input  D ;
output Q ;
reg NOTIFIER ;

   udp_dff (DS0000, D, CLK, 1'B0, 1'B0, NOTIFIER);
   not (P0002, DS0000);
   buf (Q, DS0000);

   specify
     // delay parameters
     specparam
       tpllh$CLK$Q = 0.12:0.12:0.12,
       tplhl$CLK$Q = 0.21:0.21:0.21,
       tminpwh$CLK = 0.064:0.14:0.21,
       tminpwl$CLK = 0.068:0.12:0.18,
       tsetup_negedge$D$CLK = 0.26:0.26:0.26,
       thold_negedge$D$CLK = -0.069:-0.069:-0.069,
       tsetup_posedge$D$CLK = 0.26:0.26:0.26,
       thold_posedge$D$CLK = -0.069:-0.069:-0.069;

     // path delays
     (CLK *> Q) = (tpllh$CLK$Q, tplhl$CLK$Q);
     $setup(negedge D, posedge CLK, tsetup_negedge$D$CLK, NOTIFIER);
     $hold (negedge D, posedge CLK, thold_negedge$D$CLK,  NOTIFIER);
     $setup(posedge D, posedge CLK, tsetup_posedge$D$CLK, NOTIFIER);
     $hold (posedge D, posedge CLK, thold_posedge$D$CLK,  NOTIFIER);
     $width(posedge CLK, tminpwh$CLK, 0, NOTIFIER);
     $width(negedge CLK, tminpwl$CLK, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module DFFSR (CLK, D, R, S, Q);
input  CLK ;
input  D ;
input  R ;
input  S ;
output Q ;
reg NOTIFIER ;

   not (I0_CLEAR, R);
   not (I0_SET, S);
   udp_dff (P0003, D_, CLK, I0_SET, I0_CLEAR, NOTIFIER);
   not (D_, D);
   not (P0002, P0003);
   buf (Q, P0002);
   and (\D&S , D, S);
   not (I7_out, D);
   and (\~D&R , I7_out, R);
   and (\S&R , S, R);

   specify
     // delay parameters
     specparam
       tphlh$S$Q = 0.37:0.37:0.37,
       tpllh$R$Q = 0.27:0.27:0.27,
       tphhl$R$Q = 0.28:0.28:0.29,
       tpllh$CLK$Q = 0.43:0.43:0.43,
       tplhl$CLK$Q = 0.43:0.43:0.43,
       tminpwl$S = 0.062:0.22:0.37,
       tminpwl$R = 0.041:0.17:0.29,
       tminpwh$CLK = 0.22:0.32:0.43,
       tminpwl$CLK = 0.22:0.25:0.28,
       tsetup_negedge$D$CLK = 0.16:0.16:0.16,
       thold_negedge$D$CLK = 0.025:0.025:0.025,
       tsetup_posedge$D$CLK = 0.16:0.16:0.16,
       thold_posedge$D$CLK = 0.025:0.025:0.025,
       trec$R$CLK = -0.025:-0.025:-0.025,
       trem$R$CLK = 0.21:0.21:0.21,
       trec$R$S = 0.000000062:0.000000062:0.000000062,
       trec$S$CLK = -0.025:-0.025:-0.025,
       trem$S$CLK = 0.12:0.12:0.12,
       trec$S$R = 0.094:0.094:0.094;

     // path delays
     (CLK *> Q) = (tpllh$CLK$Q, tplhl$CLK$Q);
     (R *> Q) = (tpllh$R$Q, tphhl$R$Q);
     (S *> Q) = (tphlh$S$Q, 0);
     $setup(negedge D, posedge CLK &&& \S&R , tsetup_negedge$D$CLK, NOTIFIER);
     $hold (negedge D, posedge CLK &&& \S&R , thold_negedge$D$CLK,  NOTIFIER);
     $setup(posedge D, posedge CLK &&& \S&R , tsetup_posedge$D$CLK, NOTIFIER);
     $hold (posedge D, posedge CLK &&& \S&R , thold_posedge$D$CLK,  NOTIFIER);
     $recovery(posedge R, posedge CLK &&& \D&S , trec$R$CLK, NOTIFIER);
     $removal (posedge R, posedge CLK &&& \D&S , trem$R$CLK, NOTIFIER);
     $recovery(posedge R, posedge S, trec$R$S, NOTIFIER);
     $recovery(posedge S, posedge CLK &&& \~D&R , trec$S$CLK, NOTIFIER);
     $removal (posedge S, posedge CLK &&& \~D&R , trem$S$CLK, NOTIFIER);
     $recovery(posedge S, posedge R, trec$S$R, NOTIFIER);
     $width(negedge S, tminpwl$S, 0, NOTIFIER);
     $width(negedge R, tminpwl$R, 0, NOTIFIER);
     $width(posedge CLK, tminpwh$CLK, 0, NOTIFIER);
     $width(negedge CLK, tminpwl$CLK, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module FAX1 (A, B, C, YC, YS);
input  A ;
input  B ;
input  C ;
output YC ;
output YS ;

   and (I0_out, A, B);
   and (I1_out, B, C);
   and (I3_out, C, A);
   or  (YC, I0_out, I1_out, I3_out);
   xor (I5_out, A, B);
   xor (YS, I5_out, C);

   specify
     // delay parameters
     specparam
       tpllh$A$YS = 0.25:0.26:0.27,
       tplhl$A$YS = 0.23:0.23:0.23,
       tpllh$A$YC = 0.14:0.14:0.14,
       tphhl$A$YC = 0.17:0.17:0.17,
       tpllh$B$YS = 0.26:0.27:0.27,
       tplhl$B$YS = 0.24:0.24:0.24,
       tpllh$B$YC = 0.13:0.15:0.16,
       tphhl$B$YC = 0.17:0.18:0.18,
       tpllh$C$YS = 0.25:0.25:0.26,
       tplhl$C$YS = 0.24:0.24:0.24,
       tpllh$C$YC = 0.14:0.14:0.14,
       tphhl$C$YC = 0.16:0.16:0.17;

     // path delays
     (A *> YC) = (tpllh$A$YC, tphhl$A$YC);
     (A *> YS) = (tpllh$A$YS, tplhl$A$YS);
     (B *> YC) = (tpllh$B$YC, tphhl$B$YC);
     (B *> YS) = (tpllh$B$YS, tplhl$B$YS);
     (C *> YC) = (tpllh$C$YC, tphhl$C$YC);
     (C *> YS) = (tpllh$C$YS, tplhl$C$YS);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module HAX1 (A, B, YC, YS);
input  A ;
input  B ;
output YC ;
output YS ;

   and (YC, A, B);
   xor (YS, A, B);

   specify
     // delay parameters
     specparam
       tpllh$A$YS = 0.19:0.19:0.19,
       tplhl$A$YS = 0.19:0.19:0.19,
       tpllh$A$YC = 0.1:0.1:0.1,
       tphhl$A$YC = 0.14:0.14:0.14,
       tpllh$B$YS = 0.18:0.18:0.18,
       tplhl$B$YS = 0.19:0.19:0.19,
       tpllh$B$YC = 0.1:0.1:0.1,
       tphhl$B$YC = 0.13:0.13:0.13;

     // path delays
     (A *> YC) = (tpllh$A$YC, tphhl$A$YC);
     (A *> YS) = (tpllh$A$YS, tplhl$A$YS);
     (B *> YC) = (tpllh$B$YC, tphhl$B$YC);
     (B *> YS) = (tpllh$B$YS, tplhl$B$YS);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module INVX1 (A, Y);
input  A ;
output Y ;

   not (Y, A);

   specify
     // delay parameters
     specparam
       tplhl$A$Y = 0.04:0.04:0.04,
       tphlh$A$Y = 0.048:0.048:0.048;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module INVX2 (A, Y);
input  A ;
output Y ;

   not (Y, A);

   specify
     // delay parameters
     specparam
       tplhl$A$Y = 0.041:0.041:0.041,
       tphlh$A$Y = 0.048:0.048:0.048;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module INVX4 (A, Y);
input  A ;
output Y ;

   not (Y, A);

   specify
     // delay parameters
     specparam
       tplhl$A$Y = 0.041:0.041:0.041,
       tphlh$A$Y = 0.048:0.048:0.048;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module INVX8 (A, Y);
input  A ;
output Y ;

   not (Y, A);

   specify
     // delay parameters
     specparam
       tplhl$A$Y = 0.041:0.041:0.041,
       tphlh$A$Y = 0.048:0.048:0.048;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module LATCH (CLK, D, Q);
input  CLK ;
input  D ;
output Q ;
reg NOTIFIER ;

   udp_tlat (DS0000, D, CLK, 1'B0, 1'B0, NOTIFIER);
   not (P0000, DS0000);
   buf (Q, DS0000);

   specify
     // delay parameters
     specparam
       tpllh$D$Q = 0.24:0.24:0.24,
       tphhl$D$Q = 0.28:0.28:0.28,
       tpllh$CLK$Q = 0.21:0.21:0.21,
       tplhl$CLK$Q = 0.29:0.29:0.29,
       tminpwh$CLK = 0.063:0.17:0.29,
       tsetup_negedge$D$CLK = 0.26:0.26:0.26,
       thold_negedge$D$CLK = -0.069:-0.069:-0.069,
       tsetup_posedge$D$CLK = 0.26:0.26:0.26,
       thold_posedge$D$CLK = -0.069:-0.069:-0.069;

     // path delays
     (CLK *> Q) = (tpllh$CLK$Q, tplhl$CLK$Q);
     (D *> Q) = (tpllh$D$Q, tphhl$D$Q);
     $setup(negedge D, negedge CLK, tsetup_negedge$D$CLK, NOTIFIER);
     $hold (negedge D, negedge CLK, thold_negedge$D$CLK,  NOTIFIER);
     $setup(posedge D, negedge CLK, tsetup_posedge$D$CLK, NOTIFIER);
     $hold (posedge D, negedge CLK, thold_posedge$D$CLK,  NOTIFIER);
     $width(posedge CLK, tminpwh$CLK, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module MUX2X1 (A, B, S, Y);
input  A ;
input  B ;
input  S ;
output Y ;

   udp_mux2 (I0_out, B, A, S);
   not (Y, I0_out);

   specify
     // delay parameters
     specparam
       tpllh$S$Y = 0.13:0.13:0.13,
       tplhl$S$Y = 0.13:0.13:0.13,
       tplhl$A$Y = 0.061:0.061:0.061,
       tphlh$A$Y = 0.092:0.092:0.092,
       tplhl$B$Y = 0.067:0.067:0.067,
       tphlh$B$Y = 0.082:0.082:0.082;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);
     (S *> Y) = (tpllh$S$Y, tplhl$S$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module NAND2X1 (A, B, Y);
input  A ;
input  B ;
output Y ;

   and (I0_out, A, B);
   not (Y, I0_out);

   specify
     // delay parameters
     specparam
       tplhl$A$Y = 0.038:0.038:0.038,
       tphlh$A$Y = 0.069:0.069:0.069,
       tplhl$B$Y = 0.039:0.039:0.039,
       tphlh$B$Y = 0.056:0.056:0.056;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module NAND3X1 (A, B, C, Y);
input  A ;
input  B ;
input  C ;
output Y ;

   and (I1_out, A, B, C);
   not (Y, I1_out);

   specify
     // delay parameters
     specparam
       tplhl$B$Y = 0.044:0.044:0.044,
       tphlh$B$Y = 0.086:0.086:0.086,
       tplhl$A$Y = 0.048:0.048:0.048,
       tphlh$A$Y = 0.1:0.1:0.1,
       tplhl$C$Y = 0.041:0.041:0.041,
       tphlh$C$Y = 0.065:0.065:0.065;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);
     (C *> Y) = (tphlh$C$Y, tplhl$C$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module NOR2X1 (A, B, Y);
input  A ;
input  B ;
output Y ;

   or  (I0_out, A, B);
   not (Y, I0_out);

   specify
     // delay parameters
     specparam
       tplhl$B$Y = 0.054:0.054:0.054,
       tphlh$B$Y = 0.055:0.055:0.055,
       tplhl$A$Y = 0.068:0.068:0.068,
       tphlh$A$Y = 0.061:0.061:0.061;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module NOR3X1 (A, B, C, Y);
input  A ;
input  B ;
input  C ;
output Y ;

   or  (I1_out, A, B, C);
   not (Y, I1_out);

   specify
     // delay parameters
     specparam
       tplhl$B$Y = 0.093:0.093:0.093,
       tphlh$B$Y = 0.087:0.087:0.087,
       tplhl$C$Y = 0.067:0.067:0.067,
       tphlh$C$Y = 0.06:0.06:0.06,
       tplhl$A$Y = 0.11:0.11:0.11,
       tphlh$A$Y = 0.09:0.09:0.09;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);
     (C *> Y) = (tphlh$C$Y, tplhl$C$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module OAI21X1 (A, B, C, Y);
input  A ;
input  B ;
input  C ;
output Y ;

   or  (I0_out, A, B);
   and (I1_out, I0_out, C);
   not (Y, I1_out);

   specify
     // delay parameters
     specparam
       tplhl$A$Y = 0.06:0.06:0.06,
       tphlh$A$Y = 0.085:0.085:0.085,
       tplhl$B$Y = 0.05:0.05:0.05,
       tphlh$B$Y = 0.079:0.079:0.079,
       tplhl$C$Y = 0.036:0.046:0.056,
       tphlh$C$Y = 0.059:0.061:0.063;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);
     (C *> Y) = (tphlh$C$Y, tplhl$C$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module OAI22X1 (A, B, C, D, Y);
input  A ;
input  B ;
input  C ;
input  D ;
output Y ;

   or  (I0_out, A, B);
   or  (I1_out, C, D);
   and (I2_out, I0_out, I1_out);
   not (Y, I2_out);

   specify
     // delay parameters
     specparam
       tplhl$D$Y = 0.046:0.057:0.068,
       tphlh$D$Y = 0.069:0.071:0.073,
       tplhl$C$Y = 0.054:0.066:0.079,
       tphlh$C$Y = 0.076:0.077:0.079,
       tplhl$A$Y = 0.059:0.071:0.082,
       tphlh$A$Y = 0.093:0.097:0.1,
       tplhl$B$Y = 0.052:0.062:0.073,
       tphlh$B$Y = 0.087:0.092:0.096;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);
     (C *> Y) = (tphlh$C$Y, tplhl$C$Y);
     (D *> Y) = (tphlh$D$Y, tplhl$D$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module OR2X1 (A, B, Y);
input  A ;
input  B ;
output Y ;

   or  (Y, A, B);

   specify
     // delay parameters
     specparam
       tpllh$B$Y = 0.12:0.12:0.12,
       tphhl$B$Y = 0.11:0.11:0.11,
       tpllh$A$Y = 0.1:0.1:0.1,
       tphhl$A$Y = 0.1:0.1:0.1;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);
     (B *> Y) = (tpllh$B$Y, tphhl$B$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module OR2X2 (A, B, Y);
input  A ;
input  B ;
output Y ;

   or  (Y, A, B);

   specify
     // delay parameters
     specparam
       tpllh$B$Y = 0.14:0.14:0.14,
       tphhl$B$Y = 0.13:0.13:0.13,
       tpllh$A$Y = 0.12:0.12:0.12,
       tphhl$A$Y = 0.13:0.13:0.13;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);
     (B *> Y) = (tpllh$B$Y, tphhl$B$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module TBUFX1 (A, EN, Y);
input  A ;
input  EN ;
output Y ;

   not (I0_out, A);
   bufif1 (Y, I0_out, EN);

   specify
     // delay parameters
     specparam
       tpzh$EN$Y = 0.084:0.084:0.084,
       tpzl$EN$Y = 0.025:0.025:0.025,
       tplz$EN$Y = 0.052:0.052:0.052,
       tphz$EN$Y = 0.072:0.072:0.072,
       tplhl$A$Y = 0.053:0.053:0.053,
       tphlh$A$Y = 0.082:0.082:0.082;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);
     (EN *> Y) = (0, 0, tplz$EN$Y, tpzh$EN$Y, tphz$EN$Y, tpzl$EN$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module TBUFX2 (A, EN, Y);
input  A ;
input  EN ;
output Y ;

   not (I0_out, A);
   bufif1 (Y, I0_out, EN);

   specify
     // delay parameters
     specparam
       tplhl$A$Y = 0.053:0.053:0.053,
       tphlh$A$Y = 0.082:0.082:0.082,
       tpzh$EN$Y = 0.086:0.086:0.086,
       tpzl$EN$Y = 0.025:0.025:0.025,
       tplz$EN$Y = 0.052:0.052:0.052,
       tphz$EN$Y = 0.073:0.073:0.073;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);
     (EN *> Y) = (0, 0, tplz$EN$Y, tpzh$EN$Y, tphz$EN$Y, tpzl$EN$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module XNOR2X1 (A, B, Y);
input  A ;
input  B ;
output Y ;

   xor (I0_out, A, B);
   not (Y, I0_out);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.11:0.11:0.11,
       tplhl$A$Y = 0.098:0.098:0.098,
       tpllh$B$Y = 0.13:0.13:0.13,
       tplhl$B$Y = 0.11:0.11:0.11;

     // path delays
     (A *> Y) = (tpllh$A$Y, tplhl$A$Y);
     (B *> Y) = (tpllh$B$Y, tplhl$B$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module XOR2X1 (A, B, Y);
input  A ;
input  B ;
output Y ;

   xor (Y, A, B);

   specify
     // delay parameters
     specparam
       tpllh$B$Y = 0.12:0.12:0.12,
       tplhl$B$Y = 0.11:0.11:0.11,
       tpllh$A$Y = 0.11:0.11:0.11,
       tplhl$A$Y = 0.098:0.098:0.098;

     // path delays
     (A *> Y) = (tpllh$A$Y, tplhl$A$Y);
     (B *> Y) = (tpllh$B$Y, tplhl$B$Y);

   endspecify

endmodule
`endcelldefine

primitive udp_dff (out, in, clk, clr, set, NOTIFIER);
   output out;
   input  in, clk, clr, set, NOTIFIER;
   reg    out;

   table

// in  clk  clr   set  NOT  : Qt : Qt+1
//
   0  r   ?   0   ?   : ?  :  0  ; // clock in 0
   1  r   0   ?   ?   : ?  :  1  ; // clock in 1
   1  *   0   ?   ?   : 1  :  1  ; // reduce pessimism
   0  *   ?   0   ?   : 0  :  0  ; // reduce pessimism
   ?  f   ?   ?   ?   : ?  :  -  ; // no changes on negedge clk
   *  b   ?   ?   ?   : ?  :  -  ; // no changes when in switches
   ?  ?   ?   1   ?   : ?  :  1  ; // set output
   ?  b   0   *   ?   : 1  :  1  ; // cover all transistions on set
   1  x   0   *   ?   : 1  :  1  ; // cover all transistions on set
   ?  ?   1   0   ?   : ?  :  0  ; // reset output
   ?  b   *   0   ?   : 0  :  0  ; // cover all transistions on clr
   0  x   *   0   ?   : 0  :  0  ; // cover all transistions on clr
   ?  ?   ?   ?   *   : ?  :  x  ; // any notifier changed

   endtable
endprimitive // udp_dff

primitive udp_tlat (out, in, enable, clr, set, NOTIFIER);

   output out;
   input  in, enable, clr, set, NOTIFIER;
   reg    out;

   table

// in  enable  clr   set  NOT  : Qt : Qt+1
//
   1  1   0   ?   ?   : ?  :  1  ; //
   0  1   ?   0   ?   : ?  :  0  ; //
   1  *   0   ?   ?   : 1  :  1  ; // reduce pessimism
   0  *   ?   0   ?   : 0  :  0  ; // reduce pessimism
   *  0   ?   ?   ?   : ?  :  -  ; // no changes when in switches
   ?  ?   ?   1   ?   : ?  :  1  ; // set output
   ?  0   0   *   ?   : 1  :  1  ; // cover all transistions on set
   1  ?   0   *   ?   : 1  :  1  ; // cover all transistions on set
   ?  ?   1   0   ?   : ?  :  0  ; // reset output
   ?  0   *   0   ?   : 0  :  0  ; // cover all transistions on clr
   0  ?   *   0   ?   : 0  :  0  ; // cover all transistions on clr
   ?  ?   ?   ?   *   : ?  :  x  ; // any notifier changed

   endtable
endprimitive // udp_tlat

primitive udp_rslat (out, clr, set, NOTIFIER);

   output out;
   input  clr, set, NOTIFIER;
   reg    out;

   table

// clr   set  NOT  : Qt : Qt+1
//
   ?   1   ?   : ?  :  1  ; // set output
   0   *   ?   : 1  :  1  ; // cover all transistions on set
   1   0   ?   : ?  :  0  ; // reset output
   *   0   ?   : 0  :  0  ; // cover all transistions on clr
   ?   ?   *   : ?  :  x  ; // any notifier changed

   endtable
endprimitive // udp_tlat

primitive udp_mux2 (out, in0, in1, sel);
   output out;
   input  in0, in1, sel;

   table

// in0 in1 sel :  out
//
    1  ?  0 :  1 ;
    0  ?  0 :  0 ;
    ?  1  1 :  1 ;
    ?  0  1 :  0 ;
    0  0  x :  0 ;
    1  1  x :  1 ;

   endtable
endprimitive // udp_mux2

