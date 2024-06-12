# Use an official Node runtime as a parent image
FROM node:20

# Set the working directory
WORKDIR /usr/src/app

# Install necessary system dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    unixodbc \
    unixodbc-dev \
    msodbcsql17 \
    libssl-dev \
    libkrb5-dev \
    curl

# Install the Microsoft ODBC Driver for SQL Server
RUN curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add - \
    && curl https://packages.microsoft.com/config/ubuntu/20.04/prod.list > /etc/apt/sources.list.d/mssql-release.list \
    && apt-get update \
    && ACCEPT_EULA=Y apt-get install -y msodbcsql17

# Set environment variable for ODBC Driver
ENV PATH="/opt/mssql-tools/bin:${PATH}"
ENV LD_LIBRARY_PATH="/usr/lib:/usr/lib/x86_64-linux-gnu:${LD_LIBRARY_PATH}"

# Copy package.json and package-lock.json
COPY package*.json ./

# Install Node.js dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Expose the port the app runs on
EXPOSE 8080

# Define the command to run the app
CMD ["node", "app.js"]
