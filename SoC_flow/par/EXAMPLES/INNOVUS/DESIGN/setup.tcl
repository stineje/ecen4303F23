###############################################################################
# CADENCE COPYRIGHT NOTICE                                                    #
# September 2008 Cadence Design Systems, Inc. All rights reserved.            #
#                                                                             #
# This script is AEWare, provided as an example of how to perform specialized #
# tasks within SoC Encounter.  It is not supported via the Cadence Hotline    #
# nor the CCR system.                                                         #
#                                                                             #
# This work may not be copied, re-published, uploaded, or distributed in any  #
# way, in any medium, whether in whole or in part, without prior written      #
# permission from Cadence.                                                    #
#                                                                             #
# This work is Cadence intellectual property and may under no circumstances   #
# be given to third parties, neither in original nor in modified versions,    #
# without explicit written permission from Cadence                            #
#                                                                             #
# The information contained herein is the proprietary and confidential        #
# information of Cadence or its licensors, and is supplied subject to, and    #
# may be used only by Cadence's customers in accordance with, a previously    #
# executed license and maintenance agreement between Cadence and its          #
# customer.                                                                   #
###############################################################################

global vars

###############################################################################
# Define some variables to point to data, libraries, and scripts
###############################################################################
set vars(design_root)  		.
set vars(data_root)    		DATA
set vars(library_root) 		LIBS
set vars(script_root) 		SCRIPTS
set vars(plug_dir)    	 	PLUG

###############################################################################
# Enable this variable if you want to abort when there are setup 
# errors ... leave 0 to continue on error
###############################################################################
set vars(abort) 0

###############################################################################
# The vars(flow) MUST be defined
# Supported flows -> default, pr_mmmc, or mmmc
###############################################################################
set vars(flow) mmmc

###############################################################################
# The following variables define the design data
# --------------------------------------------------------------------
# vars(design) <design name> REQUIRED
# vars(netlist) <verilog netlist file> REQUIRED
# vars(cts_spec) <cts spec file list > REQUIRED
# --------------------------------------------------------------------
# Either a fp_file, def_file or both MUST be defined
# --------------------------------------------------------------------
# vars(fp_file) <floorplan file>
# vars(def_file) <floorplan DEF file>
# --------------------------------------------------------------------
# vars(scan_def) OPTIONAL
###############################################################################
set vars(design)   tdsp_core
set vars(netlist)  "DATA/tdsp_core.v"
if {$vars(mode) == "flat"} {
   set vars(fp_file)  DATA/tdsp_core.fp
} else {
   set vars(fp_file)  DATA/hier.fp
#   set vars(hier_flow_type) "2pass"
   set vars(partition_list) "mult_32"
}
set vars(power_nets) "VDD AVdd"
set vars(ground_nets) "VSS AVss"

###############################################################################
# The following are REQUIRED
# --------------------------------------------------------------------
# vars(process) <process node> (65nm, 90nm, e.g.)
# vars(max_route_layers) <top routing layer>
###############################################################################
set vars(process)         45nm
set vars(max_route_layer) 6

###############################################################################
# The following are for the ILM based hierarchical flow
# vars(partition_list) <ptn1> <ptn2> ... REQUIRED
# vars(<ptn1>,cts_spec) <cts spec for ptn1> REQUIRED
# vars(<ptn1>,latency_sdc) <latency sdc for ptn1> REQUIRED
# vars(<ptn1>,incr_cts_sdc) <post cts incr sdc for ptn1> OPTIONAL
# vars(<ptn1>,post_cts_sdc) <post cts (full) sdc for ptn1> OPTIONAL
###############################################################################

###############################################################################
# Define library sets ...
# --------------------------------------
# set vars(library_sets) "<set1> <set2> ..."
# set vars(<set1>,timing) <list of lib files> (REQUIRED)
# set vars(<set1>,si) <list of cdb/udn files> (OPTIONAL)
###############################################################################
set vars(library_sets) "slow_libs"

set vars(slow_libs,timing) "GPDK/LIBS/GPDK045/timing/slow.lib"

set vars(lef_files) "GPDK/LIBS/GPDK045/gsclib045.lef"

###############################################################################
# Define rc corners ...
# --------------------------------------
# set vars(rc_corners) "<corner1> <corner2> ..."
# set vars(<corner1>,T) <temperature>
# set vars(<corner1>,cap_table) <cap table for corner1>
###############################################################################
# Optionally define QRC technology information
# --------------------------------------
# set vars(<corner>,qx_tech_file) <qx_tech_file for corner1>
# set vars(<corner>,qx_lib_file) <qx_lib_file for corner1>
# set vars(<corner>,qx_conf_file) <qx_conf_file for corner1>
###############################################################################
set vars(rc_corners)          "rc_max"
set vars(rc_max,T)            125
set vars(rc_max,cap_table)    GPDK/TECH/capTable
set vars(rc_max,qx_tech_file)  GPDK/TECH/qrcTechFile
#set vars(signoff_extraction_engine) qrc

###############################################################################
# Scale factors are also optional but are strongly encouraged for 
# obtaining the best flow convergence and QoR.  
# Scaling factors are applied per rc corner
# --------------------------------------------------------------------
# set vars(<corner1>,def_res_factor) <default resistance scale factor>
# set vars(<corner1>,det_res_factor) <detailed resistance scale factor>
# set vars(<corner1>,def_cap_factor) <default capacitance scale factor>
# set vars(<corner1>,det_cap_factor) <detailed capacitance scale factor>
# set vars(<corner1>,def_clk_cap_factor) <default clock capacitance scale factor>
# set vars(<corner1>,det_clk_cap_factor) <detailed clock capacitance scale factor>
# set vars(<corner1>,xcap_factor) <coupling capacitance scale factor>
###############################################################################
set vars(rc_max,def_res_factor)     0.95
set vars(rc_max,det_res_factor)     1.27
set vars(rc_max,def_cap_factor)     1.09
set vars(rc_max,det_cap_factor)     1.09
set vars(rc_max,def_clk_cap_factor) 1.10
set vars(rc_max,det_clk_cap_factor) 1.05
set vars(rc_max,xcap_factor)        1.03

###############################################################################
# Define operating conditions (optional)
# --------------------------------------------------------------------
# set vars(opconds) "<opcond1> <opcond2> ..."
# set vars(<opcond1>,library_file) <library file >
# set vars(<opcond1>,process) <process scale factor>
# set vars(<opcond1>,voltage) <voltage>
# set vars(<opcond1>,temperature) <temperature>
###############################################################################

###############################################################################
# Define delay corners ...
# --------------------------------------------------------------------
# set vars(delay_corners) "<corner1> <corner2> ..."
# set vars(<corner1>,library_set) <library_set> (previously defined)
# set vars(<corner1>,opcond) <opcond> (previously defined) (optional)
# set vars(<corner1>,rc_corner) library_set (previously defined)
###############################################################################
set vars(delay_corners)        "slow_max"
set vars(slow_max,library_set) "slow_libs"
set vars(slow_max,rc_corner)   "rc_max"

###############################################################################
# Define constraints modes ... 
# --------------------------------------------------------------------
# set vars(constraint_modes) "<mode1> <mode2> ..."
# set vars(<mode1>,pre_cts_sdc) <pre cts constraint file>
# set vars(<mode1>,post_cts_sdc) <post cts constraint file> (optional)
###############################################################################

set vars(constraint_modes)             "setup_func_mode"
set vars(setup_func_mode,pre_cts_sdc)  DATA/prects.sdc
set vars(setup_func_mode,incr_cts_sdc) DATA/postcts.sdc

###############################################################################
# Define analysis views ...
# --------------------------------------------------------------------
# set vars(setup_analysis_views) "<view1> <view2>"
# set vars(hold_analysis_views) "<view1> <view2>"
# set vars(<view1>,delay_corner) <delay corner>
# set vars(<view1>,constraint_mode) <constraint mode>
###############################################################################
set vars(setup_analysis_views)       "setup_func"
set vars(hold_analysis_views)        "setup_func"

set vars(setup_func,delay_corner)    "slow_max"
set vars(setup_func,constraint_mode) "setup_func_mode"

###############################################################################
# Define active setup and hold views and denote which are default
###############################################################################
set vars(default_setup_view) "setup_func"
set vars(default_hold_view)  "setup_func"
set vars(active_setup_views) "setup_func"
set vars(active_hold_views)  "setup_func"

###############################################################################
# Define derating factors for OCV here (clock and data). 
# Derating factors are applied per delay corner
###############################################################################
set vars(slow_max,data_cell_late)   1.03
set vars(slow_max,data_cell_early)  0.97
set vars(slow_max,data_net_late)    1.03
set vars(slow_max,data_net_early)   0.97
set vars(slow_max,clock_cell_late)  1.03
set vars(slow_max,clock_cell_early) 0.97
set vars(slow_max,clock_net_late)   1.03
set vars(slow_max,clock_net_early)  0.97

#######################################################################
# Distribution setup
# lsf, rsh, local, or custom
#######################################################################
#set vars(distribute)    custom
#set vars(custom,script) {/grid/sfi/farm/bin/gridsub -W 72:00 -P SOC7.1 -R "SFIARCH==OPT64 && OSREL==EE40" -q lnx64}
#set vars(lsf,queue)     lnx64
#set vars(lsf,resource)  "SFIARCH==OPT64 && OSREL==EE40"
#set vars(lsf,args)      "-W 72:00 -P SOC8.1"
set vars(threads)       3
set vars(hosts)         1
#set vars(rsh,hosts)     "xv40opt01 xv40opt01 xv40opt02 xv40opt02"

#set vars(mail,to) [list <login_id>]
#set vars(mail,steps) [list prects postcts postroute signoff]

puts "<FF> Finished loading setup.tcl"
