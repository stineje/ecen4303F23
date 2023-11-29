module top (input logic [7:0] A, B,
	    input logic clk, en, reset,
	    output logic [7:0] Z);

   logic [7:0] 		       acc;
   logic [7:0] 		       prod;   
   logic [2:0] 		       ctr;
   logic [7:0] 		       Ainput;
   logic [7:0] 		       Binput;
   logic [7:0] 		       temp_shift;   
   logic [7:0] 		       temp;   

   // mux inputs
   assign Ainput = reset ? 8'h0 : A;
   assign Binput = reset ? B : temp;   
   
   assign temp_shift = Binput << 1;
   assign prod = temp_shift[ctr] ? temp_shift : 8'h0;
   proj ecen4303F23 (clk, en, Ainput, prod, temp);
   counter #(3) cnt (clk, reset, ctr);
   assign Z = temp;   

endmodule // top
