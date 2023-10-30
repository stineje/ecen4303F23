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
       tplhl$D$Y = 0.046:0.057:0.068,
       tphlh$D$Y = 0.069:0.071:0.073,
       tplhl$C$Y = 0.054:0.066:0.079,
       tphlh$C$Y = 0.076:0.077:0.079,
       tplhl$A$Y = 0.059:0.071:0.082,
       tphlh$A$Y = 0.093:0.097:0.1,
       tplhl$B$Y = 0.052:0.062:0.073,
       tphlh$B$Y = 0.087:0.092:0.096;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);
     (C *> Y) = (tphlh$C$Y, tplhl$C$Y);
     (D *> Y) = (tphlh$D$Y, tplhl$D$Y);

   endspecify

endmodule

`endcelldefine
