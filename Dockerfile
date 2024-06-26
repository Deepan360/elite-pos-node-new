FROM node:20.12.2

# Install build dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    python3 \
    unixodbc-dev \
    && rm -rf /var/lib/apt/lists/*

# Set the working directory
WORKDIR /usr/src/app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install production dependencies
RUN npm install --only=production

# Copy the rest of the application files
COPY . .

# Expose the application port (optional, adjust as needed)
EXPOSE 8007

# Define the command to run the application
CMD ["node", "app.js"]
