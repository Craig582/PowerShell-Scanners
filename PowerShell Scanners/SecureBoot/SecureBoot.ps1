$bios = $env:firmware_type

If($bios -eq "Legacy"){
$SB2 = "N/A"
}

Elseif($bios -eq "UEFI"){
$SB = Confirm-SecureBootUEFI 

$SB2 = Switch($SB){

"False"{"Disabled"}
"True"{"Enabled"}
Default{"Unknown"}

}
}

[PSCUSTOMOBJECT]@{
"BIOS Type" = $bios
"Secure Boot" = $SB2
}