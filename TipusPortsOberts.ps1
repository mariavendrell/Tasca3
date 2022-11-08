Write-Output "Que tipus de ports oberts vols veure? "
$Tipus = Read-Host "1.UDP / 2.TCP / 3.UDP i TCP -> "


switch ($Tipus) {
1{
    Write-Output "Ports UDP oberts: "
    Get-NetUDPEndpoint | Select-Object -Property LocalPort 
}
2{
    "Ports TCP oberts: "
    Get-NetTCPConnection -State Listen | Select-Object -Property LocalPort 
}
3{
    Write-Output "Port UDP oberts: "
    Get-NetUDPEndpoint | Select-Object -Property LocalPort 
    "Ports TCP oberts: "
    Get-NetTCPConnection -State Listen | Select-Object -Property LocalPort 
}
default{
    Write-Output "L'opcio no es correcta "
}
}