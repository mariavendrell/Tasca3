<# - Crea un script que permeti filtrar per tipus de ports oberts (TCP, UDP o tots dos al mateix temps) #>
# Preguntar quin tipus de ports vol veure
Write-Output "Que tipus de ports oberts vols veure? "
$Tipus = Read-Host "1.UDP / 2.TCP / 3.UDP i TCP -> "

# Visiaulitzar el ports que vol veure
switch ($Tipus) {
1{
    # UDP
    Write-Output "Ports UDP oberts: "
    Get-NetUDPEndpoint | Select-Object -Property LocalPort 
}
2{
    # TCP
    "Ports TCP oberts: "
    Get-NetTCPConnection -State Listen | Select-Object -Property LocalPort 
}
3{
    # UDP i TCP
    Write-Output "Port UDP oberts: "
    Get-NetUDPEndpoint | Select-Object -Property LocalPort 
    "Ports TCP oberts: "
    Get-NetTCPConnection -State Listen | Select-Object -Property LocalPort 
}
default{
    # L'opcio no es correcta
    Write-Output "L'opcio no es correcta "
}
}