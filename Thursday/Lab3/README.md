# Lab 3 - Perform Server Backups

Backup a Virtual Machine

* Deploy a Windows virtual machine
* Navigate to Recovery Services vaults in the portal
* Add a new vault
* Add a new backup job, select "Virtual Machine" for the workload
* Kick off a manual backup job to snapshot the VM

Backup on "On-Prem" Server

* RDP to the server you created earlier. We'll use it in this lab as an "on-prem" server
* Login to the portal and go to your Recovery Services vault
* Add a new backup job, select "On-premises" for the workload
* Download and install the agent on the server
* Configure files & folders for backup
* Run a backup, delete some files, and do a test restore
* Delete the Resource Group from your Azure Pass subscription when complete