module proj (input logic clk, en,
	     input logic [7:0] a, b, 
	     output logic [7:0] Z);
   
   logic [7:0] val;   

   adder #(8) p1(a, b, val);
   flopen #(8) p2(clk, en, val, Z);

endmodule // proj


   