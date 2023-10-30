Process typical{
	voltage = 5.0;
	temp = 25;
	Corner = "";
	Vtn = 0.65;
	Vtp = 0.95;
};

Signal std_cell {
	unit = REL;
	Vh=1.0 1.0;
	Vl=0.0 0.0;
	Vth=0.5 0.5;
	Vsh=0.8 0.8;
	Vsl=0.2 0.2;
	tsmax=2.0n;
};

Signal VDD5.0V {
	unit = ABS;
	Vh=5.0 5.0;
	Vl=0.0 0.0;
	Vth=2.5 2.5;
	Vsh=2.0 2.0;
	Vsl=0.5 0.5;
	tsmax=2.0n;
};
	
Simulation std_cell{
	transient = 0.1n 80n 10p;
	dc = 0.1 4.5 0.1;
	bisec = 6.0n 6.0n 100p;
	resistance = 10MEG;
};

Index X1{
	Slew = 0.100n 0.30n 0.7n 1.0n 2.0n;
	Load = 0.025p 0.05p 0.1p 0.3p 0.6p;
};

Index X2{
	Slew = 0.100n 0.30n 0.7n 1.0n 2.0n;
	Load = 0.050p 0.10p 0.2p 0.6p 1.2p;
};

Index X4{
	Slew = 0.100n 0.30n 0.7n 1.0n 2.0n;
	Load = 0.1p 0.2p 0.4p 1.2p 2.4p;
};

Index X8{
	Slew = 0.100n 0.30n 0.7n 1.0n 2.0n;
	Load = 0.2p 0.4p 0.8p 2.4p 4.8p;
};

Index Clk_Slew{
	bslew = 0.100n 0.5n 1.0n;
};

Index IO5x5{
	Slew = 0.1n 0.3n 0.6n 1.3n 3.0n;
	Load = 5p 10p 20p 50p 75p;
};

Group POWR{
	PIN = *.Vdd *.Vdd2;
};

Group Core_Pins{
	PIN = *.DO *.DI ;
};

Group Pad_Pins{
	PIN = *.YPAD ;
};

Group X1{
	CELL = *X1 ;
};

Group X2{
	CELL = *X2 ;
};

Group X4{
	CELL = *X4 ;
};

Group X8{
	CELL = *X8 ;
};

Group Clk_Slew{
	PIN = *.CLK ;
};

Margin m0 {
	setup 	= 1.0 0.0 ;
	hold 	= 1.0 0.0 ;
	release = 1.0 0.0 ;
	removal = 1.0 0.0 ;
	recovery = 1.0 0.0 ;
	width	= 1.0 0.0 ;
	delay 	= 1.0 0.0 ;
	power 	= 1.0 0.0 ;
	cap 	= 1.0 0.0 ;
} ;

Nominal n0 {
	delay = 0.5 0.5 ;
	power = 0.5 0.5 ;
	cap   = 0.5 0.5 ;
} ;

set process(typical){
	simulation = std_cell;
	signal = std_cell;
	margin = m0;
	nominal = n0;
};

set index(typical){
	Group(X1) = X1;
	Group(X2) = X2;
	Group(X4) = X4;
	Group(X8) = X8;
	Group(Pad_Pins)  = IO5x5;
	Group(Core_Pins) = X4;
	Group(Clk_Slew)  = Clk_Slew;
};

set signal(typical){
	Group(POWR) = VDD5.0V;
};
