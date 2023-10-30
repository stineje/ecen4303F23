##################################################################################
#                         PRE-ASSIGNPIN PLUG-IN 
##################################################################################
#
# This example plug-in script should be  called before invoking assignPtnPin.
#
# - Assign partition pins
# - Set pin-placement parameters for pin-assignment:
#     - pinDepth, to avoid min-area violations when
#        DRC is run at the partition-level
#     - pinPitch and pin-layers set to single layer
#       for each side (T/B/L/R)
###############################################################################

#set pin_depth(2) 0.4
#set pin_depth(3) 0.4
#set pin_depth(4) 0.4
#set pin_depth(5) 0.4
#set pin_depth(6) 1.5

#set pin_spacing 2

#set pin_layer(T) [list 2 4]
#set pin_layer(B) [list 2 4]
#set pin_layer(L) [list 3 5]
#set pin_layer(R) [list 3 5]

#foreach ptn $vars(partition_list) {
#   foreach layer [list 2 3 4 5] {
#      setPinConstraint -cell $ptn -target_layers $layer -depth $pin_depth($layer)
#   }

## spacing for all sides of a cell
#   setPinConstraint -cell $ptn -spacing $pin_spacing -side all

#   foreach edge "T B L R" {
#      setPinConstraint  -cell $ptn -layer $pin_layer($edge) -side $edge
## spacing for each side of a cell; either use below command or command used for all edges outside for loop
#      setPinConstraint -cell $ptn -spacing $pin_spacing -side $edge

#   }
#}


