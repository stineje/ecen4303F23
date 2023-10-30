// Created by ihdl
`timescale 1ns/10ps

`celldefine

module XNOR2X1 (A, B, Y);
input  A ;
input  B ;
output Y ;

   xor (I0_out, A, B);
   not (Y, I0_out);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.085:0.085:0.085,
       tplhl$A$Y = 0.081:0.081:0.081,
       tpllh$B$Y = 0.1:0.1:0.1,
       tplhl$B$Y = 0.089:0.089:0.089;

     // path delays
     (A *> Y) = (tpllh$A$Y, tplhl$A$Y);
     (B *> Y) = (tpllh$B$Y, tplhl$B$Y);

   endspecify

endmodule

`endcelldefine
