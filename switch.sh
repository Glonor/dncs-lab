export DEBIAN_FRONTEND=noninteractive
apt-get update
apt-get install -y tcpdump
apt-get install -y openvswitch-common openvswitch-switch apt-transport-https ca-certificates curl software-properties-common

# Startup commands for switch go here
sudo su

#BRIDGE CREATION
#creates a new bridge called switch
ovs-vsctl add-br switch

#INTERFACE CONFIGURATION
#creates a trunk port
ovs-vsctl add-port switch enp0s8

#creates an access port on VLAN 10
ovs-vsctl add-port switch enp0s9 tag=10

#creates an access port on VLAN 20
ovs-vsctl add-port switch enp0s10 tag=20

#brings the interfaces up
ip link set enp0s8 up
ip link set enp0s9 up
ip link set enp0s10 up