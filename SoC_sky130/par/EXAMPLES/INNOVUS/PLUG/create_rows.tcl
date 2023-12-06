### Create rows in the  PDsmc power Domain
deselectAll
windowSelect 280 1325 440 1550
deselectObject Module i_apb_subsystem/i_smc
deleteRow -selected
createRow -site core  -area 280 1325 440 1550
createRow -site bcore  -area 280 1325 440 1550
deselectAll

### Create rows in the  uart power Domain
windowSelect 490 1325 880 1525
deselectObject Module i_apb_subsystem/i_uart1
deleteRow -selected
createRow -site core  -area 490 1325 880 1525
createRow -site bcore  -area 490 1325 880 1525
deselectAll

### Create rows in the  PDpll power Domain
windowSelect 2340  2225  2753  2753
deselectObject Module i_PLL
deleteRow -selected
createRow -site core  -area 2340  2225  2753  2753 -flip1st
createRow -site bcore  -area 2340  2225  2753  2753
deselectAll

### Create rows in the  PDwakeup power Domain
windowSelect 2555 1580 2705 1630
deselectObject Module i_wakeup
deleteRow -selected
createRow -site core  -area 2555 1580 2705 1630 -flip1st
createRow -site bcore  -area 2555 1580 2705 1630
deselectAll

setLayerPreference stdRow -isSelectable 0
