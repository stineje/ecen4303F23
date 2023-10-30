;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Scheme Functions For Recommended Astro Methodology
; Copyright (C) 2000-2005 Astro CAE Group
; RCMD Version 2006.06.sp4.11.27.2006
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

define cmd_file "clock_opt.cmd"
scmReplayFile "replay/clock_opt.cmd"

scmOpenCell '(-cell_name topcts -copy_from toppl -overwrite)

scmBuildClock '()
    ;;;; <Does> astCTS -> astCTO
    ;;;; <Options>
    ;;;;        -effort                                 # Default is medium
    ;;;;        -clock_target_skew                      # Default is 0
    ;;;;        -useful_skew                            # Default is off, target for global skew
    ;;;;        -worst					# Default is on
    ;;;;        -best					# Default is off
    ;;;;        -typical				# Default is off
    ;;;;        -top					# Defautl is off, target for block level
    ;;;;        -clock_gating_check			# Defautl is off, turn on clock gating check in atTimingSetup
    ;;;;        -enable_mixed_clock_signal_edges	# Defautl is on
    ;;;;        -global_skew				# Defautl is on
    ;;;;        -local_skew				# Defautl is off
    ;;;;        -useful_skew				# Defautl is off
    ;;;;        -clock_width_factor			# Defautl is 1.
    ;;;;        -clock_double_spacing			# Defautl is off.
    ;;;;        -shield_clock_net			# Defautl is off.
    ;;;;        -shield_width_factor			# Defautl is off.
    ;;;;        -shield_spacing_factor			# Defautl is off.
    ;;;;        -clock_net_min_layer_name		# Defautl is "".
    ;;;;        -clock_net_max_layer_name		# Defautl is "".
    ;;;;        -clock_net_timing_driven_spacing	# Defautl is off.
    ;;;;        -mark_priority_clock_fix		# Defautl is off.
    ;;;;        -delete_clock_tree			# Defautl is off.
    ;;;;        -file_to_load_before_astCTS		# Defautl is "".
    ;;;;        -load_custom_cts_script 		# Defautl is "".

;scmOptimizeScanChain '()
    ;;;; <Does> axgScanChainOptim
    ;;;; 	    This is to reconnect and optimize scan chain before optimizations.
    ;;;; <Example> scmOptimizeScanChain '(-chain_name ScanGroup_scan_in[1] -preserve_latches)
    ;;;;           Pls refer to help file for more details.
    ;;;; <Options> 
    ;;;;	-allow_new_module_ports			# Default on.
    ;;;;	-preserve_latches			# Default off.
    ;;;;	-clock_net_based_reordering		# Default off.
    ;;;; 	-mode optimize/delete_only/update_netlist_only	# Default is optimize.

;scmTraceScanChain '(-output report/scan_new_order.scm -port_name scan_in[0] -end_port_name scan_out[0])
    ;;;; <Note> Need to trace again the new scan chain order to take effect.
    ;;;;        If have prepared a file for previous trace in place_opt.cmd, you can
    ;;;;        load that file here.

scmPropagateClock '()
    ;;;; <Does> atTimingSetup -> sdc "set_propagated_clock {*}"
    ;;;; <Options>
    ;;;;	-set_io_clock_latency			# Default off. Automatically calculate the clock insertion
    ;;;;						  delay of the flop that connect to IO port, and set the 
    ;;;;						  insertion delay as clock latency of that IO port.
    ;;;;	-ignore_clock_uncertainty		# Default off.                                          
    ;;;;	-enable_ideal_network_delay		# Default on.                                          
    ;;;;	-delay_model				# Default is high_effort (arnoldi).                                          
    ;;;;	-ignore_propagated_clock		# Default off.                                          
    ;;;;	-enable_preset_clear_arcs		# Default off.                                          
    ;;;;	-enable_recovery_removal_arcs		# Default off.                                          
    ;;;;	-enable_mixed_clock_signal_edges	# Default on.                                          
    ;;;;	-enable_clock_gating_checks		# Default off.                                          
    ;;;;	-purge_sync_pin	 			# Default off.                                          
    ;;;;	-file_to_load_after_scmPropagateClock	# Default "".                                          

scmPostCTSOpt '()
    ;;;; <Does> If autoplace = 1 :
    ;;;;           astMarkClockTree -> astAutoPlace with effort controls
    ;;;;        If autoplace = 0 :
    ;;;;	   -effort medium : astMarkClockTree -> astPostPS
    ;;;;           -effort high   : astMarkClockTree -> astPostPS -> pdsMoveCell -> astPostPS
    ;;;; <Options>
    ;;;;	-effort					# Default medium. ( low | medium | high )   
    ;;;;        -mark_clock_fix                        	# Default is on
    ;;;;        -remove_congestion                      # Default is off. Works if autoplace = 1.

scmSaveCell '()

scmReportSkew '(-operating_condition worst -output report/clock_opt.skew)
    ;;;; <Does> astSkewAnalysis
    ;;;; <Options>
    ;;;;	-clock_names clock_name			# Default is left blank. Reports all clocks.
    ;;;;	-operating_condition worst/typical/best	# Default worst.
    ;;;;	-global_clock_skew			# Default on.
    ;;;; 	-detailed_report			# Default off.
    ;;;;	-local_clock_skew_report		# Default off.
    ;;;;	-local_clock_skew_at_clock_ports	# Default off.
    ;;;;	-inter_clock_skew			# Default off.
    ;;;;	-output_file output_file_name

scmReportTiming '(-output report/clock_opt.rpt -max_trans -max_cap -slack_threshold 0)

scmPRSummary '(-output report/clock_opt.sum)

scmSaveCell '(-close_cell)

exit
