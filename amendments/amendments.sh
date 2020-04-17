#!/bin/bash
rippledpath=/opt/ripple/bin/rippled
amendmentspy=/opt/rippled/show_ammendments.py
features=$(sudo docker exec rippledvalidator $rippledpath feature)
python $amendmentspy "$features"
