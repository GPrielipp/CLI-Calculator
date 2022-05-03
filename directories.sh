#/bin/bash

if [ $# -lt 2 ]; then
    echo "Usage: directories.sh <OBJDIR> <BINDIR> <?OBJDIRS>"
    exit 1
fi

OBJDIR=$1
BINDIR=$2
OBJDIRS=${@:3}

if ! [ -d $OBJDIR ]; then
    echo "mkdir -p $OBJDIR &2>/dev/null"
    mkdir -p $OBJDIR &2>/dev/null
fi

if ! [ -d $BINDIR ]; then
    echo "mkdir -p $BINDIR &2>/dev/null"
    mkdir -p $BINDIR &2>/dev/null
fi

if ! [ -z "$OBJDIRS" ]; then
    echo "mkdir -p $OBJDIRS &2>/dev/null"
    mkdir -p $OBJDIRS &2>/dev/null
fi