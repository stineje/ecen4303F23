if {![namespace exists ::IMEX]} { namespace eval ::IMEX {} }
set ::IMEX::dataVar [file dirname [file normalize [info script]]]
set ::IMEX::libVar ${::IMEX::dataVar}/libs

create_library_set -name libs_tt\
   -timing\
    [list ${::IMEX::libVar}/mmmc/sky130_osu_sc_12T_ms_tt_1P80_25C.ccs.lib]
create_rc_corner -name rc_typ\
   -preRoute_res 1\
   -postRoute_res 1\
   -preRoute_cap 1\
   -postRoute_cap 1\
   -postRoute_xcap 1\
   -preRoute_clkres 0\
   -preRoute_clkcap 0\
   -T 25
create_delay_corner -name corner_tt\
   -library_set libs_tt\
   -rc_corner rc_typ
create_constraint_mode -name setup_func_mode\
   -sdc_files\
    [list ${::IMEX::dataVar}/mmmc/modes/setup_func_mode/setup_func_mode.sdc]
create_analysis_view -name hold_func -constraint_mode setup_func_mode -delay_corner corner_tt -latency_file ${::IMEX::dataVar}/mmmc/views/hold_func/latency.sdc
create_analysis_view -name setup_func -constraint_mode setup_func_mode -delay_corner corner_tt -latency_file ${::IMEX::dataVar}/mmmc/views/setup_func/latency.sdc
set_analysis_view -setup [list setup_func] -hold [list hold_func]
