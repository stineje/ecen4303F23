# ############################################################################ #
# Foundation Flow Codegen Vars Record
# Executed on 11:54:03 AM(Dec02) by user: jstine
# Copyright 2008-2012, Cadence Design Systems, Inc.
# All Rights Reserved
# ############################################################################ #

# This file contains all default (seeded) variables and user-defined variables that were resolved during code generation.
if {![info exists vars]} {
   global vars
}
global env
set env(VPATH) make
set vars(ff_exe_dir) "/home/jstine/ecen4303/ecen4303F23/SoC_sky130/par"
set vars(rundir) "/home/jstine/ecen4303/ecen4303F23/SoC_sky130/par"
set vars(script_dir) "FF"

set vars(plug_dir) "PLUG"


set vars(abort) {0}
set vars(abutted_design) {0}
set vars(active_hold_views) {hold_func}
set vars(active_setup_views) {setup_func}
set vars(activity_file_format) {TCF}
set vars(add_tracks) {true}
set vars(arg_list) {codegen edi flat makefile mode rc novus synth_flow rundir script_dir style user_mode verbose version}
set vars(argv) {cts}
set vars(backup_data) {0}
set vars(batch) {true}
set vars(black_box) {true}
set vars(bsteps) {cts}
set vars(budget_mode) {giga_opt}
set vars(captbl_file) {}
set vars(capture_metrics) {true}
set vars(catch_errors) {0}
set vars(ccopt_effort) {low}
set vars(ccopt_integration) {native}
set vars(cdb_file) {}
set vars(cdb_file,max) {}
set vars(cdb_file,min) {}
set vars(check_setup) {0}
set vars(check_setup_errors) {{Variable vars(rc_typ,cap_table) or vars(rc_typ,qx_tech_file) must be defined}}
set vars(codegen) {true}
set vars(config_files) {./setup.tcl ./innovus_config.tcl}
set vars(constraint_modes) {setup_func_mode}
set vars(corner_tt,library_set) {libs_tt}
set vars(corner_tt,rc_corner) {rc_typ}
set vars(cpf_isolation) {false}
set vars(cpf_keep_rows) {false}
set vars(cpf_level_shifter) {false}
set vars(cpf_power_domain) {false}
set vars(cpf_power_switch) {false}
set vars(cpf_state_retention) {false}
set vars(cpf_timing) {false}
set vars(cpus_per_remote_host) {1}
set vars(create_flexfiller_blockage) {false}
set vars(cts,time_design,skip) {true}
set vars(cts_cells) {sky130_osu_sc_12T_ms__inv_1 sky130_osu_sc_12T_ms__buf_1}
set vars(cts_engine) {ccopt}
set vars(custom_rundir_name_append) {}
set vars(cwd) {/home/jstine/ecen4303/ecen4303F23/SoC_sky130/par}
set vars(data_root) {../synth/mapped}
set vars(dbs_dir) {DBS}
set vars(dbs_format) {fe}
set vars(debug) {0}
set vars(default_hold_view) {hold_func}
set vars(default_setup_view) {setup_func}
set vars(delay_corners) {corner_tt}
set vars(design) {mult_alone}
set vars(design_root) {/home/jstine/ecen4303/ecen4303F23/SoC_sky130/par/../..}
set vars(dont_use_list) {}
set vars(eco_dir) {ECO}
set vars(edi) {false}
set vars(enable_aocv) {false}
set vars(enable_celtic_steps) {false}
set vars(enable_cppr) {none}
set vars(enable_flexilm) {false}
set vars(enable_nrgr) {false}
set vars(enable_ocv) {pre_place}
set vars(enable_pac) {true}
set vars(enable_pam) {false}
set vars(enable_qor_check) {false}
set vars(enable_rcp) {false}
set vars(enable_si_aware) {true}
set vars(enable_signoff_eco) {false}
set vars(enable_socv) {false}
set vars(enable_ss) {false}
set vars(error_count) {1}
set vars(execute_string) {/usr/bin/tclsh /home/jstine/ecen4303/ecen4303F23/SoC_sky130/par/SCRIPTS/gen_flow.tcl -m flat -d FF -v 16.1.0 -s . -y none -n cts}
set vars(fast_min,clock_cell_early) {1.00}
set vars(fast_min,clock_cell_late) {1.00}
set vars(fast_min,clock_net_early) {1.00}
set vars(fast_min,clock_net_late) {1.00}
set vars(fast_min,data_cell_early) {1.00}
set vars(fast_min,data_cell_late) {1.00}
set vars(fast_min,data_net_early) {1.00}
set vars(fast_min,data_net_late) {1.00}
set vars(fff_info_level) {0}
set vars(filler_cells) {sky130_osu_sc_12T_ms__fill_1 sky130_osu_sc_12T_ms__fill_2 sky130_osu_sc_12T_ms__fill_4 sky130_osu_sc_12T_ms__fill_8 sky130_osu_sc_12T_ms__fill_16}
set vars(fix_hold) {postcts postroute postroute_si}
set vars(fix_hold_ignore_ios) {false}
set vars(fix_litho) {false}
set vars(flat) {off}
set vars(flavor) {flat}
set vars(flexmodel_art_based) {true}
set vars(flexmodel_as_ptn) {1}
set vars(flexmodel_prototype) {false}
set vars(flexmodel_prototype_congestion_aware) {false}
set vars(flexmodel_prototype_flow_style) {top_to_bottom}
set vars(flexmodel_prototype_timing_aware) {false}
set vars(flexmodel_prototype_user_contraints) {user_constraints.txt}
set vars(flow) {mmmc}
set vars(flow_effort) {standard}
set vars(format_lines) {true}
set vars(freeze_vars) {false}
set vars(generate_flow_steps) {0}
set vars(generate_tracks) {true}
set vars(genus_config_tcl) {}
set vars(globbed) {true}
set vars(good_corners) {corner_tt}
set vars(ground_nets) {VSS}
set vars(hier_flow_type) {1pass}
set vars(high_timing_effort) {false}
set vars(hold_analysis_views) {setup_func}
set vars(hold_func,constraint_mode) {setup_func_mode}
set vars(hold_func,delay_corner) {corner_tt}
set vars(hosts) {1}
set vars(html_dir) {HTML}
set vars(html_summary) {RPT/summary.html}
set vars(ieee1801_isolation) {false}
set vars(ieee1801_keep_rows) {false}
set vars(ieee1801_level_shifter) {false}
set vars(ieee1801_power_domain) {false}
set vars(ieee1801_power_switch) {false}
set vars(ieee1801_state_retention) {false}
set vars(ieee1801_timing) {false}
set vars(ilm) {0}
set vars(ilm_list) {}
set vars(import_mode) {-treatUndefinedCellAsBbox 0 -keepEmptyModule 1 -useLefDef56 1 }
set vars(info_count) {1}
set vars(initialized) {1}
set vars(innovus_config_tcl) {./innovus_config.tcl}
set vars(insert_feedthrough) {1}
set vars(lef_files) {/programs/pdk/sky130_osu_sc_t12/sky130_osu_sc_12T.tlef /programs/pdk/sky130_osu_sc_t12/12T_ms/lef/sky130_osu_sc_12T_ms.lef}
set vars(library_root) {/programs/pdk/sky130_osu_sc_t12/12T_ms/lib}
set vars(library_sets) {libs_tt}
set vars(libs_tt,timing) {/programs/pdk/sky130_osu_sc_t12/12T_ms/lib/sky130_osu_sc_12T_ms_tt_1P80_25C.ccs.lib}
set vars(litho_driven_routing) {false}
set vars(loaded) {1}
set vars(local_cpus) {1}
set vars(log_dir) {LOG}
set vars(lp_config_tcl) {}
set vars(make) {cts}
set vars(make_browser) {netscape}
set vars(make_syn_tool) {genus}
set vars(make_syn_tool_args) {-64 -legacy_ui}
set vars(make_tool) {innovus}
set vars(make_tool_args) {-64 -nowin}
set vars(makefile) {false}
set vars(max_route_layer) {5}
set vars(metalfill) {false}
set vars(mode) {flat}
set vars(netlist) {../synth/mapped/mult_alone.vh}
set vars(netlist_type) {verilog}
set vars(novus) {false}
set vars(oa_abstract_name) {}
set vars(oa_design_cell) {}
set vars(oa_design_lib) {}
set vars(oa_design_view) {}
set vars(oa_layout_name) {}
set vars(orig_dbs_dir) {DBS}
set vars(orig_log_dir) {LOG}
set vars(orig_rpt_dir) {RPT}
set vars(pac_scratch_dir) {PAC_SCRATCH}
set vars(parent) {edi}
set vars(partition_dir) {PARTITION}
set vars(partition_dir_pass2) {PARTITION_CTS}
set vars(place,time_design,skip) {true}
set vars(place_io_pins) {false}
set vars(place_opt_design) {true}
set vars(placement_based_ptn) {0}
set vars(plugins) {pre_cts_tcl post_cts_tcl}
set vars(plugins_defined) {pre_init_tcl post_init_tcl pre_place_tcl pre_cts_tcl post_cts_tcl}
set vars(plugins_found) {pre_init_tcl post_init_tcl pre_place_tcl pre_cts_tcl post_cts_tcl}
set vars(post_cts_tcl) {PLUG/INNOVUS/post_cts.tcl}
set vars(post_init_tcl) {PLUG/INNOVUS/post_init.tcl}
set vars(postcts_setup_hold) {false}
set vars(postroute_setup_hold) {true}
set vars(power_analysis_view) {}
set vars(power_effort) {none}
set vars(power_nets) {VDD}
set vars(pre_cts_sdc) {/home/jstine/ecen4303/ecen4303F23/SoC_sky130/synth/mapped/mult_alone.sdc}
set vars(pre_cts_tcl) {PLUG/INNOVUS/pre_cts.tcl}
set vars(pre_init_tcl) {PLUG/INNOVUS/pre_init.tcl}
set vars(pre_place_tcl) {PLUG/INNOVUS/pre_place.tcl}
set vars(preroute_opt_design) {false}
set vars(proc_file) {1}
set vars(process) {130nm}
set vars(qxconf_file) {}
set vars(qxlayermap_file) {}
set vars(qxlib_file) {}
set vars(qxtech_file) {}
set vars(rc) {false}
set vars(rc_corners) {rc_typ}
set vars(rc_max,def_cap_factor) {1.09}
set vars(rc_max,def_clk_cap_factor) {1.00}
set vars(rc_max,def_clk_res_factor) {1.00}
set vars(rc_max,def_res_factor) {1.00}
set vars(rc_max,det_cap_factor) {1.00}
set vars(rc_max,det_clk_cap_factor) {1.00}
set vars(rc_max,det_clk_res_factor) {1.00}
set vars(rc_max,det_res_factor) {1.00}
set vars(rc_max,xcap_factor) {1.00}
set vars(rc_min,def_cap_factor) {1.00}
set vars(rc_min,def_res_factor) {1.00}
set vars(rc_min,det_cap_factor) {1.00}
set vars(rc_min,det_res_factor) {1.00}
set vars(rc_min,xcap_factor) {1.00}
set vars(rc_typ,T) {25}
set vars(remote_hosts) {0}
set vars(report_power) {false}
set vars(report_run_time) {true}
set vars(report_system_info) {true}
set vars(required_procs) {source_file system_info get_clock_ports report_time insert_welltaps_endcaps  save_results load_applet get_tool load_path_groups }
set vars(resize_shifter_and_iso_insts) {true}
set vars(restore_design) {1}
set vars(route,check_place,skip) {true}
set vars(route,time_design,skip) {true}
set vars(route_clock_nets) {true}
set vars(route_opt_design) {false}
set vars(rpt_dir) {RPT}
set vars(run_clp) {true}
set vars(run_lec) {true}
set vars(rundir_namechange_method) {suffix}
set vars(save_constraints) {0}
set vars(script_path) {/home/jstine/ecen4303/ecen4303F23/SoC_sky130/par/SCRIPTS}
set vars(script_root) {/home/jstine/ecen4303/ecen4303F23/SoC_sky130/par/SCRIPTS}
set vars(seed) {1}
set vars(setup_analysis_views) {hold_func}
set vars(setup_func,constraint_mode) {setup_func_mode}
set vars(setup_func,delay_corner) {corner_tt}
set vars(setup_func_mode,pre_cts_sdc) {/home/jstine/ecen4303/ecen4303F23/SoC_sky130/synth/mapped/mult_alone.sdc}
set vars(setup_path) {.}
set vars(setup_tcl) {./setup.tcl}
set vars(signoff_extraction_effort) {low}
set vars(skip_cts) {false}
set vars(skip_signoff_checks) {false}
set vars(slow_max,clock_cell_early) {1.00}
set vars(slow_max,clock_cell_late) {1.00}
set vars(slow_max,clock_net_early) {1.00}
set vars(slow_max,clock_net_late) {1.00}
set vars(slow_max,data_cell_early) {1.00}
set vars(slow_max,data_cell_late) {1.00}
set vars(slow_max,data_net_early) {1.00}
set vars(slow_max,data_net_late) {1.00}
set vars(sourced) {true}
set vars(step) {cts}
set vars(step_arg) {cts}
set vars(steps) {init place prects cts postcts postcts_hold route postroute postroute_hold signoff}
set vars(stop_step) {signoff}
set vars(style) {none}
set vars(superhosts) {0}
set vars(superthreads) {1}
set vars(synth_flow) {default_synthesis_flow_3step}
set vars(tdsp_core,pac_mode) {all}
set vars(threads) {1}
set vars(tie_cells) {sky130_osu_sc_12T_ms__tiehi sky130_osu_sc_12T_ms__tielo}
set vars(time_info_db) {RPT/time_info.db}
set vars(time_info_rpt) {RPT/time_info.rpt}
set vars(timelib) {}
set vars(timelib,max) {/programs/pdk/sky130_osu_sc_t12/12T_ms/lib/sky130_osu_sc_12T_ms_tt_1P80_25C.ccs.lib}
set vars(timelib,min) {/programs/pdk/sky130_osu_sc_t12/12T_ms/lib/sky130_osu_sc_12T_ms_tt_1P80_25C.ccs.lib}
set vars(top) {0}
set vars(top_cell) {mult_alone}
set vars(track_opt) {false}
set vars(uniquify_netlist) {1}
set vars(update_io_latency) {true}
set vars(use_flexmodels) {0}
set vars(use_proto_net_delay_model) {false}
set vars(user_comments) {0}
set vars(user_mode) {flat}
set vars(verbose) {false}
set vars(verify_litho) {false}
set vars(version) {16.1.0}
set vars(vpath) {make}
set vars(warning_count) {6}
set vars(restore_design) {true}
