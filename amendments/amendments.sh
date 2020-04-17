#!/bin/bash
# If running @wietse docker image leave it true
incontainer=true
rippledpath=/opt/ripple/bin/rippled

# python scripts that converts json to table
amendmentspy=/opt/rippled/ammendments.py

if [ "$incontainer" = true ]
then
 features=$(sudo docker exec rippledvalidator $rippledpath feature)
else
 features=$(sudo $rippledpath feature)
fi 
python $amendmentspy "$features"
