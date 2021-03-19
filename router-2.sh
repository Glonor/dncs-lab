export DEBIAN_FRONTEND=noninteractive

sudo su

#IP FORWARDING
sysctl net.ipv4.ip_forward=1

#INTERFACE CONFIGURATION
#add IP addresses to the interfaces
ip addr add 192.168.4.1/23 dev enp0s8
ip addr add 10.0.0.2/30 dev enp0s9

#brings the interfaces up
ip link set enp0s8 up
ip link set enp0s9 up

#STATIC ROUTING
#deletes the dafault gateway
ip route del default
#creates a static route to reach subnet A via router-1
ip route add 192.168.0.0/23 via 10.0.0.1 dev enp0s9
#creates a static route to reach subnet B via router-1
ip route add 192.168.2.0/23 via 10.0.0.1 dev enp0s9