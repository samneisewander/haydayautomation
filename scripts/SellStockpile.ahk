WinActivate, Hay Day Alt 2 ; Activate
CoordMode, Mouse, Window ; Some configuration stuff
WinGetPos, X, Y, W, H, Hay Day Alt 2 ; Get the position/dimensions of Hay Day Window

MouseMove, 480, 530
SendInput, {Click}
Sleep 1000

Loop 5{
    MouseMove, 280 + 100*(A_Index - 1), 280
    MouseGetPos, MouseX, MouseY

    PixelSearch,,, MouseX - 25, MouseY - 25, MouseX + 25, MouseY + 25, 0x043052,, Fast RGB
    if(ErrorLevel == 0){
        ; Box is sold
        SendInput, {Click}
        Sleep 500
    }
    PixelSearch,,, MouseX - 25, MouseY - 25, MouseX + 25, MouseY + 25, 0x7B593D,, Fast RGB
    if(ErrorLevel == 0){
        ; Box is empty
        SendInput, {Click} ; select empty box
        MouseMove, 320, 210 ; Navigate to highest stocked crop
        SendInput, {Click} ; select empty box
        MouseMove, 700, 220 ; Navigate to plus button
        SendInput, {Click 9} ; Max
        MouseMove, 700, 280 ; Navigate to plus button
        SendInput, {Click 10} ; Add 10 coins to price

        ; Check for flashing advertise button
        PixelGetColor, Color1, 590, 400, RGB
        Sleep 100
        PixelGetColor, Color2, 590, 400, RGB
        Sleep 100
        PixelGetColor, Color3, 590, 400, RGB

        if(Color1 != Color2 || Color1 != Color3){
            ; If ad available, select it
            MouseMove, 590, 400
            SendInput, {Click}
        }

        MouseMove, 630, 480 ; Navigate to put on sale
        SendInput, {Click} ; Select

        Continue
    }
    Sleep 1000
}

MouseMove, 126, 103 ; Close unwanted GUI
Loop 3{
    SendInput, {Click}
    Sleep 1000
}

ExitApp
Esc::ExitApp