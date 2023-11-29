`timescale 1ns/1ps
module stimulus;

   logic [7:0] a;
   logic [7:0] b;   
   logic       reset;
   logic       en;  
   logic [7:0] z;
 
   logic 	clk;
   logic [31:0] errors;
   logic [31:0] vectornum;      
   
   integer 	 handle3;
   integer 	 i;  
   integer       j;
   integer 	 y_integer;   
   integer 	 sum; 

   top dut (a, b, clk, en, reset, z);

   // 1 ns clock
   initial 
     begin	
	clk = 1'b1;
	forever #5 clk = ~clk;
     end

   initial
     begin
	handle3 = $fopen("proj.out");
	vectornum = 0;
	errors = 0;		
     end

   initial
     begin
	#0  en = 1'b1;
	#0  a = 8'd42;
	#0  b = 8'hf;	
	#0  reset = 1'b1;
	#63 reset = 1'b0;
	
     end // initial begin   

endmodule // stimulus
