WinActivate, Hay Day Alt 2 ; Activate
CoordMode, Mouse, Window ; Some configuration stuff
WinGetPos, X, Y, W, H, Hay Day Alt 2 ; Get the position/dimensions of Hay Day Window

MouseMove, 472, 370, ; Move to expected location of crop tile
SendInput, {Click} ; Select tile
Sleep 1000 ; Allow GUI to appear

MouseGetPos, MouseX, MouseY
PixelSearch,,, MouseX, MouseY, MouseX + 100, MouseY + 100, 0x445A63,, Fast RGB ; Search for marker of progress bar
if (ErrorLevel == 0){
    ; Crops are not done growing as time GUI is visible
    ; Unselect Crop tile
    MouseMove, 126, 103
    SendInput, {Click}
    ExitApp
}

PixelSearch,,, MouseX, MouseY, MouseX - 200, MouseY - 130, 0xFFF8BA,, Fast RGB ; Search for marker of crop selection GUI
if (ErrorLevel != 0){
    ; Crop GUI not found, ready to harvest

    MouseMove, -70, -20, 10, R ; Move relatively to expected location of scythe
    SendInput, {Click down}
    MouseMove, -200, -100, 10, R ; Move mouse to arbitrary top left region

    HarvestWidth = 500 ; How wide, in pixels, to drag the scythe
    HarvestHeight = 300 ; How high, in pixels, to drag the scythe
    MouseSpeed = 10 ; How quickly to move the mouse. 0 is instant, 100 slowest
    Detail = 30 ; How many passes should be made in the specified area.

    Loop %Detail%{
        if(Mod(A_Index, 2) != 0){
            ; Odd Iteration
            MouseMove, HarvestWidth, 0, MouseSpeed, R
            MouseMove, 0, HarvestHeight/Detail, MouseSpeed, R
        }
        else{
            ; Even Iteration
            MouseMove, -HarvestWidth, 0, MouseSpeed, R
            MouseMove, 0, HarvestHeight/Detail, MouseSpeed, R
        }
    }
    SendInput, {Click up}

    MouseMove, 126, 103 ; Close unwanted GUI
    Loop 3{
        SendInput, {Click}
        Sleep 1000
    }
}

; Time to plant
MouseMove, 472, 370, ; Move to expected location of crop tile
SendInput, {Click} ; Select tile
Sleep 1000 ; Allow GUI to appear
MouseMove, -50, -54,, R ; Move relatively to expected position of wheat GUI

SendInput, {Click down}
MouseMove, 472, 370, ; Move to expected location of crop tile

MouseMove, -200, -100,, R ; Move mouse to arbitrary top left region

PlantWidth = 500 ; How wide, in pixels, to drag the scythe
PlantHeight = 300 ; How high, in pixels, to drag the scythe
MouseSpeed = 10 ; How quickly to move the mouse. 0 is instant, 100 slowest
Detail = 30 ; How many passes should be made in the specified area.

Loop %Detail%{
    if(Mod(A_Index, 2) != 0){
        ; Odd Iteration
        MouseMove, PlantWidth, 0, MouseSpeed, R
        MouseMove, 0, PlantHeight/Detail, MouseSpeed, R
    }
    else{
        ; Even Iteration
        MouseMove, -PlantWidth, 0, MouseSpeed, R
        MouseMove, 0, PlantHeight/Detail, MouseSpeed, R
    }
}
SendInput, {Click up}

MouseMove, 126, 103 ; Close unwanted GUI
Loop 3{
    SendInput, {Click}
    Sleep 1000
}

ExitApp
Esc::ExitApp