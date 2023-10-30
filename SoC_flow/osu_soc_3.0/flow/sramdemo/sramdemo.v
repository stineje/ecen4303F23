// A small 8-bit ALU with a Newton-Raphson Divider
//
// Johannes Grad, IIT
//

//--------------------------------------------------
// 8x8 2's complement multiplier

module fa(sum,cout,a,b,cin);
output sum;
output cout;
input a;
input b;
input cin;

assign sum=a^b^cin;
assign cout=a&b|cin&(a|b);
endmodule

module adder7(cout,z,a,b,cin);
output [6:0] z;
output [6:0] cout;
input  [6:0] a,b;
input  [6:0] cin;

fa a0(z[0],cout[0],a[0],b[0],cin[0]);
fa a1(z[1],cout[1],a[1],b[1],cin[1]);
fa a2(z[2],cout[2],a[2],b[2],cin[2]);
fa a3(z[3],cout[3],a[3],b[3],cin[3]);
fa a4(z[4],cout[4],a[4],b[4],cin[4]);
fa a5(z[5],cout[5],a[5],b[5],cin[5]);
fa a6(z[6],cout[6],a[6],b[6],cin[6]);
endmodule

module cpa(cout,z,a,b,cin);
output [6:0] z;
output cout;
input  [6:0] a,b;
input  cin;
wire [6:0] c;

fa a0(z[0],c[1],a[0],b[0],cin);
fa a1(z[1],c[2],a[1],b[1],c[1]);
fa a2(z[2],c[3],a[2],b[2],c[2]);
fa a3(z[3],c[4],a[3],b[3],c[3]);
fa a4(z[4],c[5],a[4],b[4],c[4]);
fa a5(z[5],c[6],a[5],b[5],c[5]);
fa a6(z[6],cout,a[6],b[6],c[6]);
endmodule

module mult(p,a,b);
output [15:0] p;
input [7:0] a,b;

wire [7:0] pp0,pp1,pp2,pp3,pp4,pp5,pp6,pp7,pp8;
wire [6:1] s1,s2,s3,s4,s5,s6,s7;
wire [6:0] c1,c2,c3,c4,c5,c6,c7;
wire cout;

assign pp0={!(b[0]&a[7]),{7{b[0]}}&{a[6],a[5],a[4],a[3],a[2],a[1],a[0]}};
assign pp1={!(b[1]&a[7]),{7{b[1]}}&{a[6],a[5],a[4],a[3],a[2],a[1],a[0]}};
assign pp2={!(b[2]&a[7]),{7{b[2]}}&{a[6],a[5],a[4],a[3],a[2],a[1],a[0]}};
assign pp3={!(b[3]&a[7]),{7{b[3]}}&{a[6],a[5],a[4],a[3],a[2],a[1],a[0]}};
assign pp4={!(b[4]&a[7]),{7{b[4]}}&{a[6],a[5],a[4],a[3],a[2],a[1],a[0]}};
assign pp5={!(b[5]&a[7]),{7{b[5]}}&{a[6],a[5],a[4],a[3],a[2],a[1],a[0]}};
assign pp6={!(b[6]&a[7]),{7{b[6]}}&{a[6],a[5],a[4],a[3],a[2],a[1],a[0]}};
assign pp7={b[7]&a[7],{7{!b[7]}}|{!a[6],!a[5],!a[4],!a[3],!a[2],!a[1],!a[0]}};

assign p[0]=pp0[0];
adder7 a1(c1,{s1,p[1]},pp0[7:1],pp1[6:0],7'b0);
adder7 a2(c2,{s2,p[2]},pp2[6:0],c1,{pp1[7],s1[6:1]});
adder7 a3(c3,{s3,p[3]},pp3[6:0],c2,{pp2[7],s2[6:1]});
adder7 a4(c4,{s4,p[4]},pp4[6:0],c3,{pp3[7],s3[6:1]});
adder7 a5(c5,{s5,p[5]},pp5[6:0],c4,{pp4[7],s4[6:1]});
adder7 a6(c6,{s6,p[6]},pp6[6:0],c5,{pp5[7],s5[6:1]});
adder7 a7(c7,{s7,p[7]},pp7[6:0],c6,{pp6[7],s6[6:1]});
cpa    a8(cout,p[14:8],c7,{pp7[7],s7[6:1]},1'b1);
assign p[15]=!cout;

endmodule

//
// End 2's complement multiplier
//
//----------------------------------------------------------------
//
// Begin Modified Newton Raphson Division
//

module cpa8(z,a,b,cin);
output [7:0] z;
input  [7:0] a,b;
input cin;
wire [8:0] c;

fa a0(z[0],c[1],a[0],b[0],cin);
fa a1(z[1],c[2],a[1],b[1],c[1]);
fa a2(z[2],c[3],a[2],b[2],c[2]);
fa a3(z[3],c[4],a[3],b[3],c[3]);
fa a4(z[4],c[5],a[4],b[4],c[4]);
fa a5(z[5],c[6],a[5],b[5],c[5]);
fa a6(z[6],c[7],a[6],b[6],c[6]);
fa a7(z[7],c[8],a[7],b[7],c[7]);
endmodule


module register8(q, in, clk, enable,reset);
input [7:0] in;
input clk,enable,reset;
output [7:0] q;
reg [7:0] q;

     always @(posedge clk or posedge reset)
	begin
	   if (reset) q<=0; else if (enable) q<=in; else q<=q;
	end
endmodule


module iapp(z,s);
input s;
output [7:0] z;

assign z=s?8'b11010000:8'b00110000;
endmodule


module mux21(out,inL,inH,sel);
input [7:0] inH,inL;
input sel;
output [7:0] out;

assign out=sel?inH:inL;
endmodule


module rounding(out,in);
input [15:0] in;
output [7:0] out;
wire lsb, ulp;

assign lsb=in[6]|(in[5]&in[4]);
assign ulp=in[6]&in[5];
cpa8 addulp(out,{in[13:7],lsb},8'b0,ulp);
endmodule


module two_minus(out, in);
input [7:0] in;
output [7:0] out;

cpa8 addulp(out, {in[7],~in[6:0]}, 8'b0, 1'b1);
endmodule


module nrdiv(round_out, enum, denom, s1, s2, s3, s4, clk,reset);
input [7:0] denom, enum;
input s1, s2, s3, s4, clk,reset;
output [7:0] round_out;

wire [15:0] mult_out;
wire [7:0] iapp,mux1,mux2,mux3,mux4,round_out,two_minus_out,regA,regB;

iapp iapprox(iapp,denom[7]);
mux21 mux21_1(mux1,enum,denom,s1);
mux21 mux21_2(mux2,regA,mux4,s2);
mux21 mux21_3(mux3,mux1,regB,s3);
mux21 mux21_4(mux4,iapp,denom,s4);

mult multiplier(mult_out, mux2, mux3);
rounding rounder(round_out, mult_out);

two_minus twominus(two_minus_out, round_out);

register8 regiA(regA, round_out, clk, s3,reset);
register8 regiB(regB, two_minus_out, clk, 1'b1,reset);

endmodule

//
// End Newton Raphson
//
//----------------------------------------------------------------
//
// Begin ALU
//

`define ADD   3'd0
`define SUB   3'd1
`define AND   3'd2
`define OR    3'd3
`define LOAD  3'd4
`define DIV   3'd5
`define MUL   3'd6
`define NOT   3'd7

//
// State Machine
//

module control(CURRENT,acc_load,error,s1,s2,s3,s4,mux_sel,aoi_sel,addsub_sel,opcode,reset,clk);
input clk;
input reset;
input [2:0] opcode;
output acc_load, error, addsub_sel;
reg acc_load, error, addsub_sel;
output [1:0] mux_sel, aoi_sel;
reg [1:0] mux_sel, aoi_sel;
output s1,s2,s3,s4;
reg s1,s2,s3,s4;
output [3:0] CURRENT;

reg [3:0] CURRENT, NEXT;

`define Ssingle 4'd0
`define Sdiv2  4'd1
`define Sdiv3  4'd2
`define Sdiv4	4'd3
`define Sdiv5	4'd4
`define Sdiv6	4'd5
`define Sdiv7  4'd6
`define Sdiv8  4'd7
`define Sdiv9	4'd8


always @(posedge clk or posedge reset)
begin
if (reset==1'b1) CURRENT<=`Ssingle;
else CURRENT<=NEXT;
end

always @(CURRENT or opcode)
begin
case(CURRENT)
	`Ssingle:begin
		if(opcode==`ADD) begin
				NEXT<=`Ssingle;
				acc_load<=1;
				mux_sel<=2'd3;
				aoi_sel<=0;
				addsub_sel<=0;
				error<=0;
				s1<=0;
				s2<=0;
				s3<=0;
				s4<=0;
		end else if(opcode==`SUB) begin
				NEXT<=`Ssingle;
				acc_load<=1;
				mux_sel<=2'd3;
				aoi_sel<=0;
				addsub_sel<=1;
				error<=0;
				s1<=0;
				s2<=0;
				s3<=0;
				s4<=0;
		end else if(opcode==`AND) begin
				NEXT<=`Ssingle;
				acc_load<=1;
				mux_sel<=2'd2;
				aoi_sel<=2'd0;
				addsub_sel<=0;
				error<=0;
				s1<=0;
				s2<=0;
				s3<=0;
				s4<=0;
		end else if(opcode==`OR) begin
				NEXT<=`Ssingle;
				acc_load<=1;
				mux_sel<=2'd2;
				aoi_sel<=2'd1;
				addsub_sel<=0;
				error<=0;
				s1<=0;
				s2<=0;
				s3<=0;
				s4<=0;
		end else if(opcode==`LOAD) begin
				NEXT<=`Ssingle;
				acc_load<=1;
				mux_sel<=2'd0;
				aoi_sel<=0;
				addsub_sel<=0;
				error<=0;
				s1<=0;
				s2<=0;
				s3<=0;
				s4<=0;
		end else if(opcode==`DIV) begin
				NEXT<=`Sdiv2;
				acc_load<=0;
				mux_sel<=2'd1;
				aoi_sel<=0;
				addsub_sel<=0;
				error<=0;
				s1<=1;
				s2<=1;
				s3<=0;
				s4<=0;
		end else if(opcode==`MUL) begin
				NEXT<=`Ssingle;
				acc_load<=1;
				mux_sel<=2'd1;
				aoi_sel<=0;
				addsub_sel<=0;
				error<=0;
				s1<=0;
				s2<=1;
				s3<=0;
				s4<=1;
		end else if(opcode==`NOT) begin
				NEXT<=`Ssingle;
				acc_load<=1;
				mux_sel<=2'd2;
				aoi_sel<=2'd2;
				addsub_sel<=0;
				error<=0;
				s1<=0;
				s2<=0;
				s3<=0;
				s4<=0;
		end else begin
				NEXT<=`Ssingle;
				acc_load<=0;
				mux_sel<=2'd1;
				aoi_sel<=0;
				addsub_sel<=0;
				error<=1;
				s1<=0;
				s2<=0;
				s3<=0;
				s4<=0;
		end
		end

	`Sdiv2:  begin
			NEXT<=`Sdiv3;
			acc_load<=0;
			mux_sel<=2'd1;
			aoi_sel<=0;	
			addsub_sel<=0;
			error<=0;
			s1<=1;
			s2<=1;	
			s3<=1;
			s4<=0;

		end
	`Sdiv3:  begin
			NEXT<=`Sdiv4;
			acc_load<=0;
			mux_sel<=2'd1;
			aoi_sel<=0;	
			addsub_sel<=0;
			error<=0;
			s1<=1;
			s2<=0;	
			s3<=0;
			s4<=0;

		end
	`Sdiv4:  begin
			NEXT<=`Sdiv5;
			acc_load<=0;
			mux_sel<=2'd1;
			aoi_sel<=0;	
			addsub_sel<=0;
			error<=0;
			s1<=1;
			s2<=0;	
			s3<=1;
			s4<=0;

		end
	`Sdiv5:  begin
			NEXT<=`Sdiv6;
			acc_load<=0;
			mux_sel<=2'd1;
			aoi_sel<=0;	
			addsub_sel<=0;
			error<=0;
			s1<=1;
			s2<=0;	
			s3<=0;
			s4<=0;

		end
	`Sdiv6:  begin
			NEXT<=`Sdiv7;
			acc_load<=0;
			mux_sel<=2'd1;
			aoi_sel<=0;	
			addsub_sel<=0;
			error<=0;
			s1<=1;
			s2<=0;	
			s3<=1;
			s4<=0;

		end
	`Sdiv7:  begin
			NEXT<=`Sdiv8;
			acc_load<=0;
			mux_sel<=2'd1;
			aoi_sel<=0;	
			addsub_sel<=0;
			error<=0;
			s1<=1;
			s2<=0;	
			s3<=0;
			s4<=0;

		end
	`Sdiv8:  begin
			NEXT<=`Sdiv9;
			acc_load<=0;
			mux_sel<=2'd1;
			aoi_sel<=0;	
			addsub_sel<=0;
			error<=0;
			s1<=1;
			s2<=0;	
			s3<=1;
			s4<=0;

		end
	`Sdiv9:  begin
			NEXT<=`Ssingle;
			acc_load<=1;
			mux_sel<=2'd1;
			aoi_sel<=0;	
			addsub_sel<=0;
			error<=0;
			s1<=0;
			s2<=0;	
			s3<=0;
			s4<=0;

		end
	default: begin
			NEXT<=`Ssingle;
			acc_load<=0;
			mux_sel<=2'd1;
			aoi_sel<=0;	
			addsub_sel<=0;
			error<=1;
			s1<=0;
			s2<=0;	
			s3<=0;
			s4<=0;
		end
endcase
end
endmodule

//
// Result MUX
//

module mux41(out, in0, in1, in2, in3, sel);
input [7:0] in0,in1,in2,in3;
input [1:0] sel;
output [7:0] out;
assign out=sel[1]?(sel[0]?in3:in2):(sel[0]?in1:in0);
endmodule


module add_sub(z,a,b,sub);
input  [7:0] a,b;
input  sub;
output [7:0] z;
cpa8 a1(z,a,sub?~b:b,sub);
endmodule


module aoi(out,op1,op2,sel);
input [7:0] op1,op2;
input [1:0] sel;
output [7:0] out;
assign out=sel[1]?(~op1):(sel[0]?(op1|op2):(op1&op2));
endmodule


//
// Top level Module
//
// Instantiates ADD/SUB unit, NR-Div unit, FSM
//


module sramdemo(current,acc,error,acc_load,s1,s2,s3,s4,in,opcode,reset,clk,ram_q);
input [7:0] in;
input clk,reset;
input [2:0] opcode;
output [7:0] acc, ram_q;
output [3:0] current;
output error,acc_load,s4,s3,s2,s1;
wire [7:0] mux_out, add_out, div_out, aoi_out;
wire [1:0] aoi_sel, mux_sel;
wire addsub_sel;

	nrdiv   block_divider(div_out, acc, in, s1, s2, s3, s4, clk,reset);
	aoi     block_aoi    (aoi_out,acc,in,aoi_sel);
	add_sub block_addsub (add_out,acc,in,(opcode==`SUB));
	control block_control(current,acc_load,error,s1,s2,s3,s4,mux_sel,aoi_sel,addsub_sel,opcode,reset,clk);

	mux41   block_accmux (mux_out, in, div_out, aoi_out, add_out, mux_sel);

	register8 block_acc  (acc, mux_out, clk, acc_load,reset);

	// Now: Instantiate the SRAM
	sram	my_sram(.A(in),.D(acc),.Q(ram_q),.w(acc_load),.e(clk));

endmodule

