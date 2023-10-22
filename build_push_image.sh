# membuat Docker image dari Dockerfile
docker build -t item-app:v1 .

# melihat daftar image di lokal
docker images

# mengubah nama image agar sesuai dengan format GitHub Packages
docker tag item-app:v1 ghcr.io/asrulsaid/item-app:v1

# login ke GitHub Packages
echo $CR_PAT | docker login ghcr.io -u asrulsaid --password-stdin

# mengunggah image ke GitHub Packages
docker push ghcr.io/asrulsaid/item-app:v1
