$inputFileName = "input.txt"
$inputFilePath = [System.IO.Path]::Combine($PSScriptRoot, $inputFileName)

$outputDirName = "output"
$outputDirPath = [System.IO.Path]::Combine($PSScriptRoot, $outputDirName)
If(!(test-path $outputDirPath))
{
    New-Item -ItemType Directory -Force -Path $outputDirPath
}

$ffmpegExe = [System.IO.Path]::Combine($PSScriptRoot, "bin", "ffmpeg.exe")

Get-Content $inputFilePath -Encoding UTF8 | foreach {
    $fields = $_ -split '\s+'

    $url = ($fields[0] -split '\?')[0]

    $outputFileName = $fields[1] + ".mp4"
    $outputFilePath = [System.IO.Path]::Combine($outputDirPath, $outputFileName)
    If(test-path $outputFilePath)
    {
        Remove-Item $outputFilePath -Force
    }

    & $ffmpegExe -i $url -c copy -bsf:a aac_adtstoasc $outputFilePath
}