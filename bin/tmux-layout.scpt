set projectDir to POSIX path of (path to home folder) & "src/ghostty"

tell application "Ghostty"
    activate

    set cfg to new surface configuration
    set initial working directory of cfg to projectDir

    set win to new window with configuration cfg
    set paneEditor to terminal 1 of selected tab of win
    set paneBuild to split paneEditor direction right with configuration cfg
    set paneGit to split paneEditor direction down with configuration cfg
    set paneLogs to split paneBuild direction down with configuration cfg

    input text "nvim ." to paneEditor
    send key "enter" to paneEditor

    input text "zig build -Demit-macos-app=false" to paneBuild
    send key "enter" to paneBuild

    input text "git status -sb" to paneGit
    send key "enter" to paneGit

    input text "tail -f /tmp/dev.log" to paneLogs
    send key "enter" to paneLogs

    focus paneEditor
end tell

