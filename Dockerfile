# Stage 1: Build Stage
FROM node:20.12.2 AS build

# Install build dependencies
RUN apt-get update && \
    apt-get install -y build-essential && \
    rm -rf /var/lib/apt/lists/*

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install dependencies
RUN npm install --only=production

# Stage 2: Production Stage
FROM node:20.12.2

# Install unixODBC-dev
RUN apt-get update && \
    apt-get install -y unixodbc-dev && \
    rm -rf /var/lib/apt/lists/*

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy built files from the previous stage
COPY --from=build /usr/src/app/node_modules ./node_modules
COPY . .

# Start your application
CMD ["npm", "start"]
