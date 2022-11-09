<#  Munta un fitxer iso i copia algun fitxer d'aquesta iso a una ruta de destí que s'ha de demanar durant l'execució. 
    El fitxer iso el pots consultar manualment, no cal que ho faci l'script.                                            #>

# Preguntar on vol copiar el arxiu random de la ISO
Write-Output "On vol copiar el arxiu random de la ISO prova.iso"
$Ubuicacio = Read-Host "Ruta(C:\User\Maria\Documentos) "

# COmprovar si existeix la ubicaio que ens ha donat
$exiteis = Test-Path $Ubuicacio

if ($exiteis -eq $True){

    # Ruta del arxiu iso
    $Ruta = ($MyInvocation.MyCommand.Path).replace($MyInvocation.MyCommand.Name,'prova.iso')

    # Muntar arxiu iso
    Mount-DiskImage -ImagePath $Ruta > $null

    # Trobar lletra del volum de la iso
    $driveLetter = (Get-DiskImage $Ruta | Get-Volume).DriveLetter

    # Crear la Ruta de la iso 
    $RutaISO = $driveLetter+":\"

    # Arxiu Random a copiar
    $ArxiuRandomISO = Get-ChildItem $RutaISO -Name | Get-Random

    # Ruta arxiu a copiar
    $ArxiuCopiar = $RutaISO + $ArxiuRandomISO

    # Copiar arxiu 
    Copy-Item $ArxiuCopiar -Destination $Ubuicacio

    Write-Output "L'arxiu $ArxiuRandomISO a sigut copiat a $Ubuicacio"

    # Desmontar ISO
    Dismount-DiskImage -ImagePath $Ruta > $null
}
else 
{
    # Avisasr que la ruta es invalida i acaba el scrip
    Write-Output "Ruta invalida"
}
