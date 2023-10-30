// Created by ihdl
`timescale 1ns/10ps

`celldefine

module OAI22X1 (A, B, C, D, Y);
input  A ;
input  B ;
input  C ;
input  D ;
output Y ;

   or  (I0_out, A, B);
   or  (I1_out, C, D);
   and (I2_out, I0_out, I1_out);
   not (Y, I2_out);

   specify
     // delay parameters
     specparam
       tplhl$D$Y = 0.038:0.047:0.055,
       tphlh$D$Y = 0.055:0.055:0.056,
       tplhl$C$Y = 0.044:0.054:0.064,
       tphlh$C$Y = 0.059:0.059:0.06,
       tplhl$A$Y = 0.051:0.06:0.07,
       tphlh$A$Y = 0.075:0.078:0.081,
       tplhl$B$Y = 0.044:0.052:0.059,
       tphlh$B$Y = 0.071:0.073:0.076;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);
     (C *> Y) = (tphlh$C$Y, tplhl$C$Y);
     (D *> Y) = (tphlh$D$Y, tplhl$D$Y);

   endspecify

endmodule

`endcelldefine
