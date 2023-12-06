####################################################################################
#                              POST-CTS PLUG-IN
#####################################################################################
#
# This plug-in script is called after clockDesign from the run_cts.tcl script.
# It can be used to adjust IO latencies, update to postcts clock uncertainties, etc.
#
#####################################################################################
set_interactive_constraint_modes [all_constraint_modes -active]
set_propagated_clock [all_clocks]
set_clock_propagation propagated
set_interactive_constraint_modes {}

set_interactive_constraint_modes {PMdefault}
source ../DATA/chip_top_propagated.sdc
set_interactive_constraint_modes {}

set_interactive_constraint_modes {PMdvfs2}
source ../DATA/chip_top_dvfs2_propagated.sdc
set_interactive_constraint_modes {}
