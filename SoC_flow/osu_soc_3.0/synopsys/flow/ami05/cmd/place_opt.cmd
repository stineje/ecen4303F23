;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Scheme Functions For Recommended Astro Methodology
; Copyright (C) 2000-2005 Astro CAE Group
; RCMD Version 2006.06.sp4.11.27.2006
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

define cmd_file "place_opt.cmd"
scmReplayFile "replay/place_opt.cmd"

scmOpenCell '(-cell_name toppl -copy_from $bind_cell_name -overwrite)
    ;;;; <Does> geOpenCell or  -> geCopyCell -> geOpenCell
    ;;;; <Options>
    ;;;;	-cell_name cell_name_a		# the cell name to be opened and worked on
    ;;;;	-copy_from cell_name_b		# copy cell_name_b to cell_name_a and open cell_name_a
    ;;;;	-overwrite			# when copy cell,overwrites if cell exists  

scmReadSDC '()
    ;;;; <Does> ataRemoveTC (remove existing sdc) -> ataLoadSDC -> disable propagated clock
    ;;;; <Options>
    ;;;;	-sdc_file sdc_file		# -sdc_file is default option, so left empty '() to load
    ;;;;					# sdc_file defined in .avntrc

;scmTraceScanChain '(-port_name scan_in[0] -end_port_name scan_out[0])
    ;;;; <Does> axgScanTrace (trace) -> axgScanChainOptim (dettach)
    ;;;; <Options> 
    ;;;;	-port_name chain_start_port_name
    ;;;;	-instance chain_start_instance_name
    ;;;;	-buffer_names buffer_name
    ;;;; 	-mux_names mux_name
    ;;;; 	-end_port_name chain_end_port_name
    ;;;; 	-end_instance chain_end_instance_name
    ;;;; 	-output output_file		# It dumps scan chain to a file
    ;;;; <Note> If you have more than oe scan pair, you need to use this command for multiple occurance.

;scmDeleteScanChain '()
    ;;;;        Delete the scan chain connection 

;scmSpecifySpareCell '(-pattern I_ALU/r162_0/.* -group_name r162)
    ;;;; <Does> aprCmdCreateHierGroup (specify spare cells as groups) -> geNameSelect -> 
    ;;;;	    aprCmdFixCell (fix spare cells outside core from being placed)
    ;;;; <Options>
    ;;;;	-pattern spare_cell_name_pattern
    ;;;;	-group_name group_name		# To assign a name to the spare cell group
    ;;;; <Note> If you have more than one spare cell groups, you need to give this command multiple times.	

scmPrePlace '()
    ;;;; <Does> atTimingSetup (for commonly used environment settings) -> astAutoPlace (if autoplace = 1) astPrePS (if autoplace = 0)
    ;;;; <Options> 
    ;;;;        -down_size_cell                 # Default is off. Only for ultra pre-placement
    ;;;;        -remove_buffer                  # Default is off.  Good for netlist which are done by PC optimization
    ;;;;	-enable_preset_clear_arcs	# Default off. Enables preset and clear asynchronous timing arcs
    ;;;;					# To turn on : '(-enable_preset_clear_arcs)
    ;;;;	-enable_recovery_removal_arcs	# Default off. Enables recovery and removal asynchronous timing arcs
    ;;;;	-enable_inter_clock		# Default on. Enables timing for inter clock paths 
    ;;;;					  which are otherwise treated as false paths.
    ;;;;	-enable_time_borrowing		# Default on. Enables time borrowing.
    ;;;;					# To turn off : '(-enable_time_borrowing 0)

scmReportTiming '(-ignore_interconnect -output report/ideal_opt.rpt -slack_threshold 0)
    ;;;; <Does> astReportTiming
    ;;;; <Options>
    ;;;;	-output output_file		# If this option is not used, window will pop up (for interactive use)	
    ;;;; 	-ignore_interconnect		# Default off. Ignores interconnect.
    ;;;; 	-max_corner			# Default on. Reports setup time.
    ;;;; 	-min_corner			# Default on. Reports hold time.
    ;;;; 	-from from_pin			# Default off. To report specific paths.				
    ;;;; 	-through through_pin		# Default off. To report specific paths.
    ;;;; 	-to to_pin			# Default off. To report specific paths.
    ;;;; 	-number_of_paths number		# Default is 20.
    ;;;; 	-slack_threshold slack 		# Default is 0.0 
    ;;;; 	-max_trans			# Default on.
    ;;;; 	-max_cap			# Default on.
    ;;;; 	-net_based			# Default on. To report tran/cap violations ordered by net name.
    ;;;; 	-clock_trans			# Default off. To includes clock net in max tran violation report.
    ;;;; 	-print_histogram		# Default on.
    ;;;; 	-force_running			# Default is off. To recompute all delays even though timer is loaded.
    ;;;; 	-show_clock_path		# Default on. To show clock paths along with signal paths.	

scmRouteRail '()
    ;;;; <Does> axgPrerouteStandardCells
    ;;;; <Example>
    ;;;;        scmRouteRail '(-use_special_via_rule -x_offset 1 -x_size 1.5 -x_step 3.3 
    ;;;;                       -y_offset 0 -y_size 0.6 -y_step 1 -dont_connect_macro_pins)
    ;;;;        Pls refer to help file for more details.
    ;;;; <Options>
    ;;;;        -post_route           		# Default off. Needed if performed after routing is done.
    ;;;;        -use_special_via_rule           # Default off. You need to turn this on to use special via rules as follows.
    ;;;;          -x_offset 
    ;;;;          -x_size
    ;;;;          -x_step
    ;;;;          -y_offset 
    ;;;;          -y_size 
    ;;;;          -y_step
    ;;;;          -keep_floating_pieces         # Default on.
    ;;;;        -connect_pg_port		# Default on. It will automatically connect PG for you.
    ;;;;        -power_net_list			# Default is VDD
    ;;;;        -power_port_list		# Default is VDD.*
    ;;;;        -ground_net_list		# Default is VSS
    ;;;;        -ground_port_list		# Default is VSS.*
    ;;;;        =============================== # Options below are default off.
    ;;;;        -offset_both_sides 
    ;;;;        -dont_connect_macro_pins
    ;;;;        -dont_connect_pad_pins
    ;;;;        -extend_to_create_pin
    ;;;;        -multiple_connection_gap
    ;;;;        -determine_pin_width_by_extreme_edge
    ;;;;        -set_tie_mode_maximum_route_width
    ;;;;        -extend_to_boundary_and_generate_pin
    ;;;;        -avoid_merging_existing_vias
    ;;;;        -optimize_via_location
    ;;;;        -do_not_route_over_macros
    ;;;;        -fill_all_empty_rows
    ;;;;        -preroute_fat_blockages_as_thin_wires
    ;;;;        -jogging_range
    ;;;;        -preroute_min_metal_layer
    ;;;;        -preroute_max_metal_layer

scmPlaceOpt '()
    ;;;;	If autoplace = 1 : astAutoPlace with effort controls
    ;;;;	If autoplace = 0 -effort medium : astPlaceDesign -> astPostPS1 -> pdsMoveCell
    ;;;;			 -effort high :	astPlaceDesign -> astPostPS1 -> pdsMoveCell -> astPostPS
    ;;;; <Options>
    ;;;;	-effort				# Default medium. ( low | medium | high )
    ;;;;	-optimize_netlist		# Default on. Placement and setup slack optimization simultaneously.
    ;;;;	-congestion_driven_placement	# Default on.
    ;;;;	-timing_driven_placement	# Default on.
    ;;;;        -timing_routability 1-10        # Default 5. Means timing weight is 5.
    ;;;;	-search_refine_hour		# Default off. Specify a numer > 0 to use search and refine in astPlaceDesign.
    ;;;;	-use_global_route		# Default off. To use global route topology in astPostPS1.
    ;;;;	-prevent_xtalk			# Default off. To prevent xtalk in astAutoPlace.
    ;;;;	-postplace_prevent_xtalk	# Default off. To prevent xtalk post place in astAutoPlace.
    ;;;;	-from inPlace/phase1/pds/phase2 # Works if autoplace = 0.
    ;;;;					  Default inplace. This allows user to spefify the staring step of the 
    ;;;;					  scmPlaceOpt.
    ;;;;					  inPlace/phase1/pds/phase2 order is like mentioned in high effort.
    ;;;;	-max_length			# Default off. 	
    ;;;;	-use_lrrt			# Works if autolace = 1.
    ;;;;					  Default off. Turn it on to use lrrt.

scmReportTiming '(-output report/place_opt.rpt -max_trans -max_cap -slack_threshold 0)       

;scmSpreadSpareGroup '(-group_name r162)
    ;;;; <Does> geNameSelect (select spare cell groups) -> aprCmdFixCell (unfix) -> axgSpreadGroupCells (spread)
    ;;;; <Options>
    ;;;;	-group_name group		# Selects the group to spread.
    ;;;; <Note> If you have several groups, you need to give the command multiple times.

scmPRSummary '(-output report/place_opt.sum)

scmSaveCell '(-close_cell)

exit
