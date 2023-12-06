##################################################################################
#                         PRE-PARTITION PLUG-IN 
##################################################################################
#
# This plug-in script is called before partitioning in the run_partition.tcl script.
#
# - Assign partition pins
# - Set pin-placement parameters for pin-assignment:
#     - pinDepth, to avoid min-area violations when 
#        DRC is run at the partition-level
#     - pinPitch and pin-layers set to single layer 
#       for each side (T/B/L/R)
# - Fix the pin locations after assignment
###############################################################################

set pin_depth(2) 0.4
set pin_depth(3) 0.4
set pin_depth(4) 0.4
set pin_depth(5) 0.4
set pin_depth(6) 1.5

set pin_spacing 2

set pin_layer(T) [list 2 4]
set pin_layer(B) [list 2 4]
set pin_layer(L) [list 3 5]
set pin_layer(R) [list 3 5]

foreach ptn $vars(partition_list) {
   foreach layer [list 2 3 4 5] {
      setLayerPinDepth -cell $ptn -layer $layer -depth $pin_depth($layer)
   }

   setMinPinSpacingOnEdge -cell $ptn -spacing $pin_spacing

   foreach edge "T B L R" {
      setAllowedPinLayersOnEdge -cell $ptn -edge $edge -layer $pin_layer($edge)
   }
}

assignPtnPin

setPtnPinStatus * * fixed

