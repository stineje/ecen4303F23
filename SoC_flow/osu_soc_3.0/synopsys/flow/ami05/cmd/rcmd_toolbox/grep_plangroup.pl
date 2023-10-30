#!/usr/local/bin/perl

# Version 5/4/2006 

$debug = 0;
$input_file = @ARGV[0];
$output_file = ".module_file";

	print "*RCMD-INFO: Running module_list conversion from user provided plan group file.\n";
	$source_file = $input_file;
	open (source,$source_file) || die "Can't open $source_file\n";
	&parse;
	&genmodulelist;

# ==============================
# 	parse
# ==============================
sub parse {
	while (<source>) {
	   if (/dbSetPlanGroupAndStatus/) {
	        chomp;
	        @line = split (/[\t \(\)]+/, $_);

	        $va_name = $line[2];
	        $x1{$va_name} = $line[12]; 
	        $y1{$va_name} = $line[13]; 
	        $x2{$va_name} = $line[14]; 
	        $y2{$va_name} = $line[15]; 

if ($debug == 1) {
print "$va_name\n";
print "$x1{$va_name}\n";
print "$y1{$va_name}\n";
print "$x2{$va_name}\n";
print "$y2{$va_name}\n";}

		push (@va_name,$va_name);
		push (@x1,$x1{$va_name});
		push (@y1,$y1{$va_name});
		push (@x2,$x2{$va_name});
		push (@y2,$y2{$va_name});

if ($debug == 1) {
print "@va_name\n";
print "@x1\n";
print "@y1\n";
print "@x2\n";
print "@y2\n";}

	   }
	}
}

sub genmodulelist {
	open (output,">$output_file") || die "Can't open $output_file\n" ;

	print output "define module_list \'\(\n";

	foreach $va_name (@va_name) {
	print output "$va_name\n";
	}

	print output "\)\n";

}
