# Lab 1 - Blue-green Deployments with Azure Web Apps and Deployment Slots

Deploy a Web App to Azure:

* Launch the "Visual Studio Community 2015 with Azure SDK 2.9 on Windows Server 2012 R2" Virtual Machine.
* Connect to your Visual Studio VM with RDP *Make sure you disable IESC*
* Use Visual Studio to create a new Web Application
* Go to file > new > project and create an empty ASP.NET website
* Right click the project name (e.g. WebApplication1) in the Solution Explorer, go to add > add new item, and add an html page to the project called default.html
* Add some text to the body of the html page
* Right click the project and select Publish Web App
* Deploy your site to a new Resource Group and App Service plan. Make sure to select at least a Standard tier App Service Plan

Create a "Dev" Deployment Slot

* In the portal, create a deployment slot in your Web App called "dev"
* Make a change to the default.html page in your project
* Deploy the updated version of your application to the "dev" deployment slot. Do this by right clicking the project and selecting Publish Web App - when the wizard comes up for publishing the app, make sure to go back to "profile", click on "Microsoft App Service" and then you'll be able to drill down into your Web App to select your "dev" deployment slot
* Navigate to your "dev" url to see the new version of the Web App
* After you confirm you have two different versions of your Web App running in the prod and dev deployment slots, perform a deployment slot swap in the portal.  Swap using the "dev" site as the source to destination "production". This simulates moving a new version of your app into production
* Navigate to the production url to confirm the new version of the app is running there
* Keep your Visual Studio VM for the next lab!


