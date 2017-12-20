#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#Include libs\Gdip.ahk
#Include libs\ims.ahk

If !pToken := Gdip_Startup()
{
	MsgBox, 48, gdiplus error!, Gdiplus failed to start. Please ensure you have gdiplus on your system
	ExitApp
}

;Make window Active
GameWindowTitle = 5.6ICBING
WinGet, hwnd,,%GameWindowTitle%
WinActivate, ahk_id %hwnd%
Sleep, 500

;Capture screen
;file=%A_ScriptDir%\test.png
file = C:\Users\3stadt\Code\ahk\haystack.png
pBitmapHayStack := Gdip_BitmapFromHWND(hwnd)
Gdip_SaveBitmapToFile(pBitmapHayStack, file)
pBitmapNeedle := Gdip_CreateBitmapFromFile("needles/olb.png")
foo:=Gdip_ImageSearch(pBitmapHayStack, pBitmapNeedle, FooBar,0 ,0 ,0 ,0 ,60)
MsgBox, %foo% %FooBar%
Gdip_DisposeImage(pBitmapHayStack)
Gdip_DisposeImage(pBitmapNeedle)
Gdip_Shutdown(pzToken)

