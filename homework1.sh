# HOMEWORK1
# Set up Docker's apt repository.
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
# Install the Docker packages
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
# Enable Docker service
sudo systemctl enable docker.service
# Start the Docker service.
sudo systemctl start docker.service
# Print the info of the Docker Client and Server
docker version --format '{{.Client.Version}}'
docker version --format '{{.Server.Version}}'
docker info
# Search for the official repos.
docker search Ubuntu
docker search alpine --filter is-official=true
docker search nginx --filter is-official=true
# Run an Nginx container using the image from the official repo.
docker run --name nginx  -p 8080:80 -d nginx
# Check Docker daemon status
systemctl status docker
# Stop the Docker daemon
sudo systemctl stop docker.socket
# Restart the Docker daemon
sudo systemctl restart docker
# Run a container again
docker start nginx
#	Run an Ubuntu container interactively.
docker run -it ubuntu
# Install Curl in the Ubuntu conatiner
apt update && apt install curl 
# Exit the container
exit
# List running containers
docker ps
# List all containers (including exited)
docker ps -a
#	Run a container in the background
docker run -d --name nginx-02 nginx
# Pause the container
docker pause nginx-02
# Unpause the container
docker unpause nginx-02
# Stop the container
docker stop nginx-02
# Restart the container
docker restart nginx-02
# Kill the container
docker kill nginx-02
# Remove a running container.
docker run -d --name nginx-03 nginx
docker rm -f nginx-03
# Pull the alpine and ubuntu images.
docker pull alpine
docker pull ubuntu
# List all the container images in your Docker Host.
docker images
# Run alpine and execute echo "hello from alpine"
docker run alpine echo "hello from alpine"
# Run busybox and execute uname -a
docker run busybox uname -a
# List all the container
docker ps
# Remove all stopped containers
docker container prune
# Remove unused images
docker image prune -a
# Inspect Docker disk usage
docker system df