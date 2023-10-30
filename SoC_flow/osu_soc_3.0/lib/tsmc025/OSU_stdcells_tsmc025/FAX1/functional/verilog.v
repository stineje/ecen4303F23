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
