# menggunakan image node:18-alpine dan memberi nama alias builder
FROM node:18-alpine as builder
# menetapkan working direktori ke /src
WORKDIR /src
# menyalin seluruh file yang dengan nama berawalan package dengan ekstensi .json ke working direktori
COPY package*.json ./
# menginstall bash
RUN apk add --no-cache bash
# mengunduh berkas shell script wait-for-it.sh
RUN wget -O ./wait-for-it.sh https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh
# mengubah hak akses file wait-for-it.sh agar dapat dieksekusi
RUN chmod +x ./wait-for-it.sh
# menginstall dependensi yang diperlukan
RUN npm ci
# menyalin semua berkas berekstensi .js ke workdir
COPY ./*.js ./
# mengekspos port 3001
EXPOSE 3001
# menjalankan script wait-for-it.sh agar shipping service menunggu maksimal 30 detik hingga rabbitmq service aktif
CMD ["sh", "-c", "./wait-for-it.sh rabbitmq.rabbitmq-system:5672 --timeout=30 -- node index.js"]