####################################################################################
#                          PRE-PLACE PLUG-IN
####################################################################################
#
# This plug-in script is called before placeDesign from the run_place.tcl flow
# script.
#
####################################################################################
# Example tasks include:
#          - Power planning related tasks which includes
#            - Power planning for power domains (ring/strap creations)
#            - Power Shut-off cell power hookup
############################################################################################

#####################################################################################
### power planning 
#####################################################################################
source PLUG/power_planning.tcl

####################################################################################
### Add placement blockages
####################################################################################
source PLUG/create_blockages.tcl

##############################################################
### specifying cell pading for double height cells; 
### this is an work around for OD.A.1 violations showing in PVS. 
### Here we are providing 2 unit cell spacing b/w double height cells.
##############################################################
set cell {HEADER* SRPG* AONBUF*}

foreach cell1 $cell {
   specifyCellPad $cell1 -right 2 -left 2 
}

################################################################
### Non-default placement settings for LVL shifter cell placement
################################################################
if {[info exists vars(cpf_file)]} {
   setPlaceMode -dividedShifterRows false
}
