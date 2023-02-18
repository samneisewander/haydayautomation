WinActivate, Hay Day Alt 2 ; Activate
CoordMode, Mouse, Window ; Some configuration stuff
WinGetPos, X, Y, W, H, Hay Day Alt 2 ; Get the position/dimensions of Hay Day Window

MouseMove, W/2, H/2 ; Moves mouse to roughly half the dims (center) of the window at X,Y
Sleep 1000

; Zoom out and pan to bounding box
SendInput, {Down down}
Sleep 1000
SendInput, {Down up}
Loop 5{
    MouseMove, -200, -200, 10, R
    SendInput, {Click down}
    MouseMove, 200, 200, 10, R
    SendInput, {Click up}
}
Sleep 1000

; Focus Camera on Dairy building
MouseMove, 797, 537
SendInput, {Click}
Sleep 3000

; Unselect Dairy building
MouseMove, 126, 103
SendInput, {Click}


ExitApp
Esc::ExitApp