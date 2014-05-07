@echo off
setlocal
if %~1. == . (
    set delete=no
) else if %~1. == -d. (
    set delete=yes
) else if %~1. == -h. (
    echo Usage: setup [-d] [-h]
    exit /b 0
) else (
    echo Unknown option: %1 >&2
    exit /b 1
)

set home=%HOMEDRIVE%%HOMEPATH%

for %%f in (vimrc) do (
    if %delete% == no (
        echo Copying %%f to %home%\.%%f
        copy %%f %home%\.%%f
    ) else (
        echo Deleting %home%\.%%f
        del %home%\.%%f
    )
)
