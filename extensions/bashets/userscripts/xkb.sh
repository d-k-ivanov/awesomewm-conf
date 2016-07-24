#!/bin/bash

# you need either getxkblayout script ot xkblayout-state app to use this script

#echo -n `getxkblayout` | tr '[:lower:]' '[:upper:]'
echo -n `xkblayout-state print %e` | tr '[:lower:]' '[:upper:]'
