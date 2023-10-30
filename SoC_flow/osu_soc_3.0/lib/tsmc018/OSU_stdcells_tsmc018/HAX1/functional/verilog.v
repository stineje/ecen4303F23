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
       tpllh$A$YS = 0.15:0.15:0.15,
       tplhl$A$YS = 0.15:0.15:0.15,
       tpllh$A$YC = 0.085:0.085:0.085,
       tphhl$A$YC = 0.11:0.11:0.11,
       tpllh$B$YS = 0.14:0.14:0.14,
       tplhl$B$YS = 0.15:0.15:0.15,
       tpllh$B$YC = 0.083:0.083:0.083,
       tphhl$B$YC = 0.097:0.097:0.097;

     // path delays
     (A *> YC) = (tpllh$A$YC, tphhl$A$YC);
     (A *> YS) = (tpllh$A$YS, tplhl$A$YS);
     (B *> YC) = (tpllh$B$YC, tphhl$B$YC);
     (B *> YS) = (tpllh$B$YS, tplhl$B$YS);

   endspecify

endmodule

`endcelldefine
