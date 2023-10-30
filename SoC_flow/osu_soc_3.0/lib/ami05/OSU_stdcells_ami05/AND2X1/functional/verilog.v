// Created by ihdl
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
       tpllh$B$Y = 0.14:0.14:0.14,
       tphhl$B$Y = 0.18:0.18:0.18,
       tpllh$A$Y = 0.14:0.14:0.14,
       tphhl$A$Y = 0.17:0.17:0.17;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);
     (B *> Y) = (tpllh$B$Y, tphhl$B$Y);

   endspecify

endmodule

`endcelldefine
