#!/bin/bash

#note: use the following command to 
# make the script executable in your shell:
# chmod +x listRegions.sh

#get a list of Azure regions
az account list-locations --query [].displayName