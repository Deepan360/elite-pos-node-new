#!/bin/bash

# Update package list and install necessary ODBC libraries
sudo apt-get update && sudo apt-get install -y \
    unixodbc \
    unixodbc-dev \
    msodbcsql17

# Run npm install to install Node.js dependencies
npm install
