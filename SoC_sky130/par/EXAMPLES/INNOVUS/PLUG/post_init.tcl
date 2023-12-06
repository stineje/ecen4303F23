####################################################################################
#                             POST-INIT PLUG-IN
####################################################################################
#
# This plug-in script is called after design import from the run_init.tcl script.
#
# --------------------------------------------------------------------------------
# Can be used for various floorplan related tasks, like:
#              - Die/core boundary
#              - placement of hard macros/blocks
#              - power domain size and clearence surrounding to it
#              - Placement and routing blockages in the floorplan
#              - IO ring creation
#              - PSO planning
# --------------------------------------------------------------------------------
# Specifically, this example includes tasks related to the LP/CPF foundation flow 
# including power domain modification and power shut-off planning. The examples 
# included here operate based on variables (vars array) defined in the 
# OVERLAY/lp_config.tcl file
#
#if {[info exists vars(cpf_file)]} {

# --------------------------------------------------------------------------------
# Modify power domains
# --------------------------------------------------------------------------------
# The 'modify_power_domains' procedure is included with the foundation flows
# to help automate power domain modification.  To enable this, please set the
# appropriate variables in the lp_config.tcl and uncomment the following command
#

#	::FF_EDI::modify_power_domains
    
# --------------------------------------------------------------------------------
# Power switch insertion
# --------------------------------------------------------------------------------
# The 'add_power_switches' procedure is included with the foundation flows
# to cover common power switch insertion scenarios.  To use, set the appropriate
# variables in the lp_config.tcl file and uncomment the following command.
# --------------------------------------------------------------------------------
# NOTE: This procedure  will NOT COVER THE ALL THE OPTIONS in addPowerSwitch
# For more complicated scenarios, please manually add the addPowerSwitch command
# here with the necessary options.
# --------------------------------------------------------------------------------

#	::FF_EDI::add_power_switches

#}

####################################################################################
### floorplan
###   - Die creation, relative placement for macro's/IP's
####################################################################################
source PLUG/floorplan.tcl

# --------------------------------------------------------------------------------
# Modify power domains,  modify_power_domain proc. is defined in utils.tcl
# --------------------------------------------------------------------------------
::FF_EDI::modify_power_domains

####################################################################################
#row creation for power domains
####################################################################################
source PLUG/create_rows.tcl
 
# --------------------------------------------------------------------------------
# Power switch insertion; this proc. will not cover the all the options in addPowerSwitch
# command but it has all the basic necessary options required for ring and column swicth
# insertion
# --------------------------------------------------------------------------------
::FF_EDI::add_power_switches


#####################################################################################
### Create halo's for macros
#####################################################################################
source PLUG/create_halos.tcl

#####################################################################################
### Place Density constrains between memories. This will help in routing as well as better timing optimization
#####################################################################################

createDensityArea 246.289 245.467 1991.786 262.176 50
createDensityArea 465.7695 263.514 478.741 919.383 50
createDensityArea 683.652 263.2765 697.107 919.5315 50
createDensityArea 901.829 263.2655 915.3305 919.538 50
createDensityArea 1119.1695 263.4165 1134.409 919.6075 50
createDensityArea 1338.21 263.2615 1351.834 919.436 50
createDensityArea 1556.4415 263.458 1569.808 919.596 50
createDensityArea 1774.6325 263.645 1787.9515 919.522 50

#####################################################################################
### ADD IO FILLER CELLS. These are inserted from largest to smallest
#####################################################################################
addIoFiller -cell IOFILLER20
addIoFiller -cell IOFILLER10
addIoFiller -cell IOFILLER5
addIoFiller -cell IOFILLER1
addIoFiller -cell IOFILLER05
addIoFiller -cell IOFILLER0005
