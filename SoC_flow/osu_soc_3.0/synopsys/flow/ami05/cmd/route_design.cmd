;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Scheme Functions For Recommended Astro Methodology
; Copyright (C) 2000-2005 Astro CAE Group
; RCMD Version 2006.06.sp4.11.27.2006
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

define cmd_file "route_design.cmd"
scmReplayFile "replay/route_design.cmd"

scmOpenCell '(-cell_name topdr -copy_from topcts -overwrite)

;Please also add your routing rule here by clicking on the GUI form, cut and paste that command here

;scmSetupDistJobs '()
    ;;;; <Note> If user want to do distributed routing in detail route, please uncomment this command.
    ;;;;        But you have to do the following before hand 
    ;;;;        define distributed_routing_machine_list '(machine1 machine2) in either .avntrc or before 
    ;;;;        this command.

;There is clock_double_spacing option in scmRoute to route clock nets with double spacing up to
;n-1 level, that includes all nets except the nets connecting to leaf flops.

scmRoute '()
    ;;;; <Options>
    ;;;; 	-route_run_time_limit       # Default is 4500 minutes
    ;;;; 	-reduce_xtalk               # Default is off
    ;;;; 	-groute_xtalk_weight        # Default is 4 if reduce_xtalk is on
    ;;;; 	-route_clock_net	    # Default is on
    ;;;; 	-clock_width_factor         # Default is 1
    ;;;; 	-clock_double_spacing       # Default is 0
    ;;;; 	-shield_clock_net	    # Default is 0
    ;;;; 	-shield_width_factor        # Default is 1
    ;;;; 	-shield_spacing_factor      # Default is 1
    ;;;; 	-clock_net_min_layer_name   # Default is ""
    ;;;; 	-clock_net_max_layer_name   # Default is ""
    ;;;; 	-clock_net_timing_driven_spacing       		# Default is 0
    ;;;; 	-groute_xtalk_weight        # Default is 4
    ;;;; 	-post_GR_optimization       # Default is 0
    ;;;; 	-track_assign_optimization  # Default is 0
    ;;;; 	-distribute_route           # Default is 0
    ;;;; 	-fix_same_net_notch         # Default is 1
    ;;;; 	-minimize_vias              # Default is 0
    ;;;; 	-file_to_load_before_axgRouteGroup              # Default is ""
    ;;;; 	-file_to_load_before_axgGlobalRoute             # Default is ""
    ;;;; 	-file_to_load_before_astPostGR                  # Default is ""
    ;;;; 	-file_to_load_before_track_assign_optimization  # Default is ""
    ;;;; 	-file_to_load_before_axgDetailRoute             # Default is ""


scmReportSkew '(-operating_condition worst -output report/route_design.skew)
    ;;;; <Does> astSkewAnalysis
    ;;;; <Options>
    ;;;;        -clock_names clock_name                 # Default is left blank. Reports all clocks.
    ;;;;        -operating_condition worst/typical/best # Default worst.
    ;;;;        -global_clock_skew                      # Default on.
    ;;;;        -detailed_report                        # Default off.
    ;;;;        -local_clock_skew_report                # Default off.
    ;;;;        -local_clock_skew_at_clock_ports        # Default off.
    ;;;;        -inter_clock_skew                       # Default off.
    ;;;;        -output_file output_file_name

scmReportTiming '(-output report/route_design.rpt -max_trans -max_cap -slack_threshold 0)

scmPRSummary '(-output report/route_design.sum)

scmSaveCell '(-close_cell)

exit
