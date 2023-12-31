#####################################################################
#                       SINGLE SCRIPT FLOW
#####################################################################

source FF/vars.tcl
source FF/procs.tcl

ff_procs::system_info
setDistributeHost -local
setMultiCpuUsage -localCpu 1


if {$vars(restore_design)} { restoreDesign DBS/route.enc.dat mult_pad }

um::enable_metrics -on
puts "<FF> Plugin -> always_source_tcl"


#-------------------------------------------------------------
set vars(step) postroute
set vars(postroute,start_time) [clock seconds]
um::push_snapshot_stack
#-------------------------------------------------------------

######################################################################
# Variables affecting this step:
#---------------------------------------------------------------------
# - vars(process)
######################################################################
# Additional variables for this step:
#---------------------------------------------------------------------
# - vars(power_effort) "low or high"
# - vars(postroute_extraction_effort)
# - vars(total_c_thresh)
# - vars(relative_c_thresh)
# - vars(coupling_c_thresh)
# - vars(qrc_layer_map)
# - vars(delay_cells)
# - vars(fix_hold_allow_tns_degradation)
# - vars(fix_hold_ignore_ios)
######################################################################
# The active analysis views are controlled by the following variables:
#---------------------------------------------------------------------
# - vars(postroute_hold,active_setup_views)
# - vars(postroute_hold,active_hold_views)
#
######################################################################
# set_analysis_view -setup $vars(postroute_hold,active_setup_views) -hold $vars(postroute_hold,active_hold_views)
#
setDesignMode -process 250
setExtractRCMode -engine postRoute
######################################################################
# Variables affecting this step:
#---------------------------------------------------------------------
# - vars(process)
# - vars(process)
# - vars(enable_cppr)
# - vars(enable_si_aware)
######################################################################
# Additional variables for this step:
#---------------------------------------------------------------------
# - vars(power_effort) "low or high"
# - vars(postroute_extraction_effort)
# - vars(total_c_thresh)
# - vars(relative_c_thresh)
# - vars(relative_c_thresh)
# - vars(qrc_layer_map)
# - vars(enable_ocv) "pre_postroute"
# - vars(enable_aocv) "true"
# - vars(enable_socv) "true"
######################################################################
# The active analysis views are controlled by the following variables:
#---------------------------------------------------------------------
# - vars(postroute,active_setup_views)
# - vars(postroute,active_hold_views)
#
######################################################################
# set_analysis_view -setup $vars(postroute,active_setup_views) -hold $vars(postroute,active_hold_views)
#
setDesignMode -process 250
setExtractRCMode -engine postRoute
setAnalysisMode -cppr none
setDelayCalMode -siAware true -engine aae
Puts "<FF> RUNNING POST-ROUTE OPTIMIZATION ..."
puts "<FF> Plugin -> pre_postroute_tcl"
puts "<FF> Plugin -> pre_postroute_hold_tcl"
optDesign -postRoute -outDir RPT -prefix postroute -setup -hold
puts "<FF> Plugin -> post_postroute_tcl"
#-------------------------------------------------------------


um::pop_snapshot_stack
create_snapshot -name postroute -categories design
report_metric -file RPT/metrics.html -format html
Puts "<FF> MAILING RESULTS TO james.stine@okstate.edu"
if {[file exists RPT/postroute.summary]} {
   exec /bin/mail -s "FF: mult_pad, postroute completed ([pwd])" < RPT/postroute.summary james.stine@okstate.edu
} elseif {[file exists RPT/postroute.summary.gz]} {
   exec gunzip -c RPT/postroute.summary.gz | /bin/mail \
      -s "FF: mult_pad, postroute completed ([pwd])" james.stine@okstate.edu
} else {
   exec /bin/mail -s "FF: mult_pad, postroute completed ([pwd])" < /dev/null james.stine@okstate.edu
}
saveDesign DBS/postroute.enc -compress
saveNetlist DBS/LEC/postroute.v.gz
if {[info exists env(VPATH)]} {exec /bin/touch $env(VPATH)/postroute}
ff_procs::report_time
puts "<FF> Plugin -> final_always_source_tcl"

exit
