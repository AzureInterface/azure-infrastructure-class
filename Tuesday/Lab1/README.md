# Lab 1 - Create Windows Web Server with DSC

* Launch a Windows Server 2012 R2
* Install WMF 5 (optional) https://www.microsoft.com/en-us/download/details.aspx?id=50395
* If using WMF 5 - use Install-Module xWebAdministration
* Install the xWebAdministration DSC module on the server
* Install IIS and a simple web page using DSC (see WindowsWebServer.ps1 for an example)
* Modify your network security group rules to permit HTTP from the outside world. Verify you can view your web page
* Delete your resource group from your Azure Pass subscription when complete
