#!/usr/local/bin/perl

# Version 06/21/06

# Updated: split (/[\t ]+/, $line1) changed to split (/\t| +/, $line1) to resolve issues with certain IA.32 machines
# Fixed: $push_default for default mode
# Enhanced: parse: $inrun and gentable: [$runnum -1] -> {$runnum} 
# Fixed: array value of second explore runs pushed one column by default run result
# Fixed: individual log files not correct for the first explore runs in incremental mode
# Added log and report options
# Added mode and old_source_file to gen_explore_table.pl arguments

$debug = 0;
$log = "log";
$report = "report";
$mode = @ARGV[0];
$old_source_file = @ARGV[1];

if ($mode eq "incremental") {
	print "*RCMD-INFO: Running HTML generation incremental mode.\n";
	$source_file = $old_source_file;
	open (source,$source_file) || die "Can't open $source_file\n";
	$push_default = 0;
	&parse;
	&redirect;

	$source_file = "$log/initial_place.log";
	open (source,$source_file) || die "Can't open $source_file\n";
	$push_default = 1;
	&parse;
	&redirect;

	&gentable;
	&define_cell_list;
}
else { 
	print "*RCMD-INFO: Running HTML generation default mode.\n";
	$source_file = "$log/initial_place.log";
	open (source,$source_file) || die "Can't open $source_file\n";
	$push_default = 1;
	&parse;
	&redirect;
	&gentable;
	&define_cell_list;}

# ==============================
# 	parse
# ==============================
sub parse {
	#$source_file = "$log/initial_place.log";
	#open (source,$source_file) || die "Can't open $source_file\n";
	while (<source>) {
	   if (/Starting Default Virtual Flat Placement/) {
		while (<source>) {
	   		if (/phase[0-9]. Both Dirs/) {
	   		     chomp;
	   		     @line = split (/[\t \(\)]+/, $_);
	   		     $default_overflow_total = $line[5]; 
	   		     $default_overflow_max = $line[8]; 
	   		     $default_overflow_percentage = $line[12]; 
	   		} #if

	   		if (/phase[0-9]. Total wire length/) {
	   		     chomp;
	   		     @line = split (/[\t ]+/, $_);
	   		     $default_wirelength = $line[5]; 
	   		} #if

	   		if (/ASTSUM:      Slack/) {
	   		     $line1 = <source>;
	   		     chomp;
	   		     @line = split (/\t| +/, $line1);
	   		     $default_wns = $line[1]; 
	   		     $default_setup_violation_number = $line[2]; 
	   		     $default_tns = $line[3]; 
	   		} #if

	   		if (/After  Virtual IPO/) {
	   		     chomp;
	   		     @line = split (/[\t ]+/, $_);
	   		     $default_vipo_wns = $line[4];
	   		     $default_vipo_tns = $line[5];
	   		} #if

			if (/End of Default Virtual Flat Placement/) {
				last;

			}
		}
	   }
		
	   if (/Starting explore mode/) {
		$inrun = 1;
		# Get $runnum		
		chomp;
		@line = split (/[\t ]+/, $_);		
		$runnum = $line[5]; 
		# Increase 1 line
		<source>;
		$line1 = <source>;
	
		# Gather value of field
		@line = split (/\t| +/, $line1);
		$objective{$runnum} = $line[4]; 
	   } #if
	
	if ($inrun == 1) {
	   if (/phase[0-9]. Both Dirs/) {
	        chomp;
	        @line = split (/[\t \(\)]+/, $_);
	        $overflow_total{$runnum} = $line[5]; 
	        $overflow_max{$runnum} = $line[8]; 
	        $overflow_percentage{$runnum} = $line[12]; 
	   } #if

	   if (/phase[0-9]. Total wire length/) {
	        chomp;
	        @line = split (/[\t ]+/, $_);
	        $wirelength{$runnum} = $line[5];
	   } #if

	   if (/ASTSUM:      Slack/) {
		$line1 = <source>;
	        chomp;
	        @line = split (/\t| +/, $line1);
	        $wns{$runnum} = $line[1]; 
	        $setup_violation_number{$runnum} = $line[2]; 
	        $tns{$runnum} = $line[3]; 
	   } #if

	   if (/After  Virtual IPO/) {
	        chomp;
	        @line = split (/[\t ]+/, $_);
	        $vipo_wns{$runnum} = $line[4];
	        $vipo_tns{$runnum} = $line[5];
	   } #if

	   if (/Save cell topvp_explore/) {
	        chomp;
	        @line = split (/[\t\. ]+/, $_);
		$cell{$runnum} = $line[2];
	   } #if			
	}
	   if (/End of explore mode/) {
		$inrun = 0;
		#$converthtml_source_file = "$report/VFP_explore_run${runnum}_$objective{$runnum}.rpt";
		#$converthtml_output_file = "$converthtml_source_file.html"; 
		#&converthtml;
		#$converthtml_source_file = "$report/VFP_explore_run${runnum}_$objective{$runnum}.sum";
		#$converthtml_output_file = "$converthtml_source_file.html"; 
		#&converthtml;

		push (@runnum,$runnum); #this is regular array, assocuative array is not array and can't be accessed outside while loop
		push (@objective,$objective{$runnum});
		push (@overflow_total,$overflow_total{$runnum});
		push (@overflow_max,$overflow_max{$runnum});
		push (@overflow_percentage,$overflow_percentage{$runnum});
		push (@wirelength,$wirelength{$runnum});
		push (@wns,$wns{$runnum});
		push (@setup_violation_number,$setup_violation_number{$runnum});
		push (@tns,$tns{$runnum});
		push (@vipo_wns,$vipo_wns{$runnum});
		push (@vipo_tns,$vipo_tns{$runnum});
		push (@cell,$cell{$runnum});
	   }

	} #End of while loop

	#push result of default run to the same array to sort
	#when $mode = incremental, this should be done after the results of current log file are pushed
	if ($push_default == 1) {
		push (@overflow_total,$default_overflow_total);
		push (@overflow_max,$default_overflow_max);
		push (@overflow_percentage,$default_overflow_percentage);
		push (@wirelength,$default_wirelength);
		push (@wns,$default_wns);
		push (@setup_violation_number,$default_setup_violation_number);
		push (@tns,$default_tns);
		push (@vipo_wns,$default_vipo_wns);
		push (@vipo_tns,$default_vipo_tns);
	
	#sort by value
		@overflow_totalsort = sort { $a <=> $b } @overflow_total; #sort by value instead of associative array because of bug
		@overflow_maxsort = sort { $a <=> $b } @overflow_max; #sort by value instead of associative array because of bug
		@overflow_percentagesort = sort { $a <=> $b } @overflow_percentage; #sort by value instead of associative array because of bug
		@wirelengthsort = sort { $a <=> $b } @wirelength;
		@wnssort = sort { $b <=> $a } @wns;
		@setup_violation_numbersort = sort { $a <=> $b } @setup_violation_number;
		@tnssort = sort { $b <=> $a }@tns;
		@vipo_wnssort = sort { $b <=> $a }@vipo_wns;
		@vipo_tnssort = sort { $b <=> $a }@vipo_tns;

	#sort by associative array
		#@overflow_totalsort = sort { $overflow_total{$b} <=> $overflow_total{$a} } keys %$overflow_total;
		#@overflow_maxsort = sort { $overflow_max{$b} <=> $overflow_max{$a} } keys %$overflow_max;
		#@overflow_percentagesort = sort { $overflow_percentage{$b} <=> $overflow_percentage{$a} } keys %$overflow_percentage;
		#@wirelengthsort = sort { $wirelength{$a} <=> $wirelength{$b} } keys %wirelength;
		#@wnssort = sort { $wns{$b} <=> $wns{$a} } keys %wns;
		#@setup_violation_numbersort = sort { $setup_violation_number{$a} <=> $setup_violation_number{$b} } keys %setup_violation_number;
		#@tnssort = sort { $tns{$b} <=> $tns{$a} } keys %tns;

	}

	if ($debug) {
		print "===== Start of Sorting Function Debug =====\n";
		print ("@runnum\n");
		print ("overflow_max\n");
		print ("@overflow_max\n");
		print ("@overflow_maxsort\n");
		print ("@overflow_maxsort[0]\n");
		print ("overflow_percentage\n");
		print ("@overflow_percentage\n");
		print ("@overflow_percentagesort\n");
		print ("@overflow_percentagesort[0]\n");
		print ("overflow_total\n");
		print ("@overflow_total\n");
		print ("@overflow_totalsort\n");
		print ("@overflow_totalsort[0]\n");
		print ("wirelength\n");
		print ("@wirelength\n");
		print ("@wirelengthsort\n");
		print ("@wirelengthsort[0]\n");
		print ("wns\n");
		print ("@wns\n");
		print ("@wnssort\n");
		print ("@wnssort[0]\n");
		print ("setup_violation_number\n");
		print ("@setup_violation_number\n");
		print ("@setup_violation_numbersort\n");
		print ("@setup_violation_numbersort[0]\n");
		print ("tns\n");
		print ("@tns\n");
		print ("@tnssort\n");
		print ("@tnssort[0]\n");
		print ("@cell\n");
		print "===== End of Sorting Function Debug =====\n";
	}

}

# ==============================
# 	gentable
# ==============================
sub gentable {
	$output_file = "explore.html";
	open (output,">$output_file") || die "Can't open $output_file\n" ;
	print output "<html><pre>\n";
	print output "<h1 align=\"center\">JRM scmVirtualFlatPlace explore mode run results</h1>\n";
	#print output "<h1><b>JRM scmVirtualFlatPlace explore mode run results</b></h1>\n";
	print output "<table border=1><tr>\n";
	print output "
		<tr>
		<td></td>
		<td></td>
		<td nowrap align=center colspan=4>setup time</td>
		<td nowrap align=center colspan=2>vipo setup time*</td>
		<td nowrap align=center colspan=4>congestion*</td>
		<td>wirelength</td>
		<td nowrap align=center colspan=2>links</td>
		</tr>\n";
	print output "
		<tr>
		<td>run</td>
		<td>objective</td>
		<td nowrap align=center>wns</td>
		<td>number</td>
		<td nowrap align=center>tns</td>
		<td>timing</td>
		<td nowrap align=center>wns</td>
		<td nowrap align=center>tns</td>
		<td>total</td>
		<td>max</td>
		<td nowrap align=center>%</td>
		<td>cong map</td>
		<td>wirelength</td>
		<td>PR sum</td>
		<td>run log</td>
		</tr>\n"; #<td><b>total</b></td> <td><font color=00F100>total</font></td> <td><a href=\s1\><b>total</b></a></td>

	if ($default_wns == @wnssort[0]) {$default_compare1 = "<b><font color=00AB00>$default_wns</font></b>";}
	else {$default_compare1 = $default_wns;}
	
	if ($default_setup_violation_number == @setup_violation_numbersort[0]) {$default_compare2 = "<b><font color=00AB00>$default_setup_violation_number</font></b>";}
	else {$default_compare2 = $default_setup_violation_number;} 
	#Very strange. Fist element is empty
	
	if ($default_tns == @tnssort[0]) {$default_compare3 = "<b><font color=00AB00>$default_tns</font></b>";}
	else {$default_compare3 = $default_tns;}
	
	if ($default_overflow_total == @overflow_totalsort[0]) {$default_compare4 = "<b><font color=00AB00>$default_overflow_total</font></b>";}
	else {$default_compare4 = $default_overflow_total;} 
	#overflow_maxsort is by number not key
	
	if ($default_overflow_max == @overflow_maxsort[0]) {$default_compare5 = "<b><font color=00AB00>$default_overflow_max</font></b>";}
	else {$default_compare5 = $default_overflow_max;}
	
	if ($default_overflow_percentage == @overflow_percentagesort[0]) {$default_compare6 = "<b><font color=00AB00>$default_overflow_percentage</font></b>";}
	else {$default_compare6 = $default_overflow_percentage;}
	
	if ($default_wirelength == @wirelengthsort[0]) {$default_compare7 = "<b><font color=00AB00>$default_wirelength</font></b>";}
	else {$default_compare7 = $default_wirelength;}

	if ($default_vipo_wns == @vipo_wnssort[0]) {$default_compare8 = "<b><font color=00AB00>$default_vipo_wns</font></b>";}
	else {$default_compare8 = $default_vipo_wns;}

	if ($default_vipo_tns == @vipo_tnssort[0]) {$default_compare9 = "<b><font color=00AB00>$default_vipo_tns</font></b>";}
	else {$default_compare9 = $default_vipo_tns;}

	print output "
		<tr>
		<td>default</td>
		<td>hier+timing</td>
		<td nowrap align=right>$default_compare1</td>
		<td nowrap align=right>$default_compare2</td>
		<td nowrap align=right>$default_compare3</td>
		<td nowrap align=center><a href=\./$report/initial_place.rpt\><b>rpt</b></a></td>
		<td nowrap align=right>$default_compare8</td>
		<td nowrap align=right>$default_compare9</td>
		<td nowrap align=right>$default_compare4</td>
		<td nowrap align=right>$default_compare5</td>
		<td nowrap align=right>$default_compare6</td>
		<td nowrap align=center><a href=\./$report/topvp.gif\><b>map</b></a></td></b></td>
		<td nowrap align=right>$default_compare7</td>
		<td nowrap align=center><a href=\./$report/initial_place.sum\><b>pr</a></td>
		<td nowrap align=center><a href=\./$report/default.log\><b>log</a></td>
		</tr>\n";

	print output "
		<tr></tr>\n";
		#<tr><td colspan=2><hr size=0></td></tr>\n";

	foreach $runnum (@runnum) {	

		#if ($runnum = @overflow_maxsort[0]) {$compare1 = "<font color=00F100>$overflow_max{$runnum}</font>";}
		#else {$compare1 = $overflow_max{$runnum};}

		#if (@wns[$runnum -1] == @wnssort[0]) {$compare1 = "<b><font color=00AB00>@wns[$runnum -1]</font></b>";}
		if (@wns{$runnum} == @wnssort[0]) {$compare1 = "<b><font color=00AB00>@wns{$runnum}</font></b>";}
		else {$compare1 = @wns{$runnum};}

		if (@setup_violation_number{$runnum} == @setup_violation_numbersort[0]) {$compare2 = "<b><font color=00AB00>@setup_violation_number{$runnum}</font></b>";}
		else {$compare2 = @setup_violation_number{$runnum};} 
		#Very strange. First element is empty

		if (@tns{$runnum} == @tnssort[0]) {$compare3 = "<b><font color=00AB00>@tns{$runnum}</font></b>";}
		else {$compare3 = @tns{$runnum};}

		if (@overflow_total{$runnum} == @overflow_totalsort[0]) {$compare4 = "<b><font color=00AB00>@overflow_total{$runnum}</font></b>";}
		else {$compare4 = $overflow_total{$runnum};} 
		#overflow_maxsort is by number not key

		if (@overflow_max{$runnum} == @overflow_maxsort[0]) {$compare5 = "<b><font color=00AB00>@overflow_max{$runnum}</font></b>";}
		else {$compare5 = $overflow_max{$runnum};}

		if (@overflow_percentage{$runnum} == @overflow_percentagesort[0]) {$compare6 = "<b><font color=00AB00>@overflow_percentage{$runnum}</font></b>";}
		else {$compare6 = $overflow_percentage{$runnum};}

		if (@wirelength{$runnum} == @wirelengthsort[0]) {$compare7 = "<b><font color=00AB00>@wirelength{$runnum}</font></b>";}
		else {$compare7 = @wirelength{$runnum};}

		if (@vipo_wns{$runnum} == @vipo_wnssort[0]) {$compare8 = "<b><font color=00AB00>@vipo_wns{$runnum}</font></b>";}
		else {$compare8 = @vipo_wns{$runnum};}

		if (@vipo_tns{$runnum} == @vipo_tnssort[0]) {$compare9 = "<b><font color=00AB00>@vipo_tns{$runnum}</font></b>";}
		else {$compare9 = @vipo_tns{$runnum};}

	        print output "
		<tr>
		<td>$runnum</td>
		<td>@objective{$runnum}</td>
		<td nowrap align=right>$compare1</td>
		<td nowrap align=right>$compare2</td>
		<td nowrap align=right>$compare3</td>
		<td nowrap align=center><a href=\./$report/VFP_explore_run${runnum}_@objective{$runnum}.rpt\><b>rpt</b></a></td>
		<td nowrap align=right>$compare8</td>
		<td nowrap align=right>$compare9</td>
		<td nowrap align=right>$compare4</td>
		<td nowrap align=right>$compare5</td>
		<td nowrap align=right>$compare6</td>
		<td nowrap align=center><a href=\./$report/topvp_explore_run${runnum}_@objective{$runnum}.gif\><b>map</b></a></td>
		<td nowrap align=right>$compare7</td>
		<td nowrap align=center><a href=\./$report/VFP_explore_run${runnum}_@objective{$runnum}.sum\><b>pr</b></a></td>
		<td nowrap align=center><a href=\./$report/run$runnum.log\><b>log</b></a></td>
		</tr>\n";

	}
	print output "</table>\n";

	print output "<font size=3><b><U>Note</U></b></font>\n";
	print output "1.<b><I>default</I></b>: This is the result without explore mode, using the default virtual flat placement settings .\n";
	print output "  This can serve as your baseline result.\n";
	print output "2.<b><I>vipo setup time</I></b>: Virtual \"In Place Optimization\" is an in memory IPO to\n"; 
	print output "  estimate a achievable setup time on a placed design.\n";
	print output "3.<b><I>congestion</I></b>: congestion is based on the overflow per GRC \(global route cell\)\n";
	print output "  total = total overflow; max = max overflow; % = overflow percentage\n";
	print output "4.<b><I>wns</I></b>: worst negative slack\n";
	print output "5.<b><I>tns</I></b>: total negative slack\n";
	print output "6.The best results out of all the runs on each column will be highlited.\n";
	print output "  This is to help you find the best run based on your criteria.\n";
	print output "7.All reports are based on legalized placement and high effort axgProtoRoute.\n";
	print output "8.The <b><I>JupiterXT/Astro User Guide</I></b> contains more information on <b><I>Virtual IPO</I></b> and how to read the <b><I>congestion</I></b> numbers.\n";
        print output "\n";
        print output "<font size=3><U><b>How to use the selected run and continue through JRM flow?</b></U></font>\n";
        print output "1.explore mode is performed in initial_place step. To continue to incremental_place step,\n";
        print output "  you'll need to modify <b><I>cmd/incremental_place.cmd</I></b> such that the selected run would be the starting cell of incremental_place step.\n";
        print output "2.Let's say if you picked run4 and want to continue with it. The saved cell for run4 is topvp_explore_run4_hier+cong+timing.\n";
        print output "  You need to modify the following command in cmd/incremental_place.cmd:\n";
        print output "  From: scmOpenCell \'\(-cell_name topvp2 -copy_from <b><I>topvp</I></b> -overwrite\)\n";
        print output "  To:   scmOpenCell \'\(-cell_name topvp2 -copy_from <font color=FA0000><b><I>topvp_explore_run4_hier+cong+timing</I></b></font> -overwrite\)\n";
	print output "\n";

	close output;		

} #sub

# ==============================
# 	redirect
# ==============================
sub redirect {
		$source_log_file = $source_file;	
		$output_file = "./$report/default.log";
		open (source,$source_log_file) || die "Can't open $source_file\n";
		while (<source>) {
			chomp;
			if (/Starting Default Virtual Flat Placement/) {
				open (output,">$output_file") || die "Can't open $output_file\n";
				print output "<html><pre>\n";
				print output "$_\n";
				while (<source>) {
					chomp;
					print output "$_\n";
					if (/End of Default Virtual Flat Placement/) {
						last;

					}
				}			
			}
		}

	foreach $runnum (@runnum) {
		$source_log_file = $source_file; #The source file need to be re-initiated for each loop
		$output_file = "./$report/run$runnum.log";
		open (source,$source_log_file) || die "Can't open $source_file\n";
		#open (output,">$output_file") || die "Can't open $output_file\n";
		#print output "<html><pre>\n";
		while (<source>) {
			chomp;
			if (/Starting explore mode run $runnum/) {
				open (output,">$output_file") || die "Can't open $output_file\n";
				print output "<html><pre>\n";
				print output "$_\n";
				while (<source>) {
					chomp;
					print output "$_\n";
					if (/End of explore mode run $runnum/) {
						last;

					}
				}			
			}
		}
	}
}

# ==============================
# 	define cell list
# ==============================
sub define_cell_list {
	open (output2,">./.explore_cell_list_file") || die "Can't open .explore_cell_list_file\n";
	print output2 "define explore_cell_list \'\(@cell\)\n";
	close output2;
	'chmod -R 777 ./.explore_cell_list_file';
}

# ==============================
# 	converthtml
# ==============================
sub converthtml {
	open (source1,$converthtml_source_file) || die "Can't open $converthtml_source_file\n" ;
	open (output1,">$converthtml_output_file") || die "Can't open $converthtml_output_file\n";
	print output1 "<html><pre>\n";
	while (<source1>) {
		chop;
		print output1 ("$_\n");
	}
	close output1;
}
