#!/bin/bash

set -e

new_workspace=$1

if [ "" == "$new_workspace" ]; then
    echo expecting workspace name/number
    exit 1
fi

active_workspace=$( i3-msg -t get_workspaces | jq '.[] | select(.focused).num' )

toplevel_containers=$( i3-msg -t get_tree | jq '(.nodes[].nodes[].nodes[] | select(.type=="workspace") | select(.num=='"$active_workspace"') | .nodes[].nodes | length) // 0' )

if [ "$toplevel_containers" -eq "0" ]; then
    i3-msg workspace $new_workspace
fi

