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
       tpllh$A$Y = 0.079:0.079:0.079,
       tphhl$A$Y = 0.094:0.094:0.094,
       tpllh$B$Y = 0.082:0.082:0.082,
       tphhl$B$Y = 0.1:0.1:0.1;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);
     (B *> Y) = (tpllh$B$Y, tphhl$B$Y);

   endspecify

endmodule

`endcelldefine
