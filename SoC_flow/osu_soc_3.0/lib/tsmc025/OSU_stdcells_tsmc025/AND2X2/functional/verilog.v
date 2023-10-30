// Created by ihdl
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
