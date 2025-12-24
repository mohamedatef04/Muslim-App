# Muslim App - APK Size Reduction Guide

## Current Situation
- **APK Sizes**: 460-463 MB per architecture
- **Main Culprit**: 6,462 audio files in `assets/Quran_json/audio/` (~450MB)

## 🎯 Recommended Solutions (Choose One)

### **Option 1: Remove All Audio Files** ⭐ BEST FOR SIZE
**Expected APK Size**: ~10-15 MB (97% reduction!)

#### Steps:
1. **Delete the audio folder**:
   ```bash
   Remove-Item -Recurse -Force assets\Quran_json\audio\
   ```

2. **Remove audio asset declarations from `pubspec.yaml`**:
   - Delete lines 77-190 (all the `assets/Quran_json/audio/` entries)

3. **Disable audio playback in the app**:
   - Comment out or remove the play/pause buttons in:
     - `lib/features/surahdetails/presentation/widgets/custom_listview_item.dart`
     - `lib/features/setting/presentation/widgets/quran_bookmark_view_body.dart`

**Pros**: Smallest APK size, fastest download
**Cons**: No offline audio playback

---

### **Option 2: Stream Audio from Online** ⭐ RECOMMENDED
**Expected APK Size**: ~10-15 MB + online streaming

Instead of bundling audio, stream from a CDN like:
- https://cdn.islamic.network/quran/audio/128/ar.alafasy/
- https://everyayah.com/data/

#### Implementation:
Modify the audio path to use URLs instead of local assets.

**Pros**: Small APK, full audio functionality
**Cons**: Requires internet connection for audio

---

### **Option 3: On-Demand Audio Download**
**Expected APK Size**: ~10-15 MB initially

Download audio files only when user wants to listen to a specific surah.

**Pros**: Small initial APK, works offline after download
**Cons**: More complex implementation

---

### **Option 4: Keep Audio but Compress**
**Expected APK Size**: ~150-200 MB

Use lower bitrate MP3 files (e.g., 32kbps instead of 128kbps).

**Pros**: Offline audio included
**Cons**: Still large APK, lower audio quality

---

## 🚀 Quick Win: Option 1 Implementation

If you want the smallest APK immediately, run these commands:

```powershell
# 1. Backup audio folder (optional)
Copy-Item -Recurse assets\Quran_json\audio\ ..\muslim_app_audio_backup\

# 2. Delete audio folder
Remove-Item -Recurse -Force assets\Quran_json\audio\

# 3. Clean and rebuild
flutter clean
flutter build apk --split-per-abi
```

Then manually edit `pubspec.yaml` to remove lines 77-190.

---

## 📊 Additional Size Optimizations

### 1. **Enable ProGuard/R8** (Android)
Add to `android/app/build.gradle`:
```gradle
buildTypes {
    release {
        shrinkResources true
        minifyEnabled true
    }
}
```

### 2. **Compress Images**
Your `assets/images/` folder might have unoptimized PNGs. Use tools like:
- TinyPNG
- ImageOptim
- `flutter pub run flutter_launcher_icons:optimize`

### 3. **Remove Unused Dependencies**
Check if you're using all packages in `pubspec.yaml`.

### 4. **Build App Bundle Instead**
```bash
flutter build appbundle
```
Google Play will generate optimized APKs per device (smaller downloads).

---

## 🎯 My Recommendation

**For immediate 97% size reduction**: Go with **Option 1** (remove audio)

**For best user experience**: Go with **Option 2** (stream audio from online)

Let me know which option you prefer, and I'll help you implement it!
