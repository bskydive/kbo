#Requires AutoHotkey v2.0
SetCapsLockState "AlwaysOff"

;capslock - en
CapsLock::Send "{Alt Down}{Shift Down}{8 Down}{Shift Up}{Alt Up}{8 Up}"

;shift+capslock - ru
+CapsLock::Send "{Alt Down}{Shift Down}{9 Down}{Shift Up}{Alt Up}{9 Up}"

return