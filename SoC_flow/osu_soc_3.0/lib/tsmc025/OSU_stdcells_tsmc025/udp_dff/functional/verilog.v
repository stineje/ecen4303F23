// Created by ihdl
primitive udp_dff (out, in, clk, clr, set, NOTIFIER);
   output out;
   input  in, clk, clr, set, NOTIFIER;
   reg    out;

   table

// in  clk  clr   set  NOT  : Qt : Qt+1
//
   0  r   ?   0   ?   : ?  :  0  ; // clock in 0
   1  r   0   ?   ?   : ?  :  1  ; // clock in 1
   1  *   0   ?   ?   : 1  :  1  ; // reduce pessimism
   0  *   ?   0   ?   : 0  :  0  ; // reduce pessimism
   ?  f   ?   ?   ?   : ?  :  -  ; // no changes on negedge clk
   *  b   ?   ?   ?   : ?  :  -  ; // no changes when in switches
   ?  ?   ?   1   ?   : ?  :  1  ; // set output
   ?  b   0   *   ?   : 1  :  1  ; // cover all transistions on set
   1  x   0   *   ?   : 1  :  1  ; // cover all transistions on set
   ?  ?   1   0   ?   : ?  :  0  ; // reset output
   ?  b   *   0   ?   : 0  :  0  ; // cover all transistions on clr
   0  x   *   0   ?   : 0  :  0  ; // cover all transistions on clr
   ?  ?   ?   ?   *   : ?  :  x  ; // any notifier changed

   endtable
endprimitive // udp_dff
