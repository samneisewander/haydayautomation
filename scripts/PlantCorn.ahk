WinActivate, Hay Day Alt 2 ; Activate
CoordMode, Mouse, Window ; Some configuration stuff
WinGetPos, X, Y, W, H, Hay Day Alt 2 ; Get the position/dimensions of Hay Day Window

MouseMove, 472, 370, ; Move to expected location of crop tile
Sleep 1000
SendInput, {Click} ; Select tile
MouseMove, 132, 57,, R ; Move relatively to the expected position of white GUI element
Sleep 1000
MouseGetPos, MouseX, MouseY ; Retrieve global coords of mouse (these are the same as coords of the window since window is at 0,0)
PixelGetColor, Color, MouseX, MouseY, RGB ; Get pixel color
if (Color == "0xFFFBD7"){
    ; Crops are not done growing as time GUI is visible
    ; Unselect Crop tile
    MouseMove, 126, 103
    SendInput, {Click}
    ExitApp
}
MouseMove, 472, 370, ; Move to expected location of crop tile
Sleep 1000
MouseMove, 379, 316, ; Move to expected location of scythe
Sleep 1000
MouseGetPos, MouseX, MouseY ; Retrieve global coords of mouse (these are the same as coords of the window since window is at 0,0)
PixelGetColor, Color, MouseX, MouseY, RGB ; Get pixel color
MsgBox, %Color%
if (Color == "0xF0EFF1"){
    ; Crops are ready to be harvested as scythe is visible
    ; This needs to be replaced with a loop. Not necessary.
    SendInput, {Click down} ; Hold left click
    MouseMove, 98, 56, 30, R ; Return to previous position
    MouseMove, -200, -30, 30, R ; First pass
    MouseMove, 400, 0, 30, R
    MouseMove, 0, 20, 30, R ; Second Pass
    MouseMove, -400, 0, 30, R
    MouseMove, 0, 20, 30, R ; Third Pass
    MouseMove, 400, 0, 30, R 
    MouseMove, 0, 20, 30, R ; Fourth Pass
    MouseMove, -400, 0, 30, R 
    MouseMove, 0, 20, 30, R ; Fifth Pass
    MouseMove, 400, 0, 30, R
    MouseMove, 0, 20, 30, R ; 6th Pass
    MouseMove, -400, 0, 30, R 
    MouseMove, 0, 20, 30, R ; 7th Pass
    MouseMove, 400, 0, 30, R 
    MouseMove, 0, 20, 30, R ; 8th Pass
    MouseMove, -400, 0, 30, R 
    MouseMove, 0, 20, 30, R ; 9th Pass
    MouseMove, 400, 0, 30, R 
    SendInput, {Click up} ; Select tile
    MouseMove, 472, 370 ; Move to expected location of crop tile
    SendInput, {Click} ; Select tile
}

; Tile garunteed to be ready for planting

MouseMove, 351, 347, 10 ; Navigate to corn in GUI
SendInput, {Click down} ; Hold left click
MouseMove, 472, 370, 30 ; Move to expected location of crop tile
MouseMove, -200, -30, 30, R ; First pass
MouseMove, 400, 0, 30, R
MouseMove, 0, 20, 30, R ; Second Pass
MouseMove, -400, 0, 30, R
MouseMove, 0, 20, 30, R ; Third Pass
MouseMove, 400, 0, 30, R 
MouseMove, 0, 20, 30, R ; Fourth Pass
MouseMove, -400, 0, 30, R 
MouseMove, 0, 20, 30, R ; Fifth Pass
MouseMove, 400, 0, 30, R
MouseMove, 0, 20, 30, R ; 6th Pass
MouseMove, -400, 0, 30, R 
MouseMove, 0, 20, 30, R ; 7th Pass
MouseMove, 400, 0, 30, R 
MouseMove, 0, 20, 30, R ; 8th Pass
MouseMove, -400, 0, 30, R 
MouseMove, 0, 20, 30, R ; 9th Pass
MouseMove, 400, 0, 30, R 
SendInput, {Click up}




ExitApp
Esc::ExitApp