// Created by ihdl
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
       tpllh$A$YS = 0.19:0.2:0.2,
       tplhl$A$YS = 0.18:0.18:0.18,
       tpllh$A$YC = 0.11:0.11:0.11,
       tphhl$A$YC = 0.13:0.13:0.13,
       tpllh$B$YS = 0.19:0.2:0.21,
       tplhl$B$YS = 0.19:0.19:0.19,
       tpllh$B$YC = 0.11:0.11:0.12,
       tphhl$B$YC = 0.13:0.13:0.14,
       tpllh$C$YS = 0.19:0.2:0.2,
       tplhl$C$YS = 0.18:0.18:0.18,
       tpllh$C$YC = 0.1:0.11:0.12,
       tphhl$C$YC = 0.12:0.12:0.13;

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
