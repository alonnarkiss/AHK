#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

MsgBox , translate on system is on
return

/*
# 	Win (Windows logo key)
! 	Altads
^ 	Ctrl
+
*/



; Set up a hotkey to trigger the translation
^!a::
	; Map Hebrew letters to English letters
	;hebrewToEnglish := {"'":"w","א":"t","ש":"a","ב":"c","ג":"d","ד":"s","ה":"v","ו":"u","ז":"z","ח":"j","ט":"y","י":"h","כ":"f","ך":"l","ל":"k","מ":"n","ם":"o","נ":"b","ן":"i","ס":"x","ע":"","פ":"g","צ":"m","ק":"e","ר":"r","ש":"a","ת":","," ":" "}
	
	english_letters := ["q","w","e","r","t","y","u","i","o","p","a","s","d","f","g","h","j","k","l",";","z","x","c","v","b","n","m",",","."]
	hebrew_letters := ["/","'","ק","ר","א","ט","ו","ן","ם","פ","ש","ד","ג","כ","ע","י","ח","ל","ך","ף","ז","ס","ב","ה","נ","מ","צ","ת","ץ"]
	english_string := "abcdefghijklmnopqrstuvwxyz"
    Send, ^c  ; Copy the selected text to the clipboard
    Sleep 50  ; sleep to get the clipboard accurate
    ;clipboard := ""
    clipboard := Clipboard  ; Store the clipboard contents in a variable
	
    Loop, parse, clipboard  ; Loop through each character in the clipboard
    {
        char := A_LoopField  ; Get the current character
        if InStr(english_string, char)  ; Check if the character is a Hebrew letter
        {
			;MsgBox  , in if
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
        }
		else
		{
			;MsgBox  , in else 
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
		}
		
		
    }
    Clipboard := clipboard  ; Update the clipboard with the translated text
    SendInput, ^v  ; Paste the translated text back into the active window
return


