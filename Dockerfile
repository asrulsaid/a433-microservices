# menggunakan image node:18-alpine dan memberi nama alias builder
FROM node:18-alpine as builder
# menetapkan working direktori ke /src
WORKDIR /src
# menyalin seluruh file yang dengan nama berawalan package dengan ekstensi .json ke working direktori
COPY package*.json ./
# menginstall dependensi dari file package
RUN npm ci
# menyalin seluruh file yang memiliki ekstensi .js ke working direktori
COPY ./*.js ./
# mengekspos port 3000
EXPOSE 3000
# menjalankan aplikasi
CMD ["node", "index.js"]