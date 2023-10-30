/************************************************/
/* Custom cell Abstract Generation Script 	*/
/* Author: Ivan Castellanos			*/
/* Oklahoma State University			*/
/************************************************/

/* To run Abstract Generation type:             */
/* abstract -nogui -replay abstract.il          */

/* All that needs to be changed are the custom_cell */
/* and output_pinnames field.			    */

absSkillMode()
/**************************************/
custom_cell = "multi"
output_pinnames = "P+"
/**************************************/

osucells = getShellEnvVar("OSUcells")
lefin = "/lib/ami05/abstract.stacks/osu05_stdcells.lef"
gdsin = "/flow/ami05.stacks/gds2_icfb.map"
absSetOption("NewLibraryName" custom_cell)
absSetLibrary(custom_cell)
absSetOption("ImportLefFiles" strcat( osucells lefin ) )
absSetOption("ImportTechLef" "true")
absImportLEF()
absSetOption("ImportGDSIIFiles" strcat( custom_cell "." "gds") )
absSetOption("ImportGDSIILayerMapFile" strcat( osucells gdsin ) )
absSetOption("DefaultBin" "Block")
absImportGDS()

absSelectCellFrom(custom_cell custom_cell)
absSetBinOption("Block" "PinsTextPinMap" "(metal1 (metal1 pin)(metal1 drawing))\n(metal2 (metal2 pin)(metal2 drawing))\n(metal3 (metal3 pin)(metal3 drawing))")
absSetBinOption("Block" "PinsPowerNames" "vdd")
absSetBinOption("Block" "PinsGroundNames" "gnd")
absSetBinOption("Block" "PinsOutputNames" output_pinnames)
absSetBinOption("Block" "PinsTextManipulation" "{_([0-9]+)_} {[\\1]}")
absSetBinOption("Block" "PinsBoundaryCreate" "always")
absSetBinOption("Block" "PinsBoundaryCreate" "always")
absSetBinOption("Block" "PinsPreserveRoutingBlockages" "true")
absSetBinOption("Block" "PinsCreatePwrPinsFromRouting" "true")
absSetBinOption("Block" "PinsPwrRoutingLayers" "metal1 metal2 via via2 ")
absSetBinOption("Block" "PinsBoundarySizeTop" "4.8")
absSetBinOption("Block" "PinsBoundarySizeBottom" "4.8")
absSetBinOption("Block" "PinsBoundarySizeLeft" "4.8")
absSetBinOption("Block" "PinsBoundarySizeRight" "4.8")

absSetBinOption("Block" "AbstractAdjustRingPinsDist" "50")
absSetBinOption("Block" "AbstractSiteName" "Block")
absSetBinOption("Block" "AbstractSiteNameDefine" "Block")
absSetBinOption("Block" "AbstractBlockageDetailedLayers" "")
absSetBinOption("Block" "AbstractBlockageShrinkWrapLayers" "")
absSetBinOption("Block" "ExtractSig" "false")
absSetBinOption("Block" "AbstractAdjustPowerRailOp" "")
absSetBinOption("Block" "AbstractAdjustBoundaryPinsSig" "false")
absSetBinOption("Block" "AbstractAdjustBoundaryPinsPwr" "false")
absSetBinOption("Block" "AbstractAdjustPowerGeometryGroups" "single")
absSetBinOption("Block" "BlockageCutVia" "false")
absSetBinOption("Block" "AbstractOverlapLayerSize" "0.45")
absSetBinOption("Block" "AbstractOverlapLayerSmoothFactor" "0")
absSetBinOption("Block" "AbstractGridMode" "report")
absSetTerminalProp(custom_cell "vdd" "shape" "ring")
absSetTerminalProp(custom_cell "gnd" "shape" "ring")
absSetBinOption("Block" "AbstractBlockageDetailedLayers" "metal1 ")
absSetBinOption("Block" "AbstractBlockageCoverLayers" "metal2 metal3 ")
absSetBinOption("Block" "ExtractPwr" "true")
absSetBinOption("Block" "ExtractNumLevelsPwr" "1")
absSetBinOption("Block" "AbstractAdjustRingPinsPwr" "true")

absSetOption("ExportLEFFile" strcat( "./" custom_cell "." "lef") )

absPins()
absExtract()
absAbstract()
absExportLEF()
exit
