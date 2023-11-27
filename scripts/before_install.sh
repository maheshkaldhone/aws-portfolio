#!/bin/bash

export FOLDER=/app/aws-portfolio

if [ -d $FOLDER ]; then
    # Remove all contents inside the directory without removing the directory itself
    rm -rf ${FOLDER:?}/*
fi
