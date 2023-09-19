#!/bin/sh
cp /classes/ecen4303F23/cshrc_ecen4303F23 ~/.cshrc
sed -i 's/USER/'$USER'/g' ~/.cshrc
