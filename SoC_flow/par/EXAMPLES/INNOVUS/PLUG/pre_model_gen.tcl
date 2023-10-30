######################################################################
# PLUG files contain DESIGN SPECIFIC information, so please review
# all PLUG files before they are used by run_model_gen.tcl or 
# run_proto.tcl and remove any DTMF design specific information 
# and replace with data valid for your design.
######################################################################

    history keep 30   ;#default = 15
    setPreference FlightLineInMove 0 ;#makes the interactive moving of BLOBs/BBOXes extremely slow...  so turning off.


#######################################################################
# LIMITATION: proto flow will not allow interactive constraints to be
#  preserved in designs with ILMs.  prototype_timing uses its own .sdc files
#  which need to be handled explicitly, but interactive constraints
#  writes out one sdc file merging all the constraints.
#  Since proto_timing modifies the timing graph, FE thinks that some interactive constraints have been
#  entered and so unflattenIlm writes out the constraints to one file, and so we lose
#  the protoInterfaceLogic.sdc file reference.
#######################################################################
    set Rda_ILM::ilmgPreserveInteractiveConstr 0

    catch {setLayerPreference power -isVisible 0}
    catch {setLayerPreference power -isSelectable 0}
    catch {setLayerPreference bump0 -isVisible 0}
    catch {setLayerPreference bump0 -isSelectable 0}
    catch {setLayerPreference bump1 -isVisible 0}
    catch {setLayerPreference bump1 -isSelectable 0}
    catch {setLayerPreference bump2 -isVisible 0}
    catch {setLayerPreference bump2 -isSelectable 0}
    catch {setLayerPreference bump3 -isVisible 0}
    catch {setLayerPreference bump3 -isSelectable 0}
    catch {setLayerPreference coverCell -isVisible 0}
    catch {setLayerPreference coverCell -isSelectable 0}
    catch {setLayerPreference M[expr 1 + [getMaxRouteLayer]]Pin -isVisible 0}
    catch {setLayerPreference layerBlk -isVisible 0}
    catch {setLayerPreference text -isVisible 0}


  #Some designs need these set for proper propagation of case_analysis, 
  #  but these are not default settings,
  #  so make sure that these are necessary for your new design:
  #Setting this to TRUE will give better reduction ratio (in some case very significant improvement),
  #  however, note that when comparing number of top-level paths full netlist vs. flexmodel netlist,
  #  there will probably be a different number of paths if top-level is using the default of FALSE:
    set_global timing_case_analysis_for_sequential_propagation true
    setAnalysisMode -caseAnalysis true  -sequentialConstProp true
    set_global timing_case_analysis_for_icg_propagation always

    set_global report_timing_format {timing_point cell delay fanout load slew}
    set_table_style -name report_timing -no_frame -indent 0

    win
    setDrawView fplan

    #set_proto_mode -create_dir proto_model


  #specify flexmodels (COMMENT THESE OUT FOR YOUR DESIGN):
  #  set_proto_model -model ptn_wrapper    -type flex_module
  #  set_proto_model -model tdsp_core  -type flex_module


  # UNCOMMENT this line for selecting all models for routing blockage
  # characterization. By default only 10% of the models will be used
  # set_proto_mode -characterize_percent_rt_blockage 1.0

