# membuat Docker image dari Dockerfile
docker build -t karsajobs-ui:latest .

# melihat daftar image di lokal
docker images

# mengubah nama image agar sesuai dengan format GitHub Packages
docker tag karsajobs-ui:latest ghcr.io/asrulsaid/karsajobs-ui:latest

# login ke GitHub Packages
echo $CR_PAT | docker login ghcr.io -u asrulsaid --password-stdin

# mengunggah image ke GitHub Packages
docker push ghcr.io/asrulsaid/karsajobs-ui:latest
