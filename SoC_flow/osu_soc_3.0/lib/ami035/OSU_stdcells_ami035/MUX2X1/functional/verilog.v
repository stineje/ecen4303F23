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
       tpllh$S$Y = 0.15:0.15:0.15,
       tplhl$S$Y = 0.16:0.16:0.16,
       tplhl$A$Y = 0.082:0.082:0.082,
       tphlh$A$Y = 0.11:0.11:0.11,
       tplhl$B$Y = 0.094:0.094:0.094,
       tphlh$B$Y = 0.096:0.096:0.096;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);
     (S *> Y) = (tpllh$S$Y, tplhl$S$Y);

   endspecify

endmodule

`endcelldefine
