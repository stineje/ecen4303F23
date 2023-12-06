#######################################################
#                                                     
#  Innovus Command Logging File                     
#  Created on Fri Dec  1 16:56:53 2023                
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
restoreDesign DBS/init.enc.dat mult_alone
um::push_snapshot_stack
setDesignMode -process 130
setAnalysisMode -analysisType onChipVariation
setPlaceMode -place_global_place_io_pins false
place_opt_design -out_dir RPT -prefix place
setTieHiLoMode -cell {sky130_osu_sc_12T_ms__tiehi sky130_osu_sc_12T_ms__tielo}
setDontUse sky130_osu_sc_12T_ms__tiehi false
setDontUse sky130_osu_sc_12T_ms__tielo false
addTieHiLo
setDontUse sky130_osu_sc_12T_ms__tiehi true
setDontUse sky130_osu_sc_12T_ms__tielo true
um::pop_snapshot_stack
getOptMode -multiBitFlopOpt -quiet
um::get_metric_definition -name *.drc
um::get_metric_definition -name *.drc.layer:*
um::get_metric_definition -name *.drc.layer:*.type:*
um::get_metric_definition -name *.drc.type:*
um::get_metric_definition -name check.drc
um::get_metric_definition -name check.drc.antenna
um::get_metric_definition -name check.place.*
um::get_metric_definition -name clock.area.buffer
um::get_metric_definition -name clock.area.clkgate
um::get_metric_definition -name clock.area.inverter
um::get_metric_definition -name clock.area.logic
um::get_metric_definition -name clock.area.nonicg
um::get_metric_definition -name clock.area.total
um::get_metric_definition -name clock.area_distribution.buffer.base_cell:*
um::get_metric_definition -name clock.area_distribution.clkgate.base_cell:*
um::get_metric_definition -name clock.area_distribution.inverter.base_cell:*
um::get_metric_definition -name clock.area_distribution.logic.base_cell:*
um::get_metric_definition -name clock.area_distribution.nonicg.base_cell:*
um::get_metric_definition -name clock.buffer_depth_constraint.skew_group:*.*
um::get_metric_definition -name clock.capacitance.gate.leaf
um::get_metric_definition -name clock.capacitance.gate.top
um::get_metric_definition -name clock.capacitance.gate.trunk
um::get_metric_definition -name clock.capacitance.sink.*
um::get_metric_definition -name clock.capacitance.total.leaf
um::get_metric_definition -name clock.capacitance.total.top
um::get_metric_definition -name clock.capacitance.total.trunk
um::get_metric_definition -name clock.capacitance.wire.leaf
um::get_metric_definition -name clock.capacitance.wire.top
um::get_metric_definition -name clock.capacitance.wire.trunk
um::get_metric_definition -name clock.drv.nets.capacitance.*
um::get_metric_definition -name clock.drv.nets.capacitance.count
um::get_metric_definition -name clock.drv.nets.capacitance.max
um::get_metric_definition -name clock.drv.nets.fanout.*
um::get_metric_definition -name clock.drv.nets.fanout.count
um::get_metric_definition -name clock.drv.nets.fanout.max
um::get_metric_definition -name clock.drv.nets.length.*
um::get_metric_definition -name clock.drv.nets.length.count
um::get_metric_definition -name clock.drv.nets.length.max
um::get_metric_definition -name clock.drv.nets.remaining
um::get_metric_definition -name clock.drv.nets.resistance.*
um::get_metric_definition -name clock.drv.nets.resistance.count
um::get_metric_definition -name clock.drv.nets.resistance.max
um::get_metric_definition -name clock.drv.nets.unfixable
um::get_metric_definition -name clock.halo.clock_tree:*.count
um::get_metric_definition -name clock.halo.clock_tree:*.violations
um::get_metric_definition -name clock.instances.buffer
um::get_metric_definition -name clock.instances.buffer.creator.*
um::get_metric_definition -name clock.instances.clkgate
um::get_metric_definition -name clock.instances.inverter
um::get_metric_definition -name clock.instances.inverter.creator.*
um::get_metric_definition -name clock.instances.logic
um::get_metric_definition -name clock.instances.nonicg
um::get_metric_definition -name clock.instances.total
um::get_metric_definition -name clock.instances_distribution.buffer.base_cell:*
um::get_metric_definition -name clock.instances_distribution.clkgate.base_cell:*
um::get_metric_definition -name clock.instances_distribution.inverter.base_cell:*
um::get_metric_definition -name clock.instances_distribution.logic.base_cell:*
um::get_metric_definition -name clock.instances_distribution.nonicg.base_cell:*
um::get_metric_definition -name clock.latency.primary_reporting_skew_group.primary_half_corner.*
um::get_metric_definition -name clock.latency.skew_group:*.delay_corner:*.early.*
um::get_metric_definition -name clock.latency.skew_group:*.delay_corner:*.late.*
um::get_metric_definition -name clock.nets.length.leaf
um::get_metric_definition -name clock.nets.length.top
um::get_metric_definition -name clock.nets.length.total
um::get_metric_definition -name clock.nets.length.trunk
um::get_metric_definition -name clock.skew.primary_reporting_skew_group.primary_half_corner.*
um::get_metric_definition -name clock.skew.primary_reporting_skew_group.primary_half_corner.skew_band.*
um::get_metric_definition -name clock.skew.skew_group:*.delay_corner:*.early.gate
um::get_metric_definition -name clock.skew.skew_group:*.delay_corner:*.early.skew_band.*
um::get_metric_definition -name clock.skew.skew_group:*.delay_corner:*.early.target
um::get_metric_definition -name clock.skew.skew_group:*.delay_corner:*.early.target_met
um::get_metric_definition -name clock.skew.skew_group:*.delay_corner:*.early.total
um::get_metric_definition -name clock.skew.skew_group:*.delay_corner:*.early.wire
um::get_metric_definition -name clock.skew.skew_group:*.delay_corner:*.late.gate
um::get_metric_definition -name clock.skew.skew_group:*.delay_corner:*.late.skew_band.*
um::get_metric_definition -name clock.skew.skew_group:*.delay_corner:*.late.target
um::get_metric_definition -name clock.skew.skew_group:*.delay_corner:*.late.target_met
um::get_metric_definition -name clock.skew.skew_group:*.delay_corner:*.late.total
um::get_metric_definition -name clock.skew.skew_group:*.delay_corner:*.late.wire
um::get_metric_definition -name clock.stage_depth_constraint.*
um::get_metric_definition -name clock.transition.auto_target.delay_corner:*.early.clock_tree:*
um::get_metric_definition -name clock.transition.auto_target.delay_corner:*.late.clock_tree:*
um::get_metric_definition -name clock.transition.primary_half_corner.leaf.*.*
um::get_metric_definition -name clock.transition.primary_half_corner.leaf.*.max
um::get_metric_definition -name clock.transition.primary_half_corner.top.*.*
um::get_metric_definition -name clock.transition.primary_half_corner.top.*.max
um::get_metric_definition -name clock.transition.primary_half_corner.trunk.*.*
um::get_metric_definition -name clock.transition.primary_half_corner.trunk.*.max
um::get_metric_definition -name clock.transition.target.delay_corner:*.early.leaf.clock_tree:*
um::get_metric_definition -name clock.transition.target.delay_corner:*.early.top.clock_tree:*
um::get_metric_definition -name clock.transition.target.delay_corner:*.early.trunk.clock_tree:*
um::get_metric_definition -name clock.transition.target.delay_corner:*.late.leaf.clock_tree:*
um::get_metric_definition -name clock.transition.target.delay_corner:*.late.top.clock_tree:*
um::get_metric_definition -name clock.transition.target.delay_corner:*.late.trunk.clock_tree:*
um::get_metric_definition -name clock.transition.target.primary_half_corner.leaf.*
um::get_metric_definition -name clock.transition.target.primary_half_corner.top.*
um::get_metric_definition -name clock.transition.target.primary_half_corner.trunk.*
um::get_metric_definition -name design.area
um::get_metric_definition -name design.area.always_on
um::get_metric_definition -name design.area.blackbox
um::get_metric_definition -name design.area.buffer
um::get_metric_definition -name design.area.combinatorial
um::get_metric_definition -name design.area.hinst:*
um::get_metric_definition -name design.area.icg
um::get_metric_definition -name design.area.inverter
um::get_metric_definition -name design.area.io
um::get_metric_definition -name design.area.isolation
um::get_metric_definition -name design.area.latch
um::get_metric_definition -name design.area.level_shifter
um::get_metric_definition -name design.area.logical
um::get_metric_definition -name design.area.macro
um::get_metric_definition -name design.area.physical
um::get_metric_definition -name design.area.power_switch
um::get_metric_definition -name design.area.register
um::get_metric_definition -name design.area.std_cell
um::get_metric_definition -name design.area.vth:*
um::get_metric_definition -name design.area.vth:*.ratio
um::get_metric_definition -name design.blockages.place.area
um::get_metric_definition -name design.blockages.route.area
um::get_metric_definition -name design.blockages.route.area.layer:*
um::get_metric_definition -name design.congestion.hotspot.max
um::get_metric_definition -name design.congestion.hotspot.total
um::get_metric_definition -name design.density
um::get_metric_definition -name design.floorplan.image
um::get_metric_definition -name design.instances
um::get_metric_definition -name design.instances.always_on
um::get_metric_definition -name design.instances.blackbox
um::get_metric_definition -name design.instances.buffer
um::get_metric_definition -name design.instances.combinatorial
um::get_metric_definition -name design.instances.hinst:*
um::get_metric_definition -name design.instances.icg
um::get_metric_definition -name design.instances.inverter
um::get_metric_definition -name design.instances.io
um::get_metric_definition -name design.instances.isolation
um::get_metric_definition -name design.instances.latch
um::get_metric_definition -name design.instances.level_shifter
um::get_metric_definition -name design.instances.logical
um::get_metric_definition -name design.instances.macro
um::get_metric_definition -name design.instances.physical
um::get_metric_definition -name design.instances.power_switch
um::get_metric_definition -name design.instances.register
um::get_metric_definition -name design.instances.std_cell
um::get_metric_definition -name design.instances.vth:*
um::get_metric_definition -name design.instances.vth:*.ratio
um::get_metric_definition -name design.multibit.*
um::get_metric_definition -name design.name
um::get_metric_definition -name design.route.drc.image
um::get_metric_definition -name flow.cputime
um::get_metric_definition -name flow.cputime.total
um::get_metric_definition -name flow.last_child_snapshot
um::get_metric_definition -name flow.log
um::get_metric_definition -name flow.machine
um::get_metric_definition -name flow.machine.cpu.frequency
um::get_metric_definition -name flow.machine.cpu.model
um::get_metric_definition -name flow.machine.cpu.number
um::get_metric_definition -name flow.machine.hostname
um::get_metric_definition -name flow.machine.memory.free
um::get_metric_definition -name flow.machine.memory.total
um::get_metric_definition -name flow.machine.os
um::get_metric_definition -name flow.machine.swap.free
um::get_metric_definition -name flow.machine.swap.total
um::get_metric_definition -name flow.memory
um::get_metric_definition -name flow.memory.resident
um::get_metric_definition -name flow.memory.resident.peak
um::get_metric_definition -name flow.realtime
um::get_metric_definition -name flow.realtime.total
um::get_metric_definition -name flow.root_config
um::get_metric_definition -name flow.run_directory
um::get_metric_definition -name flow.run_tag
um::get_metric_definition -name flow.step.tcl
um::get_metric_definition -name flow.template.feature_enabled
um::get_metric_definition -name flow.template.type
um::get_metric_definition -name flow.tool_list
um::get_metric_definition -name flow.user
um::get_metric_definition -name messages
um::get_metric_definition -name name
um::get_metric_definition -name power
um::get_metric_definition -name power.clock
um::get_metric_definition -name power.hinst:*
um::get_metric_definition -name power.internal
um::get_metric_definition -name power.internal.hinst:*
um::get_metric_definition -name power.internal.type:*
um::get_metric_definition -name power.leakage
um::get_metric_definition -name power.leakage.hinst:*
um::get_metric_definition -name power.leakage.type:*
um::get_metric_definition -name power.switching
um::get_metric_definition -name power.switching.hinst:*
um::get_metric_definition -name power.switching.type:*
um::get_metric_definition -name route.drc
um::get_metric_definition -name route.drc.antenna
um::get_metric_definition -name route.drc.layer:*
um::get_metric_definition -name route.map.*
um::get_metric_definition -name route.overflow
um::get_metric_definition -name route.overflow.horizontal
um::get_metric_definition -name route.overflow.layer:*
um::get_metric_definition -name route.overflow.vertical
um::get_metric_definition -name route.shielding.*
um::get_metric_definition -name route.via
um::get_metric_definition -name route.via.layer:*
um::get_metric_definition -name route.via.multicut
um::get_metric_definition -name route.via.multicut.layer:*
um::get_metric_definition -name route.via.multicut.percentage
um::get_metric_definition -name route.via.singlecut
um::get_metric_definition -name route.via.singlecut.layer:*
um::get_metric_definition -name route.via.singlecut.percentage
um::get_metric_definition -name route.via.total
um::get_metric_definition -name route.wirelength
um::get_metric_definition -name timing.drv.max_cap.total
um::get_metric_definition -name timing.drv.max_cap.worst
um::get_metric_definition -name timing.drv.max_fanout.total
um::get_metric_definition -name timing.drv.max_fanout.worst
um::get_metric_definition -name timing.drv.max_length.total
um::get_metric_definition -name timing.drv.max_length.worst
um::get_metric_definition -name timing.drv.max_tran.total
um::get_metric_definition -name timing.drv.max_tran.worst
um::get_metric_definition -name timing.hold.feps
um::get_metric_definition -name timing.hold.feps.analysis_view:*
um::get_metric_definition -name timing.hold.feps.path_group:*
um::get_metric_definition -name timing.hold.feps.path_group:*.analysis_view:*
um::get_metric_definition -name timing.hold.feps.path_group:reg2reg
um::get_metric_definition -name timing.hold.histogram
um::get_metric_definition -name timing.hold.histogram.views
um::get_metric_definition -name timing.hold.pba.histogram
um::get_metric_definition -name timing.hold.pba.histogram.views
um::get_metric_definition -name timing.hold.tns
um::get_metric_definition -name timing.hold.tns.analysis_view:*
um::get_metric_definition -name timing.hold.tns.path_group:*
um::get_metric_definition -name timing.hold.tns.path_group:*.analysis_view:*
um::get_metric_definition -name timing.hold.tns.path_group:reg2reg
um::get_metric_definition -name timing.hold.wns
um::get_metric_definition -name timing.hold.wns.analysis_view:*
um::get_metric_definition -name timing.hold.wns.path_group:*
um::get_metric_definition -name timing.hold.wns.path_group:*.analysis_view:*
um::get_metric_definition -name timing.hold.wns.path_group:reg2reg
um::get_metric_definition -name timing.setup.feps
um::get_metric_definition -name timing.setup.feps.analysis_view:*
um::get_metric_definition -name timing.setup.feps.path_group:*
um::get_metric_definition -name timing.setup.feps.path_group:*.analysis_view:*
um::get_metric_definition -name timing.setup.feps.path_group:reg2reg
um::get_metric_definition -name timing.setup.histogram
um::get_metric_definition -name timing.setup.histogram.views
um::get_metric_definition -name timing.setup.pba.histogram
um::get_metric_definition -name timing.setup.pba.histogram.views
um::get_metric_definition -name timing.setup.tns
um::get_metric_definition -name timing.setup.tns.analysis_view:*
um::get_metric_definition -name timing.setup.tns.path_group:*
um::get_metric_definition -name timing.setup.tns.path_group:*.analysis_view:*
um::get_metric_definition -name timing.setup.tns.path_group:reg2reg
um::get_metric_definition -name timing.setup.type
um::get_metric_definition -name timing.setup.wns
um::get_metric_definition -name timing.setup.wns.analysis_view:*
um::get_metric_definition -name timing.setup.wns.path_group:*
um::get_metric_definition -name timing.setup.wns.path_group:*.analysis_view:*
um::get_metric_definition -name timing.setup.wns.path_group:reg2reg
um::get_metric_definition -name timing.si.glitches
um::get_metric_definition -name timing.si.noise
um::get_metric_definition -name transition.*
um::get_metric_definition -name transition.count
um::get_metric_definition -name transition.max
get_metric -raw -id current -uuid 1adca658-978e-40a8-b8d7-0b9379642428 clock.Routing.area.total
get_metric -raw -id current -uuid 1adca658-978e-40a8-b8d7-0b9379642428 clock.PostConditioning.area.total
get_metric -raw -id current -uuid 1adca658-978e-40a8-b8d7-0b9379642428 clock.eGRPC.area.total
get_metric -raw -id current -uuid 1adca658-978e-40a8-b8d7-0b9379642428 clock.Routing.area.total
get_metric -raw -id current -uuid 1adca658-978e-40a8-b8d7-0b9379642428 clock.Implementation.area.total
get_metric -raw -id current -uuid 1adca658-978e-40a8-b8d7-0b9379642428 clock.eGRPC.area.total
get_metric -raw -id current -uuid 1adca658-978e-40a8-b8d7-0b9379642428 clock.Construction.area.total
get_metric -raw -id current -uuid 1adca658-978e-40a8-b8d7-0b9379642428 clock.Implementation.area.total
get_metric -raw -id current -uuid ffe10ce0-1625-412f-b331-4a11825bb507 clock.Routing.area.total
get_metric -raw -id current -uuid ffe10ce0-1625-412f-b331-4a11825bb507 clock.PostConditioning.area.total
get_metric -raw -id current -uuid ffe10ce0-1625-412f-b331-4a11825bb507 clock.eGRPC.area.total
get_metric -raw -id current -uuid ffe10ce0-1625-412f-b331-4a11825bb507 clock.Routing.area.total
get_metric -raw -id current -uuid ffe10ce0-1625-412f-b331-4a11825bb507 clock.Implementation.area.total
get_metric -raw -id current -uuid ffe10ce0-1625-412f-b331-4a11825bb507 clock.eGRPC.area.total
get_metric -raw -id current -uuid ffe10ce0-1625-412f-b331-4a11825bb507 clock.Construction.area.total
get_metric -raw -id current -uuid ffe10ce0-1625-412f-b331-4a11825bb507 clock.Implementation.area.total
get_metric -raw -id current -uuid d726d74b-9291-4fbf-865f-732484065481 clock.Routing.area.total
get_metric -raw -id current -uuid d726d74b-9291-4fbf-865f-732484065481 clock.PostConditioning.area.total
get_metric -raw -id current -uuid d726d74b-9291-4fbf-865f-732484065481 clock.eGRPC.area.total
get_metric -raw -id current -uuid d726d74b-9291-4fbf-865f-732484065481 clock.Routing.area.total
get_metric -raw -id current -uuid d726d74b-9291-4fbf-865f-732484065481 clock.Implementation.area.total
get_metric -raw -id current -uuid d726d74b-9291-4fbf-865f-732484065481 clock.eGRPC.area.total
get_metric -raw -id current -uuid d726d74b-9291-4fbf-865f-732484065481 clock.Construction.area.total
get_metric -raw -id current -uuid d726d74b-9291-4fbf-865f-732484065481 clock.Implementation.area.total
get_metric -raw -id current -uuid ab700020-5b16-4de0-acff-f1ea9375cdb9 clock.Routing.area.total
get_metric -raw -id current -uuid ab700020-5b16-4de0-acff-f1ea9375cdb9 clock.PostConditioning.area.total
get_metric -raw -id current -uuid ab700020-5b16-4de0-acff-f1ea9375cdb9 clock.eGRPC.area.total
get_metric -raw -id current -uuid ab700020-5b16-4de0-acff-f1ea9375cdb9 clock.Routing.area.total
get_metric -raw -id current -uuid ab700020-5b16-4de0-acff-f1ea9375cdb9 clock.Implementation.area.total
get_metric -raw -id current -uuid ab700020-5b16-4de0-acff-f1ea9375cdb9 clock.eGRPC.area.total
get_metric -raw -id current -uuid ab700020-5b16-4de0-acff-f1ea9375cdb9 clock.Construction.area.total
get_metric -raw -id current -uuid ab700020-5b16-4de0-acff-f1ea9375cdb9 clock.Implementation.area.total
get_metric -raw -id current -uuid 6f96304e-23c9-4b15-9310-a2643eb27bc8 clock.Routing.area.total
get_metric -raw -id current -uuid 6f96304e-23c9-4b15-9310-a2643eb27bc8 clock.PostConditioning.area.total
get_metric -raw -id current -uuid 6f96304e-23c9-4b15-9310-a2643eb27bc8 clock.eGRPC.area.total
get_metric -raw -id current -uuid 6f96304e-23c9-4b15-9310-a2643eb27bc8 clock.Routing.area.total
get_metric -raw -id current -uuid 6f96304e-23c9-4b15-9310-a2643eb27bc8 clock.Implementation.area.total
get_metric -raw -id current -uuid 6f96304e-23c9-4b15-9310-a2643eb27bc8 clock.eGRPC.area.total
get_metric -raw -id current -uuid 6f96304e-23c9-4b15-9310-a2643eb27bc8 clock.Construction.area.total
get_metric -raw -id current -uuid 6f96304e-23c9-4b15-9310-a2643eb27bc8 clock.Implementation.area.total
get_metric -raw -id current -uuid fb34160b-b0d2-4a2a-ab29-1e9f0e66ca72 clock.Routing.area.total
get_metric -raw -id current -uuid fb34160b-b0d2-4a2a-ab29-1e9f0e66ca72 clock.PostConditioning.area.total
get_metric -raw -id current -uuid fb34160b-b0d2-4a2a-ab29-1e9f0e66ca72 clock.eGRPC.area.total
get_metric -raw -id current -uuid fb34160b-b0d2-4a2a-ab29-1e9f0e66ca72 clock.Routing.area.total
get_metric -raw -id current -uuid fb34160b-b0d2-4a2a-ab29-1e9f0e66ca72 clock.Implementation.area.total
get_metric -raw -id current -uuid fb34160b-b0d2-4a2a-ab29-1e9f0e66ca72 clock.eGRPC.area.total
get_metric -raw -id current -uuid fb34160b-b0d2-4a2a-ab29-1e9f0e66ca72 clock.Construction.area.total
get_metric -raw -id current -uuid fb34160b-b0d2-4a2a-ab29-1e9f0e66ca72 clock.Implementation.area.total
get_metric -raw -id current -uuid d13c0827-e5bb-48c8-99a1-1445ce5cfb62 clock.Routing.area.total
get_metric -raw -id current -uuid d13c0827-e5bb-48c8-99a1-1445ce5cfb62 clock.PostConditioning.area.total
get_metric -raw -id current -uuid d13c0827-e5bb-48c8-99a1-1445ce5cfb62 clock.eGRPC.area.total
get_metric -raw -id current -uuid d13c0827-e5bb-48c8-99a1-1445ce5cfb62 clock.Routing.area.total
get_metric -raw -id current -uuid d13c0827-e5bb-48c8-99a1-1445ce5cfb62 clock.Implementation.area.total
get_metric -raw -id current -uuid d13c0827-e5bb-48c8-99a1-1445ce5cfb62 clock.eGRPC.area.total
get_metric -raw -id current -uuid d13c0827-e5bb-48c8-99a1-1445ce5cfb62 clock.Construction.area.total
get_metric -raw -id current -uuid d13c0827-e5bb-48c8-99a1-1445ce5cfb62 clock.Implementation.area.total
get_metric -raw -id current -uuid deddd9df-6ffc-42ef-83e9-d80066971c44 clock.Routing.area.total
get_metric -raw -id current -uuid deddd9df-6ffc-42ef-83e9-d80066971c44 clock.PostConditioning.area.total
get_metric -raw -id current -uuid deddd9df-6ffc-42ef-83e9-d80066971c44 clock.eGRPC.area.total
get_metric -raw -id current -uuid deddd9df-6ffc-42ef-83e9-d80066971c44 clock.Routing.area.total
get_metric -raw -id current -uuid deddd9df-6ffc-42ef-83e9-d80066971c44 clock.Implementation.area.total
get_metric -raw -id current -uuid deddd9df-6ffc-42ef-83e9-d80066971c44 clock.eGRPC.area.total
get_metric -raw -id current -uuid deddd9df-6ffc-42ef-83e9-d80066971c44 clock.Construction.area.total
get_metric -raw -id current -uuid deddd9df-6ffc-42ef-83e9-d80066971c44 clock.Implementation.area.total
saveDesign DBS/place.enc -compress
saveNetlist DBS/LEC/place.v.gz
