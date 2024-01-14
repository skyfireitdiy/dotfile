F12:: {
    if WinExist("ahk_exe WindowsTerminal.exe") {
        WinActivate
    } else {
        Run("wt.exe")
    }
}