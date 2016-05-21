# Lab 2 - Geo-route incoming traffic to your Azure Web App

Create two Azure Web Apps:

* Create a new resource group
* Add a new Web App to the resource group in West US. Name the app so you can tell where its provisioned (e.g. 23WebAppWest)
* Add a new Web App to the resource group in East US. Name the app so you can tell where its provisioned (e.g. 23WebAppEast)
* Install the [Open From Azure Websites](https://visualstudiogallery.msdn.microsoft.com/60d414b1-4ead-4fde-9359-588aa126cd6c) Visual Studio extention
* Download the publish profiles for each Web App

Do this for each Web App:

* In Visual Studio, go to file > open > select Open from Azure Websites and navigate to your publish profile
* With your Web App open in Visual Studio, right click on the Web App name in the Solution Explorer and select add > add new item and select html page
* Name you html page default.html
* Add a message to the body of the page that displays the Azure region, either east or west
* Right click on the html page in the Solution Explorer and click on publish
* Navigate to your Web App using the public URL (you can get this in the portal) and ensure you see your webpage

Create a Traffic Manager Profile:

* In the portal, search for Traffic Manager profile
* Create a new profile for your Web Apps and ensure the routing method is set to "performance"
* Add external endpoints for both the west and east Web Apps. Make sure to add them as "Azure" endpoints instead of external
* Visit your traffic manager URL to view the Web App. Did it route you to the correct location? If not, you may need to wait 5-10 mins for the platform to figure things out.
* You can also change the routing method for Traffic Manager to Priority. Then you can "stop" a Web App in the portal to test high availability / failover
* Delete all resource groups from your Azure Pass subscription when complete
