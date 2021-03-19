export DEBIAN_FRONTEND=noninteractive

sudo su

#INTERFACE CONFIGURATION
#set up IP address to the interface
ip addr add 192.168.2.2/23 dev enp0s8
#brings the interface up
ip link set enp0s8 up

#STATIC ROUTING
#sets the default gateway on router-1
ip route add default via 192.168.2.1