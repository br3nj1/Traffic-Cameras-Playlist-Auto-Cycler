@echo off
setlocal EnableExtensions EnableDelayedExpansion

rem Path hints (edit if needed)
set MPV_EXE="%ProgramFiles%\mpv\mpv.exe"
set MPV_EXE_ALT="%ProgramFiles(x86)%\mpv\mpv.exe"
set VLC_EXE="%ProgramFiles%\VideoLAN\VLC\vlc.exe"
set VLC_EXE_ALT="%ProgramFiles(x86)%\VideoLAN\VLC\vlc.exe"

set PLAYLIST="%~dp0pkwy-cams.m3u"

if exist %MPV_EXE% (
  %MPV_EXE% --fs --ontop --no-terminal --really-quiet --playlist=%PLAYLIST%
  goto :eof
) else if exist %MPV_EXE_ALT% (
  %MPV_EXE_ALT% --fs --ontop --no-terminal --really-quiet --playlist=%PLAYLIST%
  goto :eof
) else if exist %VLC_EXE% (
  %VLC_EXE% --fullscreen --qt-start-minimized --no-video-title-show --playlist-autostart --playlist-enqueue %PLAYLIST%
  goto :eof
) else if exist %VLC_EXE_ALT% (
  %VLC_EXE_ALT% --fullscreen --qt-start-minimized --no-video-title-show --playlist-autostart --playlist-enqueue %PLAYLIST%
  goto :eof
) else (
  echo Could not find mpv or VLC. Please install one and update paths in this .bat.
  pause
)
