#!/usr/bin/env powershell

Write-Output "$([char]0x1b)[91m ---$([char]0x1b)[1;35m ghci-color$([char]0x1b)[91m cannot print infinite sequences ---$([char]0x1b)[0m"

$GREEN = "$([char]0x1b)[92m"
$RED = "$([char]0x1b)[91m"
$CYAN = "$([char]0x1b)[96m"
$BLUE = "$([char]0x1b)[94m" 
$YELLOW = "$([char]0x1b)[93m" 
$PURPLE = "$([char]0x1b)[95m" 
$RESET = "$([char]0x1b)[0m"

$load_failed = '^Failed, modules loaded:'
$load_done = 'done'
$double_colon = '::'
$right_arrow = '\->'
$right_arrow2 = '=>'
$calc_operators = '[+-/*]'
$char = "'\\?.'"
$string = '"[^"]*"'
$parenthesis = '[{}()]'
$left_bracket = '\[(.*?)\]'
$right_bracket = '\]'
$no_instance = '^\s*No instance'
$interactive = '^<[^>]*>'

Invoke-Expression (Get-Command ghci).Path @args | `
    % {$_ `
        -replace $load_failed, "$RED`$0$RESET" `
        -replace $load_done, "$GREEN`$0$RESET" `
        -replace $double_colon, "$PURPLE`$0$RESET" `
        -replace $right_arrow, "$PURPLE`$0$RESET" `
        -replace $right_arrow2, "$PURPLE`$0$RESET" `
        -replace $calc_operators, "$PURPLE`$0$RESET" `
        -replace $char, "$RED`$0$RESET" `
        -replace $string, "$CYAN`$0$RESET" `
        -replace $parenthesis, "$BLUE`$0$RESET" `
        -replace $left_bracket, "$BLUE`[$RESET`$1]" `
        -replace $right_bracket, "$BLUE`$0$RESET" `
        -replace $no_instance, "$RED`$0$RESET" `
        -replace $interactive, "$RED`$0$RESET" `
    }
