#!/usr/bin/pwsh
<#
    .SYNOPSIS
        
    
    .DESCRIPTION  
        Generate index.md  
    .NOTES
        Use file up-to '# Content', after that generate the Index
    .LINK
        https://adrianbiro.github.io
#>
function Set-Index {
    Param([string] $Location)
    [string[]]$blogs = foreach ($i in (Get-ChildItem -Path $Location -Recurse -Filter '*.md')) { 
        Resolve-Path -Relative $i 
    }
    
    [System.Collections.ArrayList]$dirs = @()
    foreach ($i in (Sort-Object -InputObject $blogs -Descending)) {
        [system.io.fileinfo]$file = $i
        [string] $dir = $file.Directory.Name
        if (-not ($dirs -contains $dir)) {
            $Content.Add(("### {0}" -f $dir)) | Out-Null
            $dirs.Add($dir) | Out-Null
        }
        $Content.Add(("* [{0}]({1})" -f ((Get-Content -TotalCount 1 -Path $i) -replace "# ", ""), $i)) | Out-Null
    }
}


[System.Collections.ArrayList]$Content = @()
function main {
    [system.io.fileinfo] $IndexFile = Resolve-Path -Relative "index.md"
    Write-Host "Generating Content"

    foreach ($i in (Get-Content -Path $IndexFile)) {
        $Content.Add($i) | Out-Null
        if ($i -match "In no sense organized.") { break }; 
    } 

    Write-Host "Generating Index"

    foreach ( $i in (Get-ChildItem "./content/" -Recurse -Filter "*.md").Directory | Sort-Object -Unique) {
        Set-Index -Location $i
    }

    Write-Host("Writing content to {0}" -f $IndexFile)

    Set-Content -Value $Content -Encoding "utf8BOM" -Path $IndexFile 

    Write-Host("Content:") 

    $Content
}
main