# menggunakan base image Node.js versi 14
FROM node:14-alpine

# menentukan working directory untuk container
WORKDIR /app

# menyalin source code ke working directory container
COPY . .

# menjalankan aplikasi dalam production mode
# dan menggunakan container bernama item-db sebagai database host
ENV NODE_ENV=production DB_HOST=item-db

# menginstal dependencies untuk production dan kemudian build aplikasi
RUN npm install --production --unsafe-perm && npm run build

# mengexpos port 8080
EXPOSE 8080

# menjalankan server
CMD ["npm", "start"]