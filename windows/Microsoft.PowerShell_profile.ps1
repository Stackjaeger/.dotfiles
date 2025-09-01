oh-my-posh init pwsh --config "C:\.dotfiles\comun\.atomic.omp.json" | Invoke-Expression

Import-Module -Name Terminal-Icons

if ($host.Name -eq 'ConsoleHost')
{
    Import-Module PSReadLine
}

Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward
# Get-PSReadLineKeyHandler
set-PSReadLineOption -PredictionSource History
set-PSReadLineOption -PredictionViewStyle ListView
set-PSReadLineOption -EditMode Windows

fastfetch