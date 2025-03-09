@echo on
title Cursor AI Terminal
cd %~dp0
if exist cursor-terminal.sh (
    where bash >nul 2>nul
    if %ERRORLEVEL% EQU 0 (
        bash cursor-terminal.sh
    ) else (
        echo Error: bash is not installed or not in PATH
        echo Please install Git Bash or WSL to run bash scripts
    )
) else (
    echo Error: cursor-terminal.sh not found in current directory
)
pause 