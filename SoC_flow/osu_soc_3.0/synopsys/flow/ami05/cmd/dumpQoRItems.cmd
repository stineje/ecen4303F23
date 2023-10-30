;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Scheme Functions For Recommended Astro Methodology
; Copyright (C) 2000-2005 Astro CAE Group
; RCMD Version 2006.06.sp4.11.27.2006
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

scmOpenCell '(-cell_name toppl)
scmAnalyzeDesign '(-function_name toppl -dump_map -map_type groute)
scmCloseCell '()

scmOpenCell '(-cell_name topcts)
scmAnalyzeDesign '(-function_name topcts -dump_map -map_type groute)
scmCloseCell '()

scmOpenCell '(-cell_name topdr)
scmAnalyzeDesign '(-function_name topdr -dump_route_drc)
scmCloseCell '()

scmOpenCell '(-cell_name toppo)
scmAnalyzeDesign '(-function_name toppo -dump_route_drc)
scmCloseCell '(-close_lib)

auStreamOut
setFormField "Stream Out Data File" "Stream File Name" "final.gds"
setFormField "Stream Out Data File" "Library Name" library_name
setFormField "Stream Out Data File" "Layer File" "./streamout.map"
setFormField "Stream Out Data File" "Child Extraction Depth" "20"
setFormField "Stream Out Data File" "Convert" "Specified Cell"
setFormField "Stream Out Data File" "Cell Name" "toppo"
formOK "Stream Out Data File"

geOpenLib
setFormField "Open Library" "Library Name" library_name
formOK "Open Library"
geOpenCell
setFormField "Open Cell" "Cell Name" "toppo"
formOK "Open Cell"

print "\n\nThank you for using OSU Synopsys SoC Design Flow.
The final layout in gds format was exported under the name final.gds
An overall view of the flow results, timing, area, etc. is given in html
format in ./rcmd_toolbox_reports/html/index.html . A summary text file
can be found in ./rcmd_toolbox_reports/chip.QoR_summary.txt
Type exit to quit Astro...\n\n"

