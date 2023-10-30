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
