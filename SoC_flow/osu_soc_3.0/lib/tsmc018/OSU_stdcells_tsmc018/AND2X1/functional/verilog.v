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
       tpllh$B$Y = 0.065:0.065:0.065,
       tphhl$B$Y = 0.086:0.086:0.086,
       tpllh$A$Y = 0.064:0.064:0.064,
       tphhl$A$Y = 0.076:0.076:0.076;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);
     (B *> Y) = (tpllh$B$Y, tphhl$B$Y);

   endspecify

endmodule

`endcelldefine
