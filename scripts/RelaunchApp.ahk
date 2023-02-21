#SingleInstance FORCE
WinActivate, Hay Day Alt 2 ; Activate
CoordMode, Mouse, Window ; Some configuration stuff
WinGetPos, X, Y, W, H, Hay Day Alt 2 ; Get the position/dimensions of Hay Day Window

MouseMove, 126, 103 ; Close unwanted GUI
Loop 3{
    SendInput, {Click}
    Sleep 1000
}

MouseMove, 150, 16
SendInput, {Click}
Sleep 1000
MouseMove, 386, 392
SendInput, {Click}
Sleep 2000
MouseMove, 885, 116 ; Navigate to Hay Day app
SendInput, {Click} ; Launch

Loop{
    ; Loop to ensure the window is open. Checks for the orange-colored coin icon in the top right of the HUD every 5 seconds.
    PixelGetColor, Color, 927, 50, RGB
    Sleep 5000
} Until Color == "0xFFE82E"

ExitApp
Esc::ExitApp