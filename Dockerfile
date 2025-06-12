# Use Node.js base image
FROM node:18-alpine

# Set working directory
WORKDIR /usr/src/app

# Copy package files
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy app files
COPY . .

# Expose port
EXPOSE 3000

# Start application
CMD ["npm", "start"]
