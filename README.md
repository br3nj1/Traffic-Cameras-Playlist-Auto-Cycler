# NJ Parkway Traffic Cameras Playlist & Auto-Cycler

This repo provides a simple way to watch **New Jersey Parkway traffic cameras** via their HLS streams.  
Includes:
- `pkwy-cams.m3u` → playlist file for **mpv** or **VLC**
- `Launch-Pkwy-Cams.bat` → one-click Windows launcher
- `Cycle-Pkwy-Cams.ps1` → PowerShell script that cycles each camera automatically

Cycles through the southbound parkway cameras. 
1) Install VLC
2) Download each file
3) Double-click the .bat file. | Press N (next) or P (previous)

You can get any camera list using URLScan.io; DOM page

ie) https://www.njta.com/travel-resources/camera-list
https://urlscan.io/result/0198fbb0-67c5-718f-99e6-6a78654f4c73/dom/

---

## 🎥 Camera Streams

These are direct `.m3u8` HLS feeds published by NJTA:

```
https://wink.njta.com/200/public/hls/WF05-24A0-4D14-0622-8C30_nj.m3u8
https://wink.njta.com/200/public/hls/WF05-24A0-4D14-07C3-6C37_nj.m3u8
https://wink.njta.com/200/public/hls/WF05-24A0-4D14-1117-39F7_nj.m3u8
https://wink.njta.com/200/public/hls/WF05-24A0-4D14-1685-A522_nj.m3u8
https://wink.njta.com/201/public/hls/WF05-24A1-4D5A-4B6E-B013_nj.m3u8
https://wink.njta.com/201/public/hls/WF05-24A1-4D5A-52C3-589A_nj.m3u8
https://wink.njta.com/201/public/hls/WF05-24A1-4D5A-5527-2784_nj.m3u8
https://wink.njta.com/201/public/hls/WF05-24A1-4D5A-5AD6-C94D_nj.m3u8
https://wink.njta.com/201/public/hls/WF05-24A1-4D5A-5D47-7DB8_nj.m3u8
https://wink.njta.com/201/public/hls/WF05-24A1-4D5A-6531-DCB7_nj.m3u8
https://wink.njta.com/201/public/hls/WF05-24A1-4D5A-6C61-F8ED_nj.m3u8
https://wink.njta.com/201/public/hls/WF05-24A1-4D5A-6E3B-B821_nj.m3u8
https://wink.njta.com/201/public/hls/WF05-24A1-4D5A-74D0-D9B9_nj.m3u8
https://wink.njta.com/201/public/hls/WF05-24A1-4D5A-7C8E-237E_nj.m3u8
https://wink.njta.com/201/public/hls/WF05-24A2-4D44-33E8-29F5_nj.m3u8
https://wink.njta.com/202/public/hls/WF05-24A2-4D44-5F8A-7156_nj.m3u8
```

---

## ▶️ Usage

### Option 1: Playlist
1. Install [mpv](https://mpv.io) (recommended) or [VLC](https://www.videolan.org/).
2. Open `pkwy-cams.m3u` in your player.
3. Use player hotkeys to switch:
   - mpv → `>` / `<`  
   - VLC → `N` / `P`

### Option 2: Windows Batch Launcher
Run `Launch-Pkwy-Cams.bat`:
- Prefers mpv, falls back to VLC.
- Fullscreen playback with the playlist.

### Option 3: PowerShell Auto-Cycler
Run `Cycle-Pkwy-Cams.ps1` to auto-cycle through each camera every N seconds.

Example:
```powershell
# Default (30s per cam with mpv)
.\Cycle-Pkwy-Cams.ps1

# 45 seconds per cam with VLC
.\Cycle-Pkwy-Cams.ps1 -Player vlc -SecondsPerCam 45
```

---

## 📌 Source of URLs

The raw camera URLs were collected from the NJTA official camera list:  
- **NJTA Camera List:** https://www.njta.com/travel-resources/camera-list  
- **DOM snapshot used for extraction:** https://urlscan.io/result/0198fbb0-67c5-718f-99e6-6a78654f4c73/dom/

---

## ⚠️ Disclaimer
- These streams are hosted and maintained by the **New Jersey Turnpike Authority**.  
- This project simply aggregates public `.m3u8` links for convenience.  
- Availability is subject to NJTA’s servers; some cameras may be offline at times.
