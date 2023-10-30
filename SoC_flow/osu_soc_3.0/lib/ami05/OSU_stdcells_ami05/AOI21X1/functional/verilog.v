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
       tplhl$A$Y = 0.11:0.11:0.11,
       tphlh$A$Y = 0.12:0.12:0.12,
       tplhl$B$Y = 0.11:0.11:0.11,
       tphlh$B$Y = 0.11:0.11:0.11,
       tplhl$C$Y = 0.11:0.12:0.13,
       tphlh$C$Y = 0.069:0.085:0.1;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);
     (C *> Y) = (tphlh$C$Y, tplhl$C$Y);

   endspecify

endmodule

`endcelldefine
