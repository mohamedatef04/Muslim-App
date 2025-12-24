# Audio Compression Guide for Muslim App

## 🎯 Goal
Reduce APK size from **460MB to ~150-180MB** by compressing audio files.

## 📋 Prerequisites

You'll need **FFmpeg** installed on your system.

### Install FFmpeg on Windows:

**Option 1: Using Chocolatey (Recommended)**
```powershell
# Install Chocolatey if you don't have it
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

# Install FFmpeg
choco install ffmpeg
```

**Option 2: Manual Download**
1. Download from: https://www.gyan.dev/ffmpeg/builds/
2. Extract to `C:\ffmpeg`
3. Add `C:\ffmpeg\bin` to your PATH environment variable

**Verify Installation:**
```powershell
ffmpeg -version
```

---

## 🔧 Audio Compression Script

### Step 1: Create Backup
```powershell
# Navigate to your project
cd F:\Apps\muslim_app

# Create backup of original audio
Copy-Item -Recurse assets\Quran_json\audio\ ..\muslim_app_audio_backup\
```

### Step 2: Run Compression Script

Save this as `compress_audio.ps1`:

```powershell
# Audio Compression Script for Muslim App
# Compresses all MP3 files to 48kbps (good quality, small size)

$audioDir = "assets\Quran_json\audio"
$totalFiles = 0
$processedFiles = 0
$originalSize = 0
$compressedSize = 0

Write-Host "🎵 Starting Audio Compression..." -ForegroundColor Cyan
Write-Host "This will take 15-30 minutes depending on your CPU..." -ForegroundColor Yellow
Write-Host ""

# Count total files
Get-ChildItem -Path $audioDir -Recurse -Filter *.mp3 | ForEach-Object {
    $totalFiles++
}

Write-Host "Found $totalFiles audio files to compress" -ForegroundColor Green
Write-Host ""

# Process each MP3 file
Get-ChildItem -Path $audioDir -Recurse -Filter *.mp3 | ForEach-Object {
    $processedFiles++
    $file = $_.FullName
    $tempFile = $file + ".temp.mp3"
    
    # Get original size
    $originalSize += $_.Length
    
    # Progress indicator
    $percent = [math]::Round(($processedFiles / $totalFiles) * 100, 1)
    Write-Progress -Activity "Compressing Audio Files" -Status "$processedFiles of $totalFiles ($percent%)" -PercentComplete $percent
    
    # Compress using FFmpeg
    # -b:a 48k = 48kbps bitrate (good balance of quality/size)
    # -ac 1 = mono (Quran recitation doesn't need stereo)
    # -ar 22050 = 22.05kHz sample rate (sufficient for voice)
    & ffmpeg -i $file -b:a 48k -ac 1 -ar 22050 -y $tempFile 2>$null
    
    if (Test-Path $tempFile) {
        # Get compressed size
        $compressedSize += (Get-Item $tempFile).Length
        
        # Replace original with compressed
        Remove-Item $file
        Rename-Item $tempFile $file
    }
}

Write-Progress -Activity "Compressing Audio Files" -Completed

# Calculate savings
$originalSizeMB = [math]::Round($originalSize / 1MB, 2)
$compressedSizeMB = [math]::Round($compressedSize / 1MB, 2)
$savedMB = [math]::Round(($originalSize - $compressedSize) / 1MB, 2)
$savedPercent = [math]::Round((($originalSize - $compressedSize) / $originalSize) * 100, 1)

Write-Host ""
Write-Host "✅ Compression Complete!" -ForegroundColor Green
Write-Host ""
Write-Host "📊 Results:" -ForegroundColor Cyan
Write-Host "  Original Size:    $originalSizeMB MB"
Write-Host "  Compressed Size:  $compressedSizeMB MB"
Write-Host "  Space Saved:      $savedMB MB ($savedPercent%)"
Write-Host ""
Write-Host "Files processed: $processedFiles" -ForegroundColor Green
```

### Step 3: Run the Script

```powershell
# Make sure you're in the project directory
cd F:\Apps\muslim_app

# Run the compression script
.\compress_audio.ps1
```

---

## ⚡ Quick Compression (Alternative)

If you want even smaller files (lower quality but still acceptable):

```powershell
# Ultra-compressed version (32kbps, mono)
Get-ChildItem -Path assets\Quran_json\audio -Recurse -Filter *.mp3 | ForEach-Object {
    $file = $_.FullName
    $temp = $file + ".temp.mp3"
    ffmpeg -i $file -b:a 32k -ac 1 -ar 22050 -y $temp 2>$null
    if (Test-Path $temp) {
        Remove-Item $file
        Rename-Item $temp $file
    }
}
```

---

## 🎯 Expected Results

| Bitrate | Quality | APK Size | Reduction |
|---------|---------|----------|-----------|
| **48kbps** (Recommended) | Good | ~150-180 MB | ~65% |
| **32kbps** (Ultra-small) | Acceptable | ~100-120 MB | ~75% |
| **64kbps** (High quality) | Excellent | ~200-220 MB | ~55% |

---

## 🔄 After Compression

1. **Test the audio quality**:
   ```bash
   flutter run
   ```
   Play a few surahs to ensure quality is acceptable.

2. **Rebuild the APK**:
   ```bash
   flutter clean
   flutter build apk --split-per-abi
   ```

3. **Check new APK size**:
   The APKs should now be ~150-180 MB instead of 460 MB!

---

## 🆘 Troubleshooting

**If FFmpeg is not found:**
- Restart PowerShell after installation
- Check PATH: `$env:PATH -split ';' | Select-String ffmpeg`

**If compression fails:**
- Make sure you have write permissions
- Close any apps that might be using the audio files
- Try running PowerShell as Administrator

**If quality is too low:**
- Use 64kbps instead: `-b:a 64k`
- Keep stereo: remove `-ac 1`

---

## 💡 Pro Tips

1. **Test before committing**: Try compressing just one surah first
2. **Keep backups**: The backup folder is your safety net
3. **Consider streaming**: For even smaller APKs, consider streaming audio instead

---

## 📞 Next Steps

After compression:
1. Test audio playback in the app
2. Rebuild APK
3. Compare file sizes
4. If satisfied, delete the backup folder to save disk space

Good luck! 🚀
