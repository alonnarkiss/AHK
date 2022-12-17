
#SingleInstance force
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.





;mesage when AHK is on
MsgBox , Sir the AHK-AutoHotkey system is on
return
; Google Search highlighted text use (ctrl shift c)
^+c::
{
 Send, ^c
 Sleep 50
 Run, http://www.google.com/search?q=%clipboard%
 Return
}

;Launch pychrm use F7
F7::Run "C:\Program Files\JetBrains\PyCharm Community Edition 2021.3.2\bin\pycharm64.exe"
return

;Launch google use F8
F8::Run "www.google.com"
return

;Launch youtube use F9
F9::Run "www.youtube.com"
return

;Launch spotify
F10::Run "https://open.spotify.com/"
return

;Launch monday
F11::Run "https://orcam-inc.monday.com/boards/2866185544"
return


; Always on Top
^SPACE:: Winset, Alwaysontop, , A ; ctrl + space
Return

;use @@ to add my Email
::@@::alon.narkiss@orcam.com

;use AA to add audioanalyzer
::AA::audio analyzer

;Launch Excel use ctrl win e
^#e::Run Excel
return

;Launch PowerPoint use ctrl win e
^#p::Run "C:\Program Files\Microsoft Office\root\Office16\POWERPNT.EXE"
return

;Launch Excel use ctrl win e
^#w::Run "C:\Program Files\Microsoft Office\root\Office16\WINWORD.EXE"
return

;Run CMD to initial the Z (/K show the cmd | /c not show cmd )
^#z::Run cmd.exe /k gpupdate /force
