#!/usr/bin/env bash

if [ `whoami` != "bower" ]; then
    echo "ERROR: Entrypoint should run as user bower" >&2
    exit -1
fi

if [ `pwd` != "/home/bower" ]; then
    echo "ERROR: Working directory is not /home/bower" >&2
    exit -1
fi

if [ ! -d "workspace" ]; then
    echo "ERROR: The bower project should be mapped to /home/bower/workspace." >&2
    echo "Start docker with '-v /path/to/my-project:/home/bower/workspace'." >&2
    exit -1
fi

cd workspace
bower install --config.interactive=false
if [ $? -ne 0 ]; then
    echo "ERROR: bower install failed." >&2
    exit -1
fi
