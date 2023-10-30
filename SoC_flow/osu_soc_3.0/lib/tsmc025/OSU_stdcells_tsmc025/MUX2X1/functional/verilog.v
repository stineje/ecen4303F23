// Created by ihdl
`timescale 1ns/10ps

`celldefine

module MUX2X1 (A, B, S, Y);
input  A ;
input  B ;
input  S ;
output Y ;

   udp_mux2 (I0_out, B, A, S);
   not (Y, I0_out);

   specify
     // delay parameters
     specparam
       tpllh$S$Y = 0.13:0.13:0.13,
       tplhl$S$Y = 0.13:0.13:0.13,
       tplhl$A$Y = 0.061:0.061:0.061,
       tphlh$A$Y = 0.092:0.092:0.092,
       tplhl$B$Y = 0.067:0.067:0.067,
       tphlh$B$Y = 0.082:0.082:0.082;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);
     (S *> Y) = (tpllh$S$Y, tplhl$S$Y);

   endspecify

endmodule

`endcelldefine
