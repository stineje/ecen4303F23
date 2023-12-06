##########################################################################################
#                           CDNS INNOVUS FOUNDATION FLOW
#-----------------------------------------------------------------------------------------
# This is the foundation flow setup.tcl file.  It contains all the necessary information
# to run the Innovus digital implementation flow. 
##########################################################################################
set vars(script_root)      SCRIPTS
set vars(design_root)      [pwd]/..
set vars(plug_dir)         PLUG
set vars(dbs_dir)          DBS
set vars(rpt_dir)          RPT
set vars(flow)             mmmc
########################################################################################
# Define required design data ...
########################################################################################
set vars(design)           chip_top
set vars(netlist)          $vars(design_root)/DATA/chip_top_netlist.v
set vars(fp_file)          $vars(design_root)/DATA/lp_work_shop_design/0408/WORK/DBS/route.enc.dat/chip_top.fp.gz
#set vars(def_files)      "<def_files>"
#set vars(generate_tracks) <true or false>
#set vars(scan_def)        <scan_def>
set vars(cts_spec)         "$vars(design_root)/DATA/chip_top.ctstch"
set vars(scan_def)         $vars(design_root)/DATA/chip_top.scandef
set vars(io_file)          $vars(design_root)/DATA/chip_top.io
set vars(process)          65nm
set vars(max_route_layer)  9
########################################################################################
# Define lef files ...
########################################################################################
set vars(lef_files) "\
   $vars(design_root)/LIBS/STDCELL/LEF/stdcell65n_9lmT2.lef \
   $vars(design_root)/LIBS/STDCELL/LEF/stdcell65nhvt_9lmT2.lef \
   $vars(design_root)/LIBS/STDCELL/LEF/stdcell65nlvt_9lmT2.lef \
   $vars(design_root)/LIBS/STDCELL/LEF/stdcell65ncg_m9T2.lef \
   $vars(design_root)/LIBS/STDCELL/LEF/stdcell65nhvtcg_m9T2.lef \
   $vars(design_root)/LIBS/STDCELL/LEF/stdcell65nlvtcg_m9T2.lef \
   $vars(design_root)/LIBS/IO/LEF/iocell65n_9lm.lef \
   $vars(design_root)/LIBS/IO/LEF/antenna_9.lef \
   $vars(design_root)/LIBS/IO/LEF/dummy_analog_pad.lef \
   $vars(design_root)/LIBS/IO/LEF/bondpad_9lm.lef \
   $vars(design_root)/LIBS/RAMS_ROMS/LEF/memdp_512x36cm4sw1bk1.plef \
   $vars(design_root)/LIBS/RAMS_ROMS/LEF/memrom_512x32cm16.plef \
   $vars(design_root)/LIBS/RAMS_ROMS/LEF/memsp_2kx32cm8sw1bk2.plef \
   $vars(design_root)/LIBS/RAMS_ROMS/LEF/memsp_32kx32cm16sw1bk16.plef \
   $vars(design_root)/LIBS/RAMS_ROMS/LEF/memsp_32x128cm4sw1bk1.plef \
   $vars(design_root)/LIBS/RAMS_ROMS/LEF/memsp_4kx32cm8sw1bk4.plef \
   $vars(design_root)/LIBS/RAMS_ROMS/LEF/memsp_512x8cm4sw1bk1.plef \
   $vars(design_root)/LIBS/RAMS_ROMS/LEF/memsp_8kx32cm8sw1bk8.plef \
   $vars(design_root)/LIBS/ANALOG/PLL/LEF/PL0042.lef \
   $vars(design_root)/LIBS/ANALOG/LVDS/LEF/lvds.lef \
   $vars(design_root)/LIBS/IP/LEF/pso.lef \
   $vars(design_root)/LIBS/IP/LEF/Module_A.partition.lef \
   $vars(design_root)/LIBS/IP/LEF/Module_B.partition.lef \
   $vars(design_root)/LIBS/IP/LEF/Module_U.partition.lef \
   $vars(design_root)/LIBS/IP/LEF/Module_W.partition.lef \
"
########################################################################################
# Define library sets ...
# set vars(library_sets) <list of library sets>
# set vars(<set>,timing) <list of lib files>
# set vars(<set>,si) <list of cdb/udn files>
########################################################################################
set vars(library_sets) "0v864 2v5 1v320 3v3 1v056 1v080"
set vars(0v864,timing) "\
   $vars(design_root)/LIBS/STDCELL/LIBERTY/HVT/stdcell65nhvtwc0d720d72.lib \
   $vars(design_root)/LIBS/STDCELL/LIBERTY/LVT/stdcell65nlvtwc0d720d72.lib \
   $vars(design_root)/LIBS/STDCELL/LIBERTY/NVT/stdcell65nwc0d720d72.lib \
   $vars(design_root)/LIBS/STDCELL/LIBERTY/HVT/stdcell65nhvtwc0d72.lib \
   $vars(design_root)/LIBS/STDCELL/LIBERTY/LVT/stdcell65nlvtwc0d72.lib \
   $vars(design_root)/LIBS/STDCELL/LIBERTY/NVT/stdcell65nwc0d72.lib \
   $vars(design_root)/LIBS/STDCELL/LIBERTY/HVT_CG/stdcell65nhvtcgwc0d72.lib \
   $vars(design_root)/LIBS/STDCELL/LIBERTY/LVT_CG/stdcell65nlvtcgwc0d72.lib \
   $vars(design_root)/LIBS/STDCELL/LIBERTY/NVT_CG/stdcell65ncgwc0d72.lib \
   $vars(design_root)/LIBS/RAMS_ROMS/LIBERTY/WORST_0864/memdp_512x36cm4sw1bk1.lib \
   $vars(design_root)/LIBS/RAMS_ROMS/LIBERTY/WORST_0864/memrom_512x32cm16.lib \
   $vars(design_root)/LIBS/RAMS_ROMS/LIBERTY/WORST_0864/memsp_2kx32cm8sw1bk2.lib \
   $vars(design_root)/LIBS/RAMS_ROMS/LIBERTY/WORST_0864/memsp_4kx32cm8sw1bk4.lib \
   $vars(design_root)/LIBS/IO/LIBERTY/iocell65nwc_0864.lib \
   $vars(design_root)/LIBS/ANALOG/LVDS/LIBERTY/lvds_wc_0864.lib \
   $vars(design_root)/LIBS/IP/LIBERTY/pso_wc_0864.lib \
   $vars(design_root)/LIBS/IP/LIBERTY/Module_A_wc_0864.lib \
   $vars(design_root)/LIBS/IP/LIBERTY/Module_B_wc_0864.lib \
   $vars(design_root)/LIBS/IP/LIBERTY/Module_U_wc_0864.lib \
   $vars(design_root)/LIBS/IP/LIBERTY/Module_W_wc_0864.lib \
"
set vars(0v864,si) "\
   $vars(design_root)/LIBS/STDCELL/CDB/HVT/stdcell65nhvtwc0d72.cdb \
   $vars(design_root)/LIBS/STDCELL/CDB/HVT/stdcell65nhvtwc0d720d72.cdb \
   $vars(design_root)/LIBS/STDCELL/CDB/NVT/stdcell65nwc0d72.cdb \
   $vars(design_root)/LIBS/STDCELL/CDB/NVT/stdcell65nwc0d720d72.cdb \
   $vars(design_root)/LIBS/STDCELL/CDB/LVT/stdcell65nlvtwc0d72.cdb \
   $vars(design_root)/LIBS/STDCELL/CDB/LVT/stdcell65nlvtwc0d720d72.cdb \
   $vars(design_root)/LIBS/STDCELL/CDB/HVT_CG/stdcell65nhvtcgwc0d72.cdb \
   $vars(design_root)/LIBS/STDCELL/CDB/NVT_CG/stdcell65ncgwc0d72.cdb \
   $vars(design_root)/LIBS/STDCELL/CDB/LVT_CG/stdcell65nlvtcgwc0d72.cdb \
"
set vars(2v5,timing) "\
   $vars(design_root)/LIBS/IP/LIBERTY/Module_U.lib \
   $vars(design_root)/LIBS/STDCELL/LIBERTY/NVT/stdcell65nwc.lib \
"
set vars(1v320,timing) "\
   $vars(design_root)/LIBS/STDCELL/LIBERTY/LVT/stdcell65nlvtbc0d881d1.lib \
   $vars(design_root)/LIBS/STDCELL/LIBERTY/HVT/stdcell65nhvtbc0d881d1.lib \
   $vars(design_root)/LIBS/STDCELL/LIBERTY/NVT/stdcell65nbc0d881d1.lib \
   $vars(design_root)/LIBS/STDCELL/LIBERTY/HVT/stdcell65nhvtbc1d11d1.lib \
   $vars(design_root)/LIBS/STDCELL/LIBERTY/HVT/stdcell65nhvtbc.lib \
   $vars(design_root)/LIBS/STDCELL/LIBERTY/LVT/stdcell65nlvtbc.lib \
   $vars(design_root)/LIBS/STDCELL/LIBERTY/LVT/stdcell65nlvtbc1d11d1.lib \
   $vars(design_root)/LIBS/STDCELL/LIBERTY/NVT/stdcell65nbc.lib \
   $vars(design_root)/LIBS/STDCELL/LIBERTY/NVT/stdcell65nbc1d11d1.lib \
   $vars(design_root)/LIBS/STDCELL/LIBERTY/HVT_CG/stdcell65nhvtcgbc.lib \
   $vars(design_root)/LIBS/STDCELL/LIBERTY/LVT_CG/stdcell65nlvtcgbc.lib \
   $vars(design_root)/LIBS/STDCELL/LIBERTY/NVT_CG/stdcell65ncgbc.lib \
   $vars(design_root)/LIBS/RAMS_ROMS/LIBERTY/BEST_1320/memdp_512x36cm4sw1bk1.lib \
   $vars(design_root)/LIBS/RAMS_ROMS/LIBERTY/BEST_1320/memrom_512x32cm16.lib \
   $vars(design_root)/LIBS/RAMS_ROMS/LIBERTY/BEST_1320/memsp_2kx32cm8sw1bk2.lib \
   $vars(design_root)/LIBS/RAMS_ROMS/LIBERTY/BEST_1320/memsp_4kx32cm8sw1bk4.lib \
   $vars(design_root)/LIBS/IO/LIBERTY/iocell65nbc.lib \
   $vars(design_root)/LIBS/ANALOG/PLL/LIBERTY/PL0042.hvt_ff_1p32v_0c.lib \
   $vars(design_root)/LIBS/IP/LIBERTY/pso_bc_1320.lib \
   $vars(design_root)/LIBS/IP/LIBERTY/Module_A_bc_1320.lib \
   $vars(design_root)/LIBS/IP/LIBERTY/Module_B_bc_1320.lib \
   $vars(design_root)/LIBS/IP/LIBERTY/Module_U_bc_1320.lib \
"
set vars(1v320,si) "\
   $vars(design_root)/LIBS/STDCELL/CDB/HVT/stdcell65nhvtbc.cdb \
   $vars(design_root)/LIBS/STDCELL/CDB/HVT/stdcell65nhvtbc1d11d1.cdb \
   $vars(design_root)/LIBS/STDCELL/CDB/HVT/stdcell65nhvtbc0d881d1.cdb \
   $vars(design_root)/LIBS/STDCELL/CDB/NVT/stdcell65nbc.cdb \
   $vars(design_root)/LIBS/STDCELL/CDB/NVT/stdcell65nbc1d11d1.cdb \
   $vars(design_root)/LIBS/STDCELL/CDB/NVT/stdcell65nbc0d881d1.cdb \
   $vars(design_root)/LIBS/STDCELL/CDB/LVT/stdcell65nlvtbc.cdb \
   $vars(design_root)/LIBS/STDCELL/CDB/LVT/stdcell65nlvtbc1d11d1.cdb \
   $vars(design_root)/LIBS/STDCELL/CDB/LVT/stdcell65nlvtbc0d881d1.cdb \
   $vars(design_root)/LIBS/STDCELL/CDB/HVT_CG/stdcell65nhvtcgbc.cdb \
   $vars(design_root)/LIBS/STDCELL/CDB/NVT_CG/stdcell65ncgbc.cdb \
   $vars(design_root)/LIBS/STDCELL/CDB/LVT_CG/stdcell65nlvtcgbc.cdb \
   $vars(design_root)/LIBS/IO/CDB/iocell65nbc.cdb \
"
set vars(3v3,timing) "\
   $vars(design_root)/LIBS/IP/LIBERTY/Module_U.lib \
   $vars(design_root)/LIBS/STDCELL/LIBERTY/NVT/stdcell65nwc.lib \
"
set vars(1v056,timing) "\
   $vars(design_root)/LIBS/STDCELL/LIBERTY/HVT/stdcell65nhvtbc0d880d88.lib \
   $vars(design_root)/LIBS/STDCELL/LIBERTY/LVT/stdcell65nlvtbc0d880d88.lib \
   $vars(design_root)/LIBS/STDCELL/LIBERTY/NVT/stdcell65nbc0d880d88.lib \
   $vars(design_root)/LIBS/STDCELL/LIBERTY/HVT/stdcell65nhvtbc0d88.lib \
   $vars(design_root)/LIBS/STDCELL/LIBERTY/LVT/stdcell65nlvtbc0d88.lib \
   $vars(design_root)/LIBS/STDCELL/LIBERTY/NVT/stdcell65nbc0d88.lib \
   $vars(design_root)/LIBS/STDCELL/LIBERTY/HVT_CG/stdcell65nhvtcgbc0d88.lib \
   $vars(design_root)/LIBS/STDCELL/LIBERTY/LVT_CG/stdcell65nlvtcgbc0d88.lib \
   $vars(design_root)/LIBS/STDCELL/LIBERTY/NVT_CG/stdcell65ncgbc0d88.lib \
   $vars(design_root)/LIBS/RAMS_ROMS/LIBERTY/BEST_1056/memdp_512x36cm4sw1bk1.lib \
   $vars(design_root)/LIBS/RAMS_ROMS/LIBERTY/BEST_1056/memrom_512x32cm16.lib \
   $vars(design_root)/LIBS/RAMS_ROMS/LIBERTY/BEST_1056/memsp_2kx32cm8sw1bk2.lib \
   $vars(design_root)/LIBS/RAMS_ROMS/LIBERTY/BEST_1056/memsp_4kx32cm8sw1bk4.lib \
   $vars(design_root)/LIBS/IO/LIBERTY/iocell65nbc_1056.lib \
   $vars(design_root)/LIBS/ANALOG/LVDS/LIBERTY/lvds_bc_1056.lib \
   $vars(design_root)/LIBS/IP/LIBERTY/pso_bc_1056.lib \
   $vars(design_root)/LIBS/IP/LIBERTY/Module_A_bc_1056.lib \
   $vars(design_root)/LIBS/IP/LIBERTY/Module_B_bc_1056.lib \
   $vars(design_root)/LIBS/IP/LIBERTY/Module_U_bc_1056.lib \
   $vars(design_root)/LIBS/IP/LIBERTY/Module_W_bc_1056.lib \
"
set vars(1v056,si) "\
   $vars(design_root)/LIBS/STDCELL/CDB/HVT/stdcell65nhvtbc0d88.cdb \
   $vars(design_root)/LIBS/STDCELL/CDB/HVT/stdcell65nhvtbc0d880d88.cdb \
   $vars(design_root)/LIBS/STDCELL/CDB/LVT/stdcell65nlvtbc0d88.cdb \
   $vars(design_root)/LIBS/STDCELL/CDB/LVT/stdcell65nlvtbc0d880d88.cdb \
   $vars(design_root)/LIBS/STDCELL/CDB/NVT/stdcell65nbc0d88.cdb \
   $vars(design_root)/LIBS/STDCELL/CDB/NVT/stdcell65nbc0d880d88.cdb \
   $vars(design_root)/LIBS/STDCELL/CDB/HVT_CG/stdcell65nhvtcgbc0d88.cdb \
   $vars(design_root)/LIBS/STDCELL/CDB/NVT_CG/stdcell65ncgbc0d88.cdb \
   $vars(design_root)/LIBS/STDCELL/CDB/LVT_CG/stdcell65nlvtcgbc0d88.cdb \
"
set vars(1v080,timing) "\
   $vars(design_root)/LIBS/STDCELL/LIBERTY/HVT/stdcell65nhvtwc0d720d9.lib \
   $vars(design_root)/LIBS/STDCELL/LIBERTY/LVT/stdcell65nlvtwc0d720d9.lib \
   $vars(design_root)/LIBS/STDCELL/LIBERTY/NVT/stdcell65nwc0d720d9.lib \
   $vars(design_root)/LIBS/STDCELL/LIBERTY/HVT/stdcell65nhvtwc0d90d9.lib \
   $vars(design_root)/LIBS/STDCELL/LIBERTY/HVT/stdcell65nhvtwc.lib \
   $vars(design_root)/LIBS/STDCELL/LIBERTY/LVT/stdcell65nlvtwc.lib \
   $vars(design_root)/LIBS/STDCELL/LIBERTY/LVT/stdcell65nlvtwc0d90d9.lib \
   $vars(design_root)/LIBS/STDCELL/LIBERTY/NVT/stdcell65nwc0d90d9.lib \
   $vars(design_root)/LIBS/STDCELL/LIBERTY/NVT/stdcell65nwc.lib \
   $vars(design_root)/LIBS/STDCELL/LIBERTY/HVT_CG/stdcell65nhvtcgwc.lib \
   $vars(design_root)/LIBS/STDCELL/LIBERTY/LVT_CG/stdcell65nlvtcgwc.lib \
   $vars(design_root)/LIBS/STDCELL/LIBERTY/NVT_CG/stdcell65ncgwc.lib \
   $vars(design_root)/LIBS/RAMS_ROMS/LIBERTY/WORST_1080/memdp_512x36cm4sw1bk1.lib \
   $vars(design_root)/LIBS/RAMS_ROMS/LIBERTY/WORST_1080/memrom_512x32cm16.lib \
   $vars(design_root)/LIBS/RAMS_ROMS/LIBERTY/WORST_1080/memsp_2kx32cm8sw1bk2.lib \
   $vars(design_root)/LIBS/RAMS_ROMS/LIBERTY/WORST_1080/memsp_4kx32cm8sw1bk4.lib \
   $vars(design_root)/LIBS/IO/LIBERTY/iocell65nwc.lib \
   $vars(design_root)/LIBS/ANALOG/PLL/LIBERTY/PL0042.hvt_ss_1p08v_125c.lib \
   $vars(design_root)/LIBS/IP/LIBERTY/pso_wc_1080.lib \
   $vars(design_root)/LIBS/IP/LIBERTY/Module_A_wc_1080.lib \
   $vars(design_root)/LIBS/IP/LIBERTY/Module_B_wc_1080.lib \
   $vars(design_root)/LIBS/IP/LIBERTY/Module_U_wc_1080.lib \
"
set vars(1v080,si) "\
   $vars(design_root)/LIBS/STDCELL/CDB/HVT/stdcell65nhvtwc.cdb \
   $vars(design_root)/LIBS/STDCELL/CDB/HVT/stdcell65nhvtwc0d90d9.cdb \
   $vars(design_root)/LIBS/STDCELL/CDB/HVT/stdcell65nhvtwc0d720d9.cdb \
   $vars(design_root)/LIBS/STDCELL/CDB/NVT/stdcell65nwc.cdb \
   $vars(design_root)/LIBS/STDCELL/CDB/NVT/stdcell65nwc0d90d9.cdb \
   $vars(design_root)/LIBS/STDCELL/CDB/NVT/stdcell65nwc0d720d9.cdb \
   $vars(design_root)/LIBS/STDCELL/CDB/LVT/stdcell65nlvtwc.cdb \
   $vars(design_root)/LIBS/STDCELL/CDB/LVT/stdcell65nlvtwc0d90d9.cdb \
   $vars(design_root)/LIBS/STDCELL/CDB/LVT/stdcell65nlvtwc0d720d9.cdb \
   $vars(design_root)/LIBS/STDCELL/CDB/HVT_CG/stdcell65nhvtcgwc.cdb \
   $vars(design_root)/LIBS/STDCELL/CDB/NVT_CG/stdcell65ncgwc.cdb \
   $vars(design_root)/LIBS/STDCELL/CDB/LVT_CG/stdcell65nlvtcgwc.cdb \
   $vars(design_root)/LIBS/IO/CDB/iocell65nwc.cdb \
"
########################################################################################
# Define rc corners ...
# set vars(rc_corners) <list of rc corners>
# set vars(<rc_corner>,T) <temperature>
# set vars(<rc_corner>,cap_table) <cap table for corner>
########################################################################################
set vars(rc_corners)       "rc_min rc_max"
set vars(rc_min,T)          0
set vars(rc_min,cap_table) $vars(design_root)/LIBS/TECHNOLOGY/CAP_TABLES/cbest/cbest.CapTbl
set vars(rc_max,T)          125
set vars(rc_max,cap_table) $vars(design_root)/LIBS/TECHNOLOGY/CAP_TABLES/cworst/cworst.CapTbl
########################################################################################
# Optionally define QRC technology information
#---------------------------------------------------------------------------------------
# set vars(<rc_corner>,qx_tech_file) <qx_tech_file for corner>
# set vars(<rc_corner>,qx_lib_file) <qx_lib_file for corner>
# set vars(<rc_corner>,qx_conf_file) <qx_conf_file for corner>
########################################################################################
set vars(rc_min,qx_tech_file) $vars(design_root)/LIBS/TECHNOLOGY/TECH_FILES/QRC/cbest/qrcTechFile
set vars(rc_min,qx_conf_file) $vars(design_root)/DATA/min_qrc.conf
set vars(rc_max,qx_tech_file) $vars(design_root)/LIBS/TECHNOLOGY/TECH_FILES/QRC/cworst/qrcTechFile
set vars(rc_max,qx_conf_file) $vars(design_root)/DATA/max_qrc.conf
########################################################################################
# Scale factors are also optional but are strongly encouraged for 
# obtaining the best flow convergence and QoR.  Scaling factors
# are applied per rc corner
#---------------------------------------------------------------------------------------
# set vars(<rc_corner>,def_res_factor)     <pre-route resistance scale factor>
# set vars(<rc_corner>,def_clk_res_factor) <pre-route clock resistance scale factor>
# set vars(<rc_corner>,det_res_factor)     <post-route resistance scale factor>
# set vars(<rc_corner>,det_clk_res_factor) <post-route clock resistance scale factor>
# set vars(<rc_corner>,def_cap_factor)     <pre-route capacitance scale factor>
# set vars(<rc_corner>,def_clk_cap_factor) <pre-route clock capacitance scale factor>
# set vars(<rc_corner>,det_cap_factor)     <post-route capacitance scale factor>
# set vars(<rc_corner>,det_clk_cap_factor) <post-route clock capacitance scale factor>
# set vars(<rc_corner>,xcap_factor)        <post-route coupling capacitance scale factor>
########################################################################################
set vars(rc_min,def_res_factor)         1.0000
set vars(rc_min,def_clk_res_factor)     0.0000
set vars(rc_min,det_res_factor)         1.0000
set vars(rc_min,det_clk_res_factor)     0.0000
set vars(rc_min,def_cap_factor)         1.0000
set vars(rc_min,def_clk_cap_factor)     0.0000
set vars(rc_min,det_cap_factor)         1.0000
set vars(rc_min,det_clk_cap_factor)     0.0000
set vars(rc_min,xcap_factor)            1.0000

set vars(rc_max,def_res_factor)         0.9500
set vars(rc_max,def_clk_res_factor)     0.0000
set vars(rc_max,det_res_factor)         1.2700
set vars(rc_max,det_clk_res_factor)     0.0000
set vars(rc_max,def_cap_factor)         1.0900
set vars(rc_max,def_clk_cap_factor)     0.0000
set vars(rc_max,det_cap_factor)         1.1000
set vars(rc_max,det_clk_cap_factor)     1.0500
set vars(rc_max,xcap_factor)            1.5300

########################################################################################
# Define operating conditions (optional)
# set vars(opconds) <list of operating conditions>
# set vars(<opcond>,library_file) <library file >
# set vars(<opcond>,P) <process scale factor>
# set vars(<opcond>,V) <voltage>
# set vars(<opcond>,T) <temperature>
########################################################################################
########################################################################################
# Define delay corners ...
# set vars(delay_corners) <list of delay corners>
# set vars(<delay_corner>,library_set) <library_set> (previously defined)
# set vars(<delay_corner>,opcond) <opcond> (previously defined) (optional)
# set vars(<delay_corner>,rc_corner) library_set> (previously defined)
########################################################################################
set vars(delay_corners) "AVdefault_WC_dc AVdvfs2_BC_dc AVdefault_BC_dc AVdvfs2_WC_dc"
set vars(AVdefault_WC_dc,library_set)   1v080
set vars(AVdefault_WC_dc,rc_corner)     rc_max
set vars(AVdvfs2_BC_dc,library_set) 	1v056
set vars(AVdvfs2_BC_dc,rc_corner)     	rc_min
set vars(AVdefault_BC_dc,library_set) 	1v320
set vars(AVdefault_BC_dc,rc_corner) 	rc_min
set vars(AVdvfs2_WC_dc,library_set) 	0v864
set vars(AVdvfs2_WC_dc,rc_corner) 	    rc_max
########################################################################################
# Optionally define derating factors for OCV here (clock and data). 
# Derating factors are applied per delay corner
########################################################################################
#set vars(<delay_corner>,data_cell_late) <float>
#set vars(<delay_corner>,data_cell_early) <float>
#set vars(<delay_corner>,data_net_late) <float>
#set vars(<delay_corner>,data_net_early) <float>
#set vars(<delay_corner>,clock_cell_late) <float>
#set vars(<delay_corner>,clock_cell_early) <float>
#set vars(<delay_corner>,clock_net_late) <float>
#set vars(<delay_corner>,clock_net_early) <float>
set vars(AVdefault_WC_dc,data_cell_early)  0.97
set vars(AVdefault_WC_dc,data_cell_late)   1.03
set vars(AVdefault_WC_dc,clock_cell_early) 0.97
set vars(AVdefault_WC_dc,clock_cell_late)  1.03
set vars(AVdefault_WC_dc,data_net_early)   0.97
set vars(AVdefault_WC_dc,data_net_late)    1.03
set vars(AVdefault_WC_dc,clock_net_early)  0.97
set vars(AVdefault_WC_dc,clock_net_late)   1.03

set vars(AVdvfs2_WC_dc,data_cell_early)    0.97
set vars(AVdvfs2_WC_dc,data_cell_late)     1.03
set vars(AVdvfs2_WC_dc,clock_cell_early)   0.97
set vars(AVdvfs2_WC_dc,clock_cell_late)    1.03
set vars(AVdvfs2_WC_dc,data_net_early)     0.97
set vars(AVdvfs2_WC_dc,data_net_late)      1.03
set vars(AVdvfs2_WC_dc,clock_net_early)    0.97
set vars(AVdvfs2_WC_dc,clock_net_late)     1.03

set vars(AVdefault_BC_dc,data_cell_early)  0.97
set vars(AVdefault_BC_dc,data_cell_late)   1.03
set vars(AVdefault_BC_dc,clock_cell_early) 0.97
set vars(AVdefault_BC_dc,clock_cell_late)  1.03
set vars(AVdefault_BC_dc,data_net_early)   0.97
set vars(AVdefault_BC_dc,data_net_late)    1.03
set vars(AVdefault_BC_dc,clock_net_early)  0.97
set vars(AVdefault_BC_dc,clock_net_late)   1.03

set vars(AVdvfs2_BC_dc,data_cell_early)    0.97
set vars(AVdvfs2_BC_dc,data_cell_late)     1.03
set vars(AVdvfs2_BC_dc,clock_cell_early)   0.97
set vars(AVdvfs2_BC_dc,clock_cell_late)    1.03
set vars(AVdvfs2_BC_dc,data_net_early)     0.97
set vars(AVdvfs2_BC_dc,data_net_late)      1.03
set vars(AVdvfs2_BC_dc,clock_net_early)    0.97
set vars(AVdvfs2_BC_dc,clock_net_late)     1.03
########################################################################################
# Define constraint modes ... 
# set vars(constraint_modes) <list of constraint modes>
# set vars(<mode>,pre_cts_sdc) <pre cts constraint file>
# set vars(<mode>,post_cts_sdc) <post cts constraint file> (optional)
########################################################################################
set vars(constraint_modes)      "PMdefault PMdvfs2"
set vars(PMdefault,pre_cts_sdc) "$vars(design_root)/DATA/chip_top.sdc"
set vars(PMdvfs2,pre_cts_sdc)   "$vars(design_root)/DATA/chip_top_dvfs2.sdc"
########################################################################################
# Define setup and hold analysis views ... each analysis view requires
# a delay corner and a constraint mode
########################################################################################
set vars(AVdefault_WC,delay_corner)    AVdefault_WC_dc
set vars(AVdefault_WC,constraint_mode) PMdefault
set vars(AVdvfs2_WC,delay_corner)      AVdvfs2_WC_dc
set vars(AVdvfs2_WC,constraint_mode)   PMdvfs2
set vars(AVdefault_BC,delay_corner)    AVdefault_BC_dc
set vars(AVdefault_BC,constraint_mode) PMdefault
set vars(AVdvfs2_BC,delay_corner)      AVdvfs2_BC_dc
set vars(AVdvfs2_BC,constraint_mode)   PMdvfs2
########################################################################################
# EDIT/VERIFY THESE LISTS!!
########################################################################################
set vars(setup_analysis_views) "AVdefault_WC AVdvfs2_WC"
set vars(hold_analysis_views)  "AVdefault_BC AVdvfs2_BC"
########################################################################################
# Define active setup and hold analysis view lists and default views
########################################################################################
set vars(default_setup_view)   [lindex $vars(setup_analysis_views) 0]
set vars(default_hold_view)    [lindex $vars(hold_analysis_views) 0]
set vars(active_setup_views)   $vars(setup_analysis_views)
set vars(active_hold_views)    $vars(hold_analysis_views)

Puts "<FF> Finished loading setup.tcl file"
