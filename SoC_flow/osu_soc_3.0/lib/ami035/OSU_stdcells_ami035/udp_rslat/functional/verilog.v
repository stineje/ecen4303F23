// Created by ihdl
primitive udp_rslat (out, clr, set, NOTIFIER);

   output out;
   input  clr, set, NOTIFIER;
   reg    out;

   table

// clr   set  NOT  : Qt : Qt+1
//
   ?   1   ?   : ?  :  1  ; // set output
   0   *   ?   : 1  :  1  ; // cover all transistions on set
   1   0   ?   : ?  :  0  ; // reset output
   *   0   ?   : 0  :  0  ; // cover all transistions on clr
   ?   ?   *   : ?  :  x  ; // any notifier changed

   endtable
endprimitive // udp_tlat
