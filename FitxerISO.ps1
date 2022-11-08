$Ruta = $MyInvocation.MyCommand.Path
Write-Output $MyInvocation.MyCommand.Name
$Ruta.replace('$MyInvocation.MyCommand.Name','')

# Mount-DiskImage -ImagePath $Ruta

# $driveLetter = (Get-DiskImage $Ruta | Get-Volume).DriveLetter

# $driveLetter = $driveLetter+":\"

# Write-Output $driveLetter

