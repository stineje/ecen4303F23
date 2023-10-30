// Created by ihdl
`timescale 1ns/10ps

`celldefine

module LATCH (CLK, D, Q);
input  CLK ;
input  D ;
output Q ;
reg NOTIFIER ;

   udp_tlat (DS0000, D, CLK, 1'B0, 1'B0, NOTIFIER);
   not (P0000, DS0000);
   buf (Q, DS0000);

   specify
     // delay parameters
     specparam
       tpllh$D$Q = 0.3:0.3:0.3,
       tphhl$D$Q = 0.34:0.34:0.34,
       tpllh$CLK$Q = 0.25:0.25:0.25,
       tplhl$CLK$Q = 0.34:0.34:0.34,
       tminpwh$CLK = 0.079:0.21:0.34,
       tsetup_negedge$D$CLK = 0.28:0.28:0.28,
       thold_negedge$D$CLK = -0.094:-0.094:-0.094,
       tsetup_posedge$D$CLK = 0.28:0.28:0.28,
       thold_posedge$D$CLK = -0.094:-0.094:-0.094;

     // path delays
     (CLK *> Q) = (tpllh$CLK$Q, tplhl$CLK$Q);
     (D *> Q) = (tpllh$D$Q, tphhl$D$Q);
     $setup(negedge D, negedge CLK, tsetup_negedge$D$CLK, NOTIFIER);
     $hold (negedge D, negedge CLK, thold_negedge$D$CLK,  NOTIFIER);
     $setup(posedge D, negedge CLK, tsetup_posedge$D$CLK, NOTIFIER);
     $hold (posedge D, negedge CLK, thold_posedge$D$CLK,  NOTIFIER);
     $width(posedge CLK, tminpwh$CLK, 0, NOTIFIER);

   endspecify

endmodule

`endcelldefine
