#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
MsgBox , translate on system V2 is on
return

/*
# 	Win (Windows logo key)
! 	Altads
^ 	Ctrl
+
*/

SetInputLang(Lang)
{
    WinExist("A")
    ControlGetFocus, CtrlInFocus
    PostMessage, 0x50, 0, % Lang, %CtrlInFocus%
}
HE = -264436723
US = 67699721

; Set up a hotkey to trigger the translation < ctrl + alt + a >
^!a::
	;Sleep 500  ; sleep to get the clipboard accurate
	
	
	;test the langugh
	oKeyboard := {HE: 4030530573, US: 67699721}
	WinGet, WinID,, A
	ThreadID:=DllCall("GetWindowThreadProcessId", "UInt", WinID, "UInt", 0)
	InputLocaleID:=DllCall("GetKeyboardLayout", "UInt", ThreadID, "UInt")
	
	;MsgBox,"this the code for langugh" %InputLocaleID%
	
	For Layout, Code in oKeyboard
		If (Code = InputLocaleID){
			langugh = %Layout%

		}
	
	; Map Hebrew letters to English letters
	english_letters := ["q","w","e","r","t","y","u","i","o","p","a","s","d","f","g","h","j","k","l",";","z","x","c","v","b","n","m",",","."]
	hebrew_letters := ["/","'","ק","ר","א","ט","ו","ן","ם","פ","ש","ד","ג","כ","ע","י","ח","ל","ך","ף","ז","ס","ב","ה","נ","מ","צ","ת","ץ"]


    Send, ^c  ; Copy the selected text to the clipboard
    Sleep 50  ; sleep to get the clipboard accurate
    ;clipboard := ""
    clipboard := Clipboard  ; Store the clipboard contents in a variable
	
    Loop, parse, clipboard  ; Loop through each character in the clipboard
    {
        char := A_LoopField  ; Get the current character
        if InStr(langugh, "US")  ; Check if the character is a Hebrew letter
        {
			
            for index, element in english_letters ;
			{
				;MsgBox % "Element number " . index . " is " . element
				if ( char == element ) ;
				{
					newChar := hebrew_letters[index]  ; Get the corresponding English letter
					clipboard := StrReplace(clipboard, char, newChar)  ;
					;MsgBox  , yes
					break
				}
				;MsgBox % "Element number " . index . " is " . element
			}
			;SetInputLang(HE)
        }
		
		else
		{
			for index, element in hebrew_letters ;
			{
				;MsgBox % "Element number " . index . " is " . element
				if ( char == element ) ;
				{
					newChar := english_letters[index]  ; Get the corresponding English letter
					clipboard := StrReplace(clipboard, char, newChar)  ;
					;MsgBox  , yes
					break
				}
				;MsgBox % "Element number " . index . " is " . element
			}
			;SetInputLang(US)
		}
		
		
    }
    Clipboard := clipboard  ; Update the clipboard with the translated text
    SendInput, ^v  ; Paste the translated text back into the active window
	
	;Change the langugh 
	if InStr(langugh, "US"){
		SetInputLang(HE)
		}
	else
	{
		SetInputLang(US)
	}
return


