# Edit this settings 
$vCenterServer="vcenter.rbk.demo"
$vCenterUsername="administrator@vsphere.local"
$vCenterPassword="VMware123!"
$vCenterRubrikRoleName="Rubrik"
# End 

$vCenterRolePrivIds = @(
"Datastore.AllocateSpace",
"Datastore.Browse",   
"Datastore.Config",           
"Datastore.FileManagement",
"Datastore.Move",     
"Datastore.Delete",      
"Host.Config.Storage", 
"Host.Config.Patch",         
"Host.Config.Maintenance",
"Host.Config.Image",
"Network.Assign",            
"Resource.AssignVMToPool",
"Resource.HotMigrate",    
"Resource.ColdMigrate",    
"Resource.QueryVMotion",      
"Sessions.ValidateSession",    
"Sessions.TerminateSession",               
"VirtualMachine.Config.AddExistingDisk",
"VirtualMachine.Config.AddNewDisk",        
"VirtualMachine.Config.AddRemoveDevice",  
"VirtualMachine.Config.AdvancedConfig",
"VirtualMachine.Config.Resource",         
"VirtualMachine.Config.ChangeTracking",
"VirtualMachine.Config.DiskLease",    
"VirtualMachine.Config.RemoveDisk",
"VirtualMachine.Config.Rename",     
"VirtualMachine.Config.Settings",        
"VirtualMachine.Config.SwapPlacement",     
"VirtualMachine.GuestOperations.Modify",    
"VirtualMachine.GuestOperations.Execute", 
"VirtualMachine.GuestOperations.Query",     
"VirtualMachine.Interact.AnswerQuestion",
"VirtualMachine.Interact.Backup",             
"VirtualMachine.Interact.DeviceConnection",
"VirtualMachine.Interact.GuestControl",
"VirtualMachine.Interact.PowerOff",  
"VirtualMachine.Interact.PowerOn",   
"VirtualMachine.Interact.Suspend", 
"VirtualMachine.Interact.Reset",          
"VirtualMachine.Interact.ToolsInstall",
"VirtualMachine.Inventory.Create", 
"VirtualMachine.Inventory.Move",       
"VirtualMachine.Inventory.Register", 
"VirtualMachine.Inventory.Delete",       
"VirtualMachine.Inventory.Unregister",            
"VirtualMachine.Provisioning.DiskRandomAccess", 
"VirtualMachine.Provisioning.DiskRandomRead",
"VirtualMachine.Provisioning.GetVmFiles",   
"VirtualMachine.Provisioning.PutVmFiles",
"VirtualMachine.State.CreateSnapshot",   
"VirtualMachine.State.RemoveSnapshot",   
"VirtualMachine.State.RenameSnapshot",     
"VirtualMachine.State.RevertToSnapshot",
"StorageProfile.Update", 
"StorageProfile.View",                  
"InventoryService.Tagging.AttachTag")

Connect-VIServer -Server $vCenterServer -Username $vCenterUserName -Password $vCenterPassword
Write-Host -Foreground Green "Creating Rubrik Custom vCenter role: $vCenterRubrikRoleName"
New-VIRole -Name $vCenterRubrikRoleName -Privilege (Get-VIPrivilege -Id $vCenterRolePrivIds)
Disconnect-VIServer -Confirm:$false



