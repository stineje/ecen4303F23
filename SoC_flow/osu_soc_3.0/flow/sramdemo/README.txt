Silicon Ensemble flow with IIT library and a macro block
--------------------------------------------------------

There are 3 major steps
I) Macro block creation
II) Synthesis
III) Place&Route
IV) Import into Magic

================================================================================

I) Macro block creation
This document will assume that the block is called "sram".
The following files have to be created:
	- sram.mag (for Magic)
	- sram.lib (for PKS)
	- sram.lef (for Silicon Ensemble)
	- sram.stub.v (for Silicon Ensemble)

I.1) Magic Layout
	- Only use Metal1 and Metal2, no Metal3
	- Draw all external pins in Metal3 of size 6x6
	- The origin MUST be at the lower left edge
          (To see the origin, hit "g" and look for the
           small black box. Then select the entire design
           and move it until the lower left corner of the 
           selection box is at the origin.)
	- Draw a 6x6 label in Metal3 on each pin

I.2) Timing file (.lib)
	- Specifies the timing of the cell
	- Propagation delay, hold and setup constraints
	- All numbers are a pure guess
	- The included file is good for any 8-bit SRAM
	- No modification should be necessary

I.3) LEF file
	- There are comments in the LEF file on where to make changes
	- Run "./mag2lef sram.mag" to get the pin block
	- mag2lef will write a pin for each Metal3 pin in the .mag file
	- mag2lef will ONLY work if the origin is at the lower left
	- Also adjust the SIZE and OBS blocks

I.4) Verilog Stub file
	- This is for Silicon Ensemble only
	- It uses it to see which pins are inputs and outputs
	- Contains an empty verilog module wrapper
	- Only define the inputs and outputs

I.5) Verification of LIB and LEF files
	- Recommended to read the LIB and LEF files into PKS
          to check against syntax errors. Type:
	  	cd sram
	  	pks_shell
	  	read_lef /import/cad2/iit_stdcells/lib/ami05/lib/iit05_stdcells.lef 
	  	read_lef_update sram.lef
	  	read_dotlib sram.lib 
	  	exit
	- If there are no Error messages from PKS, then the files are good

================================================================================

II) Synthesis

This is done as usual with PKS and "compile_bgx.scr".

In "compile_bgx.scr" there is one additional line, 
which reads in "sram.lib". Make sure the file and path is correct.
Also make all other modifications as usual.

Then simply run
pks_shell -f compile_bgx.scr

Note that area and power are invalid because the SRAM is modeled as
zero power and zero area. Also note that the SRAM has a fake delay 
of 2ns. Therefore, the timing report is not really true either.


================================================================================

III) Place and Route

This is done as usual, using Silicon Ensemble.

There are 2 scripts: "seultra.scr" and "block.scr".

"seultra.scr" is only there so "iitcells_se2magic" can gather its data. This
script will not actually be run. Just open it and plug in your design name
as usual. 

The script that is actually run is called "block.scr". It is an extension of
the original script, with some additional commands for floorplanning etc.

There are several lines marked with "CHANGE", change them according to your design.

Since this involves some floorplanning we will run Silicon Ensemble in GUI mode
so we can see what is going on and if we like the block placement:

The flow is then:
	- edit "seultra.scr" as usual
	- edit "block.scr" to match
	- run Silicon Ensemble: "se_shell_gui -f block.scr"
	- the script will run and then finish
	- roll back the log window and see if there were violations reported
	  by "verifyGeometry" and "verifyConnectivity"
	- look at the design and see if it looks okay
	- do "File -> Exit"


================================================================================

VI) Import into Magic

This is fairly messy because it is not used to seeing a block. But just
ignore all messages and see what you get in the end, it may still be useful.

Assuming that "seultra.scr" has been correctly modified, run 
	iitcells_se2magic
to create a Magic layout and a Sue schematic. Note that the schematic is no
good because we didn't draw a schematic for the macro block. There will be
a "divide by zero" error and some "cell not found" errors. Those are okay.

Now, go into the Magic folder and copy the actual .mag layout of the block:
	cd magic
	cp ../../sram/sram.mag

This will overwrite the blank "sram.mag" that was created during import

Then open the layout in Magic and run a DRC check. You should see that
Metal3 was routed on top of the block, because it was not blocked off in 
the LEF file. However, there should be no Metal1 and Metal2 routing over
the block. Also make sure that all pins are neatly connected.


------------------
Johannes Grad, IIT
