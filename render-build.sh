#!/bin/bash

# Update package list and install necessary ODBC libraries
apt-get update && apt-get install -y \
    build-essential \
    unixodbc \
    unixodbc-dev \
    msodbcsql17

# Run npm install to install Node.js dependencies
npm install
