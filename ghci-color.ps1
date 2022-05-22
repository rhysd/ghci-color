#!/usr/bin/env powershell

Write-Output "$([char]0x1b)[91m ---$([char]0x1b)[1;35m ghci-colour$([char]0x1b)[91m cannot print infinite sequences ---$([char]0x1b)[0m"

$GREEN = "$([char]0x1b)[92m"
$RED = "$([char]0x1b)[91m"
$CYAN = "$([char]0x1b)[96m"
$BLUE = "$([char]0x1b)[94m" 
$YELLOW = "$([char]0x1b)[93m" 
$PURPLE = "$([char]0x1b)[95m" 
$RESET = "$([char]0x1b)[0m"

<#
$load_failed = '^Failed, modules loaded:'
$load_done = 'done.'
$double_colon = '::'
$right_arrow = '\->'
$right_arrow2 = '=>'
$calc_operators = '[+\-\/*]'
$char = '``\?.'
$string='`"[^\`"]*`"'
$parenthesis = '[{}()]'
$left_bracket = '\[\([^09]\)'
$right_bracket = '\]'
$no_instance = '^\s*No instance'
$interactive = '^<[^>]*>'
#>

Invoke-Expression (Get-Command ghci).Path @args 2>&1 | `
    % {$_ `
        -replace '^Failed, modules loaded:', "$RED`$0$RESET" `
        -replace 'done.', "$GREEN`$0$RESET" `
        -replace '::', "$PURPLE`$0$RESET" `
        -replace '\->', "$PURPLE`$0$RESET" `
        -replace '=>', "$PURPLE`$0$RESET" `
        -replace '[+-/*]', "$PURPLE`$0$RESET" `
        -replace "'\\?.'", "$RED`$0$RESET" `
        -replace '"[^"]*"', "$CYAN`$0$RESET" `
        -replace '[{}()]', "$BLUE`$0$RESET" `
        -replace '\[(.*?)\]', "$BLUE`[$RESET`$1]" `
        -replace '\]', "$BLUE`$0$RESET" `
        -replace '^\s*No instance', "$RED`$0$RESET" `
        -replace '^<[^>]*>', "$RED`$0$RESET" `
    }