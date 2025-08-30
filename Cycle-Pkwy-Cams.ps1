param(
  [int]$SecondsPerCam = 30,
  [ValidateSet("mpv","vlc")][string]$Player = "mpv"
)

# Paths (edit if needed)
$mpv = "${env:ProgramFiles}\mpv\mpv.exe"
$vlc = "${env:ProgramFiles}\VideoLAN\VLC\vlc.exe"
$playlist = Join-Path $PSScriptRoot "pkwy-cams.m3u"

if ($Player -eq "mpv") {
  if (-not (Test-Path $mpv)) { $mpv = "${env:ProgramFiles(x86)}\mpv\mpv.exe" }
  if (-not (Test-Path $mpv)) { throw "mpv.exe not found. Install mpv or set path." }
} else {
  if (-not (Test-Path $vlc)) { $vlc = "${env:ProgramFiles(x86)}\VideoLAN\VLC\vlc.exe" }
  if (-not (Test-Path $vlc)) { throw "vlc.exe not found. Install VLC or set path." }
}

$urls = Get-Content $playlist | Where-Object { $_ -match "^https?://" }

while ($true) {
  foreach ($u in $urls) {
    if ($Player -eq "mpv") {
      $p = Start-Process -FilePath $mpv -ArgumentList @("--fs","--no-terminal","--really-quiet",$u) -PassThru
      Start-Sleep -Seconds $SecondsPerCam
      if (!$p.HasExited) { try { $p.CloseMainWindow() | Out-Null } catch {} }
      Start-Sleep -Milliseconds 500
      if (!$p.HasExited) { try { $p.Kill() } catch {} }
    } else {
      $p = Start-Process -FilePath $vlc -ArgumentList @("--fullscreen","--qt-start-minimized","--no-video-title-show","--play-and-exit",$u) -PassThru
      Start-Sleep -Seconds $SecondsPerCam
      if (!$p.HasExited) { try { $p.CloseMainWindow() | Out-Null } catch {} }
      Start-Sleep -Milliseconds 500
      if (!$p.HasExited) { try { $p.Kill() } catch {} }
    }
  }
}
