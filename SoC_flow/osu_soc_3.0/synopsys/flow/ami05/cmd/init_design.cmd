;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Scheme Functions For Recommended Astro Methodology
; Copyright (C) 2000-2005 Astro CAE Group
; RCMD Version 2006.06.sp4.11.27.2006
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

define cmd_file "init_design.cmd"
scmReplayFile "replay/init_design.cmd"

scmInitialDesign '()
    ;;;; <Does>  auVerilogToCell -> scmOpenCell '(-library_name $library_name -cell_name $bind_cell_name)
    ;;;; <Options>
    ;;;;        -library_name				# Default is from .avntrc 
    ;;;;        -verilog_file				# Default is from .avntrc
    ;;;;        -verilog_list_file			# Default is from .avntrc
    ;;;;        -bind_cell_name				# Default is from .avntrc
    ;;;;        -top_module_name			# Default is from .avntrc
    ;;;;        -top_module_name_list_file		# No Default
    ;;;;        -tech_file				# Default is from .avntrc
    ;;;;        -hdl_to_gdsii_map_file			# No Default
    ;;;;        -ref_lib_control_file			# No Default
    ;;;;        -bus_style				# Default is from .avntrc
    ;;;;        -bus_append				# No Default
    ;;;;        -tie_down_net				# Default is from .avntrc
    ;;;;        -tie_high_net				# Default is from .avntrc
    ;;;;        -hierarchy_separator			# Default is from /
    ;;;;        -case_sensitive				# Default is 1
    ;;;;        -multiple_pg				# Default is 0
    ;;;;        -no_backslash				# Default is from .avntrc
    ;;;;        -remove_first_backslash			# Default is from .avntrc
    ;;;;        -create_bus_for_undefined_cells_from	# Default is connection
    ;;;;        -honor_fram_for_module_definition	# Default is 0
    ;;;;        -precede_hierarchical_names		# Default is 0
    ;;;;        -expand_netlist_cell_without_instance	# Default is 1
    ;;;;        -stop_at_fram				# Default is 0
    ;;;;        -print_net_without_connections		# Default is 0
    ;;;;        -preserve_hierarchy			# Default is from .avntrc
    ;;;;        -handle_dirty_netlist			# Default is 0

scmSetupTLUPlus '()

scmLoadTDF '()
    ;;;; <Options> 
    ;;;;	-cell_name				# Default is current cell. 
    ;;;;	-tdf_file				# Default is from .avntrc.
    ;;;;	-connect_pad_pg				# Default is on. To connect pad P/G ports automatically.

;scmPlanner '()
    ;;;; Runs axgPlanner with default values as Astro.

load "./cmd/custom/rings.cmd"

scmLoad '(-file $floorplan_file)
    ;;;; <Does> It loads a file and check if the file exists.
    ;;;;	    Here it loads floorplan file.
    ;;;; <Options> 
    ;;;;	-file file_name   		    

scmLoad '(-file $preroute_file)

scmPRSummary '(-output report/initial_pr.sum)
    ;;;; <Does> It dumps out pr summary.
    ;;;; <Options>
    ;;;;	-output output_file_name		

scmSaveCell '(-close_cell -all_open_cells)
    ;;;; <Does> It saves cell.

exit
