// Created by ihdl
primitive udp_tlat (out, in, enable, clr, set, NOTIFIER);

   output out;
   input  in, enable, clr, set, NOTIFIER;
   reg    out;

   table

// in  enable  clr   set  NOT  : Qt : Qt+1
//
   1  1   0   ?   ?   : ?  :  1  ; //
   0  1   ?   0   ?   : ?  :  0  ; //
   1  *   0   ?   ?   : 1  :  1  ; // reduce pessimism
   0  *   ?   0   ?   : 0  :  0  ; // reduce pessimism
   *  0   ?   ?   ?   : ?  :  -  ; // no changes when in switches
   ?  ?   ?   1   ?   : ?  :  1  ; // set output
   ?  0   0   *   ?   : 1  :  1  ; // cover all transistions on set
   1  ?   0   *   ?   : 1  :  1  ; // cover all transistions on set
   ?  ?   1   0   ?   : ?  :  0  ; // reset output
   ?  0   *   0   ?   : 0  :  0  ; // cover all transistions on clr
   0  ?   *   0   ?   : 0  :  0  ; // cover all transistions on clr
   ?  ?   ?   ?   *   : ?  :  x  ; // any notifier changed

   endtable
endprimitive // udp_tlat
