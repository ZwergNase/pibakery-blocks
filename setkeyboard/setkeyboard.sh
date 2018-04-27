#!/bin/bash

model=${1%% *}
layout=${2%% *}

sed -i /etc/default/keyboard -e "s/^XKBMODEL.*/XKBMODEL=\"$model\"/"
sed -i /etc/default/keyboard -e "s/^XKBLAYOUT.*/XKBLAYOUT=\"$layout\"/"