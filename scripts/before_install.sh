#!/bin/bash

export FOLDER=/app/FE

if PM2_HOME='/root/.pm2' pm2 list | grep -q "FE"; then
  # Delete the PM2 process for FE
  PM2_HOME='/root/.pm2' pm2 delete portfolio
  PM2_HOME='/root/.pm2' pm2 save
  echo "Process 'FE' deleted from pm2."
else
  echo "Process 'FE' not found in pm2."
fi

if [ -d $FOLDER ]; then
    # Remove all contents inside the directory without removing the directory itself
    rm -rf ${FOLDER:?}/*
fi
