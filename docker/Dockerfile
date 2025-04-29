FROM node:18-alpine

# Install git and other build dependencies
RUN apk add --no-cache git bash python3 make g++ && \
    git config --global url."https://github.com/".insteadOf git@github.com:

# Set working directory
WORKDIR /app

# Clone Strapi
RUN git clone https://github.com/karthik1434/my-strapi-project.git .

# Install dependencies using npm
RUN npm install

# Build Strapi
RUN npm run build

# Expose default Strapi port
EXPOSE 1337

# Start the Strapi app in development mode
CMD ["npm", "run", "develop"]