# docker stop $(docker ps -q)
# docker system prune
# docker build -t libp2p-node .
# docker run -d -e LIBP2P_PORT=15000 libp2p-node
# docker logs -f container-id
# docker run -d -e LIBP2P_PORT=16000 libp2p-node

# Use a slim Node.js base image
FROM node:24-alpine

# Set the working directory
WORKDIR /app

# Copy package.json and lock file
COPY package*.json ./

# Install dependencies
RUN yarn install

# Copy the rest of the app
# Resolve SAST later
COPY . .

# Start the app (adjust as needed)
CMD ["node", "dist/node.js"]
