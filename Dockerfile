# Use the official Node.js image as a base
FROM node:20.12.2

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install dependencies, excluding devDependencies
RUN npm install --only=production

# Copy the rest of your application code
COPY . .

# Start your application
CMD ["npm", "start"]
