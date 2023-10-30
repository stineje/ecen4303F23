// Created by ihdl
`timescale 1ns/10ps

`celldefine

module PADINC (YPAD, DI);
input  YPAD ;
output DI ;

   buf (DI, YPAD);

   specify
     // delay parameters
     specparam
       tpllh$YPAD$DI = 0.15:0.15:0.15,
       tphhl$YPAD$DI = 0.17:0.17:0.17;

     // path delays
     (YPAD *> DI) = (tpllh$YPAD$DI, tphhl$YPAD$DI);

   endspecify

endmodule

`endcelldefine
