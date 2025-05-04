# HOMEWORK2
# List all Docker networks.
docker network ls
# Inspect the default bridge network.
docker network inspect bridge
# Create a new bridge user-defined network.
docker network create --driver bridge brige02
# Run a container attached to it and inspect its IP.
docker run -dit --name alpine-test --network bridge02 alpine
inspect alpine-test
#Run two Nginx containers which have to be connected to that user-defined network created
docker run -dit --name nginx01 --network bridge02 nginx
docker run -dit --name nginx02 --network bridge02 nginx
# Create a Docker volume: mydata
docker volume create mydata
# Run a container using the created volume
docker run -dit --name alpine-vol-test -v mydata:/data alpine sh
# Write a file inside /data from the container
docker exec -it alpine-vol-test  sh
echo "Hello from alpine-vol-test container"
exit 
# Stop the container
docker stop alpine-vol-test 
# Relaunch to verify persistence.
docker start alpine-vol-test 
docker exec -it alpine-vol-test  sh
sleep 2
cat /data/hello.txt
sleep 5
exit
# Create a directory
mkdir -p ~/bind-mount-test
# Run a container with a bind mount.
docker run -dit --name alpine-bind -v ~/bind-mount-test:/mnt alpine sh
# Create a file in /mnt from the container and check the host
docker exec -it alpine-bind sh
sleep 2
echo "Bind mount is working fine!!!!" > /mnt/test.txt
exit
cat ~/bind-mount-test/test.txt
# Create a file in a named volume.
docker exec alpine-vol-test sh -c 'echo "Other file created in volume from reused container" > /data/other_file.txt'
docker exec alpine-vol-test ls /data
docker exec alpine-vol-test cat /data/other_file.txt
# Create a file using a bind mount.
docker exec alpine-bind sh -c 'echo "Other file created in bind from reused container" > /mnt/other_file.txt'
ls ~/bind-mount-test
cat  ~/bind-mount-test/other_file.txt 
# Run an Ubuntu container with the necessary options to enable Docker in Docker (DinD).
docker run -dit --name ubuntu-DinD -v /var/run/docker.sock:/var/run/docker.sock  -v /usr/bin/docker:/usr/bin/docker ubuntu
#2.	Exec into the container and run docker version.
docker exec -it ubuntu-DinD sh
sleep 2
docker version
exit
#Run a container with memory and CPU limits
docker run -dit --name limited-container --memory="256m" --cpus="0.5" alpine sh
docker stats limited-container
docker system df
# Run a container with policy --restart on-failure.
docker run -dit --name nginx-failing --restart on-failure nginx sh -c "exit 1"
# Run a container with  policy --restart unless-stopped
docker run -dit --name nginx-unless-stopped --restart unless-stopped -p 8080:80 nginx
slepp 5
sudo reboot
docker ps
# Create a network dbnet.
docker network create dbnet
# Create a volume dbdata.
docker volume create dbdata
# Run a MariaDB container wit requirements
docker run -dit --name phpmyadmin --network dbnet -v ~/phpmyadmin/config:/etc/phpmyadmin -e PMA_HOST=mariadb-db  -e PMA_PORT=3306 -p 8081:80 phpmyadmin/phpmyadmin
