#!/bin/bash


# Update for your admin password
AdminPassword=P@ssw0rd2017

# Create a resource group.
az group create --name Servers --location westus2

# Create a virtual network.
az network vnet create --resource-group Servers --name myVnet --subnet-name mySubnet

# Create a public IP address.
az network public-ip create --resource-group Servers --name myPublicIP

# Create a network security group.
az network nsg create --resource-group Servers --name myNetworkSecurityGroup

# Create a virtual network card and associate with public IP address and NSG.
az network nic create \
  --resource-group Servers \
  --name myNic \
  --vnet-name myVnet \
  --subnet mySubnet \
  --network-security-group myNetworkSecurityGroup \
  --public-ip-address myPublicIP

# Create a virtual machine. 
az vm create \
    --resource-group Servers \
    --name myVM \
    --location westus2 \
    --nics myNic \
    --image win2016datacenter \
    --admin-username azureuser \
    --admin-password $AdminPassword \
    --size Standard_D2s_v3

# Open port 3389 to allow RDP traffic to host.
az vm open-port --port 3389 --resource-group Servers --name myVM
