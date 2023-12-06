####################################################################################
### Define core boundary 
####################################################################################
floorPlan \
   -site core \
   -d 3000 3000 55.0 55.0 55.0 55.0

selectObject Module i_apb_subsystem
ungroup
deselectAll
setDrawView fplan


####################################################################################
### Releative placement of MEMORIES and PLL 
####################################################################################
relativePlace i_sram_subsystem/i_1_sram_voltage_island/i_0_SRAM_2kx32_wrap/i_sram_core CORE \
   -orientation R90 \
   -relation L \
   -alignedBy B \
   -xSpace 18.0000 \
   -ySpace 20.0000
relativePlace i_sram_subsystem/i_2_sram_voltage_island/i_0_SRAM_2kx32_wrap/i_sram_core i_sram_subsystem/i_1_sram_voltage_island/i_0_SRAM_2kx32_wrap/i_sram_core \
   -orientation R270 \
   -relation R \
   -alignedBy B \
   -xSpace 18.0000 \
   -ySpace 0.0000
relativePlace i_sram_subsystem/i_0_sram_voltage_island/i_0_SRAM_2kx32_wrap/i_sram_core i_sram_subsystem/i_2_sram_voltage_island/i_0_SRAM_2kx32_wrap/i_sram_core \
   -orientation MY90 \
   -relation R \
   -alignedBy B \
   -xSpace 18.0000 \
   -ySpace 0.0000
relativePlace i_sram_subsystem/i_0_sram_voltage_island/i_1_SRAM_2kx32_wrap/i_sram_core i_sram_subsystem/i_0_sram_voltage_island/i_0_SRAM_2kx32_wrap/i_sram_core \
   -orientation MX90 \
   -relation R \
   -alignedBy B \
   -xSpace 18.0000 \
   -ySpace 0.0000
relativePlace i_sram_subsystem/i_0_sram_voltage_island/i_2_SRAM_2kx32_wrap/i_sram_core i_sram_subsystem/i_0_sram_voltage_island/i_1_SRAM_2kx32_wrap/i_sram_core \
   -orientation MY90 \
   -relation R \
   -alignedBy B \
   -xSpace 18.0000 \
   -ySpace 0.0000
relativePlace i_sram_subsystem/i_0_sram_voltage_island/i_3_SRAM_2kx32_wrap/i_sram_core i_sram_subsystem/i_0_sram_voltage_island/i_2_SRAM_2kx32_wrap/i_sram_core \
   -orientation MX90 \
   -relation R \
   -alignedBy B \
   -xSpace 18.0000 \
   -ySpace 0.0000
relativePlace i_sram_subsystem/i_3_sram_voltage_island/i_3_SRAM_2kx32_wrap/i_sram_core i_sram_subsystem/i_0_sram_voltage_island/i_3_SRAM_2kx32_wrap/i_sram_core \
   -orientation MY90 \
   -relation R \
   -alignedBy B \
   -xSpace 18.0000 \
   -ySpace 0.0000
relativePlace i_sram_subsystem/i_3_sram_voltage_island/i_2_SRAM_2kx32_wrap/i_sram_core i_sram_subsystem/i_3_sram_voltage_island/i_3_SRAM_2kx32_wrap/i_sram_core \
   -orientation MX90 \
   -relation R \
   -alignedBy B \
   -xSpace 18.0000 \
   -ySpace 0.0000
relativePlace i_sram_subsystem/i_2_sram_voltage_island/i_1_SRAM_2kx32_wrap/i_sram_core i_sram_subsystem/i_1_sram_voltage_island/i_0_SRAM_2kx32_wrap/i_sram_core \
   -orientation MY90 \
   -relation T \
   -alignedBy L \
   -xSpace 0.0000 \
   -ySpace 4.0000
relativePlace i_sram_subsystem/i_1_sram_voltage_island/i_1_SRAM_2kx32_wrap/i_sram_core i_sram_subsystem/i_2_sram_voltage_island/i_1_SRAM_2kx32_wrap/i_sram_core \
   -orientation MX90 \
   -relation R \
   -alignedBy B \
   -xSpace 18.0000 \
   -ySpace 0.0000
relativePlace i_sram_subsystem/i_2_sram_voltage_island/i_2_SRAM_2kx32_wrap/i_sram_core i_sram_subsystem/i_1_sram_voltage_island/i_1_SRAM_2kx32_wrap/i_sram_core \
   -orientation MY90 \
   -relation R \
   -alignedBy B \
   -xSpace 18.0000 \
   -ySpace 0.0000
relativePlace i_sram_subsystem/i_1_sram_voltage_island/i_2_SRAM_2kx32_wrap/i_sram_core i_sram_subsystem/i_2_sram_voltage_island/i_2_SRAM_2kx32_wrap/i_sram_core \
   -orientation MX90 \
   -relation R \
   -alignedBy B \
   -xSpace 18.0000 \
   -ySpace 0.0000
relativePlace i_sram_subsystem/i_1_sram_voltage_island/i_3_SRAM_2kx32_wrap/i_sram_core i_sram_subsystem/i_1_sram_voltage_island/i_2_SRAM_2kx32_wrap/i_sram_core \
   -orientation MY90 \
   -relation R \
   -alignedBy B \
   -xSpace 18.0000 \
   -ySpace 0.0000
relativePlace i_sram_subsystem/i_3_sram_voltage_island/i_1_SRAM_2kx32_wrap/i_sram_core i_sram_subsystem/i_1_sram_voltage_island/i_3_SRAM_2kx32_wrap/i_sram_core \
   -orientation MX90 \
   -relation R \
   -alignedBy B \
   -xSpace 18.0000 \
   -ySpace 0.0000
relativePlace i_sram_subsystem/i_2_sram_voltage_island/i_3_SRAM_2kx32_wrap/i_sram_core i_sram_subsystem/i_3_sram_voltage_island/i_1_SRAM_2kx32_wrap/i_sram_core \
   -orientation MY90 \
   -relation R \
   -alignedBy B \
   -xSpace 18.0000 \
   -ySpace 0.0000
relativePlace i_sram_subsystem/i_3_sram_voltage_island/i_0_SRAM_2kx32_wrap/i_sram_core i_sram_subsystem/i_2_sram_voltage_island/i_3_SRAM_2kx32_wrap/i_sram_core \
   -orientation MX90 \
   -relation R \
   -alignedBy B \
   -xSpace 18.0000 \
   -ySpace 0.0000
relativePlace i_D1TCM/i_sram_core_0 i_sram_subsystem/i_2_sram_voltage_island/i_1_SRAM_2kx32_wrap/i_sram_core \
   -orientation MX \
   -relation T \
   -alignedBy L \
   -xSpace 0.0000 \
   -ySpace 4.0000
relativePlace i_ITCM/i_sram_core i_D1TCM/i_sram_core_0 \
   -orientation MX \
   -relation R \
   -alignedBy B \
   -xSpace 20.0000 \
   -ySpace 0.0000
relativePlace i_D0TCM/i_sram_core_0 i_ITCM/i_sram_core \
   -orientation MX \
   -relation R \
   -alignedBy B \
   -xSpace 20.0000 \
   -ySpace 0.0000
relativePlace i_D1TCM/i_sram_core_1 i_D0TCM/i_sram_core_0 \
   -orientation MX \
   -relation R \
   -alignedBy B \
   -xSpace 20.0000 \
   -ySpace 0.0000
relativePlace i_D0TCM/i_sram_core_1 i_D1TCM/i_sram_core_1 \
   -orientation MX \
   -relation R \
   -alignedBy B \
   -xSpace 20.0000 \
   -ySpace 0.0000
relativePlace i_PLL CORE \
   -orientation R90 \
   -relation T \
   -alignedBy R \
   -xSpace 3.0000 \
   -ySpace 3.0000
relativePlace i_Module_W CORE \
   -orientation R0 \
   -relation T \
   -alignedBy L \
   -xSpace 20.0000 \
   -ySpace 25.0000
placeInstance \
   i_rom_subsystem/i_rom_wrap/i_rom_core 2404.045 1476.2 R0 \
   -fixed

####################################################################################
### Placement of block 
####################################################################################
placeInstance \
   i_Module_A 2345.0 1670.6 R0 \
   -fixed
placeInstance \
   i_Module_B 2120 1218.8 R0 \
   -fixed
placeInstance \
   i_Module_U 2031.2 245.0 R0 \
   -fixed

####################################################################################
### Create rows in the default power Domain
####################################################################################
deselectAll
setLayerPreference stdRow \
   -isVisible 1
setLayerPreference stdRow \
   -isSelectable 1
deleteRow \
   -all
createRow \
   -site core  \
   -flip1st
createRow \
   -site bcore


