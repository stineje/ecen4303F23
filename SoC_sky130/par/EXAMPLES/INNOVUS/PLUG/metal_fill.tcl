###############################################################################
# Optionally define the following when applicable
###############################################################################
set vars(mf_layers) "1 2 3 4 5 6"                          ; # Metal Fill Layer List 
set vars(mf_winsize) "50 50 50 50 50 50"                   ; # Metal Fill Window Size
set vars(mf_winstep) "25 25 25 25 25 25"                   ; # Metal Fill Window Step
set vars(mf_minwidth) "0.3 0.3 0.3 0.3 0.3 0.4"            ; # Metal Fill Minimum Width 
set vars(mf_maxwidth) "3.0 3.0 3.0 3.0 3.0 3.0"            ; # Metal Fill Max Width
set vars(mf_active) "0.3 0.3 0.3 0.3 0.3 0.6"              ; # Metal Fill Active Spacing 
set vars(mf_gap) "0.3 0.3 0.3 0.3 0.3 0.6"                 ; # Metal Fill Gap Spacing 
set vars(mf_gap_opc) "0.3 0.3 0.3 0.3 0.3 0.6"             ; # Metal Fill Gap Spacing (OPC)
set vars(mf_mindensity) "10 10 10 10 10 10"                ; # Metal Fill Min Density
set vars(mf_minarea) "0.240 0.240 0.240 0.240 0.240 0.565"
set vars(mf_maxarea) "80.0 80.0 80.0 80.0 80.0 160.0"
# Metal Fill Min Length
set vars(mf_minlength) "\
   [expr round([lindex $vars(mf_minarea) 0]/[lindex $vars(mf_minwidth) 0]+0.5)] \
   [expr round([lindex $vars(mf_minarea) 1]/[lindex $vars(mf_minwidth) 1]+0.5)] \
   [expr round([lindex $vars(mf_minarea) 2]/[lindex $vars(mf_minwidth) 2]+0.5)] \
   [expr round([lindex $vars(mf_minarea) 3]/[lindex $vars(mf_minwidth) 3]+0.5)] \
   [expr round([lindex $vars(mf_minarea) 4]/[lindex $vars(mf_minwidth) 4]+0.5)] \
   [expr round([lindex $vars(mf_minarea) 5]/[lindex $vars(mf_minwidth) 5]+0.5)] \
"
# Metal Fill Max Length
set vars(mf_maxlength) "\
   [expr round([lindex $vars(mf_maxarea) 0]/[lindex $vars(mf_maxwidth) 0]-0.5)] \
   [expr round([lindex $vars(mf_maxarea) 1]/[lindex $vars(mf_maxwidth) 1]-0.5)] \
   [expr round([lindex $vars(mf_maxarea) 2]/[lindex $vars(mf_maxwidth) 2]-0.5)] \
   [expr round([lindex $vars(mf_maxarea) 3]/[lindex $vars(mf_maxwidth) 3]-0.5)] \
   [expr round([lindex $vars(mf_maxarea) 4]/[lindex $vars(mf_maxwidth) 4]-0.5)] \
   [expr round([lindex $vars(mf_maxarea) 5]/[lindex $vars(mf_maxwidth) 5]-0.5)] \
"
foreach layer $vars(mf_layers) {
   set index [expr $layer-1]
   setMetalFill \
            -iterationName iter1 \
            -layer $layer \
            -windowSize [lindex $vars(mf_winsize) $index] [lindex $vars(mf_winsize) $index] \
            -windowStep [lindex $vars(mf_winstep) $index] [lindex $vars(mf_winstep) $index] \
            -minWidth [lindex $vars(mf_minwidth) $index] \
            -maxWidth [lindex $vars(mf_maxwidth) $index] \
            -minLength [lindex $vars(mf_minlength) $index] \
            -maxLength [lindex $vars(mf_maxlength) $index] \
            -activeSpacing [lindex $vars(mf_active) $index] \
            -gapSpacing [lindex $vars(mf_gap) $index] \
            -minDensity [lindex $vars(mf_mindensity) $index]
}

foreach layer $vars(mf_layers) {
   set index [expr $layer-1]
   setMetalFill \
            -iterationName iter2 \
            -layer $layer \
            -windowSize [lindex $vars(mf_winsize) $index] [lindex $vars(mf_winsize) $index] \
            -windowStep [lindex $vars(mf_winstep) $index] [lindex $vars(mf_winstep) $index] \
            -minWidth [lindex $vars(mf_minwidth) $index] \
            -maxWidth [lindex $vars(mf_maxwidth) $index] \
            -minLength [lindex $vars(mf_minlength) $index] \
            -maxLength [lindex $vars(mf_maxlength) $index] \
            -activeSpacing [lindex $vars(mf_active) $index] \
            -gapSpacing [lindex $vars(mf_gap_opc) $index] \
            -minDensity [lindex $vars(mf_mindensity) $index]\
            -opc
}

addMetalFill -iterationNameList {iter1 iter2} -timingAware sta
