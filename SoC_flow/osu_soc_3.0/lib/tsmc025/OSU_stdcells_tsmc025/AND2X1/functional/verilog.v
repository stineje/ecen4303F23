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
       tpllh$B$Y = 0.081:0.081:0.081,
       tphhl$B$Y = 0.11:0.11:0.11,
       tpllh$A$Y = 0.085:0.085:0.085,
       tphhl$A$Y = 0.1:0.1:0.1;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);
     (B *> Y) = (tpllh$B$Y, tphhl$B$Y);

   endspecify

endmodule

`endcelldefine
