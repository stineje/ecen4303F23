##################################################################################
#                              PRE_CTS PLUG-IN 
##################################################################################
#
# This plug-in script is called before clockDesign from the run_cts.tcl flow script.
#
##################################################################################

#setCTSMode -topPreferredLayer 7 \
#           -bottomPreferredLayer 3  \
#           -preferredExtraSpace 2
# for 3 metal LEF
create_route_type -bottom_preferred_layer 1 -name METAL1
create_route_type -top_preferred_layer 3 -name METAL3
set_ccopt_property route_type METAL1
set_ccopt_property route_type METAL3
setCTSMode -routeBottomPreferredLayer 1 -routeLeafBottomPreferredLayer 1 -routeTopPreferredLayer 3 -routeLeafTopPreferredLayer 3



