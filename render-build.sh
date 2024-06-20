#!/usr/bin/env bash

# Update package lists
apt-get update

# Install system dependencies
apt-get install -y unixodbc-dev g++ make

# Ensure python is available for node-gyp
apt-get install -y python3

# Link python3 to python if necessary
ln -s /usr/bin/python3 /usr/bin/python || true

# Other dependencies can be added here
