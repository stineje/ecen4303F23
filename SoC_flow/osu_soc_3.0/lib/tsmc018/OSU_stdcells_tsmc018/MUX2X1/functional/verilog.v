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
       tpllh$S$Y = 0.1:0.1:0.1,
       tplhl$S$Y = 0.099:0.099:0.099,
       tplhl$A$Y = 0.05:0.05:0.05,
       tphlh$A$Y = 0.072:0.072:0.072,
       tplhl$B$Y = 0.055:0.055:0.055,
       tphlh$B$Y = 0.066:0.066:0.066;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);
     (S *> Y) = (tpllh$S$Y, tplhl$S$Y);

   endspecify

endmodule

`endcelldefine
