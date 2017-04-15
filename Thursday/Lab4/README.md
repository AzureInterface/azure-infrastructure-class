# Lab 4 - Perform Server Backups

Backup a Virtual Machine

1. Deploy a Windows virtual machine
2. Navigate to Recovery Services vaults in the portal
3. Add a new vault (note: search for "backup")
4. Add a new backup job, select "Virtual Machine" for the workload
5. Kick off a manual backup job to snapshot the VM (this will probably take about 30mins)

Backup on "On-Prem" Server

1. RDP to the server you created earlier. We'll use it in this lab as an "on-prem" server
2. Login to the portal and go to your Recovery Services vault
3. Add a new backup job, select "On-premises" for the workload
4. Download and install the agent on the server
5. Configure files & folders for backup
6. Run a backup, delete some files, and do a test restore

Restore your Snapshot to a new VM

1. In your Recovery Services vault, navigate to the VM backup job
2. Restore the backup to a new VM in your existing Resource Group
3. Verify you can access the VM after the restore
4. Delete the Resource Group from your Azure Pass subscription when complete

### Notes

Back up a Windows Server or client to Azure
* https://docs.microsoft.com/en-us/azure/backup/backup-configure-vault

Restore files to a Windows server or Windows client machine
* https://docs.microsoft.com/en-us/azure/backup/backup-azure-restore-windows-server
