#!/bin/bash

export NODE_ENV=production
pm2 startOrRestart app.js --env production --no-daemon

# node app.js
