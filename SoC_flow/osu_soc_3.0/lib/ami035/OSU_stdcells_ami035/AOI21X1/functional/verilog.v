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
       tplhl$A$Y = 0.088:0.088:0.088,
       tphlh$A$Y = 0.099:0.099:0.099,
       tplhl$B$Y = 0.086:0.086:0.086,
       tphlh$B$Y = 0.084:0.084:0.084,
       tplhl$C$Y = 0.068:0.071:0.074,
       tphlh$C$Y = 0.051:0.068:0.085;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);
     (C *> Y) = (tphlh$C$Y, tplhl$C$Y);

   endspecify

endmodule

`endcelldefine
