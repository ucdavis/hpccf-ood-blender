#!/usr/bin/env bash

export SEND_256_COLORS_TO_REMOTE=1

# Disable xfce panel session manager
#xfwm4 --compositor=off --sm-client-disable &
xfwm4 --sm-client-disable &
xsetroot -solid "#D3D3D3"
xfsettingsd --sm-client-disable &
xfce4-panel --sm-client-disable &

# launch dbus first through eval becuase it can conflict with a conda environment
# see https://github.com/OSC/ondemand/issues/700
eval $(dbus-launch)

#
# Start Blender
#
set -x
vglrun -wm -d $DISPLAY blender -W --log-file blender.log
