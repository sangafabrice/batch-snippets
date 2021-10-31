Set-Location -Path ($MyInvocation.MyCommand.Path -replace '\\[^\\]+$')

Register-ObjectEvent -InputObject ([System.IO.FileSystemWatcher] (Resolve-Path -Path .).Path) -EventName Changed -Action {
    if (($Event.SourceArgs)[1].Name -eq 'batchshell.code-snippets') {
        Copy-Item -Path 'batchshell.code-snippets' -Destination "$($Env:AppData)\Code\User\snippets\batchshell.code-snippets" -Force
    }
} | Out-Null