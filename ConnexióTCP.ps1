Add-Type -AssemblyName System.Windows.Forms

$ConnexioTCP = Test-NetConnection google.com -Port 280 -InformationLevel Quiet


if ($ConnexioTCP -eq $true){
    [System.Windows.Forms.MessageBox]::Show("La connexió TCP a google.com per el port 80 ha sigut exitosa", "CONNEXIO TCP", "OK", "Information")
}
else {
    [System.Windows.Forms.MessageBox]::Show("La connexió TCP a google.com per el port 80 ha fallat", "CONNEXIO TCP", "OK", "Error")
}

