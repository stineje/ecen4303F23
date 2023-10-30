// Created by ihdl
`timescale 1ns/10ps

`celldefine

module OR2X1 (A, B, Y);
input  A ;
input  B ;
output Y ;

   or  (Y, A, B);

   specify
     // delay parameters
     specparam
       tpllh$B$Y = 0.086:0.086:0.086,
       tphhl$B$Y = 0.081:0.081:0.081,
       tpllh$A$Y = 0.074:0.074:0.074,
       tphhl$A$Y = 0.076:0.076:0.076;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);
     (B *> Y) = (tpllh$B$Y, tphhl$B$Y);

   endspecify

endmodule

`endcelldefine
