From: [i3 faq: move + goto workspace when moving a container empties the focused workspace](https://faq.i3wm.org/question/5049/move-goto-workspace-when-moving-a-container-empties-the-focused-workspace/#5055)

Requires [jq](http://stedolan.github.io/jq/) - `apt-get install -y jq` or equivalent. This is a lightweight JSON parser.

Put the script in your path, then bind as: 

    bindsym $mod+Shift+exclam      move workspace 1; exec i3-switch-if-workspace-empty.sh 1
    # ..10

To run it manually, just pass it the number to switch to, if the current workspace is empty.

Tested with multiple monitors as well. 
