# Quick FFmpeg Installation Guide

## ⚡ Quick Install (Recommended)

### Option 1: Using Chocolatey (Easiest)

1. **Install Chocolatey** (if you don't have it):
   - Open PowerShell as Administrator
   - Run:
   ```powershell
   Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
   ```

2. **Install FFmpeg**:
   ```powershell
   choco install ffmpeg -y
   ```

3. **Restart PowerShell** and verify:
   ```powershell
   ffmpeg -version
   ```

### Option 2: Manual Installation

1. **Download FFmpeg**:
   - Go to: https://www.gyan.dev/ffmpeg/builds/
   - Download: `ffmpeg-release-essentials.zip`

2. **Extract**:
   - Extract to `C:\ffmpeg`
   - You should have: `C:\ffmpeg\bin\ffmpeg.exe`

3. **Add to PATH**:
   - Press `Win + X`, select "System"
   - Click "Advanced system settings"
   - Click "Environment Variables"
   - Under "System variables", find "Path", click "Edit"
   - Click "New" and add: `C:\ffmpeg\bin`
   - Click "OK" on all windows

4. **Restart PowerShell** and verify:
   ```powershell
   ffmpeg -version
   ```

---

## 🚀 After Installation

Once FFmpeg is installed, run the compression script:

```powershell
cd F:\Apps\muslim_app
.\compress_audio.ps1
```

This will:
- ✅ Compress 6,462 audio files
- ✅ Reduce size by ~65% (460MB → ~150MB)
- ⏱️ Take about 15-30 minutes

---

## ⚠️ Important Notes

1. **Backup is automatic**: The script will preserve your original files
2. **Test first**: After compression, test audio playback before rebuilding
3. **Quality**: 48kbps is a good balance - still sounds clear for Quran recitation

---

## 🆘 Need Help?

If you have issues installing FFmpeg, I can help you with:
1. Alternative compression methods
2. Streaming audio instead (no compression needed)
3. Removing audio completely (smallest APK)

Let me know! 🎯
