#/bin/bash

OBJDIR=$1
BINDIR=$2
OBJDIRS=$3

if [ $# -lt 2 ]; then
    echo "Usage: directories.sh <OBJDIR> <BINDIR> <?OBJDIRS>"
    exit 1
fi

if ! [ -d $OBJDIR ]; then
    echo "OBJDIR"
    mkdir -p $OBJDIR &2>/dev/null
fi

if ! [ -d $BINDIR ]; then
    echo "BINDIR"
    mkdir -p $BINDIR &2>/dev/null
fi

if ! [ -z "$OBJDIRS" ]; then
    echo "OBJDIRS"
    mkdir -p $OBJDIRS &2>/dev/null
fi