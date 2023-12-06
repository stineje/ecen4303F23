#######################################################
#                                                     
#  Innovus Command Logging File                     
#  Created on Sat Dec  2 11:54:16 2023                
#                                                     
#######################################################

#@(#)CDS: Innovus v19.18-s072_1 (64bit) 04/08/2021 10:55 (Linux 2.6.32-431.11.2.el6.x86_64)
#@(#)CDS: NanoRoute 19.18-s072_1 NR210301-2308/19_18-UB (database version 18.20, 511.7.1) {superthreading v1.53}
#@(#)CDS: AAE 19.18-s017 (64bit) 04/08/2021 (Linux 2.6.32-431.11.2.el6.x86_64)
#@(#)CDS: CTE 19.18-s016_1 () Mar 23 2021 22:00:45 ( )
#@(#)CDS: SYNTECH 19.18-s008_1 () Mar 17 2021 22:55:16 ( )
#@(#)CDS: CPE v19.18-s025
#@(#)CDS: IQuantus/TQuantus 19.1.3-s268 (64bit) Mon Aug 10 22:57:12 PDT 2020 (Linux 2.6.32-431.11.2.el6.x86_64)

set_global _enable_mmmc_by_default_flow      $CTE::mmmc_default
suppressMessage ENCEXT-2799
getVersion
setDistributeHost -local
setMultiCpuUsage -localCpu 1
restoreDesign DBS/place.enc.dat mult_alone
um::push_snapshot_stack
setDesignMode -process 130
setAnalysisMode -cppr none
setNanoRouteMode -routeWithLithoDriven false
create_route_type -bottom_preferred_layer 1 -name met1
create_route_type -top_preferred_layer 5 -name met5
set_ccopt_property route_type met1
set_ccopt_property route_type met5
create_ccopt_clock_tree_spec
ccopt_design -outDir RPT -prefix cts
