$fileTable = @{}
$outputs = @()

foreach ($file in Get-ChildItem -File) {
    $hash = Get-FileHash -Path $file.FullName -Algorithm SHA256

    if($fileTable.ContainsKey($hash.Hash)) {
        $outputs += "$($file.Name),$($fileTable[$hash.Hash])"
    } else {
    $fileTable.Add($hash.Hash, $file.Name)
    }
}

Write-Output $outputs
