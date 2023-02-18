#SingleInstance, Force

Esc::ExitApp ; Exit script with Escape key

^+h::
    ; Focus Appplication and Center Mouse
    CoordMode, Mouse, Screen ; IMPORTANT: MouseMove WILL NOT WORK properly without this.
    if WinExist("Hay Day Alt 2"){
        WinActivate, Hay Day Alt 2
    }
    else{
        MsgBox,, Cannot Find Window, The macro failed because no target window could be found.
        return
    }
    WinGetPos, X, Y, W, H, Hay Day Alt 2 ; Get the position/dimensions of Hay Day Window

    MouseMove, (X + W//2), (Y + H//2) ; Moves mouse to roughly half the dims (center) of the window at X,Y
    Sleep 1000

    ; Standardize Camera and Zoom Out
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

    ; Center Camera On Farm (dependant on WinGetPos having been declared)
    MouseMove, (X + W*.5), (Y + H*.5) ; Moves mouse to half the dims (center) of the window at X,Y
    MouseMove, (X + W*.8), (Y + H*.8), 30
    SendInput, {Click down}
    MouseMove, (X + W*.5), (Y + H*.3), 30
    SendInput, {Click up}

    Sleep 2000

Loop 51{
    

    ; Farm Corn (dependant on WinGetPos having been run)
    MouseMove, (X + W*.64), (Y + H*.6), 30 ; Hopefully moves the mouse over the top leftmost farm tile, regardless of window size.
    Sleep 1000
    SendInput, {Click} ; Select Crop
    MouseMove, (X + W*.57), (Y + H*.588), 30 ; Navigate to Scyth
    SendInput, {Click down} ; Click and hold Scyth
    MouseMove, (X + W*.635), (Y + H*.59), 30 ; Hopefully moves the mouse over the top leftmost farm tile, regardless of window size.
    MouseMove, (X + W*.50), (Y + H*.540), 30 ; Move scyth to top left of crop field
    MouseMove, (X + W*.900), (Y + H*.540), 30 ; Pass 1
    MouseMove, (X + W*.50), (Y + H*.60), 30 ; Reposition
    MouseMove, (X + W*.900), (Y + H*.60), 30 ; Pass 2
    MouseMove, (X + W*.50), (Y + H*.650), 30 ; Reposition
    MouseMove, (X + W*.900), (Y + H*.650), 30 ; Pass 3
    MouseMove, (X + W*.50), (Y + H*.70), 30 ; Reposition
    MouseMove, (X + W*.900), (Y + H*.70), 30 ; Pass 3
    MouseMove, (X + W*.50), (Y + H*.750), 30 ; Reposition
    MouseMove, (X + W*.900), (Y + H*.750), 30 ; Pass 3
    SendInput, {Click up}

    ; Plant Corn
    MouseMove, (X + W*.64), (Y + H*.6), 30 ; Hopefully moves the mouse over the top leftmost farm tile, regardless of window size.
    Sleep 1000
    SendInput, {Click} ; Select Crop

    MouseMove, (X + W*.5), (Y + H*.588), 30 ; Navigate to corn
    SendInput, {Click down} ; Click and hold corn
    MouseMove, (X + W*.635), (Y + H*.59), 30 ; Move corn back to farm tile
    MouseMove, (X + W*.550), (Y + H*.540), 30 ; Move scyth to top left of crop field
    MouseMove, (X + W*.900), (Y + H*.540), 30 ; Pass 1
    MouseMove, (X + W*.500), (Y + H*.600), 30 ; Reposition
    MouseMove, (X + W*.900), (Y + H*.600), 30 ; Pass 2
    MouseMove, (X + W*.500), (Y + H*.650), 30 ; Reposition
    MouseMove, (X + W*.900), (Y + H*.650), 30 ; Pass 3
    MouseMove, (X + W*.500), (Y + H*.700), 30 ; Reposition
    MouseMove, (X + W*.900), (Y + H*.700), 30 ; Pass 3
    MouseMove, (X + W*.500), (Y + H*.750), 30 ; Reposition
    MouseMove, (X + W*.900), (Y + H*.750), 30 ; Pass 3
    SendInput, {Click up}

    ;Sell corn
    MouseMove, (X + W*.175), (Y + H*.70), 30 ; Position over Shop
    SendInput, {Click}

    Loop 2{
        MouseMove, (X + W*(.3 + .1*(A_Index - 1))), (Y + H*.50), 10 ; Position over first slot
        SendInput, {Click} ; Collect money
        Sleep, 2000
        SendInput, {Click} ; Enter box
        MouseMove, (X + W*.300), (Y + H*.40), 10 ; Position over corn
        SendInput, {Click} ; Select Corn
        MouseMove, (X + W*.690), (Y + H*.40), 10 ; Position over plus button
        Loop 20
        {
            Send {Click} ; Auto-repeat consists of consecutive down-events (with no up-events).
            Sleep 30 ; The number of milliseconds between keystrokes (or use SetKeyDelay).
        }
        MouseMove, (X + W*.560), (Y + H*.70), 10
        SendInput, {Click} ; Advertise
        MouseMove, (X + W*.560), (Y + H*.80), 10
        SendInput, {Click} ; Put on sale
    }
    ; Reset Shop view
    MouseMove, (X + W*.5), (Y + H*.95), 30
    Loop 2
    {
        Send {Click} ; Auto-repeat consists of consecutive down-events (with no up-events).
        Sleep 30 ; The number of milliseconds between keystrokes (or use SetKeyDelay).
    }
    Loop 5 {
        Sleep 1000*60
        SendInput, {Click}
    }
}

return