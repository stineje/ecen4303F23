########################################################################################
# Enable onChipVariation (for MMMC flows).  Options are:
# pre_postcts, pre_postroute, pre_postroute_si, pre_signoff, false
########################################################################################
set vars(enable_ocv)           pre_postroute

########################################################################################
# Optionally enable cppr; options are: setup, hold, both, none
########################################################################################
set vars(enable_cppr)          both

########################################################################################
# Optionally enable signalStorm delay calculation during postroute
# and postroute_si steps. When false, it gets applied only during
# the signoff step
########################################################################################
set vars(enable_ss)            false

########################################################################################
#                      Placement Options
########################################################################################
#set vars(in_place_opt)         true
set vars(clock_gate_aware)     true
set vars(congestion_effort)    high

########################################################################################
#                     Tie/Filler/Tap Cell Options
# --------------------------------------------------------------------------------------
#                         Tie cell information
# --------------------------------------------------------------------------------------
set vars(tie_cells)            "TIEH TIEL"
# --------------------------------------------------------------------------------------
#                     Filler cell information
# --------------------------------------------------------------------------------------
set vars(filler_cells)         "FILLER64 FILLER32 FILLER16 FILLER8 FILLER4 FILLER2 FILLER1"
# ---------------------------------------------------------------------------------------
#                     Welltap cell information
# ---------------------------------------------------------------------------------------
#    verify_rule : maximum distance (in microns) between welltap cells and standard cells 
#                  in microns
#        max_gap : specifies the maximum distance from the right edge of one well-tap cell 
#                  to the left edge of  the following well-tap cell in the same row
#  cell_interval : specifies the maximum distance from the center of one well-tap cell 
#                  to the center of the following well-tap cell in the same row
#
# NOTE: max_gap and cell_interval parameters are mutually exclusive, user has to define 
#       only one of these parameters to add welltap cells
#
# ---------------------------------------------------------------------------------------
#set vars(welltaps)                         <welltap cells>
#set vars(welltaps,checkerboard)            <true or false>
#set vars(welltaps,max_gap)                 <max gap>
#set vars(welltaps,cell_interval)           <cell interval>
#set vars(welltaps,verify_rule)             <distance interval>
# ---------------------------------------------------------------------------------------
#                          Endcap cell information
# ---------------------------------------------------------------------------------------
#set vars(pre_endcap)	 <pre endcap cell>
#set vars(post_endcap)   <post endcap cell>

##########################################################################################
#                            LP/CPF Flow Options
##########################################################################################
set vars(cpf_file)       $vars(design_root)/DATA/chip_top_1.0e_integrated_for_backend.cpf
#set vars(cpf_keep_rows) <true | false>
# ---------------------------------------------------------------------------------------
# The vars(power_domains) is optional.  If not defined, the power
# power domain list will be picked up automatically
# ---------------------------------------------------------------------------------------
set vars(power_domains) "PDpll PDw PDrom PDsmc PDwakeup PD_3p3v PD_2p5v i_apb_subsystem__i_uart1__PDuart_SW PDdvfs"
# ---------------------------------------------------------------------------------------
# Additional optional low power variables can be defined in the lp_config.tcl file.
# These variables are intended to help automate some of the most common steps in the 
# LP/CPF flow
# ---------------------------------------------------------------------------------------

#########################################################################################
#                               Clock Tree Options
# ---------------------------------------------------------------------------------------
set vars(route_clock_nets)  true
#set vars(cts_cells)        <list of clock buffers>
#set vars(clock_gate_cells) <list of clock gating cells>
#set vars(clock_eco)        false

#########################################################################################
#                              Optimization Options
# ---------------------------------------------------------------------------------------
#set vars(high_timing_effort)             true
set vars(clock_gate_aware)               true
set vars(critical_range)                 0
set vars(dynamic_power_effort)           none
set vars(leakage_power_effort)           none
set vars(preserve_assertions)            false
set vars(useful_skew)                    false
set vars(fix_hold)                       true
set vars(fix_hold_ignore_ios)            false
set vars(fix_hold_allow_tns_degradation) false
set vars(skew_buffers) "\
   CKBUFFERD8 \
   CKBUFFERD6 \
   CKBUFFERD4 \
   CKBUFFERD3 \
   CKBUFFERD2 \
   CKBUFFERD16 \
   CKBUFFERD12 \
   CKBUFFERD1 \
   CKBUFFERD0 \
   CKINVERTERD8 \
   CKINVERTERD6 \
   CKINVERTERD4 \
   CKINVERTERD3 \
   CKINVERTERD2 \
   CKINVERTERD16 \
   CKINVERTERD12 \
   CKINVERTERD1 \
   CKINVERTERD0 \
"
set vars(delay_cells)  "DELAY0 DELAY005 DELAY01 DELAY015 DELAY02 DELAY1 DELAY2 DELAY3 DELAY4"
set vars(dont_use_list) "*CK* BUFT*  ANTENNA* DCAP* DELAY* GATEARRAY* HEADER*"
#set vars(delay_cells) <list of delay cells>
#set vars(dont_use_list) ""
#set vars(use_list) ""
#set vars(activity_file)       <activity file>
#set vars(activity_file_type)  <TCF | SAF | VCD>
set vars(report_power)         true
#set vars(power_analysis_view) <power analysis view>
set vars(power_analysis_view)  AVdefault_WC

#########################################################################################
#                              Nanoroute Options
# ---------------------------------------------------------------------------------------
set vars(multi_cut_effort)     low
set vars(litho_driven_routing) false

#########################################################################################
#                              Signal Integrity Options
# ---------------------------------------------------------------------------------------
set vars(delta_delay_threshold) 10
set vars(coupling_c_thresh)     0.01
set vars(relative_c_thresh)     0.01
set vars(total_c_thresh)        0
set vars(celtic_settings)       "set_virtual_attacker -mode current -gtol 0.025"
#set vars(si_analysis_type)      pessimistic
#########################################################################################
# Optionally define the following when applicable
# ---------------------------------------------------------------------------------------
set vars(assign_buffer)       {1 -buffer BUFFD2}
set vars(buffer_tie_assign)  true
#set vars(pwrnet)             <list of power nets>
#set vars(gndnet)             <list of ground nets>
#set vars(jtag_cells)         <list of jtag cells>
#set vars(jtag_rows)          <number of rows for jtag placement>
set vars(spare_cells)        "*spare*"
#set vars(gds_files)          <list of gds files>
set vars(gds_layer_map)      "$vars(design_root)/LIBS/TECHNOLOGY/gds2.map"
set vars(qrc_layer_map)      "$vars(design_root)/DATA/layermap"
#set vars(qrc_library)        <qrc library directory>
#set vars(qrc_config_file)    <qrc config file>

#########################################################################################
# The following plugins are supported when needed ...
# ---------------------------------------------------------------------------------------
set vars(always_source_tcl) 			$vars(plug_dir)/always_source.tcl
set vars(final_always_source_tcl) 		$vars(plug_dir)/final_always_source.tcl
set vars(pre_init_tcl) 					$vars(plug_dir)/pre_init.tcl
set vars(post_init_tcl) 				$vars(plug_dir)/post_init.tcl
set vars(pre_place_tcl) 				$vars(plug_dir)/pre_place.tcl
set vars(post_place_tcl) 				$vars(plug_dir)/post_place.tcl
set vars(pre_prects_tcl) 				$vars(plug_dir)/pre_prects.tcl
set vars(post_prects_tcl) 				$vars(plug_dir)/post_prects.tcl
set vars(pre_cts_tcl) 					$vars(plug_dir)/pre_cts.tcl
set vars(post_cts_tcl) 					$vars(plug_dir)/post_cts.tcl
set vars(pre_postcts_tcl) 				$vars(plug_dir)/pre_postcts.tcl
set vars(post_postcts_tcl) 				$vars(plug_dir)/post_postcts.tcl
set vars(pre_route_tcl) 				$vars(plug_dir)/pre_route.tcl
set vars(post_route_tcl) 				$vars(plug_dir)/post_route.tcl
set vars(pre_postcts_hold_tcl) 			$vars(plug_dir)/pre_postcts_hold.tcl
set vars(post_postcts_hold_tcl) 		$vars(plug_dir)/post_postcts_hold.tcl
set vars(pre_postroute_tcl) 			$vars(plug_dir)/pre_postroute.tcl
set vars(post_postroute_tcl) 			$vars(plug_dir)/post_postroute.tcl
set vars(pre_postroute_hold_tcl) 		$vars(plug_dir)/pre_postroute_hold.tcl
set vars(post_postroute_hold_tcl) 		$vars(plug_dir)/post_postroute_hold.tcl
set vars(pre_postroute_si_tcl) 			$vars(plug_dir)/pre_postroute_si.tcl
set vars(post_postroute_si_tcl) 		$vars(plug_dir)/post_postroute_si.tcl
set vars(pre_postroute_si_hold_tcl) 	$vars(plug_dir)/pre_postroute_si_hold.tcl
set vars(post_postroute_si_hold_tcl)	$vars(plug_dir)/post_postroute_si_hold.tcl
set vars(pre_signoff_tcl) 				$vars(plug_dir)/pre_signoff.tcl
set vars(post_signoff_tcl) 				$vars(plug_dir)/post_signoff.tcl
#----------------------------------------------------------------------------------------
set vars(pre_partition_tcl) 			$vars(plug_dir)/pre_partition.tcl
set vars(post_partition_tcl) 			$vars(plug_dir)/post_partition.tcl
set vars(pre_assemble_tcl) 				$vars(plug_dir)/pre_assemble.tcl
set vars(post_assemble_tcl) 			$vars(plug_dir)/post_assemble.tcl
#----------------------------------------------------------------------------------------
# To insert metal fill during the flow define the following two
# variables:
# - vars(metalfill) [pre_postroute, pre_postroute_si, pre_signoff]
# - vars(metalfill_tcl) <path to metalfill plug-in file>
#----------------------------------------------------------------------------------------
#set vars(metalfill)                  	pre_postroute
#set vars(metalfill_tcl) 				<path to plug-in file>

##########################################################################################
# Distribution setup ... vars(distribute) can be one of the following:
# lsf, rsh, local, or custom
# Depending on the value of vars(distribute), addition variables
# may be required.  Some examples are shown below
#----------------------------------------------------------------------------------------
set vars(distribute)           custom
set vars(custom,script)        {/grid/sfi/farm/bin/gridsub -W 72:00 -P SOC7.1 \
                                -R "SFIARCH==OPT64 && OSREL==EE40" -q lnx64}
set vars(local_cpus)           2
set vars(remote_hosts)         4
set vars(pus_per_remote_host)  2
