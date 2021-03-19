export DEBIAN_FRONTEND=noninteractive

sudo su

#Configuration of network interface
ip addr add 192.168.4.2/23 dev enp0s8
ip link set enp0s8 up

#Docker installation
apt-get update
apt-get install -y apt-transport-https ca-certificates curl software-properties-common
#Add Docker’s official GPG key:
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
apt-get update

#install the latest version of Docker Engine and containerd
apt-get install -y docker-ce docker-ce-cli containerd.io
#pull and run nginx-test from docker-hub
docker pull dustnic82/nginx-test
docker run -d -p 80:80 dustnic82/nginx-test

#Setting up default gateway
ip route add default via 192.168.4.1