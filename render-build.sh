#!/bin/bash

# Install unixODBC
apt-get update
apt-get install -y unixodbc unixodbc-dev

# Install dependencies
npm install

# Start your application
npm start
 