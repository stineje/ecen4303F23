#!/bin/sh

gcc -o bit_test bit_test.c -lm
/bin/cp -f project_template.cmd project.cmd
bit_test > temp.out
/bin/cat temp.out >> project.cmd
/bin/rm -f temp.out
