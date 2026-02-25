[System.IO.FileInfo[]]$files = Get-ChildItem -File

$target_ext = $args[0]
if (-not $target_ext.StartsWith('.')) {
    $target_ext = ".$target_ext"
}

New-Item -ItemType Directory -Path $target_ext -Force
foreach ($file in $files) {
    if ($file.Extension -eq $target_ext) {
        Move-Item -Path $file.FullName -Destination $target_ext
    }
}
