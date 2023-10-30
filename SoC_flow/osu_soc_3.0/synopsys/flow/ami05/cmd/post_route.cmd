;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Scheme Functions For Recommended Astro Methodology
; Copyright (C) 2000-2005 Astro CAE Group
; RCMD Version 2006.06.sp4.11.27.2006
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

define cmd_file "post_route.cmd"
scmReplayFile "replay/post_route.cmd"

scmOpenCell '(-cell_name toppo -copy_from topdr -overwrite)

scmRouteOpt '()
    ;;;; <Options>
    ;;;; 	-optimize_route_pattern	      		# Default is off, recommended for high density design
    ;;;; 	-fix_induced_delay            		# Default is off
    ;;;; 	-fix_noise                    		# Default is off
    ;;;; 	-fix_antenna                  		# Default is off
    ;;;; 	-ignore_lower_layer_segments  		# Default is on
    ;;;; 	-include_lower_layer_segments_to_pins  	# Default is off
    ;;;; 	-include_all_lower_layer_segments  	# Default is off
    ;;;; 	-antenna_rule_file  			# Default is ""
    ;;;;        -max_ratio	                        # Default is 1000000
    ;;;;        -top_layer_probe_constraints  		# Default is ""
    ;;;; 	-use_astPostRouteOpt_flow  		# Default is on

;scmFixAntenna '()
    ;;;; <Note> Please load antenna rule file with -antenna_rule_file option if had any
    ;;;; <Note> If want to insert diode, please define diode cells in .avntrc file
    ;;;; <Options>
    ;;;;        -ignore_lower_layer_segments  		# Default is on
    ;;;;        -include_lower_layer_segments_to_pins 	# Default is off
    ;;;;        -include_all_lower_layer_segments 	# Default is off
    ;;;;        -antenna_rule_file            		# Default is ""
    ;;;;        -max_ratio                    		# Default is 1000000
    ;;;;        -top_layer_probe_constraints  		# Default is ""
    ;;;;        -insert_diode                 		# Default is off
    ;;;;        -specify_diode                		# Default is off

;scmTopoPostRT '()
    ;;;; <Note> To perform minor topology fixing using astPostRT. 
    ;;;; <Options>
    ;;;;	 -topo_star_rcxt			# Default is off, need to specify xt_<xxx> options for StarRC setup.
    ;;;;	 -xt_extra_command_file			# Default is ".xt_extra_command".
    ;;;;	 -xt_nxtgrd_file_min			# Default is "".
    ;;;;	 -xt_nxtgrd_file_nom			# Default is "".
    ;;;;	 -xt_nxtgrd_file_max			# Default is "".
    ;;;;	 -xt_mapping_file			# Default is "".
    ;;;;	 -xt_netlist_format			# Default is "SPF".
    ;;;;	 -num_loop				# Default is 1.
    ;;;;	 -max_iter				# Default is 100.
    ;;;;	 -fast_extraction			# Default is off.
    ;;;;	 -topo_fix_max_length			# Default is off.
    ;;;;	 -only_topo_fix_max_length		# Default is off.
    ;;;;	 -topo_max_length			# Default is 1000.
    ;;;;	 -topo_fix_trans_cap			# Default is on.
    ;;;;	 -only_topo_fix_trans_cap		# Default is off.
    ;;;;	 -topo_fix_setup			# Default is on.
    ;;;;	 -only_topo_fix_setup			# Default is off.
    ;;;;	 -topo_fix_hold				# Default is on.
    ;;;;	 -only_topo_fix_hold			# Default is off.
    ;;;;	 -eco_search_repair_loop		# Default is 5.
    ;;;;	 -add_filler_cell			# Default is off.
    ;;;;	 -purge_filler_cell			# Default is off.

scmConnectPGPort '()
    ;;;; <Note> To make sure all cell are connected to power/ground before going into verification tools

scmRouteRail '(-post_route)

scmReportTiming '(-output report/post_route.rpt -max_trans -max_cap -slack_threshold 0)

scmReportSkew '(-operating_condition worst -output report/post_route.skew)

scmPRSummary '(-output report/post_route.sum)

scmSaveCell '(-close_cell)

exit
