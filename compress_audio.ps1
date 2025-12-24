# Audio Compression Script for Muslim App
# Compresses all MP3 files to 48kbps (good quality, small size)

$audioDir = "assets\Quran_json\audio"
$totalFiles = 0
$processedFiles = 0
$originalSize = 0
$compressedSize = 0

Write-Host "Audio Compression Script" -ForegroundColor Cyan
Write-Host "This will take 15-30 minutes depending on your CPU..." -ForegroundColor Yellow
Write-Host ""

# Check for local or system FFmpeg
$localFFmpeg = Join-Path $PSScriptRoot "tools\ffmpeg.exe"
$ffmpegPath = "ffmpeg"

if (Test-Path $localFFmpeg) {
    $ffmpegPath = $localFFmpeg
    Write-Host "[OK] Found local FFmpeg: $localFFmpeg" -ForegroundColor Green
    Write-Host ""
} else {
    try {
        $ffmpegVersion = & ffmpeg -version 2>&1 | Select-Object -First 1
        Write-Host "[OK] Found system FFmpeg: $ffmpegVersion" -ForegroundColor Green
        Write-Host ""
    } catch {
        Write-Host "FFmpeg not found. Attempting to download..." -ForegroundColor Yellow
        
        # Create tools directory
        $toolsDir = Join-Path $PSScriptRoot "tools"
        if (-not (Test-Path $toolsDir)) {
            New-Item -ItemType Directory -Path $toolsDir | Out-Null
        }

        $url = "https://www.gyan.dev/ffmpeg/builds/ffmpeg-release-essentials.zip"
        $zipPath = Join-Path $toolsDir "ffmpeg.zip"
        
        Write-Host "Downloading FFmpeg..." -ForegroundColor Cyan
        try {
            if (Test-Path $zipPath) { Remove-Item $zipPath -Force }
            
            [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
            Invoke-WebRequest -Uri $url -OutFile $zipPath -UseBasicParsing
            
            Write-Host "Extracting FFmpeg..." -ForegroundColor Cyan
            Expand-Archive -Path $zipPath -DestinationPath $toolsDir -Force
            
            # Find the exe
            $extractedExe = Get-ChildItem -Path $toolsDir -Recurse -Filter "ffmpeg.exe" | Select-Object -First 1
            
            if ($extractedExe) {
                Move-Item -Path $extractedExe.FullName -Destination $localFFmpeg -Force
                $ffmpegPath = $localFFmpeg
                Write-Host "[OK] FFmpeg installed locally." -ForegroundColor Green
            } else {
                throw "Could not find ffmpeg.exe in extracted files"
            }
            
            Remove-Item $zipPath -Force
            Get-ChildItem -Path $toolsDir -Directory | Remove-Item -Recurse -Force
            
        } catch {
            Write-Host "[ERROR] Failed to download/install FFmpeg." -ForegroundColor Red
            Write-Host "Error: $_" -ForegroundColor Red
            exit 1
        }
    }
}

# Check if audio directory exists
if (-not (Test-Path $audioDir)) {
    Write-Host "[ERROR] Audio directory not found: $audioDir" -ForegroundColor Red
    exit 1
}

# Count total files
Get-ChildItem -Path $audioDir -Recurse -Filter *.mp3 | ForEach-Object {
    $totalFiles++
}

if ($totalFiles -eq 0) {
    Write-Host "[ERROR] No MP3 files found in $audioDir" -ForegroundColor Red
    exit 1
}

Write-Host "Found $totalFiles audio files to compress" -ForegroundColor Green
Write-Host ""

$startTime = Get-Date

# Process each MP3 file
Get-ChildItem -Path $audioDir -Recurse -Filter *.mp3 | ForEach-Object {
    $processedFiles++
    $file = $_.FullName
    $tempFile = $file + ".temp.mp3"
    
    $originalSize += $_.Length
    
    $percent = [math]::Round(($processedFiles / $totalFiles) * 100, 1)
    
    Write-Progress -Activity "Compressing Audio Files" `
                   -Status "$processedFiles of $totalFiles ($percent%)" `
                   -PercentComplete $percent
    
    & $ffmpegPath -i $file -b:a 48k -ac 1 -ar 22050 -v error -hide_banner -y $tempFile
    
    if (Test-Path $tempFile) {
        $compressedSize += (Get-Item $tempFile).Length
        Remove-Item $file -Force
        Rename-Item $tempFile $file
    } else {
        Write-Host "Warning: Failed to compress $($_.Name)" -ForegroundColor Yellow
    }
}

Write-Progress -Activity "Compressing Audio Files" -Completed

$endTime = Get-Date

$originalSizeMB = [math]::Round($originalSize / 1MB, 2)
$compressedSizeMB = [math]::Round($compressedSize / 1MB, 2)
$savedMB = [math]::Round(($originalSize - $compressedSize) / 1MB, 2)

if ($originalSize -gt 0) {
    $savedPercent = [math]::Round((($originalSize - $compressedSize) / $originalSize) * 100, 1)
} else {
    $savedPercent = 0
}

Write-Host ""
Write-Host "[OK] Compression Complete!" -ForegroundColor Green
Write-Host ""
Write-Host "Results:" -ForegroundColor Cyan
Write-Host "  Original Size:    $originalSizeMB MB"
Write-Host "  Compressed Size:  $compressedSizeMB MB"
Write-Host ("  Space Saved:      {0} MB ({1}%)" -f $savedMB, $savedPercent) -ForegroundColor Green
Write-Host ""
Write-Host ("Time taken: {0}" -f ($endTime - $startTime).ToString('mm\:ss'))
Write-Host "Files processed: $processedFiles"
Write-Host ""
Write-Host "Next Steps:" -ForegroundColor Yellow
Write-Host "  1. Test audio playback: flutter run"
Write-Host "  2. Rebuild APK: flutter clean && flutter build apk --split-per-abi"
