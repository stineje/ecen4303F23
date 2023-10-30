// Created by ihdl
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
       tpllh$A$YS = 0.23:0.23:0.23,
       tplhl$A$YS = 0.25:0.25:0.25,
       tpllh$A$YC = 0.14:0.14:0.14,
       tphhl$A$YC = 0.18:0.18:0.18,
       tpllh$B$YS = 0.22:0.22:0.22,
       tplhl$B$YS = 0.25:0.25:0.25,
       tpllh$B$YC = 0.14:0.14:0.14,
       tphhl$B$YC = 0.16:0.16:0.16;

     // path delays
     (A *> YC) = (tpllh$A$YC, tphhl$A$YC);
     (A *> YS) = (tpllh$A$YS, tplhl$A$YS);
     (B *> YC) = (tpllh$B$YC, tphhl$B$YC);
     (B *> YS) = (tpllh$B$YS, tplhl$B$YS);

   endspecify

endmodule

`endcelldefine
