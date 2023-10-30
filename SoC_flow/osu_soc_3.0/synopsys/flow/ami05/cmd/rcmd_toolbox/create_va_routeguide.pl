#!/usr/local/bin/perl

# Version 5/4/2006 

$debug = 0;
$input_file = "report/dump.plangroup";
$output_file = ".pns.routeguide";
$mode = @ARGV[0];
$old_source_file = @ARGV[1];

	print "*RCMD-INFO: Running plan group conversion to route guide.\n";
	$source_file = $input_file;
	open (source,$source_file) || die "Can't open $source_file\n";
	&parse;
	&genvafile;

# ==============================
# 	parse
# ==============================
sub parse {
	while (<source>) {
	   if (/dbSetPlanGroupAndStatus/) {
	        chomp;
	        @line = split (/[\t \(\)]+/, $_);

	        $va_name = $line[2];
	        $x1{$va_name} = $line[10]; 
	        $y1{$va_name} = $line[11]; 
	        $x2{$va_name} = $line[12]; 
	        $y2{$va_name} = $line[13]; 

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

sub genvafile {
	open (output,">$output_file") || die "Can't open $output_file\n" ;

	print output ";********************\n";
	print output ";*   Route Guides   *\n";
	print output ";********************\n";
	print output "define _cell \(geGetEditCell\)\n";

	foreach $va_name (@va_name) {
	print output "axCreateRouteGuide _cell \'\(@x1{$va_name} @y1{$va_name}) \'\(@x2{$va_name} @y2{$va_name}\) \'\( 0 0 0 8190 0\)\n";
	}
}
