#!/usr/bin/pwsh
#Requires -Version 6.1
function Get-Html {
    Param(
        [Parameter(Mandatory = $true,
            HelpMessage = "Path to file.md")] 
        [ValidateScript({
                if (-Not ($_ | Test-Path -PathType Leaf) ) {
                    throw "The Path argument must be a file. Folder paths are not allowed."
                }
                return $true
            })]
        [system.io.fileinfo]$file
    )
    [system.io.fileinfo]$html = (Join-Path -Path $file.DirectoryName -ChildPath ("{0}.html" -f $file.BaseName))
(ConvertFrom-Markdown -Path $file).Html -replace '(href=".*).md', '${1}.html' | Out-File -Encoding "utf8BOM" -LiteralPath $html 
    return $html
}
Get-ChildItem -Path (git rev-parse --show-cdup) -Recurse -Filter '*.md' -Exclude "README.md" | ForEach-Object {
    Write-Host("Generating {0}" -f (Get-Html -file $_.FullName))
}
