export DEBIAN_FRONTEND=noninteractive

sudo su

#IP FORWARDING
sysctl net.ipv4.ip_forward=1

#INTERFACE CONFIGURATION
#adds IP address to the interface
ip addr add 10.0.0.1/30 dev enp0s9
#brings the interface up
ip link set enp0s9 up

#SUBINTERFACES FOR VLANS
#creates the subinterface for VLAN 10
ip link add link enp0s8 name enp0s8.10 type vlan id 10
#adds IP address to the subinterface
ip addr add 192.168.0.1/23 dev enp0s8.10

#creates the subinterfaces for VLAN 20
ip link add link enp0s8 name enp0s8.20 type vlan id 20
#adds IP address to the subinterface
ip addr add 192.168.2.1/23 dev enp0s8.20

#set the interfaces up
ip link set enp0s8 up
ip link set enp0s8.10 up
ip link set enp0s8.20 up

#STATIC ROUTING
#deletes the dafault gateway
ip route del default
#creates a static route to reach subnet B via router-2
ip route add 192.168.4.0/23 via 10.0.0.2 dev enp0s9