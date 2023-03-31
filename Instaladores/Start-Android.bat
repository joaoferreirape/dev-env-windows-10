@echo off & cls

@REM ##################################################
@REM # Script para inicialização do Android Studio
@REM # Desenvolvido por: João Ferreira <joaoferreirape@gmail.com>
@REM ##################################################



start "Abrir Android Studio" /min /wait cmd /c taskkill /IM studio64.exe /F    1> NUL 2> NUL
rd /S /Q "%USERPROFILE%\.android"                                   1> NUL 2> NUL
rd /S /Q "%USERPROFILE%\AppData\Roaming\Google\AndroidStudio2022.1" 1> NUL 2> NUL
rd /S /Q "%USERPROFILE%\AppData\Roaming\Google\consentOptions"      1> NUL 2> NUL
xcopy /S /E /C /I /Q /G /H /R /Y /Z %~dp0\.android              "%USERPROFILE%\.android"                                    1> NUL 2> NUL
xcopy /S /E /C /I /Q /G /H /R /Y /Z %~dp0\AndroidStudio2022.1   "%USERPROFILE%\AppData\Roaming\Google\AndroidStudio2022.1"  1> NUL 2> NUL
xcopy /S /E /C /I /Q /G /H /R /Y /Z %~dp0\consentOptions        "%USERPROFILE%\AppData\Roaming\Google\consentOptions"       1> NUL 2> NUL
start "Abrir Android Studio" /min /wait cmd /c taskkill /IM studio64.exe /F    1> NUL 2> NUL
%~dp0\bin\studio64.exe &

cls

exit 0
