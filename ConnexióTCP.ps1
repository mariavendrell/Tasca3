<# - Comprova amb un script que la connexió TCP és correcta. Mostra un missatge emergent indicant que funciona correctament. #>

Add-Type -AssemblyName System.Windows.Forms

# Fare la connexió a google.com pero el port pot anan variant per que es punguin comprovar
# que funcionan l'opcio de connexió exitosa i fallada

# Port aleatori
$Port = 80, 90, 144, 443 | Get-Random

# COmprovo la connexió
$ConnexioTCP = Test-NetConnection google.com -Port $Port -InformationLevel Quiet

# Missatge Emergent
if ($ConnexioTCP -eq $true){
    [System.Windows.Forms.MessageBox]::Show("La connexió TCP a google.com per el port $Port ha sigut exitosa", "CONNEXIO TCP", "OK", "Information")
}
else {
    [System.Windows.Forms.MessageBox]::Show("La connexió TCP a google.com per el port $Port ha fallat", "CONNEXIO TCP", "OK", "Error")
}

