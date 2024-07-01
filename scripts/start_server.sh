#!/bin/bash

# navigate to app folder
cd /app/FE

# initial startup by running react-script "start", name process "marketing"
# --watch watches and restarts if files change

PM2_HOME='/root/.pm2' pm2 delete FE
PM2_HOME='/root/.pm2' pm2 start npm --name "FE" -- start

# freeze process list for automatic respawn
PM2_HOME='/root/.pm2' pm2 save

