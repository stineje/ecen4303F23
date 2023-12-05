Ad hoc Testing Routines to create Golden File

J. Stine
Oklahoma State University
12/1/23

C program can be manipulated to increase size of 
test.  Please make sure project.cmd passes.  If you
run create_test.sh it will create a new project.
cmd - just FYI.

Enjoy!

Note:  you may need to change project_template.cmd and/or
the C file to make sure your input/output signals match.  

Procedure:

1.) Change bit_test.c to modify loops in bit_test.c (L56)
2.) Run ./create_test.sh to compile and generate new project.cmd
3.) irsim sky130A_tt_nom_27.prm project.sim -project.cmd
4.) Any errors will be displayed in IRSIM output

What does this program do?

It runs bit_test.c and creates vectors with "known" outputs to match
against the project for validation.  The create_test.sh script will
compile the program, run it, and place its output at the bottom of
project.cmd.  The top part of project.cmd will be project_template.cmd
- again, make sure you modify this file to make sure your input/output
names match.

