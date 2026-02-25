function yes_or_no([string]$question) {
    while ($true) {
        $response = (Read-Host "$question (y/n)")[0..1] -Join ""

        switch ($response.ToLower()) {
            'y' { return $true }
            'n' { return $false }
            default { Write-Host "Please enter 'y' for yes or 'n' for no." }
        }
    }
}
