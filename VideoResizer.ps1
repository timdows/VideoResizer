Param (
    [string]$inputDirectory = "",
    [string]$outputDirectory = ""
)

Write-Host "--------------------------------"
Write-Host "inputDirectory:" $inputDirectory
Write-Host "outputDirectory:" $outputDirectory
Write-Host "--------------------------------"

Function Resize() {
    Get-ChildItem -Path $inputDirectory -filter *.mp4 | ForEach-Object {
        #$command = "ffmpeg -i `"" + $_.FullName + "`" -vf `"scale='min(1600,iw)':-1`" `"" + $outputDirectory + "\" + $_.BaseName + ".mp4`""
        $command = "ffmpeg -i `"" + $_.FullName + "`" -vcodec libx264 -crf 24 -vf `"scale='min(1024,iw)':-1`" `"" + $outputDirectory + "\" + $_.BaseName + ".mp4`""
        Write-Host $command
        Invoke-Expression $command
    }
}

Resize