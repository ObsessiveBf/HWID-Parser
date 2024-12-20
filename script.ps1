Clear-Host

# Display Header
Write-Host @"
   _    ___          _______ _____     _____      _ _           _             
  | |  | \ \        / /_   _|  __ \   / ____|    | | |         | |            
  | |__| |\ \  /\  / /  | | | |  | | | |     ___ | | | ___  ___| |_ ___  _ __ 
  |  __  | \ \/  \/ /   | | | |  | | | |    / _ \| | |/ _ \/ __| __/ _ \| '__|
  | |  | |  \  /\  /   _| |_| |__| | | |___| (_) | | |  __/ (__| || (_) | |   
  |_|  |_|   \/  \/   |_____|_____/   \_____\___/|_|_|\___|\___|\__\___/|_|   
                                                                            
                                                                            
                                                                            
"@ -ForegroundColor Red

# Check if the script is running as admin
function Test-Admin {
    $currentUser = New-Object Security.Principal.WindowsPrincipal $([Security.Principal.WindowsIdentity]::GetCurrent())
    return $currentUser.IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)
}

if (!(Test-Admin)) {
    Write-Warning "Please run this script as Administrator!"
    Start-Sleep 3
    Exit
}

# Inform the user that the script is starting
Start-Sleep -s 1
Clear-Host

Write-Host "Collecting hardware information, please wait..." -ForegroundColor Yellow

# Define the hardware info commands
$commands = @(
    'Get-WmiObject win32_processor | Select-Object ProcessorId',
    'Get-WmiObject Win32_PhysicalMemory | Select-Object SerialNumber',
    'Get-WmiObject Win32_DiskDrive | Select-Object SerialNumber'
)

# Loop through each command and display the results
foreach ($command in $commands) {
    Write-Host "Running command: $command" -ForegroundColor Cyan
    $result = Invoke-Expression $command
    Write-Host $result
    Write-Host ("=" * 50)  # Divider line for readability
}

Write-Host ""
Write-Host "Hardware information collected successfully!" -ForegroundColor Green
