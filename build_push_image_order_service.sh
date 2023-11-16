# membuat Docker image dari Dockerfile
docker build -t order-service:latest .

# melihat daftar image di lokal
docker images

# mengubah nama image agar sesuai dengan format GitHub Packages
docker tag order-service:latest ghcr.io/asrulsaid/order-service:latest

# login ke GitHub Packages
echo $CR_PAT | sudo docker login ghcr.io -u asrulsaid --password-stdin

# mengunggah image ke GitHub Packages
sudo docker push ghcr.io/asrulsaid/order-service:latest
