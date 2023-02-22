#SingleInstance FORCE
WinActivate, Hay Day Alt 2 ; Activate
WinMove, Hay Day Alt 2,, 0, 0, 1024, 576 ; Move window to top left of monitor
CoordMode, Mouse, Window ; Some configuration stuff
WinGetPos, X, Y, W, H, Hay Day Alt 2 ; Get the position/dimensions of Hay Day Window

^h::


MouseMove, -85, -20, 10, R ; Move relatively to expected location of scythe
SendInput, {Click down}


ExitApp
Esc::ExitApp