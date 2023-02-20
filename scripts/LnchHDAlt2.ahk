; Launch Hay Day Alt 2

; Launches the shortcut for the Bluestacks instance 'Hay Day Alt 2' and opens/focuses Hay Day.

#SingleInstance FORCE
if WinExist("Hay Day Alt 2") {
    ; Clause to catch open instances and reset them.
    WinGet, ID, PID, Hay Day Alt 2
    Process, Close, %ID%
    WinWaitClose, Hay Day Alt 2
}

Run, C:\Users\samue\OneDrive\Desktop\Code\Hay Day Automation\assets\Hay Day Alt 2 ;Run a shortcut in lib
WinWait, Hay Day Alt 2 ; Wait
WinActivate, Hay Day Alt 2 ; Activate
WinMove, Hay Day Alt 2,, 0, 0, 1024, 576 ; Move window to top left of monitor
Sleep 10000 ; Buffer time to allow emulator to load

CoordMode, Mouse, Window ; Some configuration stuff
WinGetPos, X, Y, W, H, Hay Day Alt 2 ; Get the position/dimensions of Hay Day Window

MouseMove, 885, 116 ; Navigate to Hay Day app
SendInput, {Click} ; Launch

Loop{
    ; Loop to ensure the window is open. Checks for the orange-colored coin icon in the top right of the HUD every 5 seconds.
    PixelGetColor, Color, 927, 50, RGB
    Sleep 5000
} Until Color == "0xFFE82E"

ExitApp

Esc::ExitApp