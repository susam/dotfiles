@echo off & goto :main

rem The MIT License (MIT)
rem
rem Copyright (c) 2015-2016 Susam Pal
rem
rem Permission is hereby granted, free of charge, to any person obtaining
rem a copy of this software and associated documentation files (the
rem "Software"), to deal in the Software without restriction, including
rem without limitation the rights to use, copy, modify, merge, publish,
rem distribute, sublicense, and/or sell copies of the Software, and to
rem permit persons to whom the Software is furnished to do so, subject to
rem the following conditions:
rem
rem The above copyright notice and this permission notice shall be
rem included in all copies or substantial portions of the Software.
rem
rem THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
rem EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
rem MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
rem IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
rem CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
rem TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
rem SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.


rem Files for which symbolic links need to be set up.
rem
rem A list of space separated filenames. A filename with spaces in it
rem must be quoted. A dot (.) is added to each filename and a symbolic
rem link with this name is set up in the home directory.


rem Starting point of this script.
:main
    setlocal

    rem Files for which symbolic links need to be set up.
    rem
    rem Space separated filenames. Each file must be present in the
    rem current directory. A dot (.) is added to each filename and a
    rem symbolic link with this name is set up in the home directory.
    set DOT_FILES=vimrc

    set VERSION=0.1.0
    set COPYRIGHT=Copyright (c) 2015-2016 Susam Pal
    set LICENSE_URL=http://susam.net/licenses/mit/
    set SUPPORT_URL=https://github.com/susam/dotfiles/issues
    set NAME=%~n0

    set undo=no
    set home=%HOMEDRIVE%%HOMEPATH%

    call :parse_arguments %*

    endlocal
    goto :eof


rem Create symbolic links for dot-files.
:setup_dot_files
    setlocal enabledelayedexpansion
    for %%f in (%DOT_FILES%) do (
        set target=%CD%\%%f
        set link=%home%\.%%f

        if exist "!link!" (
            call :err Link !link! already exists.
        ) else if not exist "!target!" (
            call :err File !target! does not exist.
        ) else (
            mklink "!link!" "!target!" > nul
            if not errorlevel 1 echo Created !link! -^> !target!.
        )

    )
    endlocal
    goto :eof


rem Delete symbolic links for dot-files.
:undo_dot_files
    setlocal enabledelayedexpansion
    for %%f in (%DOT_FILES%) do (
        set link=%home%\.%%f
        if not exist "!link!" (
            call :err Link !link! does not exist.
        ) else (
            del "!link!"
            if not errorlevel 1 echo Deleted !link!.
        )
    )
    endlocal
    goto :eof


rem Parse command line arguments passed to this script.
rem
rem Arguments:
rem   arg...: All arguments this script was invoked with.
:parse_arguments
    if %1. == -u. (
        set undo=yes
        shift
        goto :parse_arguments
    ) else if %1. == --undo. (
        set undo=yes
        shift
        goto :parse_arguments
    ) else if %1. == -h. (
        call :show_help
        goto :eof
    ) else if %1. == --help. (
        call :show_help
        goto :eof
    ) else if %1. == /?. (
        call :show_help
        goto :eof
    ) else if %1. == -v. (
        call :show_version
        goto :eof
    ) else if %1. == --version. (
        call :show_version
        goto :eof
    )

    if not %1. == . (
        call :err Unknown argument "%~1".
        exit /b 1
    )

    if %undo% == no (
        call :setup_dot_files
    ) else (
        call :undo_dot_files
    )

    goto :eof


rem Print error message.
rem
rem Arguments:
rem   string...: String to print to standard error stream.
:err
    >&2 echo %NAME%: %*
    goto :eof


rem Show the path of this script.
:where_am_i
    echo %~f0
    goto :eof


rem Show help.
:show_help
    echo Usage: %NAME% [-u] [-h] [-v]
    echo.
    echo Set up dot-files in home directory.
    echo.
    echo Options:
    echo   -u, --undo     Undo setup.
    echo   -h, --help     Show this help and exit.
    echo   -v, --version  Show version and exit.
    echo.
    echo Report bugs to ^<%SUPPORT_URL%^>.
    goto :eof


rem Show version and copyright.
:show_version
    echo %NAME% %VERSION%
    echo %COPYRIGHT%
    echo.
    echo This is free and open source software. You can use, copy, modify,
    echo merge, publish, distribute, sublicense, and/or sell copies of it,
    echo under the terms of the MIT License. You can obtain a copy of the
    echo MIT License at ^<%LICENSE_URL%^>.
    echo.
    echo This software is provided "AS IS", WITHOUT WARRANTY OF ANY KIND,
    echo express or implied. See the MIT License for details.
    goto :eof
