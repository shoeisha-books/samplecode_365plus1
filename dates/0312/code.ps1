[CmdletBinding()]
param (
    [string]$keyPhrase = "JuliusCaesar",
    [switch]$decipher
)
 
$texts = "abcdefghijklmnopqrstuvwxyz0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ '" +
"あいうえおかきくけこさしすせそたちつてとなにぬねのはひふへほまみむめもやゆよらりるれろわをん"+
"アイウエオカキクケコサシスセソタチツテトナニヌネノハヒフヘホマミムメモヤユヨラリルレロワヲン"
 
$textsToProcess = [string](Read-Host("Enter phrase to cipher"))
$shift = $keyPhrase.Length
$textProcessed = ""
 
for ($i = 0; $i -lt $textsToProcess.Length; $i++) {
    $text = $textsToProcess[$i]
    if ($texts.Contains($text)) {
        if($decipher){
            $indexShifted = ($texts.IndexOf($text) - $shift + $texts.Length) % $texts.Length
        }
        else {
            $indexShifted = ($texts.IndexOf($text) + $shift) % $texts.Length
        }
        $textShifted = $texts[$indexShifted]
        $textProcessed += $textShifted
    }
    else {
        $textProcessed += $text
    }
}
 
Write-Host $textProcessed