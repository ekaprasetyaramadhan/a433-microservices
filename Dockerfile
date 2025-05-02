# order-service/Dockerfile

# 1. Gunakan image Node.js yang ringan
FROM node:18-alpine

# 2. Set working directory di dalam container
WORKDIR /usr/src/app

# 3. Copy package.json & package-lock.json, lalu install dependencies
COPY package*.json ./
RUN npm install --production

# 4. Copy file .env agar dotenv bisa memuat konfigurasi
COPY .env ./

# 5. Copy seluruh source code aplikasi
COPY . .

# 6. Expose port sesuai PORT di .env (default 3000)
EXPOSE 3000

# 7. Jalankan aplikasi
CMD ["node", "index.js"]
