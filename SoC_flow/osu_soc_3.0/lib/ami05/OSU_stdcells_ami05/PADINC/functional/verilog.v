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
       tpllh$YPAD$DI = 0.11:0.11:0.11,
       tphhl$YPAD$DI = 0.12:0.12:0.12;

     // path delays
     (YPAD *> DI) = (tpllh$YPAD$DI, tphhl$YPAD$DI);

   endspecify

endmodule

`endcelldefine
