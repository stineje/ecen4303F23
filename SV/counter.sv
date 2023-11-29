module counter #(parameter WIDTH = 4)
   (clk, rst, count);
   
   input logic              clk;
   input logic 		    rst;
   output logic [WIDTH-1:0] count;
   
   always_ff @(posedge clk or negedge rst)
     begin
	if(rst)
	  count=0;
	else
	  count=count+1;
     end
   
endmodule

