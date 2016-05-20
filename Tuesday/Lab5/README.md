# Lab 5 - Deploy an AD DS Domain Controller and use Domain Join Extention to add new servers to the domain

* Launch the AD Domain Controller ARM template from [here](https://github.com/Azure/azure-quickstart-templates/tree/master/active-directory-new-domain)
* Launch a new server into the same resource group / vnet as the domain controller
* Make sure your new VM can resolve DNS against the domain controller
* Use the Azure joindomain extention to join the server to your AD domain (see DomainJoin-Extention-Example.ps1)
* Delete the resource group from your Azure Pass subscription when complete

