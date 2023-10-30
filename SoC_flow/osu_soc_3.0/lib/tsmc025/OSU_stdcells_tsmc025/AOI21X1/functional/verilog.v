// Created by ihdl
`timescale 1ns/10ps

`celldefine

module AOI21X1 (A, B, C, Y);
input  A ;
input  B ;
input  C ;
output Y ;

   and (I0_out, A, B);
   or  (I1_out, I0_out, C);
   not (Y, I1_out);

   specify
     // delay parameters
     specparam
       tplhl$A$Y = 0.06:0.06:0.06,
       tphlh$A$Y = 0.084:0.084:0.084,
       tplhl$B$Y = 0.06:0.06:0.06,
       tphlh$B$Y = 0.072:0.072:0.072,
       tplhl$C$Y = 0.053:0.056:0.059,
       tphlh$C$Y = 0.047:0.059:0.072;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);
     (C *> Y) = (tphlh$C$Y, tplhl$C$Y);

   endspecify

endmodule

`endcelldefine
