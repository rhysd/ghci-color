#!/usr/bin/env powershell

Write-Output "`e[91m ---`e[1;35m ghci-colour`e[91m cannot print infinite sequences ---`e[0m"

$GREEN = $(Write-Output "`e[92m") 
$RED = $(Write-Output "`e[91m") 
$CYAN = $(Write-Output "`e[96m") 
$BLUE = $(Write-Output "`e[94m") 
$YELLOW = $(Write-Output "`e[93m") 
$PURPLE = $(Write-Output "`e[95m") 
$RESET = $(Write-Output "`e[0m") 

$load_failed = "s/^Failed, modules loaded:/$RED&$RESET/;"
$load_done = "s/done./$GREEN&$RESET/g;"
$double_colon = "s/::/$PURPLE&$RESET/g;"
$right_arrow = "s/\->/$PURPLE&$RESET/g;"
$right_arrow2 = "s/=>/$PURPLE&$RESET/g;"
$calc_operators = "s/[+\-\/*]/$PURPLE&$RESET/g;"
$char = "s/'``\?.'/$RED&$RESET/g;"
# $string="s/`"[^`"]*`"/$RED&$RESET/g;"
$parenthesis = "s/[{}()]/$BLUE&$RESET/g;"
$left_bracket = "s/\[\([^09]\)/$BLUE[$RESET\1/g;"
$right_bracket = "s/\]/$BLUE&$RESET/g;"
$no_instance = "s/^\s*No instance/$RED&$RESET/g;"
$interactive = "s/^<[^>]*>/$RED&$RESET/g;"

Invoke-Expression (Get-Command ghci).Path @args 2>&1 | `
    sed "$load_failed `
         $load_done `
         $no_instance `
         $interactive `
         $double_colon `
         $right_arrow `
         $right_arrow2 `
         $parenthesis `
         $left_bracket `
         $right_bracket `
         $double_colon `
         $calc_operators `
         s/`"[^\`"]*`"/$CYAN&$RESET/g; `
         $char" 