az vm extension set \
  --publisher Microsoft.Compute \
  --version 1.3 \
  --name JsonADDomainExtension \
  --vm-name MemberServer \
  --resource-group ADRG \
  --settings '{"name":"example.com", "user":"sysadmin", "restart": true, "options":3}' \
  --protected-settings '{"Password":"P@ssw0rd2017"}'