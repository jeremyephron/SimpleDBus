#!/bin/bash

PROJECT_ROOT=$(realpath $(dirname `realpath $0`)/..)
SOURCE_ROOT=$PROJECT_ROOT/tests/simulator
BUILD_PATH=$PROJECT_ROOT/.build

# Parse the received commands
while :; do
    case $1 in
        -c|--clean) FLAG_CLEAN="SET"            
        ;;
        *) break
    esac
    shift
done

# Cleanup the existing files
if [[ ! -z "$FLAG_CLEAN" ]]; then
    rm -rf $BUILD_PATH
fi

# Compile!
mkdir -p $BUILD_PATH
cd $BUILD_PATH
cmake -H$SOURCE_ROOT -DOVERRIDE_ORG_BLUEZ_SERVICE_NAME='"test.simpledbus"' -DOVERRIDE_ORG_BLUEZ_DBUS_BUS='DBUS_BUS_SESSION'
make -j