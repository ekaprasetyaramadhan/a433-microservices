# shipping-service/Dockerfile

# 1. Base image
FROM node:18-alpine

# 2. Working directory
WORKDIR /usr/src/app

# 3. Copy dependencies metadata & install
COPY package*.json ./
RUN npm install --production

# 4. Copy .env so dotenv can load PORT and AMQP_URL
COPY .env ./

# 5. Copy application code
COPY . .

# 6. Expose the listening port
EXPOSE 3001

# 7. Start the service
CMD ["node", "index.js"]
