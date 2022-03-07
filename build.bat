@echo off

set WATCOM=F:\projects\fun\dos_games_rev\tools\open-watcom-2_0-c-win-x64
set PATH=%WATCOM%\binnt64;%PATH%

wasm.exe part_0.asm -mt -bt=dos -nt=seg000
if %ERRORLEVEL% NEQ 0 goto error
::dmpobj.exe part_0.obj > part_0.obj.dmpobj.txt

wcc.exe part_1.c -zl -zls -s -bt=dos -ms -nt=seg000
if %ERRORLEVEL% NEQ 0 goto error
::dmpobj.exe part_1.obj > part_1.obj.dmpobj.txt

wasm.exe part_2.asm -mt -bt=dos -nt=seg000
if %ERRORLEVEL% NEQ 0 goto error
::dmpobj.exe part_2.obj > part_2.obj.dmpobj.txt

wlink.exe name main.com format dos com file { part_0.obj part_1.obj part_2.obj } option { map=main.map }
if %ERRORLEVEL% NEQ 0 goto error

echo success
pause
exit /b 0

:error
pause

exit /b 1
