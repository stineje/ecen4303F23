#! /usr/local/bin/perl

####################################################################
# 
# Title:    ext4mag018.pl
# Author:   James Stine
# Created:  2/27/2000
# Revision:
#
# Takes a magic file and extracts it and creates a sim file.
# 
####################################################################

# check for correct number of arguments
if( $#ARGV != 0) 
{    
    print("Usage: ext4mag.pl file\n");
    print("       Extracts and Creates a sim file for a magic file\n");
    print("       File can be only .mag format.\n"); 
    exit(1);
}

# Set variables needed.
$MAGIC = "magic";
$EXT2SIM = "ext2sim";
$EXT2SPICE = "ext2spice";
$GEMINI = "gemini";

$file = $ARGV[0];

if (! -e $file) {
	print "$file does not exist\n";
	exit(2);
}

# check for correct file format
if ($file =~ /(.+)(\.mag)/) 
{ 
    $filename = $1;
    $filenamenoRC = $1 . "_noRC";
    print("Checking $filename.mag\n");
    &doExt($filename);
}
else 
{
    print("The file that you have specified ($file) does not\n");
    print("have a .mag extension. The script only accepts\n");
    print("magic files in this formats.\n");
    exit(1);
}

################
# Sub-Routines #
################

# processing for .mag input file
sub doExt
{
    print("Now extracting the file in Magic.  Check MAGIC.LOG for output from Magic.\n");
    print("This script is for SCN6M_SUBM.10 TSMC018\n");
    $printname = $filename . "_color.ps";
    system("rm *.ext");
    open (MAGIC, "|$MAGIC -dNULL $filename 1> MAGIC.LOG 2>&1 ") ;
    print MAGIC ":drc off\n";
    print MAGIC ":extract all\n";
    print MAGIC ":cif\n";
    print MAGIC ":calma nolabel\n";
    print MAGIC ":calma\n";
    print MAGIC ":quit\n";
    print MAGIC "yes\n";
    close(MAGIC);
    print ("Now creating spice, cif and sim files\n");
    system("ext2sim -y 6 $filename.ext 1> /dev/null 2>&1");
    system("ext2sim -y 6 -R -C -o $filenamenoRC.sim $filename.ext 1>\ /dev/null 2>&1");
    system("ext2spice -F -y 6 -f spice3 $filename.ext 1> /dev/null 2\>&1");
    printf ("Now making spice file for you.  It will be called %s", $filename);
    print (".sp\n");
    system("spiceit018 $filename");

}





