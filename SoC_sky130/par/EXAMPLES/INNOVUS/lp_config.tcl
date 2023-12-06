##########################################################################################
# Low power configuration file overlay.  This file contains foundation flow variables
# that are specific to the LP/CPF flow and should be used in addition to the setup.tcl
##########################################################################################
#
##########################################################################################
#                           Placement Options
# ----------------------------------------------------------------------------------------
# set vars(resize_shifter_and_iso_insts) <true | false>
#
##########################################################################################
#                           Tie cell information
# ----------------------------------------------------------------------------------------
# The variable vars(tie_cells) is defined in the setup.tcl and is used to define a 
# "global" tie cell list. This list will be used by default for each power domain.
# It can be overridden for a given power domain by setting vars(<power_domain>,tie_cells).
# ----------------------------------------------------------------------------------------
 set vars(PDpll,tie_cells)	    "TIEH TIEL"
 set vars(PDw,tie_cells)	    "TIEH TIEL"
 set vars(PDrom,tie_cells)	    "TIEH TIEL"
 set vars(PDsmc,tie_cells)	    "TIEH TIEL"
 set vars(PDwakeup,tie_cells)	"TIEH TIEL"
 set vars(PD_3p3v,tie_cells)	"TIEH TIEL"
 set vars(PD_2p5v,tie_cells)	"TIEH TIEL"
 set vars(PDuart,tie_cells)	    "TIEH TIEL"
 set vars(PDdvfs,tie_cells)	    "TIEH TIEL"
#
##########################################################################################
#                         Filler cell information
# ----------------------------------------------------------------------------------------
# The variable vars(filler_cells) is defined in the setup.tcl and is used to define a 
# "global" filler cell list. This list will be used by default for each power domain.
# It can be overridden for a given power domain by setting vars(<power_domain>,filler_cells).
# ----------------------------------------------------------------------------------------
 set vars(PDpll,filler_cells) 	 "FILLER64 FILLER32 FILLER16 FILLER8 FILLER4 FILLER2 FILLER1"
 set vars(PDw,filler_cells)	     "FILLER64 FILLER32 FILLER16 FILLER8 FILLER4 FILLER2 FILLER1"
 set vars(PDrom,filler_cells) 	 "FILLER64 FILLER32 FILLER16 FILLER8 FILLER4 FILLER2 FILLER1"
 set vars(PDsmc,filler_cells) 	 "FILLER64 FILLER32 FILLER16 FILLER8 FILLER4 FILLER2 FILLER1"
 set vars(PDwakeup,filler_cells	 "FILLER64 FILLER32 FILLER16 FILLER8 FILLER4 FILLER2 FILLER1"
 set vars(PD_3p3v,filler_cells)	 "FILLER64 FILLER32 FILLER16 FILLER8 FILLER4 FILLER2 FILLER1"
 set vars(PD_2p5v,filler_cells)	 "FILLER64 FILLER32 FILLER16 FILLER8 FILLER4 FILLER2 FILLER1"
 set vars(PDuart,filler_cells)	 "FILLER64 FILLER32 FILLER16 FILLER8 FILLER4 FILLER2 FILLER1"
 set vars(PDdvfs,filler_cells)	 "FILLER64 FILLER32 FILLER16 FILLER8 FILLER4 FILLER2 FILLER1"
#
##########################################################################################
#                          Welltap cell information
# ----------------------------------------------------------------------------------------
# The variable vars(welltaps) is defined in the setup.tcl and is used to define a 
# "global" welltap cell list. This list will be used by default for each power domain.
# It can be overridden for a given power domain by setting vars(<power_domain>,welltaps).
# ----------------------------------------------------------------------------------------
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
# ----------------------------------------------------------------------------------------
# set vars(PDpll,welltaps) 		        <welltap cell list for <power_domain>>
# set vars(PDpll,welltaps,checkerboard)  <true or false>
# set vars(PDpll,welltaps,max_gap)       <max gap in microns>
# set vars(PDpll,welltaps,cell_interval) <cell interval in microns>
# set vars(PDpll,welltaps,row_offset)    <row offset in microns>
# set vars(PDpll,welltaps,verify_rule)   <verify rule distance>
# set vars(PDw,welltaps) 		        <welltap cell list for <power_domain>>
# set vars(PDw,welltaps,checkerboard)  <true or false>
# set vars(PDw,welltaps,max_gap)       <max gap in microns>
# set vars(PDw,welltaps,cell_interval) <cell interval in microns>
# set vars(PDw,welltaps,row_offset)    <row offset in microns>
# set vars(PDw,welltaps,verify_rule)   <verify rule distance>
# set vars(PDrom,welltaps) 		        <welltap cell list for <power_domain>>
# set vars(PDrom,welltaps,checkerboard)  <true or false>
# set vars(PDrom,welltaps,max_gap)       <max gap in microns>
# set vars(PDrom,welltaps,cell_interval) <cell interval in microns>
# set vars(PDrom,welltaps,row_offset)    <row offset in microns>
# set vars(PDrom,welltaps,verify_rule)   <verify rule distance>
# set vars(PDsmc,welltaps) 		        <welltap cell list for <power_domain>>
# set vars(PDsmc,welltaps,checkerboard)  <true or false>
# set vars(PDsmc,welltaps,max_gap)       <max gap in microns>
# set vars(PDsmc,welltaps,cell_interval) <cell interval in microns>
# set vars(PDsmc,welltaps,row_offset)    <row offset in microns>
# set vars(PDsmc,welltaps,verify_rule)   <verify rule distance>
# set vars(PDwakeup,welltaps) 		        <welltap cell list for <power_domain>>
# set vars(PDwakeup,welltaps,checkerboard)  <true or false>
# set vars(PDwakeup,welltaps,max_gap)       <max gap in microns>
# set vars(PDwakeup,welltaps,cell_interval) <cell interval in microns>
# set vars(PDwakeup,welltaps,row_offset)    <row offset in microns>
# set vars(PDwakeup,welltaps,verify_rule)   <verify rule distance>
# set vars(PD_3p3v,welltaps) 		        <welltap cell list for <power_domain>>
# set vars(PD_3p3v,welltaps,checkerboard)  <true or false>
# set vars(PD_3p3v,welltaps,max_gap)       <max gap in microns>
# set vars(PD_3p3v,welltaps,cell_interval) <cell interval in microns>
# set vars(PD_3p3v,welltaps,row_offset)    <row offset in microns>
# set vars(PD_3p3v,welltaps,verify_rule)   <verify rule distance>
# set vars(PD_2p5v,welltaps) 		        <welltap cell list for <power_domain>>
# set vars(PD_2p5v,welltaps,checkerboard)  <true or false>
# set vars(PD_2p5v,welltaps,max_gap)       <max gap in microns>
# set vars(PD_2p5v,welltaps,cell_interval) <cell interval in microns>
# set vars(PD_2p5v,welltaps,row_offset)    <row offset in microns>
# set vars(PD_2p5v,welltaps,verify_rule)   <verify rule distance>
# set vars(PDuart,welltaps) 		        <welltap cell list for <power_domain>>
# set vars(PDuart,welltaps,checkerboard)  <true or false>
# set vars(PDuart,welltaps,max_gap)       <max gap in microns>
# set vars(PDuart,welltaps,cell_interval) <cell interval in microns>
# set vars(PDuart,welltaps,row_offset)    <row offset in microns>
# set vars(PDuart,welltaps,verify_rule)   <verify rule distance>
# set vars(PDdvfs,welltaps) 		        <welltap cell list for <power_domain>>
# set vars(PDdvfs,welltaps,checkerboard)  <true or false>
# set vars(PDdvfs,welltaps,max_gap)       <max gap in microns>
# set vars(PDdvfs,welltaps,cell_interval) <cell interval in microns>
# set vars(PDdvfs,welltaps,row_offset)    <row offset in microns>
# set vars(PDdvfs,welltaps,verify_rule)   <verify rule distance>
#
##########################################################################################
#                          Endcap cell information
# ----------------------------------------------------------------------------------------
# The variables vars(pre_endcap) and vars(post_endcap) are set in the setup.tcl file and
# are used to define "global" endcap cells. These used by default for each power domain.
# They can be overridden for a given power domain setting vars(<power_domain>,pre_endcap)
# and/or vars(<power_domain>,post_endcap).
# ----------------------------------------------------------------------------------------
# set vars(PDpll,pre_endcap)     <pre endcap cell for <power_domain>>
# set vars(PDpll,post_endcap)    <post endcap cell for <power_domain>>
# set vars(PDw,pre_endcap)       <pre endcap cell for <power_domain>>
# set vars(PDw,post_endcap)      <post endcap cell for <power_domain>>
# set vars(PDrom,pre_endcap)     <pre endcap cell for <power_domain>>
# set vars(PDrom,post_endcap)    <post endcap cell for <power_domain>>
# set vars(PDsmc,pre_endcap)     <pre endcap cell for <power_domain>>
# set vars(PDsmc,post_endcap)    <post endcap cell for <power_domain>>
# set vars(PDwakeup,pre_endcap)  <pre endcap cell for <power_domain>>
# set vars(PDwakeup,post_endcap) <post endcap cell for <power_domain>>
# set vars(PD_3p3v,pre_endcap)   <pre endcap cell for <power_domain>>
# set vars(PD_3p3v,post_endcap)  <post endcap cell for <power_domain>>
# set vars(PD_2p5v,pre_endcap)   <pre endcap cell for <power_domain>>
# set vars(PD_2p5v,post_endcap)  <post endcap cell for <power_domain>>
# set vars(PDuart,pre_endcap)    <pre endcap cell for <power_domain>>
# set vars(PDuart,post_endcap)   <post endcap cell for <power_domain>>
# set vars(PDdvfs,pre_endcap)    <pre endcap cell for <power_domain>>
# set vars(PDdvfs,post_endcap)   <post endcap cell for <power_domain>>
#
##########################################################################################
#                            Always on net buffering
# ----------------------------------------------------------------------------------------
# By default SOCE does always-on-net synthesis for SRPG control signal and PSO enable 
# signals as part of optDesign -preCTS, but this can be manually done for specific nets if
# necessary.  To do this, define the following variables and uncomment the pre_prects.tcl
# plug-in template
# ----------------------------------------------------------------------------------------
set vars(always_on_buffers)            "AONBUFFD8 AONBUFFD4 AONBUFFD2"
# set vars(always_on_buffers)          <list of always on buffers>
# set vars(always_on_nets)             <list of always on nets>
# set vars(always_on_nets,max_fanout)  <max fanout limit for always on nets> (optional)
# set vars(always_on_nets,max_tran)    <max transition on always on nets> (optional)
# set vars(always_on_nets,max_skew)    <max skew for always on nets> (optional)
# set vars(always_on_nets,max_delay)   <max delay for always on nets> (optional)
# set vars(PDpll,always_on_buffers)    <buffers for <power domain>>
# set vars(PDw,always_on_buffers)      <buffers for <power domain>>
# set vars(PDrom,always_on_buffers)    <buffers for <power domain>>
# set vars(PDsmc,always_on_buffers)    <buffers for <power domain>>
# set vars(PDwakeup,always_on_buffers) <buffers for <power domain>>
# set vars(PD_3p3v,always_on_buffers)  <buffers for <power domain>>
# set vars(PD_2p5v,always_on_buffers)  <buffers for <power domain>>
# set vars(PDuart,always_on_buffers)   <buffers for <power domain>>
# set vars(PDdvfs,always_on_buffers)   <buffers for <power domain>>
#
##########################################################################################
#                      Secondary power/ground routing
# ----------------------------------------------------------------------------------------
# Automatic secondary power routing can be enabled the foundation flows by setting 
# vars(route_secondary_pg_nets) to true and providing cell pin pair information to
# identify the connections requiring routing (AONBUFFD1:TVDD LSL2HCD4:VDDL, e.g.) 
# ----------------------------------------------------------------------------------------
# set vars(route_secondary_pg_nets)         [true | false]
# set vars(secondary_pg,cell_pin_pairs)     <secondary power cell pin pair list>
# ----------------------------------------------------------------------------------------
#In addition, the following can optionally defined either globally or per p/g net
# ----------------------------------------------------------------------------------------
# set vars(secondary_pg,max_fanout)       	<max fanout for secondary power routing>
# set vars(secondary_pg,pattern)          	<secondary power routing pattern trunk | steiner>
# set vars(secondary_pg,non_default_rule) 	<non-default rule for secondary p/g/ routing>
# ----------------------------------------------------------------------------------------
# To optionally override for a given p/g net(s), use the vars(route_secondary_pg_nets) to 
# define the list of nets to be overridden and then override vars(<p/g net>,<option>)
# ----------------------------------------------------------------------------------------
# set vars(secondary_pg,nets)          	    <list of power/ground nets>
# set vars(<p/g_net>,max_fanout)       	    <max fanout>
# set vars(<p/g_net>,pattern)          	    <trunk | steiner>
# set vars(<p/g_net>,non_default_rule) 	    <non default rule>
set vars(route_secondary_pg_nets) true
set vars(secondary_pg,cell_pin_pairs) " \
   SRPGCSRD4HVT:TVDD SRPGCSRD2HVT:TVDD SRPGCSRD1HVT:TVDD SRPGCSD4HVT:TVDD  \
   SRPGCSD2HVT:TVDD SRPGCSD1HVT:TVDD SRPGCRD4HVT:TVDD SRPGCRD2HVT:TVDD  \
   SRPGCRD1HVT:TVDD SRPGCD4HVT:TVDD SRPGCD2HVT:TVDD SRPGCD1HVT:TVDD  \
   SRPGCSRD4LVT:TVDD SRPGCSRD2LVT:TVDD SRPGCSRD1LVT:TVDD SRPGCSD4LVT:TVDD  \
   SRPGCSD2LVT:TVDD SRPGCSD1LVT:TVDD SRPGCRD4LVT:TVDD SRPGCRD2LVT:TVDD  \
   SRPGCRD1LVT:TVDD SRPGCD4LVT:TVDD SRPGCD2LVT:TVDD SRPGCD1LVT:TVDD \
   SRPGCSRD4:TVDD SRPGCSRD2:TVDD SRPGCSRD1:TVDD SRPGCSD4:TVDD SRPGCSD2:TVDD  \
   SRPGCSD1:TVDD SRPGCRD4:TVDD SRPGCRD2:TVDD SRPGCRD1:TVDD SRPGCD4:TVDD  \
   SRPGCD2:TVDD SRPGCD1:TVDD AONBUFFD8HVT:TVDD AONBUFFD4HVT:TVDD AONBUFFD2HVT:TVDD  \
   AONBUFFD1HVT:TVDD AONBUFFD8LVT:TVDD AONBUFFD4LVT:TVDD AONBUFFD2LVT:TVDD AONBUFFD1LVT:TVDD \
   AONBUFFD8:TVDD AONBUFFD4:TVDD AONBUFFD2:TVDD AONBUFFD1:TVDD AONBUFFD8HVT:TVDD  \
   AONBUFFD4HVT:TVDD AONBUFFD2HVT:TVDD AONBUFFD1HVT:TVDD AONBUFFD8LVT:TVDD AONBUFFD4LVT:TVDD  \
   AONBUFFD2LVT:TVDD AONBUFFD1LVT:TVDD AONBUFFD8:TVDD AONBUFFD4:TVDD AONBUFFD2:TVDD AONBUFFD1:TVDD  \
   LSL2HCD8LVT:VDDL LSL2HCD4LVT:VDDL LSL2HCD2LVT:VDDL LSL2HCD1LVT:VDDL LSL2HCD8:VDDL  \
   LSL2HCD4:VDDL LSL2HCD2:VDDL LSL2HCD1:VDDL LSL2HD8LVT:VDDL LSL2HD4LVT:VDDL LSL2HD2LVT:VDDL \
   LSL2HD1LVT:VDDL LSL2HD8:VDDL LSL2HD4:VDDL LSL2HD2:VDDL LSL2HD1:VDDL \
"
set vars(secondary_pg,max_fanout)  1
set vars(secondary_pg,nets)        "VDDdvfs VDDw"
set vars(VDDdvfs,pattern)          trunk
set vars(VDDdvfs,max_fanout)       1
set vars(VDDw,pattern)             steiner
set vars(VDDw,max_fanout)          1
#
##########################################################################################
#                              runCLP options
# ----------------------------------------------------------------------------------------
# set vars(clp_options)  <options for runCLP>
# ----------------------------------------------------------------------------------------
#set vars(clp_options)  " -cmd ../DATA/chip_top_backend_clp.do -extraVlog ../DATA/dummy.v"
#
##########################################################################################
#              Modify power domains, row creation for power domains
# ----------------------------------------------------------------------------------------
# The foundation flows contain a sample post_init_tcl (PLUG/post_init.tcl) plug-in to do 
# power domain modification automatically based on the folloing variables:
# ----------------------------------------------------------------------------------------
# set vars(<domain>,bbox)          <llx lly urx ury>; bondary coordinates in microns
# set vars(<domain>,rs_exts)       <top bot left right>; distance in microns  
# set vars(<domain>,min_gaps)      <top bot left right>; distance in microns
# set vars(<domain>,module)        <power domain module name> (optional)
# set vars(<domain>,sites)         <list of site names for power domain> (optional)
# set vars(<domain>,site>,flip)    <true | false>; if true flip the 1st row for the site (optional)
# ----------------------------------------------------------------------------------------
set vars(PDsmc,bbox)        "280 1325 440 1550"
set vars(PDsmc,rs_exts)     "5 15 15 15"
set vars(PDsmc,min_gaps)    "5 15 15 15"
# ----------------------------------------------------------------------------------------
set vars(PDuart,bbox)       "490 1325 880 1525"
set vars(PDuart,rs_exts)    "20 20 20 20"
set vars(PDuart,min_gaps)   "15 15 15 15"
# ----------------------------------------------------------------------------------------
set vars(PDpll,bbox)        "2340 2225 2753 2753"
set vars(PDpll,rs_exts)     "15 15 12 15"
set vars(PDpll,min_gaps)    "15 15 12 15"
# ----------------------------------------------------------------------------------------
set vars(PDrom,bbox)        "2404.045 1475 2713 1550"
set vars(PDrom,rs_exts)     "15 15 15 15"
set vars(PDrom,min_gaps)    "15 15 15 15"
# ----------------------------------------------------------------------------------------
set vars(PDwakeup,bbox)     "2555 1580 2705 1630"
set vars(PDwakeup,rs_exts)  "15 15 15 15"
set vars(PDwakeup,min_gaps) "15 15 15 15"
# ----------------------------------------------------------------------------------------
set vars(PDw,bbox)          "263 1628 2307 2732"
set vars(PDw,rs_exts)       "5 5 5 5"
set vars(PDw,min_gaps)      "5 5 5 5"
#
##########################################################################################
#                           Power Shut-off Planning 
# ----------------------------------------------------------------------------------------
# The foundation flows contain a sample post_init_tcl (PLUG/post_init.tcl) plug-in to do 
# power switch insertion automatically based on the following information:
# ----------------------------------------------------------------------------------------
# set vars(<power_domain>,switchable)         <true | false>
# set vars(<power_domain>,switch_type)        <column | ring>
# set vars(<power_domain>,switch_cell)        <PSO cell name>
# set vars(<power_domain>,input_enable_pin)   <PSO cell input enable pin>
# set vars(<power_domain>,output_enable_pin)  <PSO cell output enable pin>
# set vars(<power_domain>,input_enable_net)   <PSO cell input enable net>
# set vars(<power_domain>,output_enable_net)  <PSO cell output enable net>
# set vars(<power_domain>,switch_instance)    <switchModuleInstance>
# set vars(<power_domain>,top_offset)         <top offset in microns>
# set vars(<power_domain>,bottom_offset)      <bottom offset in microns>
# set vars(<power_domain>,right_offset)       <right offset in microns>
# set vars(<power_domain>,left_offset)        <left offset in microns>
# ----------------------------------------------------------------------------------------
# Below variables are for column based pso implemetation
# ----------------------------------------------------------------------------------------
# set vars(<power_domain>,checker_board)      <true | false>
# set vars(<power_domain>,horizonal_pitch)    <in microns>
# set vars(<power_domain>,column_height)      <Switch cell column height in microns>
# set vars(<power_domain>,skip_rows)          <Number of rows to skip>
# set vars(<power_domain>,back_to_back_chain) <true|false>
# ... Connects the enableNetOut at the top of a column to the enableNetIn at the top of 
# ... the next column, and connects the enableNetOut at the bottom of the column to the 
# ... enableNetIn at the bottom of the next column
# ----------------------------------------------------------------------------------------
# Below variables are for ring based pso implemetation
# ----------------------------------------------------------------------------------------
# set vars(<power_domain>,top_ring)           <1|0>
# set vars(<power_domain>,bottom_ring)        <1|0>
# set vars(<power_domain>,right_ring)         <1|0>
# set vars(<power_domain>,left_ring)          <1|0>
# ... defines which side of the power domain to insert switches:
# ----------------------------------------------------------------------------------------
# set vars(<power_domain>,top_switch_cell)    <pso cell name>
# set vars(<power_domain>,bottom_switch_cell) <pso cell name>
# set vars(<power_domain>,left_switch_cell)   <pso cell name>
# set vars(<power_domain>,right_switch_cell)  <pso cell name>
# ... define pso cell name for each side of the power domain
# ----------------------------------------------------------------------------------------
# set vars(<power_domain>,top_filler_cell)    <filler cell name>
# set vars(<power_domain>,bottom_filler_cell) <filler cell name>
# set vars(<power_domain>,left_filler_cell)   <filler cell name>
# set vars(<power_domain>,right_filler_cell)  <filler cell name>
# set vars(<power_domain>,corner_cell_list)   <corner cell name>
# ... define filler cell name for each side of the power domain
# ----------------------------------------------------------------------------------------
# set vars(<power_domain>,top_switches)       <"<number> -distribute">
# set vars(<power_domain>,bottom_switches)    <"<number> -distribute">
# set vars(<power_domain>,left_switches)      <"<number> -distribute">
# set vars(<power_domain>,right_switches)     <"<number> -distribute">
# ... define the number of switches for each side of the power domain

### uart power domain column based pso implementation
set vars(PDuart,switchable)         true
set vars(PDuart,switch_type)        column
#set vars(PDuart,instance)           i_apb_subsystem/i_power_ctrl/pwr1_on_urt
set vars(PDuart,switch_instance)    i_apb_subsystem/i_uart1
set vars(PDuart,input_enable_pin)   PSOENIN
set vars(PDuart,output_enable_pin)  PSOENOUT
#set vars(PDuart,input_enable_net)   [get_object_name [all_connected $vars(PDuart,instance)]]
set vars(PDuart,input_enable_net)   i_apb_subsystem/n_805
set vars(PDuart,output_enable_net)  pduart_powered_off
set vars(PDuart,top_offset)         2
set vars(PDuart,bottom_offset)      60
set vars(PDuart,right_offset)       2
set vars(PDuart,left_offset)        20
set vars(PDuart,switch_cell)        HEADERD2
set vars(PDuart,checker_board)      true
set vars(PDuart,horizonal_pitch)    70
set vars(PDuart,column_height)      125
set vars(PDuart,skip_rows)          5
set vars(PDuart,back_to_back_chain) true

### PDsmc power domain ring based pso implementation
set vars(PDsmc,switchable)         true
set vars(PDsmc,switch_type)        ring
#set vars(PDsmc,instance)           i_apb_subsystem/i_power_ctrl/pwr1_on_smc
set vars(PDsmc,switch_instance)    i_apb_subsystem/i_smc
set vars(PDsmc,input_enable_pin)   PSOENIN
set vars(PDsmc,output_enable_pin)  PSOENOUT
#set vars(PDsmc,input_enable_net)   [get_object_name [all_connected $vars(PDsmc,instance)]]
set vars(PDsmc,input_enable_net)   i_apb_subsystem/n_799
set vars(PDsmc,output_enable_net)  pdsmc_powered_off
set vars(PDsmc,top_offset)         2
set vars(PDsmc,bottom_offset)      2
set vars(PDsmc,right_offset)       2
set vars(PDsmc,left_offset)        2
set vars(PDsmc,top_ring)           1
set vars(PDsmc,bottom_ring)        1
set vars(PDsmc,right_ring)         1
set vars(PDsmc,left_ring)          1
set vars(PDsmc,corner_cell_list)   CDN_RING_CORNER_UL
set vars(PDsmc,top_filler_cell)    CDN_RING_FILLER
set vars(PDsmc,bottom_filler_cell) CDN_RING_FILLER
set vars(PDsmc,left_filler_cell)   CDN_RING_FILLER
set vars(PDsmc,right_filler_cell)  CDN_RING_FILLER
set vars(PDsmc,top_switch_cell)    CDN_RING_SW
set vars(PDsmc,bottom_switch_cell) CDN_RING_SW
set vars(PDsmc,left_switch_cell)   CDN_RING_SW
set vars(PDsmc,right_switch_cell)  CDN_RING_SW
set vars(PDsmc,top_switches)       "4 -distribute"
set vars(PDsmc,bottom_switches)    "4 -distribute"
set vars(PDsmc,left_switches)      "4 -distribute"
set vars(PDsmc,right_switches)     "4 -distribute"

### PDrom power domain ring based pso implementation
set vars(PDrom,switchable)         true
set vars(PDrom,switch_type)        ring
#set vars(PDrom,instance)           i_apb_subsystem/i_power_ctrl/pwr1_on_rom
set vars(PDrom,switch_instance)    i_apb_subsystem 
set vars(PDrom,input_enable_pin)   PSOENIN
set vars(PDrom,output_enable_pin)  PSOENOUT
#set vars(PDrom,input_enable_net)   [get_object_name [all_connected $vars(PDrom,instance)]]
set vars(PDrom,input_enable_net)  i_apb_subsystem/UNCONNECTED652  
set vars(PDrom,output_enable_net)  pdrom_powered_off
set vars(PDrom,top_offset)         2
set vars(PDrom,bottom_offset)      2
set vars(PDrom,right_offset)       2
set vars(PDrom,left_offset)        2
set vars(PDrom,top_ring)           1
set vars(PDrom,bottom_ring)        1
set vars(PDrom,right_ring)         1
set vars(PDrom,left_ring)          1
set vars(PDrom,corner_cell_list)   CDN_RING_CORNER_UL
set vars(PDrom,top_filler_cell)    CDN_RING_FILLER
set vars(PDrom,bottom_filler_cell) CDN_RING_FILLER
set vars(PDrom,left_filler_cell)   CDN_RING_FILLER
set vars(PDrom,right_filler_cell)  CDN_RING_FILLER
set vars(PDrom,top_switch_cell)    CDN_RING_SW
set vars(PDrom,bottom_switch_cell) CDN_RING_SW
set vars(PDrom,left_switch_cell)   CDN_RING_SW
set vars(PDrom,right_switch_cell)  CDN_RING_SW
set vars(PDrom,top_switches)       "25 -distribute"
set vars(PDrom,bottom_switches)    "25 -distribute"
set vars(PDrom,left_switches)      "10 -distribute"
set vars(PDrom,right_switches)     "10 -distribute"
#
