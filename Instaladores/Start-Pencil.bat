@echo off & cls

@REM ##################################################
@REM # Script para inicialização do Evolus Pencil
@REM # Desenvolvido por: João Ferreira <joaoferreirape@gmail.com>
@REM ##################################################



start "Abrir Evolus Pencil" /min /wait cmd /c taskkill /IM Pencil.exe /F    1> NUL 2> NUL
rd /s /q  %USERPROFILE%\.pencil                 1> NUL 2> NUL
rd /s /q  %USERPROFILE%\AppData\Roaming\Pencil  1> NUL 2> NUL
rd /s /q  %USERPROFILE%\stencils                1> NUL 2> NUL
xcopy /S /E /C /I /Q /G /H /R /Y /Z %~dp0\.pencil   %USERPROFILE%\.pencil               1> NUL 2> NUL
xcopy /S /E /C /I /Q /G /H /R /Y /Z %~dp0\Pencil   %USERPROFILE%\AppData\Roaming\Pencil 1> NUL 2> NUL
xcopy /S /E /C /I /Q /G /H /R /Y /Z %~dp0\stencils   %USERPROFILE%\stencils             1> NUL 2> NUL
start "Abrir Evolus Pencil" /min /wait cmd /c taskkill /IM Pencil.exe /F    1> NUL 2> NUL
%~dp0\Pencil.exe &

cls

exit 0
