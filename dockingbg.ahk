#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#SingleInstance Force

;check background on login
WM_DISPLAYCHANGE(0,0)

OnMessage(0x7E, "WM_DISPLAYCHANGE")
  return

WM_DISPLAYCHANGE(wParam, lParam)
  {
  ;WM_DISPLAYCHANGE is triggered any time a change is made to the display settings
  ;get the monitor count
  SysGet, mc, MonitorCount

 if mc = 1
    {
    ;if 1 monitor, use this background
    source = **PATH** ;do not include end forward-slash
    file = **IMAGE NAME**
    SetWallpaperStyle("Fill")
    background_file = %source%\%file%
    DllCall("SystemParametersInfo", UInt, 0x14, UInt, 0, Str, background_file, UInt, 2) 
    }
  else if mc = 2
    {
    ;if 2 monitors, use this background
    source = **PATH** ;do not include end forward-slash
    file = **IMAGE NAME**
    SetWallpaperStyle("Fill")
    background_file = %source%\%file%
    DllCall("SystemParametersInfo", UInt, 0x14, UInt, 0, Str, background_file, UInt, 2)
    } 
  else if mc = 3
    {
    ;if 3 monitors, use this background
    source = **PATH** ;do not include end forward-slash
    file = **IMAGE NAME**
    SetWallpaperStyle("Fill")
    background_file = %source%\%file%
    DllCall("SystemParametersInfo", UInt, 0x14, UInt, 0, Str, background_file, UInt, 2)
    }
  }

!1::Reload ; ALT + 1 to reload

  Reset:
{
	Reload
}

  SetWallpaperStyle(style)
  {
    ;for tiled,    use TileWallpaper=1 WallpaperStyle=0
    ;for centered, use TileWallpaper=0 WallpaperStyle=0
    ;for strech,   use TileWallpaper=0 WallpaperStyle=2
    ;for fit,      use TileWallpaper=0 WallpaperStyle=6
    ;for fill, 	   use TileWallpaper=0 WallpaperStyle=10
    if style=Fill
      {
      RegWrite, REG_SZ, HKEY_CURRENT_USER, Control Panel\Desktop, TileWallpaper, 1
      RegWrite, REG_SZ, HKEY_CURRENT_USER, Control Panel\Desktop, WallpaperStyle, 0
      }
    else if style=Centered
      {
      RegWrite, REG_SZ, HKEY_CURRENT_USER, Control Panel\Desktop, TileWallpaper, 0
      RegWrite, REG_SZ, HKEY_CURRENT_USER, Control Panel\Desktop, WallpaperStyle, 0
      }
    else if style=Streched
      {
      RegWrite, REG_SZ, HKEY_CURRENT_USER, Control Panel\Desktop, TileWallpaper, 0
      RegWrite, REG_SZ, HKEY_CURRENT_USER, Control Panel\Desktop, WallpaperStyle, 2
      }
    else if style=Fit
      {
      RegWrite, REG_SZ, HKEY_CURRENT_USER, Control Panel\Desktop, TileWallpaper, 0
      RegWrite, REG_SZ, HKEY_CURRENT_USER, Control Panel\Desktop, WallpaperStyle, 6
      }
    else if style=Tiled
      {
      RegWrite, REG_SZ, HKEY_CURRENT_USER, Control Panel\Desktop, TileWallpaper, 0
      RegWrite, REG_SZ, HKEY_CURRENT_USER, Control Panel\Desktop, WallpaperStyle, 10
      }
  }
