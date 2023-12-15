#!/bin/bash

export FOLDER=/app/aws-portfolio

if PM2_HOME='/root/.pm2' pm2 list | grep -q "portfolio"; then
  # Delete the PM2 process for Bleezur-frontend
  PM2_HOME='/root/.pm2' pm2 delete portfolio
  PM2_HOME='/root/.pm2' pm2 save
  echo "Process 'portfolio' deleted from pm2."
else
  echo "Process 'portfolio' not found in pm2."
fi

if [ -d $FOLDER ]; then
    # Remove all contents inside the directory without removing the directory itself
    rm -rf ${FOLDER:?}/*
fi