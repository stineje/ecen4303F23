// Created by ihdl
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
       tpllh$B$Y = 0.18:0.18:0.18,
       tphhl$B$Y = 0.16:0.16:0.16,
       tpllh$A$Y = 0.15:0.15:0.15,
       tphhl$A$Y = 0.15:0.15:0.15;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);
     (B *> Y) = (tpllh$B$Y, tphhl$B$Y);

   endspecify

endmodule

`endcelldefine
