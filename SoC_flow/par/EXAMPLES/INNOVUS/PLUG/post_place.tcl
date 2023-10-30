###################################################################################
#                             POST-PLACE PLUG-IN
###################################################################################
#
# This plug-in script is called after placeDesign from the run_place.tcl script.
#
# Example tasks include:
#          - standard cell rail creation 
#
###################################################################################
# 
# Standard cell rail creation for power domains if they are created/modified
# during the flow
# -----------------------------------------------------------------------------------

#sroute \
#   -noBlockPins \
#   -noPadRings \
#   -noPadPins \
#   -noStripes \
#   -straightConnections { straightWithDrcClean straightWithChanges } \
#   -nets { <p/g nets> } \
#   -powerDomains { <power domain> }  \
#   -targetViaTopLayer <layer> \
#   -crossoverViaTopLayer <layer> \
#   -verbose
######################################################################################
### standard cell rail creation
### Note: Before creating std. cell rails, user should check stack via limit from 
### tech. lef/DRC  rules based on this he has to pass proper values for 
### targetViaTopLayer/crossoverViaTopLayer
######################################################################################

### std. rails for PDuart power domain
sroute \
     -noBlockPins \
     -noPadRings \
     -noPadPins \
     -noStripes \
     -straightConnections { straightWithDrcClean straightWithChanges } \
     -nets { VDDuart VSSsoc } \
     -powerDomains { PDuart }  \
     -targetViaTopLayer 4 \
     -crossoverViaTopLayer 4 \
     -verbose

### std. rails for PDdvfs power domain
sroute \
       -noBlockPins \
       -noPadRings \
       -noPadPins \
       -noStripes \
       -straightConnections { straightWithDrcClean straightWithChanges } \
       -nets { VDDdvfs VSSsoc } \
       -powerDomains { PDdvfs }  \
       -targetViaTopLayer 4 \
       -crossoverViaTopLayer 4 \
       -verbose

editSelect -type Special -layers {M3 M4 M5 M7}  -nets {VDDdvfs VSSsoc} -shapes {COREWIRE} -status {ROUTED FIXED}

deleteSelectedFromFPlan

### std. rails for PDsmc power domain
sroute \
    -noBlockPins \
    -noPadRings \
    -noPadPins \
    -noStripes \
   -straightConnections { straightWithDrcClean straightWithChanges } \
   -nets { VDDsmc VSSsoc } \
   -powerDomains { PDsmc }  \
   -targetViaTopLayer 4 \
   -crossoverViaTopLayer 4 \
   -layerChangeTopLayer 4 \
   -verbose

### std. rails for PDwakeup power domain
sroute \
    -noBlockPins \
    -noPadRings \
    -noPadPins \
    -noStripes \
    -straightConnections { straightWithDrcClean straightWithChanges } \
    -nets { VDDwake VSSsoc } \
    -powerDomains { PDwakeup } \
    -targetViaTopLayer 4 \
    -crossoverViaTopLayer 4 \
    -layerChangeTopLayer 4 \
    -verbose

### std. rails for PDpll power domain
sroute \
     -noBlockPins \
     -noPadRings \
     -noPadPins \
     -noStripes \
     -straightConnections { straightWithDrcClean straightWithChanges } \
     -nets { VDDpll VSSsoc } \
     -powerDomains { PDpll }  \
     -targetViaTopLayer 4 \
     -crossoverViaTopLayer 4 \
     -layerChangeTopLayer 4 \
     -verbose


### Block Pin to connections for i_Module_U
selectInst i_Module_U

sroute \
     -noPadRings \
     -noCorePins \
     -noPadPins \
     -noStripes \
     -blockPin { allPins } \
     -blockPinMaxLayer 6 \
     -targetViaTopLayer 6 \
     -crossoverViaTopLayer 6 \
     -straightConnections { straightWithDrcClean } \
     -nets { VDDdvfs VSSsoc } \
     -msgRate 1 \
     -layerChangeTopLayer 6 \
     -blocks named \
     -blockNames { i_Module_U } \
     -verbose 

deselectAll

### Block Pin to connections for i_Module_B
selectInst i_Module_B

sroute \
     -noPadRings \
     -noCorePins \
     -noPadPins \
     -noStripes \
     -blockPin { allPins } \
     -blockPinMaxLayer 6 \
     -targetViaTopLayer 6 \
     -crossoverViaTopLayer 6 \
     -straightConnections { straightWithDrcClean } \
     -nets { VDDdvfs VSSsoc } \
     -msgRate 1 \
     -layerChangeTopLayer 6 \
     -blocks named \
     -blockNames { i_Module_B } \
     -verbose 


deselectAll

clearDrc

#####################################################################################
### Clean any DRC 
#####################################################################################

deselectAll
uiSetTool cutWire
editCutWire -x1 254.0005 -y1 1631.617 -x2 254.0005 -y2 1622.78
editCutWire -x1 2311.0735 -y1 1629.6475 -x2 2311.0735 -y2 1622.9375
uiSetTool select


deselectAll
selectWire 254.0000 1627.2350 2311.0750 1627.5650 1 VDDdvfs
deleteSelectedFromFPlan

deselectAll
editCutWire -x1 2350.025 -y1 2277.41 -x2 2350.025 -y2 2224.374
uiSetTool select
editSelect -type Special -nets {VDDpll VSSsoc} -layers M1 -direction H -area 2374.235 2224.315 2766.79 2278.2 -shapes {FOLLOWPIN COREWIRE} -status {ROUTED FIXED}
deleteSelectedFromFPlan

deselectAll

######################################################################################
### sroute creates spacing/short violations with M1 hook-up to the ring around SMS block,
### work around is deleting all M1 rows from cell blockage area around SMC block 
######################################################################################

deselectAll
setLayerPreference allM0 -isVisible 0
setLayerPreference allM1 -isVisible 1
setLayerPreference allM2 -isVisible 0
setLayerPreference allM3 -isVisible 0
setLayerPreference allM4 -isVisible 0
setLayerPreference allM5 -isVisible 0
setLayerPreference allM6 -isVisible 0
setLayerPreference allM7 -isVisible 0
setLayerPreference allM8 -isVisible 0
setLayerPreference allM9 -isVisible 0
setLayerPreference allM1Cont -isVisible 0
setLayerPreference allM2Cont -isVisible 0
setLayerPreference allM3Cont -isVisible 0
setLayerPreference allM4Cont -isVisible 0
setLayerPreference allM5Cont -isVisible 0
setLayerPreference allM6Cont -isVisible 0
setLayerPreference allM7Cont -isVisible 0
setLayerPreference allM8Cont -isVisible 0
setLayerPreference allM9Cont -isVisible 0
deselectAll

setLayerPreference inst -isVisible 0

deselectAll
windowSelect 263.911 1309.076 455.284 1565.786
windowToggleSelect 279.910 1324.698 440.067 1550.292
deleteSelectedFromFPlan
deselectAll
setLayerPreference inst -isVisible 1

setLayerPreference allM0 -isVisible 1
setLayerPreference allM1 -isVisible 1
setLayerPreference allM2 -isVisible 1
setLayerPreference allM3 -isVisible 1
setLayerPreference allM4 -isVisible 1
setLayerPreference allM5 -isVisible 1
setLayerPreference allM6 -isVisible 1
setLayerPreference allM7 -isVisible 1
setLayerPreference allM8 -isVisible 1
setLayerPreference allM9 -isVisible 1
setLayerPreference allM1Cont -isVisible 1
setLayerPreference allM2Cont -isVisible 1
setLayerPreference allM3Cont -isVisible 1
setLayerPreference allM4Cont -isVisible 1
setLayerPreference allM5Cont -isVisible 1
setLayerPreference allM6Cont -isVisible 1
setLayerPreference allM7Cont -isVisible 1
setLayerPreference allM8Cont -isVisible 1
setLayerPreference allM9Cont -isVisible 1

### Trim metal
editSelect -nets {VDDdvfs VSSsoc} -layer {M2 M4} -type Special
editTrim -selected
deselectAll

uiSetTool select
