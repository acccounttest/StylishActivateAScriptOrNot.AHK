#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#SingleInstance force
#UseHook Off;
SetBatchLines, -1
#MaxThreadsPerHotkey, 2
;#MaxHotkeysPerInterval 2
#Persistent
; #Warn  ; Enable warnings to assist with detecting common errors.
;SHORTCUTS https://support.microsoft.com/en-us/windows/keyboard-shortcuts-in-windows-dcc61a57-8ff0-cffe-9796-cb9706c75eec
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#If WinActive("ahk_exe chrome.exe")
{
;1.Save mouse coordinates.
;2.Click at extension icon position from window top left. 
;3.Send the first character of the script.
;4.Recover last mouse cursor coordinates values.
;5.DO not try escape this popup/window.
;;;;;;;;;;;;;;;;;;OR;;;;;;;;;;;;;;;;;;
;1.Open manage script list in settings.
;2.Send special char.
;3.Close the tab.
;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;THIS SCRIPT PERMIT TO SWITCH ONE SCRIPT ON THE FLY WITH A SINGLE KEY COMBO;;;;;;;;;;;;;;;;;;;;;;;
;THIS IS FAR BETTER AGAINST THE AUTO SORTING LIST OR EVEN WITH OPEN THEN TYPE SHORTCUT AND CLOSE;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;Cannot send escape to this window because it call the win key, it's due to the window is no more the same , the popup could be configured as a totaly separated window.
;    ;The popup does not close itself, so press a click before trying the same key
;    ;If the control key is too slow to be triggered, use a real letter instead the underscore, its the only script name with begin with that character.
;    ;I prefered to choose not a letter because it could be too ambiguous later when the list will growth.
;^enter::
;    MouseGetPos, axpos,aypos
;    Sleep,10
;    click,1291,61
;    ;depend your browser width and height values
;    Sleep,200
;    SendInput,_
;    Sleep,10
;    MouseMove, %axpos%,%aypos%
;    ;Sendinput,{Esc}
;return


;Send first character of the script does not works in manage script list, i added control+m as shortcut for stylish, the second shortcut option.
;The problem with the second solution is change brutaly current tab and hope the last will be the last could not works as excepted, so no quit the current tab maybe a better otpion while this one create a very little blink effect, just the time to open and close another tab.
!enter::
    Send,^m
    Sleep,200
    ;This is the first entry in my case,maybe due to the first character as special it is ordered first.
    click,270,108
    Sleep,100
    Send,^w
return
}
