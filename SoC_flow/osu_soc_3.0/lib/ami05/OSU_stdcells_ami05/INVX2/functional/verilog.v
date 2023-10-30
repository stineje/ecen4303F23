// Created by ihdl
`timescale 1ns/10ps

`celldefine

module INVX2 (A, Y);
input  A ;
output Y ;

   not (Y, A);

   specify
     // delay parameters
     specparam
       tplhl$A$Y = 0.083:0.083:0.083,
       tphlh$A$Y = 0.079:0.079:0.079;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);

   endspecify

endmodule

`endcelldefine
