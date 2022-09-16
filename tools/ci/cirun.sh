#!/usr/bin/env bash

set -e
set -o xtrace

WD=$(cd $(dirname $0) && pwd)
WORKSPACE=$(cd $WD/../../.. && pwd -P)
nuttx=$WORKSPACE/nuttx
logs=${WD}/logs
target="sim"
BOARD="sim"
core="sim"

image=`find ${nuttx} -type f -name 'nuttx'`
path=${image%/*}
cd ${TOP}/testrun/scripts/script
python3 -m pytest -m "common" ./ -B ${BOARD} -P ${path} -L ${logs}/${BOARD}/${core} -R ${target} -C --json=${logs}/${BOARD}/${core}/pytest.json
