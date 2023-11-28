`timescale 1ns/1ps
module stimulus;

   logic [7:0] a;   
   logic [7:0] b;   
   logic [7:0] z;
   logic       en;   

   logic [31:0] z_correct;
   
   logic 	clk;
   logic [31:0] errors;
   logic [31:0] vectornum;      
   
   integer 	 handle3;
   integer 	 i;  
   integer       j;
   integer 	 y_integer;   
   integer 	 sum; 

   proj dut (clk, en, a, b, z);

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
	for (j=0; j < 64; j=j+1)
	  begin
	     // Put vectors before beginning of clk
	     @(posedge clk)
	       begin
		  a = $random;
		  b = $random;
		  en = $random;		  
	       end
	     // Wait 2 cycles (to be sure)
	     repeat (4)
	       @(posedge clk);
	     @(negedge clk)
	       begin
		  z_correct = a+b;
		  vectornum = vectornum + 1;		       
		  if ((en == 1'b1) & (z_correct[7:0] != z))
		    begin
		       errors = errors + 1;
		       $display("%h %h %b || %h %h", 
				a, b, en, z, z_correct);
		    end		       
		  #0 $fdisplay(handle3, "%h %h %b || %h %h %b", 
			       a, b, en, z, z_correct, (z == z_correct));
	       end // @(negedge clk)		  
	  end // for (j=0; j < 4; j=j+1)
	$display("%d tests completed with %d errors", vectornum, errors);
	$finish;	
     end // initial begin   

endmodule // stimulus
