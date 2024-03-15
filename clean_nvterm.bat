@echo off
setlocal enabledelayedexpansion

for /f "tokens=*" %%a in (C:\Users\ealflm\.nvterm_info) do (
    for /f "tokens=1" %%b in ('tasklist /FI "PID eq %%a" /NH') do (
        REM echo %%b
        if "%%b"=="pwsh.exe" (
            REM echo Process %%a is running PowerShell.
            taskkill /F /PID %%a
        ) else (
            REM echo Process %%a is not running PowerShell.
        )
    )
)

del "C:\Users\ealflm\.nvterm_info"
