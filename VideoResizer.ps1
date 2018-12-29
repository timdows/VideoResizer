Param (
    [string]$inputDirectory = "",
    [string]$outputDirectory = ""
)

Write-Host "--------------------------------"
Write-Host "inputDirectory:" $inputDirectory
Write-Host "outputDirectory:" $outputDirectory
Write-Host "--------------------------------"

Function Resize() {
    Get-ChildItem -Path $inputDirectory -filter *.mp4 | foreach {
        $command = "ffmpeg -i `"" + $_.FullName + "`" `"" + $outputDirectory + "\" + $_.BaseName + ".mp4`""
        Write-Host $command
        Invoke-Expression $command
    }
}

Resize