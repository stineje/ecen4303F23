// Created by ihdl
`timescale 1ns/10ps

`celldefine

module DFFPOSX1 (CLK, D, Q);
input  CLK ;
input  D ;
output Q ;
reg NOTIFIER ;

   udp_dff (DS0000, D, CLK, 1'B0, 1'B0, NOTIFIER);
   not (P0002, DS0000);
   buf (Q, DS0000);

   specify
     // delay parameters
     specparam
       tpllh$CLK$Q = 0.21:0.21:0.21,
       tplhl$CLK$Q = 0.3:0.3:0.3,
       tminpwh$CLK = 0.1:0.2:0.3,
       tminpwl$CLK = 0.085:0.18:0.27,
       tsetup_negedge$D$CLK = 0.28:0.28:0.28,
       thold_negedge$D$CLK = -0.094:-0.094:-0.094,
       tsetup_posedge$D$CLK = 0.28:0.28:0.28,
       thold_posedge$D$CLK = -0.094:-0.094:-0.094;

     // path delays
     (CLK *> Q) = (tpllh$CLK$Q, tplhl$CLK$Q);
     $setup(negedge D, posedge CLK, tsetup_negedge$D$CLK, NOTIFIER);
     $hold (negedge D, posedge CLK, thold_negedge$D$CLK,  NOTIFIER);
     $setup(posedge D, posedge CLK, tsetup_posedge$D$CLK, NOTIFIER);
     $hold (posedge D, posedge CLK, thold_posedge$D$CLK,  NOTIFIER);
     $width(posedge CLK, tminpwh$CLK, 0, NOTIFIER);
     $width(negedge CLK, tminpwl$CLK, 0, NOTIFIER);

   endspecify

endmodule

`endcelldefine
