# Lab 5 - Create a custom VM image

Create a new Windows VM or power on an existing Windows VM in your Azure Pass subscription

* Customize the server. Disable IESC, etc.
* Run sysprep to generalize the server (run sysprep.exe)
* Use the PowerShell script samples in this repo to generalize your VM and capture an image (Capture-Image.ps1)
* Deploy a new server with your image into the existing resource group (Add-AzureServerFromImage.ps1)
* Delete all resource groups from your Azure Pass subscription when complete
