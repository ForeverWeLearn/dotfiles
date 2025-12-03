Invoke-Expression (&starship init powershell)
Invoke-Expression (& { (zoxide init --cmd cd --hook prompt powershell | Out-String) })

Set-Alias -Name ls -Value 'eza.exe'

Set-PSReadlineKeyHandler -Key Tab -Function AcceptNextSuggestionWord

function y {
    $tmp = (New-TemporaryFile).FullName
    yazi $args --cwd-file="$tmp"
    $cwd = Get-Content -Path $tmp -Encoding UTF8
    if (-not [String]::IsNullOrEmpty($cwd) -and $cwd -ne $PWD.Path) {
        Set-Location -LiteralPath (Resolve-Path -LiteralPath $cwd).Path
    }
    Remove-Item -Path $tmp
}
