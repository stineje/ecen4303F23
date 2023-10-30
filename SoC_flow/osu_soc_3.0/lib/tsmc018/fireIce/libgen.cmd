### Flow Commands ###
input_type {pr_lef}
setvar library_name libgen_lef
setvar tech_file qx/icecaps.tch

generic_power_names 1.8 {vdd}
generic_ground_names 0.0 {gnd}

setvar generate_port_powerview TRUE


### Input Commands ###
gds_file_list_file {}
lef_file_list_file {all.lef}

cell_list {*}

include qx/lefdef.layermap

####### End of File #########
