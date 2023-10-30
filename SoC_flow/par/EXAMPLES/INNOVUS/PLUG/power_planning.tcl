###########################################################################################
### Rings creations for Blocks and for power Domains
###########################################################################################

###########################################################################################
### Block Ring creation around the "UART" block on M4/M5
###########################################################################################
deselectAll
selectObject Module i_apb_subsystem/i_uart1

addRing \
   -spacing_bottom 1 \
   -width_left 3.2 \
   -width_bottom 3.2 \
   -width_top 3.2 \
   -width_right 3.2 \
   -spacing_top 1 \
   -layer_bottom M5 \
   -stacked_via_top_layer M5  \
   -around power_domain \
   -jog_distance 0.1 \
   -offset_bottom 0.3 \
   -layer_top M5 \
   -threshold 0.1 \
   -offset_left 0.3 \
   -spacing_right 1 \
   -spacing_left 1 \
   -type block_rings \
   -offset_right 0.3 \
   -offset_top 0.3 \
   -layer_right M4 \
   -nets {VDDuart VSSsoc VDDdvfs} \
   -stacked_via_bottom_layer M1 \
   -layer_left M4 \
   -snap_wire_center_to_grid Grid

deselectAll
 
###########################################################################################
### Block Ring creation around the PDw power domain on M4/M5
###########################################################################################
selectObject Group PDw 

addRing \
   -spacing_bottom 1.0 \
   -width_left 4 \
   -width_bottom 4 \
   -width_top 4 \
   -spacing_top 1.0 \
   -layer_bottom M5 \
   -stacked_via_top_layer M9 \
   -width_right 4 \
   -around power_domain \
   -jog_distance 0.1 \
   -offset_bottom 2 \
   -layer_top M5 \
   -threshold 0.1 \
   -offset_left 4 \
   -spacing_right 1.0 \
   -spacing_left 1.0 \
   -type block_rings \
   -offset_right 4 \
   -offset_top 4 \
   -layer_right M4 \
   -nets { VDDw VSSsoc VDDdvfs} \
   -stacked_via_bottom_layer M1 \
   -layer_left M4  \
   -snap_wire_center_to_grid Grid

deselectAll

###########################################################################################
### Block Ring creation around the PDwakeup power domain on M4/M5
###########################################################################################
selectObject Group PDwakeup 

addRing \
   -spacing_bottom 1.0 \
   -width_left 3.6 \
   -width_bottom 3.6 \
   -width_top 3.6 \
   -spacing_top 1.0 \
   -layer_bottom M5 \
   -stacked_via_top_layer M5 \
   -width_right 3.6 \
   -around power_domain \
   -jog_distance 0.1 \
   -offset_bottom 1 \
   -layer_top M5 \
   -threshold 0.1 \
   -offset_left 1 \
   -spacing_right 1.0 \
   -spacing_left 1.0 \
   -type block_rings \
   -offset_right 1 \
   -offset_top 1 \
   -layer_right M4 \
   -nets {VDDwake VSSsoc VDDdvfs} \
   -stacked_via_bottom_layer M1 \
   -layer_left M4  \
   -snap_wire_center_to_grid Grid

deselectAll

###########################################################################################
### Block Ring creation around the PLL macro on M4/M5
###########################################################################################
selectInst i_PLL

addRing \
   -spacing_bottom 1.5 \
   -width_left 4 \
   -width_bottom 4 \
   -width_top 10 \
   -spacing_top 3.0 \
   -layer_bottom M5 \
   -stacked_via_top_layer M9 \
   -width_right 4 \
   -around selected \
   -jog_distance 0.1 \
   -offset_bottom 56 \
   -layer_top M5 \
   -threshold 0.1 \
   -offset_left 60 \
   -spacing_right 1.5 \
   -spacing_left 1.5 \
   -type block_rings \
   -offset_right 4 \
   -offset_top 20 \
   -layer_right M4 \
   -nets {VDDpll VSSsoc} \
   -stacked_via_bottom_layer M1 \
   -layer_left M4 \
   -snap_wire_center_to_grid Grid

addRing \
   -spacing_bottom 1.5 \
   -width_left 5 \
   -width_bottom 5 \
   -snap_wire_center_to_grid Grid \
   -width_top 5 \
   -left 0 \
   -top 0 \
   -spacing_top 1.5 \
   -layer_bottom M5 \
   -stacked_via_top_layer M5 \
   -width_right 5 \
   -around selected \
   -jog_distance 0.1 \
   -offset_bottom 70 \
   -layer_top M5 \
   -threshold 0.1 \
   -right 0 \
   -offset_left 78 \
   -spacing_right 1.5 \
   -spacing_left 1.5 \
   -type block_rings \
   -offset_right 78 \
   -offset_top 78 \
   -layer_right M4 \
   -nets VDDdvfs \
   -stacked_via_bottom_layer M1 \
   -layer_left M4

deselectAll

###########################################################################################
### pad to ring connection for PDw power domain
###########################################################################################
createObstruct 241.000 1820.000 262.000 2126.000
createObstruct 743.000 2729.000 2035.000 2756.000

sroute \
   -noBlockPins \
   -noPadRings \
   -noCorePins \
   -noStripes \
   -padPinAllGeomsConnect \
   -targetViaTopLayer 5 \
   -crossoverViaTopLayer 5 \
   -padPinMaxLayer 2 \
   -straightConnections { straightWithDrcClean straightWithChanges } \
   -nets {VDDw} \
   -area { 185 185 2815 2815 }

selectObstruct 241.000 1820.000 262.000 2126.000 defObstructName
selectObstruct 743.000 2729.000 2035.00 2756.000 defObstructName
deleteSelectedFromFPlan 

###########################################################################################
### Block Pin to Ring connection for "WILD_SUBSYSTEM"
###########################################################################################
sroute \
   -blockPinRouteWithPinWidth \
   -noPadRings \
   -noCorePins \
   -noPadPins \
   -noStripes \
   -straightConnections { straightWithDrcClean } \
   -blockPinTarget { routeToRingOnly } \
   -nets { VDDw VSSsoc } \
   -blocks named \
   -blockNames { i_Module_W }

###########################################################################################
### pad to ring connection for PLL
###########################################################################################
sroute \
   -noBlockPins \
   -noPadRings \
   -noCorePins \
   -noStripes \
   -padPinAllGeomsConnect \
   -padPinMaxLayer 2 \
   -straightConnections { straightWithDrcClean straightWithChanges } \
   -nets {VDDpll} \
   -area { 185 185 2815 2815 }

###########################################################################################
### Block Pin to Ring connection for "PLL"
###########################################################################################
sroute \
   -blockPinRouteWithPinWidth \
   -noPadRings \
   -noCorePins \
   -noPadPins \
   -noStripes \
   -straightConnections { straightWithDrcClean } \
   -blockPinTarget { routeToRingOnly } \
   -nets { VDDpll VSSsoc } \
   -blocks named \
   -blockNames { i_PLL }


###########################################################################################
### Creation of core ring
###########################################################################################

###Adding Blockages over PLL to avoid wire editing 
createRouteBlk 2335.000 2216.900 2810.0400 2809.9800 \
   -layer 1 2 3 4 5 6 7 8 9

### Top level Core Ring creation on M4/M5
addRing \
   -spacing_bottom 2 \
   -width_left 11 \
   -width_bottom 11 \
   -snap_wire_center_to_grid Grid \
   -width_top 11 \
   -spacing_top 2 \
   -layer_bottom M5 \
   -stacked_via_top_layer M9 \
   -width_right 11 \
   -around core \
   -jog_distance 0.1 \
   -offset_bottom 2.5 \
   -layer_top M5 \
   -threshold 0.1 \
   -offset_left 2.5 \
   -spacing_right 2 \
   -spacing_left 2 \
   -offset_right 2.5 \
   -offset_top 2.5 \
   -layer_right M4 \
   -nets {VSSsoc VDDdvfs} \
   -stacked_via_bottom_layer M1 \
   -layer_left M4

selectRouteBlk 2335.0000 2216.9000 2810.0400 2809.9800 defLayerBlkName 4
deleteSelectedFromFPlan

### Pad to Core Ring connection for "VDDdvfs"
sroute \
   -noBlockPins \
   -noPadRings \
   -noCorePins \
   -noStripes \
   -padPinAllGeomsConnect \
   -padPinMaxLayer 2 \
   -straightConnections { straightWithDrcClean straightWithChanges } \
   -nets {VDDdvfs} \
   -area { 185 185 2815 2815 }

### Pad to Core Ring connection for "VSSsoc"
sroute \
   -noBlockPins \
   -noPadRings \
   -noCorePins \
   -noStripes \
   -padPinAllGeomsConnect \
   -padPinMaxLayer 2 \
   -straightConnections { straightWithDrcClean straightWithChanges } \
   -nets {VSSsoc} \
   -area { 185 185 2815 2815 }

createRouteBlk 2335.000 2216.900 2810.0400 2809.9800 \
   -layer 1 2 3 4 5 6 7 8 9

### Another set of Top level Core Ring creation on M4/M5
addRing \
   -spacing_bottom 2 \
   -width_left 11 \
   -width_bottom 11 \
   -snap_wire_center_to_grid Grid \
   -width_top 11 \
   -spacing_top 2 \
   -layer_bottom M5 \
   -stacked_via_top_layer M9 \
   -width_right 11 \
   -around core \
   -jog_distance 0.1 \
   -offset_bottom 28.5 \
   -layer_top M5 \
   -threshold 0.1 \
   -offset_left 28.5 \
   -spacing_right 2 \
   -spacing_left 2 \
   -offset_right 28.5 \
   -offset_top 28.5 \
   -layer_right M4 \
   -nets {VSSsoc VDDdvfs} \
   -stacked_via_bottom_layer M1 \
   -layer_left M4

### Trimming floating wire
editSelect \
   -type Special \
   -layers M4
editTrim \
   -selected
uiSetTool select

###########################################################################################
### Analog connections for PLL and PHY 
###########################################################################################

###Remove Blockage over PLL

selectRouteBlk 2335.0000 2216.9000 2810.0400 2809.9800 defLayerBlkName 4
deleteSelectedFromFPlan

### For PLL 

selectInst i_PLL

### Analog Power Ring creation for "PLL" block on M4
addRing \
   -spacing_bottom 2 \
   -width_left 5 \
   -width_bottom 5 \
   -width_top 5 \
   -left 0 \
   -top 0 \
   -spacing_top 2 \
   -layer_bottom M5 \
   -stacked_via_top_layer M5 \
   -width_right 5 \
   -around selected \
   -jog_distance 0.1 \
   -offset_bottom 20 \
   -bottom 0 \
   -layer_top M5 \
   -threshold 0.1 \
   -offset_left 20 \
   -spacing_right 2 \
   -spacing_left 2 \
   -type block_rings \
   -offset_right 20 \
   -offset_top 60 \
   -layer_right M4 \
   -nets {AGND1_H AGND0_H AVDD1_H AVDD0_H} \
   -stacked_via_bottom_layer M1 \
   -layer_left M4

deselectAll

### Analog Pad to Ring connection for "PLL" block
sroute \
   -noBlockPins \
   -noPadRings \
   -noCorePins \
   -noStripes \
   -padPinAllGeomsConnect \
   -targetViaTopLayer 5 \
   -crossoverViaTopLayer 5 \
   -straightConnections { straightWithDrcClean straightWithChanges } \
   -area { 2770.6795 2802.326 2817.8185 2631.3315 } \
   -nets { AGND1_H AGND0_H  AVDD1_H AVDD0_H } \
   -layerChangeTopLayer 4

### Analog Block Pin to Ring connection for "PLL" block
sroute \
   -blockPinRouteWithPinWidth \
   -noPadRings \
   -noCorePins \
   -noPadPins \
   -noStripes \
   -layerChangeBotLayer 4 \
   -crossoverViaBottomLayer 4 \
   -targetViaTopLayer 5 \
   -crossoverViaTopLayer 5 \
   -straightConnections { straightWithDrcClean straightWithChanges } \
   -targetViaBottomLayer 4 \
   -blockPinTarget { routeToRingOnly } \
   -nets { AGND1_H AGND0_H  AVDD1_H AVDD0_H } \
   -layerChangeTopLayer 5 \
   -blocks named \
   -blockNames { i_PLL }

deselectAll

### Trimming floating wire
editSelect \
   -nets {AGND1_H AGND0_H AVDD1_H AVDD0_H} \
   -type Special
editTrim \
   -selected
deselectAll
uiSetTool select

###Adding Blockages over PLL  

createRouteBlk 2335.000 2216.900 2810.0400 2809.9800 \
   -layer 1 2 3 4 5 6 7 8 9
selectInst i_Module_U
 
### Analog Power Ring creation for "PHY" block on M3
addRing \
   -spacing_bottom 0.4 \
   -width_left 6 \
   -width_bottom 0.4 \
   -snap_wire_center_to_grid Grid \
   -width_top 0.4 \
   -left 0 \
   -top 0 \
   -spacing_top 0.4 \
   -layer_bottom M1 \
   -stacked_via_top_layer M3 \
   -width_right 6 \
   -around shared_cluster \
   -jog_distance 0.1 \
   -offset_bottom 0.1 \
   -bottom 0 \
   -layer_top M1 \
   -threshold 0.1 \
   -offset_left 0.1 \
   -spacing_right 3 \
   -spacing_left 2 \
   -type block_rings \
   -offset_right 3 \
   -offset_top 0.1 \
   -layer_right M3 \
   -nets {vssa vdda33 vdda25} \
   -stacked_via_bottom_layer M1 \
   -layer_left M2

deselectAll

### Analog Pad to Block Ring connection for "PHY" block
sroute \
   -noBlockPins \
   -noPadRings \
   -noCorePins \
   -noStripes \
   -padPinAllGeomsConnect  \
   -targetViaTopLayer 3  \
   -crossoverViaTopLayer 3 \
   -straightConnections { straightWithDrcClean straightWithChanges } \
   -area { 2743.0 495.0 2818.3 600.6 } \
   -nets {vssa vdda33 vdda25}

deselectAll

### Block Analog "vssa" Pin to Ring connection for "PHY" block
sroute \
   -noPadRings \
   -noCorePins \
   -noPadPins \
   -noStripes \
   -blockSides {right} \
   -blockPinRouteWithPinWidth \
   -straightConnections { straightWithChanges } \
   -blockPinTarget { routeToRingOnly } \
   -nets { vssa } \
   -blocks named \
   -blockNames {i_Module_U} \
   -area {2753 258 2788 1074}

### Trimming floating wire
editSelect \
   -nets {vssa} \
   -layer {M3} \
   -type Special
editTrim \
   -selected
deselectAll
uiSetTool select

### Block Analog "vdda33" Pin to Ring connection for "PHY" block
sroute \
   -noPadRings \
   -noCorePins \
   -noPadPins \
   -noStripes \
   -blockSides {right} \
   -blockPinRouteWithPinWidth \
   -straightConnections { straightWithChanges } \
   -blockPinTarget { routeToRingOnly } \
   -nets { vdda33 } \
   -blocks named \
   -blockNames {i_Module_U } \
   -area {2753 258 2788 1074}

### Trimming floating wire
editSelect \
   -nets {vdda33} \
   -layer {M3} \
   -type Special
editTrim \
   -selected
deselectAll
uiSetTool select

### Block Analog "vdda25" Pin to Ring connection for "PHY" block
sroute \
   -noPadRings \
   -noCorePins \
   -noPadPins \
   -noStripes \
   -blockSides {right} \
   -blockPinRouteWithPinWidth \
   -straightConnections { straightWithChanges } \
   -blockPinTarget { routeToRingOnly } \
   -nets { vdda25 } \
   -blocks named \
   -blockNames { i_Module_U } \
   -area {2753 258 2788 1074} \
   -blockPinMinLayer 2

### Trimming floating wire
editSelect \
   -nets {vdda25} \
   -layer {M3} \
   -type Special
editTrim \
   -selected
deselectAll
uiSetTool select

### Top level Core Ring creation on M8/M9 
addRing \
   -spacing_bottom 2 \
   -width_left 11 \
   -width_bottom 11  \
   -width_top 11 \
   -spacing_top 2 \
   -layer_bottom M9 \
   -stacked_via_top_layer M9 \
   -width_right 11 \
   -around core \
   -jog_distance 0.1 \
   -offset_bottom 2.5 \
   -layer_top M9 \
   -threshold 0.1 \
   -offset_left 2.5 \
   -spacing_right 2 \
   -spacing_left 2 \
   -offset_right 2.5 \
   -offset_top 2.5 \
   -layer_right M8 \
   -nets {VSSsoc VDDdvfs} \
   -stacked_via_bottom_layer M8 \
   -layer_left M8

### Another set of Top level Core Ring creation on M8/M9 
addRing \
   -spacing_bottom 2 \
   -width_left 11 \
   -width_bottom 11 \
   -width_top 11 \
   -spacing_top 2 \
   -layer_bottom M9 \
   -stacked_via_top_layer M9 \
   -width_right 11 \
   -around core \
   -jog_distance 0.1 \
   -offset_bottom 28.5 \
   -layer_top M9 \
   -threshold 0.1 \
   -offset_left 28.5 \
   -spacing_right 2 \
   -spacing_left 2 \
   -offset_right 28.5 \
   -offset_top 28.5 \
   -layer_right M8 \
   -nets {VSSsoc VDDdvfs} \
   -stacked_via_bottom_layer M8 \
   -layer_left M8

##########################################################################
### Ring and stripe creation for PDrom power domain
##########################################################################

deselectAll

selectObject Group PDrom

setAddStripeOption \
   -extend_to_closest_target ring \
   -switch_cellname { CDN_RING_SW CDN_RING_FILLER }

### Block Ring creation around "PDROM" block on M4/M5
addRing \
   -spacing_bottom 0.5 \
   -width_left 1.5 \
   -width_bottom 1.5 \
   -width_top 1.5 \
   -spacing_top 0.5 \
   -layer_bottom M5 \
   -stacked_via_top_layer M5 \
   -width_right 1.5 \
   -around power_domain \
   -jog_distance 0.1 \
   -offset_bottom 1 \
   -layer_top M5 \
   -threshold 0.1 \
   -offset_left 1 \
   -spacing_right 0.5 \
   -spacing_left 0.5 \
   -type block_rings \
   -offset_right 0.5 \
   -offset_top 0.5 \
   -layer_right M4 \
   -nets {VDDrom VSSsoc} \
   -stacked_via_bottom_layer M1 \
   -layer_left M4  \
   -snap_wire_center_to_grid Grid

### Power Stripe creation for "PDROM" on M8
addStripe \
   -block_ring_top_layer_limit M9 \
   -max_same_layer_jog_length 0.8 \
   -over_power_domain 1 \
   -padcore_ring_bottom_layer_limit M4 \
   -set_to_set_distance 35 \
   -stacked_via_top_layer M9 \
   -padcore_ring_top_layer_limit M9 \
   -spacing 3 \
   -xleft_offset 13 \
   -xright_offset 1 \
   -merge_stripes_value 0.1 \
   -layer M8 \
   -block_ring_bottom_layer_limit M4 \
   -width 4.8 \
   -nets {VDDrom VSSsoc} \
   -stacked_via_bottom_layer M4 \
   -snap_wire_center_to_grid Grid 

deselectAll

### Add connections to ROM rings this will make better connections 

addStripe \
   -snap_wire_center_to_grid Grid \
   -set_to_set_distance 35 \
   -stacked_via_top_layer M5 \
   -spacing 1.6 \
   -xleft_offset 3 \
   -xright_offset 5 \
   -create_pins 0 \
   -layer M4 \
   -width 6.4 \
   -nets {VDDrom} \
   -stacked_via_bottom_layer M1 \
   -area {2404.045 1464.000 2713.000 1559.500} \
   -allow_jog_block_ring 0 \
   -allow_jog_padcore_ring 0

### Trimming floating wire
editSelect \
   -nets {VDDrom} \
   -layer M4 \
   -type Special
editTrim \
   -selected
deselectAll

##########################################################################
### PDsmc power domain stripe creation
##########################################################################

selectObject Group PDsmc

###  Vertical Power Stripe creation for "SMS" block on M4
addStripe \
   -block_ring_top_layer_limit M5 \
   -max_same_layer_jog_length 0.8 \
   -over_power_domain 1 \
   -padcore_ring_bottom_layer_limit M1 \
   -set_to_set_distance 70 \
   -skip_via_on_pin {} \
   -stacked_via_top_layer M5 \
   -padcore_ring_top_layer_limit M5 \
   -spacing 1.6 \
   -xleft_offset 0.905 \
   -xright_offset 10 \
   -merge_stripes_value 0.1 \
   -layer M4 \
   -block_ring_bottom_layer_limit M1 \
   -width 6.4 \
   -nets {VSSsoc VDDdvfs VDDsmc} \
   -stacked_via_bottom_layer M1 \
   -snap_wire_center_to_grid Grid

###  Horizontal Power Stripe creation for "SMS" block on M5
addStripe \
   -block_ring_top_layer_limit M5 \
   -max_same_layer_jog_length 0.8 \
   -over_power_domain 1 \
   -padcore_ring_bottom_layer_limit M1 \
   -set_to_set_distance 35 \
   -skip_via_on_pin {} \
   -stacked_via_top_layer M5 \
   -padcore_ring_top_layer_limit M5 \
   -spacing 1.6 \
   -merge_stripes_value 0.1 \
   -direction horizontal \
   -layer M5 \
   -block_ring_bottom_layer_limit M1 \
   -width 6.4 \
   -nets {VSSsoc VDDdvfs VDDsmc} \
   -stacked_via_bottom_layer M1 \
   -ytop_offset 2 \
   -ybottom_offset 6 \
   -snap_wire_center_to_grid Grid

deselectAll

##########################################################################
### PDuart power domain stripe creation
##########################################################################
selectObject Module i_apb_subsystem/i_uart1

### Vertical "VDDdvfs" Power Stripe creation for "UART" block on M4 to connect to PSO cells
addStripe \
   -block_ring_top_layer_limit M9 \
   -max_same_layer_jog_length 0.8 \
   -over_power_domain 1 \
   -padcore_ring_bottom_layer_limit M1 \
   -set_to_set_distance 70 \
   -skip_via_on_pin {} \
   -stacked_via_top_layer M9 \
   -padcore_ring_top_layer_limit M9 \
   -spacing 2 \
   -xleft_offset 20 \
   -merge_stripes_value 0.1 \
   -layer M4 \
   -block_ring_bottom_layer_limit M1 \
   -width 9.6 \
   -nets {VDDdvfs} \
   -stacked_via_bottom_layer M1 \
   -snap_wire_center_to_grid Grid

### Vertical Power Stripe creation for "UART" block on M4
addStripe \
   -block_ring_top_layer_limit M9 \
   -max_same_layer_jog_length 0.8 \
   -over_power_domain 1 \
   -padcore_ring_bottom_layer_limit M1 \
   -set_to_set_distance 70 \
   -skip_via_on_pin {} \
   -stacked_via_top_layer M9 \
   -padcore_ring_top_layer_limit M9 \
   -spacing 1.6 \
   -xleft_offset 36 \
   -merge_stripes_value 0.1 \
   -layer M4 \
   -block_ring_bottom_layer_limit M1 \
   -width 6.4 \
   -nets {VSSsoc VDDuart} \
   -stacked_via_bottom_layer M1 \
   -snap_wire_center_to_grid Grid

### Horizontal Power Stripe creation for "UART" block on M5
addStripe \
   -block_ring_top_layer_limit M5 \
   -max_same_layer_jog_length 0.8 \
   -over_power_domain 1 \
   -padcore_ring_bottom_layer_limit M1 \
   -set_to_set_distance 35 \
   -skip_via_on_pin {} \
   -stacked_via_top_layer M5 \
   -padcore_ring_top_layer_limit M5 \
   -spacing 1.6 \
   -merge_stripes_value 0.1 \
   -direction horizontal \
   -layer M5 \
   -block_ring_bottom_layer_limit M1 \
   -width 6.4 \
   -nets {VSSsoc VDDdvfs VDDuart} \
   -stacked_via_bottom_layer M1 \
   -ytop_offset 2 \
   -ybottom_offset 6 \
   -snap_wire_center_to_grid Grid

deselectAll

##########################################################################
### PDwakeup power domain stripe creation
##########################################################################
selectObject Group PDwakeup

### Vertical Power Stripe creation for "WAKEUP" block on M4
addStripe \
   -block_ring_top_layer_limit M5 \
   -max_same_layer_jog_length 0.8 \
   -over_power_domain 1 \
   -padcore_ring_bottom_layer_limit M1 \
   -set_to_set_distance 35 \
   -stacked_via_top_layer M5 \
   -padcore_ring_top_layer_limit M5 \
   -spacing 1.5 \
   -xleft_offset 0.905 \
   -xright_offset 1 \
   -merge_stripes_value 0.1 \
   -layer M4 \
   -block_ring_bottom_layer_limit M1 \
   -width 6.4 \
   -nets {VSSsoc VDDwake} \
   -stacked_via_bottom_layer M1 \
   -snap_wire_center_to_grid Grid 

deselectAll

### Top level strap creations with layers M4/M5

deselectAll
selectInst i_PLL

### Top level Horizontal Power Stripe creation on M5
addStripe \
   -extend_to design_boundary \
   -area_blockage { 262 266 262 1285 1965 1285 1965 917.8 1990.6 917.8 1990.6 266 } \
   -block_ring_top_layer_limit M5 \
   -max_same_layer_jog_length 0.8 \
   -snap_wire_center_to_grid Grid \
   -padcore_ring_bottom_layer_limit M1 \
   -set_to_set_distance 35 \
   -ybottom_offset 1 \
   -break_at_selected_blocks 1 \
   -stacked_via_top_layer M5 \
   -padcore_ring_top_layer_limit M5 \
   -spacing 1.6 \
   -merge_stripes_value 0.1 \
   -allow_jog_block_ring 0 \
   -create_pins 0 \
   -direction horizontal \
   -layer M5 \
   -block_ring_bottom_layer_limit M1 \
   -ytop_offset 5 \
   -width 6.4 \
   -nets {VSSsoc VDDdvfs} \
   -stacked_via_bottom_layer M1

createRouteBlk 244.000 2751.000 253.000 2756.000 \
   -layer 4

### Top level Vertical Power Stripe creation only in the Design Are on M4
addStripe \
   -block_ring_top_layer_limit M5 \
   -max_same_layer_jog_length 0.8 \
   -snap_wire_center_to_grid Grid \
   -padcore_ring_bottom_layer_limit M2 \
   -set_to_set_distance 35 \
   -break_at_selected_blocks 1 \
   -stacked_via_top_layer M5 \
   -padcore_ring_top_layer_limit M5 \
   -spacing 1.6 \
   -xleft_offset 1 \
   -xright_offset 5 \
   -merge_stripes_value 0.1 \
   -create_pins 0 \
   -layer M4 \
   -block_ring_bottom_layer_limit M4 \
   -width 6.4 \
   -nets {VSSsoc VDDdvfs} \
   -stacked_via_bottom_layer M1 \
   -area {245.000 245.000 2755.00 2755.000} \
   -area_blockage { 262 266 262 1285 1965 1285 1965 917.8 1990.6 917.8 1990.6 266 } \
   -allow_jog_block_ring 0 \
   -allow_jog_padcore_ring 0

deselectAll
selectRouteBlk 244.000 2751.000 253.000 2756.000 defLayerBlkName 4
deleteSelectedFromFPlan
deselectAll

### Top level Vertical Power Stripe creation only in the extended design boundary are on M6
addStripe \
   -extend_to design_boundary \
   -block_ring_top_layer_limit M5 \
   -max_same_layer_jog_length 0.8 \
   -snap_wire_center_to_grid Grid \
   -padcore_ring_bottom_layer_limit M5 \
   -set_to_set_distance 35 \
   -stacked_via_top_layer M9 \
   -padcore_ring_top_layer_limit M9 \
   -spacing 1.6 \
   -xleft_offset 1 \
   -xright_offset 5 \
   -merge_stripes_value 0.1 \
   -create_pins 0 \
   -layer M6 \
   -block_ring_bottom_layer_limit M4 \
   -width 6.4 \
   -nets {VSSsoc VDDdvfs} \
   -stacked_via_bottom_layer M5 \
   -area_blockage {245.000 260.400 2755.00 2740.500}

deselectAll

### Trimming floating wire
editSelect \
   -type Special \
   -layers M6
editTrim \
   -selected
deselectAll
uiSetTool select


deselectAll

### Top level Horizontal Power Stripe creation on M9
addStripe \
   -area { 193 245 2807 2755 } \
   -block_ring_top_layer_limit M9 \
   -max_same_layer_jog_length 0.8  \
   -snap_wire_center_to_grid Grid \
   -padcore_ring_bottom_layer_limit M5 \
   -set_to_set_distance 35 \
   -stacked_via_top_layer M9 \
   -padcore_ring_top_layer_limit M9 \
   -spacing 1.6 \
   -merge_stripes_value 0.1 \
   -direction horizontal \
   -layer M9 \
   -block_ring_bottom_layer_limit M5 \
   -width 6.4 \
   -nets {VSSsoc VDDdvfs} \
   -stacked_via_bottom_layer M5 \
   -allow_jog_block_ring 0 \
   -ytop_offset 18 \
   -ybottom_offset 18

deselectAll

### Add M4 straps b/w memories 
### M4/M5 power ring creation for memories this will help in reducing IR drop b/w memories 

selectInst i_D1TCM/i_sram_core_0
selectInst i_ITCM/i_sram_core
selectInst i_D0TCM/i_sram_core_0
selectInst i_D1TCM/i_sram_core_1
selectInst i_D0TCM/i_sram_core_1

selectInst i_sram_subsystem/i_2_sram_voltage_island/i_1_SRAM_2kx32_wrap/i_sram_core
selectInst i_sram_subsystem/i_1_sram_voltage_island/i_0_SRAM_2kx32_wrap/i_sram_core
selectInst i_sram_subsystem/i_2_sram_voltage_island/i_0_SRAM_2kx32_wrap/i_sram_core
selectInst i_sram_subsystem/i_1_sram_voltage_island/i_1_SRAM_2kx32_wrap/i_sram_core
selectInst i_sram_subsystem/i_2_sram_voltage_island/i_2_SRAM_2kx32_wrap/i_sram_core
selectInst i_sram_subsystem/i_0_sram_voltage_island/i_0_SRAM_2kx32_wrap/i_sram_core
selectInst i_sram_subsystem/i_1_sram_voltage_island/i_2_SRAM_2kx32_wrap/i_sram_core
selectInst i_sram_subsystem/i_0_sram_voltage_island/i_1_SRAM_2kx32_wrap/i_sram_core
selectInst i_sram_subsystem/i_1_sram_voltage_island/i_3_SRAM_2kx32_wrap/i_sram_core
selectInst i_sram_subsystem/i_0_sram_voltage_island/i_2_SRAM_2kx32_wrap/i_sram_core
selectInst i_sram_subsystem/i_3_sram_voltage_island/i_1_SRAM_2kx32_wrap/i_sram_core
selectInst i_sram_subsystem/i_0_sram_voltage_island/i_3_SRAM_2kx32_wrap/i_sram_core
selectInst i_sram_subsystem/i_2_sram_voltage_island/i_3_SRAM_2kx32_wrap/i_sram_core
selectInst i_sram_subsystem/i_3_sram_voltage_island/i_3_SRAM_2kx32_wrap/i_sram_core
selectInst i_sram_subsystem/i_3_sram_voltage_island/i_0_SRAM_2kx32_wrap/i_sram_core
selectInst i_sram_subsystem/i_3_sram_voltage_island/i_2_SRAM_2kx32_wrap/i_sram_core

createRouteBlk 597.500 1287.250 601.500 1291.000 \
   -layer 4

### Block Ring creation around above selected memories on M4/M5; This is done to improve IR drop and to avoid DRC's
addRing \
   -spacing_bottom 0.5 \
   -width_left 3 \
   -width_bottom 1.5 \
   -snap_wire_center_to_grid Grid \
   -width_top 1.5 \
   -left 0 \
   -spacing_top 0.5 \
   -layer_bottom M5 \
   -stacked_via_top_layer M9 \
   -width_right 3 \
   -around shared_cluster \
   -jog_distance 0.8 \
   -offset_bottom 0.1 \
   -bottom 0 \
   -layer_top M5 \
   -threshold 0.1 \
   -right 0 \
   -offset_left 0.1 \
   -spacing_right 1.0 \
   -spacing_left 1.0 \
   -type block_rings \
   -offset_right 0.1 \
   -offset_top 0.1 \
   -layer_right M4 \
   -nets {VSSsoc VDDdvfs} \
   -rectangle 1 \
   -stacked_via_bottom_layer M1 \
   -layer_left M4

deselectAll

selectRouteBlk 597.500 1287.250 601.500 1291.000 defLayerBlkName 4
deleteSelectedFromFPlan
deselectAll

### M8 routing blockage to avoid shorts b/w M8 Vs M4 on memory
### M8 vertical stripe creation, there is a short with via cross-over b/w M8/M4 b/w memories, as a work around routing blockage is placed

createRouteBlk 885.888 577.447 894.6395 593.892 \
   -layer 8

setAddStripeOption \
   -domain_offset_from_core 1
selectObject Group  PDdvfs
selectObject Group  PDw

### Top level Vertical Stripe creation on  M8
addStripe \
   -block_ring_top_layer_limit M9 \
   -max_same_layer_jog_length 0.8 \
   -over_power_domain 1 \
   -snap_wire_center_to_grid Grid \
   -padcore_ring_bottom_layer_limit M5 \
   -set_to_set_distance 35 \
   -stacked_via_top_layer M9 \
   -padcore_ring_top_layer_limit M9 \
   -spacing 1.6 \
   -xleft_offset 54 \
   -xright_offset 25 \
   -merge_stripes_value 0.1 \
   -layer M8 \
   -block_ring_bottom_layer_limit M5 \
   -width 6.4 \
   -nets {VSSsoc VDDdvfs} \
   -stacked_via_bottom_layer M5 \
   -allow_jog_block_ring 0 

deselectAll

selectRouteBlk 885.8900 577.4450 894.6400 593.8900 defLayerBlkName 8
deleteSelectedFromFPlan

deselectAll

### Trimming floating wire
editSelect \
   -type Special \
   -layers {M5 M8 M9}
editTrim \
   -selected
uiSetTool select
deselectAll

### VDDwake connection

### Vertical Stripe creation for "VDDwake" net of "WAKEUP" block on M4
addStripe \
   -area { 2750 1604 2763.600 1105.600 } \
   -block_ring_top_layer_limit M5 \
   -snap_wire_center_to_grid Grid \
   -set_to_set_distance 10 \
   -xleft_offset 2 \
   -stacked_via_top_layer M5 \
   -spacing 1.5 \
   -direction vertical \
   -layer M4 \
   -block_ring_bottom_layer_limit M4 \
   -width 8 \
   -nets {VDDwake} \
   -stacked_via_bottom_layer M1

createObstruct 2727.4815 1101.834 2755.7265 1138.149

### Pad to VDDwake stripe connection on M1/M2
sroute \
   -noBlockPins \
   -noPadRings \
   -noCorePins \
   -noStripes \
   -padPinAllGeomsConnect  \
   -targetViaTopLayer 5  \
   -crossoverViaTopLayer 5 \
   -straightConnections { straightWithDrcClean straightWithChanges } \
   -area { 2745.6 1145.5 2824.3 1104.6 } \
   -nets {VDDwake} \
   -layerChangeTopLayer 5 

### Horizontal Stripe which connects vertical VDDwake stripe to the Pads on M5
addStripe \
   -area { 2706.1 1595.795 2754.900 1605.795 } \
   -block_ring_top_layer_limit M5 \
   -snap_wire_center_to_grid Grid \
   -set_to_set_distance 10 \
   -ybottom_offset 1 \
   -stacked_via_top_layer M5 \
   -spacing 2.0 \
   -direction horizontal \
   -layer M5 \
   -block_ring_bottom_layer_limit M4 \
   -width 8 \
   -nets {VDDwake} \
   -stacked_via_bottom_layer M4

selectObstruct 2727.4000 1101.8000 2755.8000 1139.6000 defObstructName
deleteSelectedFromFPlan 

### Remove Blockage over PLL

selectRouteBlk 2335.0000 2216.9000 2810.0400 2809.9800 defLayerBlkName 4
deleteSelectedFromFPlan

clearDrc

### Below is a fix for DRCs 

uiSetTool select
editSelect \
   -type Special \
   -layers M4 \
   -direction V \
   -area 2439.005 1094.975 2716.32 1104.520 \
   -status {ROUTED FIXED}
editTrim \
   -selected
deselectAll
