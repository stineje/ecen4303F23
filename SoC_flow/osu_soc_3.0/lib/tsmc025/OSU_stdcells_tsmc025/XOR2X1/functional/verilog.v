// Created by ihdl
`timescale 1ns/10ps

`celldefine

module XOR2X1 (A, B, Y);
input  A ;
input  B ;
output Y ;

   xor (Y, A, B);

   specify
     // delay parameters
     specparam
       tpllh$B$Y = 0.12:0.12:0.12,
       tplhl$B$Y = 0.11:0.11:0.11,
       tpllh$A$Y = 0.11:0.11:0.11,
       tplhl$A$Y = 0.098:0.098:0.098;

     // path delays
     (A *> Y) = (tpllh$A$Y, tplhl$A$Y);
     (B *> Y) = (tpllh$B$Y, tplhl$B$Y);

   endspecify

endmodule

`endcelldefine
