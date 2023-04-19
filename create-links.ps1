Write-Host "Running the script: $($MyInvocation.MyCommand.Name)"

# Get the current directory
$currentDirectory = Get-Location

# Get all items in the current folder
$CONFIG_ITEMS = Get-ChildItem -Path *

foreach ($CONFIG_ITEM in $CONFIG_ITEMS) {
	Write-Host "Creating a symbolic for the following files... $($CONFIG_ITEM.name)"
	
	# If object is the file init.lua
	if($CONFIG_ITEM.Name -eq "init.lua") { 
		New-Item -ItemType SymbolicLink -Path "C:\\Users\\edmun\\AppData\\Local\\nvim\\$($CONFIG_ITEM.name)" -Target "$($currentDirectory.Path)\\$($CONFIG_ITEM.name)"
	}
	if($CONFIG_ITEM.PSIsContainer -AND $CONFIG_ITEM.Name -eq "lua") {
		New-Item -ItemType Junction -Path "C:\\Users\\edmun\\AppData\\Local\\nvim\\$($CONFIG_ITEM.name)" -Target "$($currentDirectory.Path)\\$($CONFIG_ITEM.name)"

	}
}

for ($i = 1; $i -le 5; $i++) {
	Write-Host $i
}
