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
       tpllh$A$YS = 0.34:0.36:0.38,
       tplhl$A$YS = 0.38:0.38:0.39,
       tpllh$A$YC = 0.24:0.24:0.24,
       tphhl$A$YC = 0.27:0.27:0.27,
       tpllh$B$YS = 0.35:0.38:0.41,
       tplhl$B$YS = 0.37:0.4:0.42,
       tpllh$B$YC = 0.23:0.25:0.28,
       tphhl$B$YC = 0.28:0.28:0.28,
       tpllh$C$YS = 0.36:0.38:0.39,
       tplhl$C$YS = 0.37:0.38:0.38,
       tpllh$C$YC = 0.22:0.23:0.25,
       tphhl$C$YC = 0.26:0.26:0.26;

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
