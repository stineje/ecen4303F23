(axgPlanner )
(formDefault "Floor Planning")
(setFormField "Floor Planning" "Row/Core Ratio" 1)
(setFormField "Floor Planning" "Control Parameter" "aspect ratio")
(setFormField "Floor Planning" "Core Aspect Ratio (H/W)" 1)
(setFormField "Floor Planning" "Core Utilization" 0.7)
(setFormField "Floor Planning" "horizontal row" "1")
(setFormField "Floor Planning" "Double Back" "1")
(setFormField "Floor Planning" "Start from first row" "0")
(setFormField "Floor Planning" "Flip first row" "0")
(setFormField "Floor Planning" "Core To Left" "26")
(setFormField "Floor Planning" "Core To Right" "26")
(setFormField "Floor Planning" "Core To Top" "26")
(setFormField "Floor Planning" "Core To Bottom" "26")
(setFormField "Floor Planning" "keep macro placement" "0")
(setFormField "Floor Planning" "keep standard cell placement" "0")
(setFormField "Floor Planning" "Min Pad Height" "0")
(setFormField "Floor Planning" "Pad Limit" "1")
(setFormField "Floor Planning" "Pin Snap" "1")
(setFormField "Floor Planning" "Keep I/O Placement" "0")
(setFormField "Floor Planning" "Max Metal Routing Layer" 3)
(formOK "Floor Planning")
axgCreateRectangularRings
setFormField "Create Rectangular Rings" "Net Name(s)" "vdd, gnd"
setFormField "Create Rectangular Rings" "L-Width" "4.5"
setFormField "Create Rectangular Rings" "R-Width" "4.5"
setFormField "Create Rectangular Rings" "B-Width" "4.5"
setFormField "Create Rectangular Rings" "T-Width" "4.5"
setFormField "Create Rectangular Rings" "Left" "8"
setFormField "Create Rectangular Rings" "Right" "8"
setFormField "Create Rectangular Rings" "Bottom" "8"
setFormField "Create Rectangular Rings" "Top" "8"
setFormField "Create Rectangular Rings" "Create Innermost Core Ring Conservatively" "1"
formOK "Create Rectangular Rings"
;formCancel "Create Rectangular Rings"

axgPrerouteInstances
setFormField "Preroute Instances" "Primary Routing Layer" "Pin"
formOK "Preroute Instances"

