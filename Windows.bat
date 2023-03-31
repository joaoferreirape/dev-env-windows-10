@echo off & cls

@REM ##################################################
@REM # Script para criação do ambiente de desenvolvimento no Windows
@REM # Desenvolvido por: João Ferreira <joaoferreirape@gmail.com>
@REM ##################################################





@REM ###############################################################################
@REM ###############################################################################
@REM ###############################################################################
@REM ###############################################################################
@REM ###############################################################################
net session >nul 2>&1
if %errorLevel% == 0 (
    echo Iniciar processos de construcao do ambiente de desenvolvimento.
    echo Os procedimentos irao demorar bastante ...
    echo Seja paciente ...
    echo .
) else (
    echo ########################################
    echo ########################################
    echo #Execute este script como ADMINISTRADOR#
    echo ########################################
    echo ########################################
    powershell "[console]::beep(1000,800);[console]::beep(900,200);[console]::beep(900,200);"
    powershell "[console]::beep(1000,800);[console]::beep(900,200);[console]::beep(900,200);"
    powershell "[console]::beep(1000,800);[console]::beep(900,200);[console]::beep(900,200);"
    powershell "[console]::beep(1000,800);[console]::beep(900,200);[console]::beep(900,200);"
    powershell "[console]::beep(1000,800);[console]::beep(900,200);[console]::beep(900,200);"
    pause >NUL
    exit 1
)





@REM ###############################################################################
@REM ###############################################################################
@REM ###############################################################################
@REM ###############################################################################
@REM ###############################################################################
@REM "Definicao de variaveis"
set pexec=%~dp0
set work=C:\Work
    set inst=%work%\Instaladores
    set apps=%work%\Apps
    set wspc=%work%\Workspace





@REM ###############################################################################
@REM ###############################################################################
@REM ###############################################################################
@REM ###############################################################################
@REM ###############################################################################
echo Adicionando o diretorio C:\Work para as excecoes do antivirus & echo Aguarde ...
powershell -inputformat none -outputformat none -NonInteractive -Command "Add-MpPreference -ExclusionPath 'C:\Work'" 1> NUL 2> NUL





@REM ###############################################################################
@REM ###############################################################################
@REM ###############################################################################
@REM ###############################################################################
@REM ###############################################################################
echo Limpando diretorios temporarios & echo Aguarde ...
start "Limpar diretorios temporarios" /min /wait cmd /c for /R "C:\Users" %%f in (Temp) do rd /S /Q "%%~ff"    1> NUL 2> NUL
start "Limpar diretorios temporarios" /min /wait cmd /c rd /S /Q "C:\Tmp"              1> NUL 2> NUL
start "Limpar diretorios temporarios" /min /wait cmd /c rd /S /Q "C:\Temp"             1> NUL 2> NUL
start "Limpar diretorios temporarios" /min /wait cmd /c rd /S /Q "C:\Windows\Temp"     1> NUL 2> NUL
powershell "[console]::beep(264,300);[console]::beep(297,300);[console]::beep(330,300)"





@REM ###############################################################################
@REM ###############################################################################
@REM ###############################################################################
@REM ###############################################################################
@REM ###############################################################################
echo Limpando diretorio C:\Work\Instaladores & echo Aguarde ...
start "Limpar diretorios de instaladores" /min /wait cmd /c rd /S /Q "%inst%"    1> NUL 2> NUL
powershell "[console]::beep(264,300);[console]::beep(297,300);[console]::beep(330,300)"





@REM ###############################################################################
@REM ###############################################################################
@REM ###############################################################################
@REM ###############################################################################
@REM ###############################################################################
echo Copiando instaladores & echo Aguarde ...
start "Copiar instaladores" /min /wait cmd /c md "%inst%"    1> NUL 2> NUL
start "Copiar instaladores" /min /wait cmd /c xcopy /S /E /C /I /Q /G /H /R /Y /Z "%pexec%\Instaladores" "%inst%"    1> NUL 2> NUL
powershell "[console]::beep(264,300);[console]::beep(297,300);[console]::beep(330,300)"





@REM ###############################################################################
@REM ###############################################################################
@REM ###############################################################################
@REM ###############################################################################
@REM ###############################################################################
@REM ###############################################################################
@REM ###############################################################################
@REM ###############################################################################
@REM ###############################################################################
@REM ###############################################################################
@REM ###############################################################################
@REM ###############################################################################
@REM ###############################################################################
@REM ###############################################################################
@REM ###############################################################################
echo Removendo a instalacao do git & echo Aguarde ...
wmic product where "Name like '%%Git%%'"    call uninstall 1> NUL 2> NUL
wmic product where "Vendor like '%%Git%%'"  call uninstall 1> NUL 2> NUL
start "Limpar git" /min /wait cmd /c rd /S /Q "C:\ProgramData\Microsoft\Windows\Menu Iniciar\Programas\Git"   1> NUL 2> NUL
start "Limpar git" /min /wait cmd /c rd /S /Q "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Git"     1> NUL 2> NUL
start "Limpar git" /min /wait cmd /c rd /S /Q "C:\Program Files\Git"                                         1> NUL 2> NUL
start "Limpar git" /min /wait cmd /c rd /S /Q "C:\Program Files (x86)\Git"                                   1> NUL 2> NUL
start "Limpar git" /min /wait cmd /c for /R "C:\Users" %%f in (.git) do rd /S /Q "%%~ff"            1> NUL 2> NUL
start "Limpar git" /min /wait cmd /c for /R "C:\Users" %%f in (.gitignore) do rd /S /Q "%%~ff"     1> NUL 2> NUL
start "Limpar git" /min /wait cmd /c for /R "C:\Users" %%f in (git) do rd /S /Q "%%~ff"            1> NUL 2> NUL
@REM start "Limpar git" /min /wait cmd /c "%inst%\Windows_path.bat git"
powershell "[console]::beep(264,300);[console]::beep(297,300);[console]::beep(330,300)"

echo Removendo a instalacao do Java & echo Aguarde ...
wmic product where "Name like '%%Java%%'"   call uninstall 1> NUL 2> NUL
start "Limpar Java" /min /wait cmd /c rd /S /Q "C:\ProgramData\Microsoft\Windows\Menu Iniciar\Programas\Java Development Kit" 1> NUL 2> NUL
start "Limpar Java" /min /wait cmd /c rd /S /Q "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Java Development Kit"   1> NUL 2> NUL
start "Limpar Java" /min /wait cmd /c rd /S /Q "C:\Program Files\Common Files\Oracle\Java"                                   1> NUL 2> NUL
start "Limpar Java" /min /wait cmd /c rd /S /Q "C:\Program Files\Java"                                                       1> NUL 2> NUL
setx /M JAVA_HOME       "" 1> NUL 2> NUL
setx /M JDK_HOME        "" 1> NUL 2> NUL
setx /M JRE             "" 1> NUL 2> NUL
setx /M JRE_HOME        "" 1> NUL 2> NUL
setx /M JAVA_EXE        "" 1> NUL 2> NUL
setx /M _JAVA_OPTIONS   "" 1> NUL 2> NUL
setx /M  JAVA_OPTIONS   "" 1> NUL 2> NUL
@REM start "Limpar Java" /min /wait cmd /c "%inst%\Windows_path.bat java"
@REM start "Limpar Java" /min /wait cmd /c "%inst%\Windows_path.bat jdk"
@REM start "Limpar Java" /min /wait cmd /c "%inst%\Windows_path.bat jdk-"
@REM start "Limpar Java" /min /wait cmd /c "%inst%\Windows_path.bat jre"
@REM start "Limpar Java" /min /wait cmd /c "%inst%\Windows_path.bat jre-"
powershell "[console]::beep(264,300);[console]::beep(297,300);[console]::beep(330,300)"

echo Removendo a instalacao do Apache Maven & echo Aguarde ...
setx /M M2 ""           1> NUL 2> NUL
setx /M M2_HOME ""      1> NUL 2> NUL
setx /M MAVEN_HOME ""   1> NUL 2> NUL
setx /M MAVEN_OPTS ""   1> NUL 2> NUL
@REM start "Limpar Maven" /min /wait cmd /c "%inst%\Windows_path.bat maven"
powershell "[console]::beep(264,300);[console]::beep(297,300);[console]::beep(330,300)"

echo Removendo a instalacao do Gradle & echo Aguarde ...
setx /M GRADLE_HOME ""  1> NUL 2> NUL
@REM start "Limpar Gradle" /min /wait cmd /c "%inst%\Windows_path.bat gradle"
powershell "[console]::beep(264,300);[console]::beep(297,300);[console]::beep(330,300)"

echo Removendo a instalacao do Python & echo Aguarde ...
wmic product where "Name like '%%Python%%'"     call uninstall 1> NUL 2> NUL
wmic product where "Vendor like '%%Python%%'"   call uninstall 1> NUL 2> NUL
start "Limpar Python" /min /wait cmd /c rd /S /Q "C:\ProgramData\Microsoft\Windows\Menu Iniciar\Programas\Python 3.11"    1> NUL 2> NUL
start "Limpar Python" /min /wait cmd /c rd /S /Q "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Python 3.11"      1> NUL 2> NUL
start "Limpar Python" /min /wait cmd /c rd /S /Q "C:\Program Files (x86)\Python"                                         1> NUL 2> NUL
start "Limpar Python" /min /wait cmd /c rd /S /Q "C:\Program Files\Python"                                               1> NUL 2> NUL
@REM start "Limpar Python" /min /wait cmd /c rd /S /Q for /R "C:\Users" %%f in ("python") do rd /S /Q "%%~ff"    1> NUL 2> NUL
@REM start "Limpar Python" /min /wait cmd /c "%inst%\Windows_path.bat python"
powershell "[console]::beep(264,300);[console]::beep(297,300);[console]::beep(330,300)"

echo Removendo a instalacao do NodeJS & echo Aguarde ...
start "Limpar NodeJS" /min /wait cmd /c "npm cache clean --global --force"
wmic product where "Name like '%%Node%%'"   call uninstall 1> NUL 2> NUL
wmic product where "Vendor like '%%Node%%'" call uninstall 1> NUL 2> NUL
start "Limpar NodeJS" /min /wait cmd /c rd /S /Q "C:\ProgramData\Microsoft\Windows\Menu Iniciar\Programas\NodeJS"   1> NUL 2> NUL
start "Limpar NodeJS" /min /wait cmd /c rd /S /Q "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\NodeJS"     1> NUL 2> NUL
start "Limpar NodeJS" /min /wait cmd /c rd /S /Q "C:\Program Files\Nodejs"                                         1> NUL 2> NUL
start "Limpar NodeJS" /min /wait cmd /c rd /S /Q "C:\Program Files (x86)\Nodejs"                                   1> NUL 2> NUL
start "Limpar NodeJS" /min /wait cmd /c for /R "C:\Users" %%f in (.node) do rd /S /Q "%%~ff"           1> NUL 2> NUL
start "Limpar NodeJS" /min /wait cmd /c for /R "C:\Users" %%f in (.npm) do rd /S /Q "%%~ff"            1> NUL 2> NUL
start "Limpar NodeJS" /min /wait cmd /c for /R "C:\Users" %%f in (node_modules) do rd /S /Q "%%~ff"    1> NUL 2> NUL
start "Limpar NodeJS" /min /wait cmd /c for /R "C:\Users" %%f in (npm) do rd /S /Q "%%~ff"             1> NUL 2> NUL
start "Limpar NodeJS" /min /wait cmd /c for /R "C:\Users" %%f in (npm_cache) do rd /S /Q "%%~ff"       1> NUL 2> NUL
@REM start "Limpar NodeJS" /min /wait cmd /c "%inst%\Windows_path.bat nodejs"
powershell "[console]::beep(264,300);[console]::beep(297,300);[console]::beep(330,300)"

echo Removendo a instalacao do NVM & echo Aguarde ...
start "Limpar NodeJS" /min /wait cmd /c "npm cache clean --global --force"
wmic product where "Name like '%%NVM%%'" call uninstall 1> NUL 2> NUL
start "Limpar NodeJS" /min /wait cmd /c rd /S /Q "C:\ProgramData\Microsoft\Windows\Menu Iniciar\Programas\NVM for Windows"    1> NUL 2> NUL
start "Limpar NodeJS" /min /wait cmd /c rd /S /Q "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\NVM for Windows"      1> NUL 2> NUL
start "Limpar NodeJS" /min /wait cmd /c rd /S /Q "C:\Program Files\nvm"                                                      1> NUL 2> NUL
start "Limpar NodeJS" /min /wait cmd /c rd /S /Q "C:\Program Files (x86)\nvm"                                                1> NUL 2> NUL
start "Limpar NodeJS" /min /wait cmd /c for /R "C:\Users" %%f in (.nvm) do rd /S /Q "%%~ff"    1> NUL 2> NUL
start "Limpar NodeJS" /min /wait cmd /c for /R "C:\Users" %%f in (nvm) do rd /S /Q "%%~ff"     1> NUL 2> NUL
setx NVM_HOME ""        1> NUL 2> NUL
setx NVM_SYMLINK ""     1> NUL 2> NUL
setx /M NVM_HOME ""     1> NUL 2> NUL
setx /M NVM_SYMLINK ""  1> NUL 2> NUL
@REM start "Limpar NodeJS" /min /wait cmd /c "%inst%\Windows_path.bat nvm"
powershell "[console]::beep(264,300);[console]::beep(297,300);[console]::beep(330,300)"

echo Removendo a instalacao do Android Studio & echo Aguarde ...
wmic product where "Name like '%%Android%%'" call uninstall 1> NUL 2> NUL
start "Limpar Android" /min /wait cmd /c rd /S /Q "C:\ProgramData\Microsoft\Windows\Menu Iniciar\Programas\Android Studio"    1> NUL 2> NUL
start "Limpar Android" /min /wait cmd /c rd /S /Q "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Android Studio"      1> NUL 2> NUL
start "Limpar Android" /min /wait cmd /c rd /S /Q "C:\Program Files\Android"                                                 1> NUL 2> NUL
start "Limpar Android" /min /wait cmd /c rd /S /Q "C:\Program Files (x86)\Android"                                           1> NUL 2> NUL
start "Limpar Android" /min /wait cmd /c for /R "C:\Users" %%f in (.android) do rd /S /Q "%%~ff"               1> NUL 2> NUL
start "Limpar Android" /min /wait cmd /c for /R "C:\Users" %%f in (AndroidStudio2022) do rd /S /Q "%%~ff"      1> NUL 2> NUL
start "Limpar Android" /min /wait cmd /c for /R "C:\Users" %%f in (AndroidStudio2022.1) do rd /S /Q "%%~ff"    1> NUL 2> NUL
start "Limpar Android" /min /wait cmd /c for /R "C:\Users" %%f in (consentOptions) do rd /S /Q "%%~ff"         1> NUL 2> NUL
setx /M ANDROID_AVD_HOME        "" 1> NUL 2> NUL
setx /M ANDROID_EMULATOR_HOME   "" 1> NUL 2> NUL
setx /M ANDROID_HOME            "" 1> NUL 2> NUL
@REM setx /M ANDROID_PREFS_ROOT      "" 1> NUL 2> NUL
@REM setx /M ANDROID_SDK_HOME        "" 1> NUL 2> NUL
setx /M ANDROID_SDK_ROOT        "" 1> NUL 2> NUL
setx /M ANDROID_USER_HOME       "" 1> NUL 2> NUL
setx /M STUDIO_JDK              "" 1> NUL 2> NUL
@REM start "Limpar Android" /min /wait cmd /c "%inst%\Windows_path.bat android"
powershell "[console]::beep(264,300);[console]::beep(297,300);[console]::beep(330,300)"

echo Removendo a instalacao do Visual Studio Code & echo Aguarde ...
wmic product where "Name like '%%Visual Studio Code%%'" call uninstall 1> NUL 2> NUL
start "Limpar VS Code" /min /wait cmd /c rd /S /Q "C:\ProgramData\Microsoft\Windows\Menu Iniciar\Programas\Visual Studio Code"    1> NUL 2> NUL
start "Limpar VS Code" /min /wait cmd /c rd /S /Q "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Visual Studio Code"      1> NUL 2> NUL
start "Limpar VS Code" /min /wait cmd /c rd /S /Q "C:\Program Files\Microsoft VS Code"                                           1> NUL 2> NUL
start "Limpar VS Code" /min /wait cmd /c rd /S /Q "C:\Program Files (x86)\Microsoft VS Code"                                     1> NUL 2> NUL
start "Limpar VS Code" /min /wait cmd /c for /R "C:\Users" %%f in (.code) do rd /S /Q "%%~ff"      1> NUL 2> NUL
start "Limpar VS Code" /min /wait cmd /c for /R "C:\Users" %%f in (.vscode) do rd /S /Q "%%~ff"    1> NUL 2> NUL
start "Limpar VS Code" /min /wait cmd /c for /R "C:\Users" %%f in (Code) do rd /S /Q "%%~ff"       1> NUL 2> NUL
start "Limpar VS Code" /min /wait cmd /c for /R "C:\Users" %%f in (VSCode) do rd /S /Q "%%~ff"       1> NUL 2> NUL
@REM start "Limpar VS Code" /min /wait cmd /c "%inst%\Windows_path.bat vscode"
powershell "[console]::beep(264,300);[console]::beep(297,300);[console]::beep(330,300)"

echo Removendo a instalacao do Evolus Pencil & echo Aguarde ...
wmic product where "Name like '%%Pencil%%'" call uninstall 1> NUL 2> NUL
wmic product where "Vendor like '%%Evolus%%'"  call uninstall 1> NUL 2> NUL
start "Limpar Evolus Pencil" /min /wait cmd /c del /F /S /Q "C:\ProgramData\Microsoft\Windows\Menu Iniciar\Programas\Pencil.lnk"  1> NUL 2> NUL
start "Limpar Evolus Pencil" /min /wait cmd /c del /F /S /Q "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Pencil.lnk"    1> NUL 2> NUL
start "Limpar Evolus Pencil" /min /wait cmd /c rd /S /Q "C:\Program Files\Pencil"                                            1> NUL 2> NUL
start "Limpar Evolus Pencil" /min /wait cmd /c rd /S /Q "C:\Program Files\Evolus"                                            1> NUL 2> NUL
start "Limpar Evolus Pencil" /min /wait cmd /c for /R "C:\Users" %%f in (.pencil) do rd /S /Q "%%~ff"          1> NUL 2> NUL
start "Limpar Evolus Pencil" /min /wait cmd /c for /R "C:\Users" %%f in (pencil-updater) do rd /S /Q "%%~ff"   1> NUL 2> NUL
start "Limpar Evolus Pencil" /min /wait cmd /c for /R "C:\Users" %%f in (Pencil) do rd /S /Q "%%~ff"           1> NUL 2> NUL
start "Limpar Evolus Pencil" /min /wait cmd /c for /R "C:\Users" %%f in (stencils) do rd /S /Q "%%~ff"         1> NUL 2> NUL
powershell "[console]::beep(264,300);[console]::beep(297,300);[console]::beep(330,300)"





@REM ###############################################################################
@REM ###############################################################################
@REM ###############################################################################
@REM ###############################################################################
@REM ###############################################################################
echo Criando novos diretorios de instalacao dos aplicativos & echo Aguarde ...
start "Limpar %apps%" /min /wait cmd /c "%inst%\Windows_delete.bat %apps%"
md %apps%\Android\.android\avd      1> NUL 2> NUL
md %apps%\Android\android-sdk       1> NUL 2> NUL
md %apps%\Android\android-studio    1> NUL 2> NUL
md %apps%\Apache\Maven              1> NUL 2> NUL
md %apps%\Git                       1> NUL 2> NUL
md %apps%\Gradle                    1> NUL 2> NUL
md %apps%\Pencil                    1> NUL 2> NUL
md %apps%\Python                    1> NUL 2> NUL
md %apps%\Microsoft                 1> NUL 2> NUL
powershell "[console]::beep(264,300);[console]::beep(297,300);[console]::beep(330,300)"





@REM ###############################################################################
@REM ###############################################################################
@REM ###############################################################################
@REM ###############################################################################
@REM ###############################################################################
echo Criando novo diretorio de trabalho/workspace & echo Aguarde ...
start "Limpar %wspc%" /min /wait cmd /c "%inst%\Windows_delete.bat %wspc%"
md %wspc%\mobile        1> NUL 2> NUL
md %wspc%\distribuidos  1> NUL 2> NUL
powershell "[console]::beep(264,300);[console]::beep(297,300);[console]::beep(330,300)"





@REM ###############################################################################
@REM ###############################################################################
@REM ###############################################################################
@REM ###############################################################################
@REM ###############################################################################
@REM ###############################################################################
@REM ###############################################################################
@REM ###############################################################################
@REM ###############################################################################
@REM ###############################################################################
@REM ###############################################################################
@REM ###############################################################################
@REM ###############################################################################
@REM ###############################################################################
@REM ###############################################################################
echo Instalando o git & echo Aguarde ...
start /wait %inst%\Git-2.39.2-64-bit.exe /ALLUSERS /SP /SILENT /VERYSILENT /SUPPRESSMSGBOXES /NORESTART /FORCECLOSEAPPLICATIONS /NORESTARTAPPLICATIONS /LOADINF=%inst%\Git-2.39.2-64-bit.inf /DIR="%apps%\Git" 1> NUL 2> NUL
setx /M PATH "C:\Work\Apps\Git\cmd;%PATH%"  1> NUL 2> NUL
powershell "[console]::beep(264,300);[console]::beep(297,300);[console]::beep(330,300)"

echo Instalando o Oracle JDK & echo Aguarde ...
start /wait %inst%\jdk-11.0.18_windows-x64_bin.exe /s 1> NUL 2> NUL
setx /M JAVA_HOME       "C:\Program Files\Java\jdk-11"              1> NUL 2> NUL
setx /M JDK_HOME        "C:\Program Files\Java\jdk-11"              1> NUL 2> NUL
setx /M JRE             "C:\Program Files\Java\jdk-11"              1> NUL 2> NUL
setx /M JRE_HOME        "C:\Program Files\Java\jdk-11"              1> NUL 2> NUL
setx /M JAVA_EXE        "C:\Program Files\Java\jdk-11\bin\java.exe" 1> NUL 2> NUL
setx /M _JAVA_OPTIONS   "-Dswing.aatext=true -Dawt.useSystemAAFontSettings=on"  1> NUL 2> NUL
setx /M  JAVA_OPTIONS   "-Dswing.aatext=true -Dawt.useSystemAAFontSettings=on"  1> NUL 2> NUL
setx /M PATH "C:\Program Files\Java\jdk-11\bin;%PATH%"  1> NUL 2> NUL
powershell "[console]::beep(264,300);[console]::beep(297,300);[console]::beep(330,300)"

echo Instalando o Apache Maven & echo Aguarde ...
start "Instalando o Apache Maven" /min /wait cmd /c "tar -xvf %inst%\apache-maven-3.9.0-bin.zip -C %apps%\Apache\Maven"  1> NUL 2> NUL
setx /M M2 "%apps%\Apache\Maven\apache-maven-3.9.0\bin"     1> NUL 2> NUL
setx /M M2_HOME "%apps%\Apache\Maven\apache-maven-3.9.0"    1> NUL 2> NUL
setx /M MAVEN_HOME "%apps%\Apache\Maven\apache-maven-3.9.0" 1> NUL 2> NUL
setx /M MAVEN_OPTS "-Xms256m -Xmx512m"                      1> NUL 2> NUL
setx /M PATH "%apps%\Apache\Maven\apache-maven-3.9.0\bin;%PATH%"                                  1> NUL 2> NUL
powershell "[console]::beep(264,300);[console]::beep(297,300);[console]::beep(330,300)"

echo Instalando o Gradle & echo Aguarde ...
start "Instalando o Gradle" /min /wait cmd /c "tar -xvf %inst%\gradle-8.0.2-all.zip -C %apps%\Gradle"    1> NUL 2> NUL
setx /M GRADLE_HOME "%apps%\Gradle\gradle-8.0.2"        1> NUL 2> NUL
setx /M PATH "%apps%\Gradle\gradle-8.0.2\bin;%PATH%"    1> NUL 2> NUL
powershell "[console]::beep(264,300);[console]::beep(297,300);[console]::beep(330,300)"

echo Instalando o Python & echo Aguarde ...
start /wait %inst%\python-3.11.2-amd64.exe /quiet InstallAllUsers=1 TargetDir="%apps%\Python\311" DefaultAllUsersTargetDir="%apps%\Python\311" \DefaultJustForMeTargetDir="%apps%\Python\311" DefaultCustomTargetDir="%apps%\Python\311" AssociateFiles=1 CompileAll=1 PrependPath=1 AppendPath=1 Shortcuts=1 Include_doc=1 Include_debug=0 Include_dev=1 Include_exe=1 Include_launcher=1 InstallLauncherAllUsers=1 Include_lib=1 Include_pip=1 Include_symbols=0 Include_tcltk=1 Include_test=1 Include_tools=1 1> NUL 2> NUL
@REM setx /M PATH "%apps%\Python\311;%PATH%"         1> NUL 2> NUL
@REM setx /M PATH "%apps%\Python\311\Scripts;%PATH%" 1> NUL 2> NUL
powershell "[console]::beep(264,300);[console]::beep(297,300);[console]::beep(330,300)"

echo Instalando o NVM & echo Aguarde ...
start /wait %inst%\nvm-setup.exe /SP /SILENT /VERYSILENT /SUPPRESSMSGBOXES /NOCANCEL /NORESTART /FORCECLOSEAPPLICATIONS /NORESTARTAPPLICATIONS /DIR="%apps%\nvm" 1> NUL 2> NUL
start "Instalando o NodeJS" /min /wait cmd /c "nvm install 16.19.1"  1> NUL 2> NUL
start "Instalando o NodeJS" /min /wait cmd /c "nvm use 16.19.1"      1> NUL 2> NUL
MKLINK /D "C:\Program Files\nodejs" "C:\Work\Apps\nvm\v16.19.1"      1> NUL 2> NUL
setx NVM_HOME "C:\Work\Apps\nvm"                1> NUL 2> NUL
setx NVM_SYMLINK "C:\Program Files\nodejs"      1> NUL 2> NUL
setx /M NVM_HOME "C:\Work\Apps\nvm"             1> NUL 2> NUL
setx /M NVM_SYMLINK "C:\Program Files\nodejs"   1> NUL 2> NUL
setx NODE_TLS_REJECT_UNAUTHORIZED=0 1> NUL 2> NUL
start "Instalando o NodeJS" /min /wait cmd /c "npm install --global --force @angular/cli @capacitor/cli @capacitor/core @compodoc/compodoc @ionic/angular-toolkit @ionic/cli @ionic/core @ionic/lab axios capacitor cordova cordova-sqlite-storage cross-env debug dotenv eslint expo-cli express express-generator express-validator flutter ionicons jade jade-cli jest jshint karma less lodash mocha moment mongoose morgan mysql native-run node-sass node-sass-middleware nodemailer nodemon npm oracledb parcel passport pm2 pug pug-error pug-lexer pug-parser react react-native restify sass semver sequelize sqlite sqlite3 tslint typescript validator vue webpack winston yarn"   1> NUL 2> NUL
start "Instalando o NodeJS" /min /wait cmd /c "npm upgrade --global --force" 1> NUL 2> NUL
setx /M NODE_TLS_REJECT_UNAUTHORIZED 1 1> NUL 2> NUL
powershell "[console]::beep(264,300);[console]::beep(297,300);[console]::beep(330,300)"

echo Instalando o Android Studio & echo Aguarde ...
start "Instalando o Android Studio" /min /wait cmd /c "tar -xvf %inst%\Android-(Work-Apps).zip -C %apps%"                                                               1> NUL 2> NUL
start "Instalando o Android Studio" /min /wait cmd /c "tar -xvf %inst%\.android-(UserProfile).zip -C %apps%\Android\android-studio"                                     1> NUL 2> NUL
start "Instalando o Android Studio" /min /wait cmd /c "tar -xvf %inst%\AndroidStudio2022.1-(UserProfile-AppData-Roaming-Google).zip -C %apps%\Android\android-studio"   1> NUL 2> NUL
start "Instalando o Android Studio" /min /wait cmd /c "tar -xvf %inst%\consentOptions-(UserProfile-AppData-Roaming-Google).zip -C %apps%\Android\android-studio"        1> NUL 2> NUL
start "Instalando o Android Studio" /min /wait cmd /c "copy /D /Y /Z %inst%\Start-Android.bat %apps%\Android\android-studio"   1> NUL 2> NUL
setx /M ANDROID_AVD_HOME "%apps%\Android\.android\avd"  1> NUL 2> NUL
setx /M ANDROID_EMULATOR_HOME "%apps%\Android\.android" 1> NUL 2> NUL
setx /M ANDROID_HOME "%apps%\Android\android-sdk"       1> NUL 2> NUL
@REM setx /M ANDROID_PREFS_ROOT "%apps%\Android\.android"    1> NUL 2> NUL
@REM setx /M ANDROID_SDK_HOME "%apps%\Android\.android"      1> NUL 2> NUL
setx /M ANDROID_SDK_ROOT "%apps%\Android\android-sdk"   1> NUL 2> NUL
setx /M ANDROID_USER_HOME "%apps%\Android\.android"     1> NUL 2> NUL
setx /M STUDIO_JDK "C:\Program Files\Java\jdk-11"       1> NUL 2> NUL
setx /M PATH "%apps%\Android\android-sdk\platform-tools;%apps%\Android\android-sdk\tools;%apps%\Android\android-studio\bin;%PATH%"  1> NUL 2> NUL
powershell "[console]::beep(264,300);[console]::beep(297,300);[console]::beep(330,300)"

echo Instalando o Microsoft Visual Studio Code & echo Aguarde ...
start /wait %inst%\VSCodeSetup-x64-1.76.0.exe /SP /SILENT /VERYSILENT /SUPPRESSMSGBOXES /NOCANCEL /NORESTART /FORCECLOSEAPPLICATIONS /NORESTARTAPPLICATIONS /DIR="%apps%\Microsoft\VSCode" /TASKS=addcontextmenufiles,addcontextmenufolders,associatewithfiles,addtopath 1> NUL 2> NUL
start "Instalando o Microsoft Visual Studio Code" /min /wait cmd /c "copy /D /Y /Z %inst%\Start-VSCode.bat %apps%\Microsoft\VSCode"   1> NUL 2> NUL
powershell "[console]::beep(264,300);[console]::beep(297,300);[console]::beep(330,300)"

echo Instalando o Evolus Pencil & echo Aguarde ...
start "Instalando o Evolus Pencil" /min /wait cmd /c "tar -xvf %inst%\Pencil-(Work-Apps).zip                     -C %apps%"          1> NUL 2> NUL
start "Instalando o Evolus Pencil" /min /wait cmd /c "tar -xvf %inst%\.pencil-(UserProfile).zip                  -C %apps%\Pencil"   1> NUL 2> NUL
start "Instalando o Evolus Pencil" /min /wait cmd /c "tar -xvf %inst%\Pencil-(UserProfile-AppData-Roaming).zip   -C %apps%\Pencil"   1> NUL 2> NUL
start "Instalando o Evolus Pencil" /min /wait cmd /c "tar -xvf %inst%\stencils-(UserProfile).zip                 -C %apps%\Pencil"   1> NUL 2> NUL
start "Instalando o Evolus Pencil" /min /wait cmd /c "copy /D /Y /Z %apps%\Pencil\.pencil\fonts\Android-Roboto\*.ttf  %SYSTEMROOT%\Fonts"   1> NUL 2> NUL
start "Instalando o Evolus Pencil" /min /wait cmd /c "copy /D /Y /Z %apps%\Pencil\.pencil\fonts\Cantarell\*.ttf       %SYSTEMROOT%\Fonts"   1> NUL 2> NUL
start "Instalando o Evolus Pencil" /min /wait cmd /c "copy /D /Y /Z %inst%\Start-Pencil.bat %apps%\Pencil"   1> NUL 2> NUL
powershell "[console]::beep(264,300);[console]::beep(297,300);[console]::beep(330,300)"





@REM ###############################################################################
@REM ###############################################################################
@REM ###############################################################################
@REM ###############################################################################
@REM ###############################################################################
echo Configurando o firewall & echo Aguarde ...
netsh advfirewall set currentprofile state on 1> NUL 2> NUL
netsh advfirewall reset 1> NUL 2> NUL
netsh advfirewall set currentprofile firewallpolicy blockinboundalways,allowoutbound 1> NUL 2> NUL

echo Adicionando regras no firewall para o git & echo Aguarde ...
netsh advfirewall firewall add rule name="@Git bin\bash"    dir=in action=allow program="%apps%\Git\bin\bash.exe"       enable=yes remoteip=any localip=any 1> NUL 2> NUL
netsh advfirewall firewall add rule name="@Git bin\git"     dir=in action=allow program="%apps%\Git\bin\git.exe"        enable=yes remoteip=any localip=any 1> NUL 2> NUL
netsh advfirewall firewall add rule name="@Git bin\sh"      dir=in action=allow program="%apps%\Git\bin\sh.exe"         enable=yes remoteip=any localip=any 1> NUL 2> NUL
netsh advfirewall firewall add rule name="@Git cmd\git.exe" dir=in action=allow program="%apps%\Git\cmd\git.exe"        enable=yes remoteip=any localip=any 1> NUL 2> NUL
netsh advfirewall firewall add rule name="@Git cmd\git-gui" dir=in action=allow program="%apps%\Git\cmd\git-gui.exe"    enable=yes remoteip=any localip=any 1> NUL 2> NUL
@REM 
netsh advfirewall firewall add rule name="@Git bin\bash"    dir=out action=allow program="%apps%\Git\bin\bash.exe"       enable=yes remoteip=any localip=any 1> NUL 2> NUL
netsh advfirewall firewall add rule name="@Git bin\git"     dir=out action=allow program="%apps%\Git\bin\git.exe"        enable=yes remoteip=any localip=any 1> NUL 2> NUL
netsh advfirewall firewall add rule name="@Git bin\sh"      dir=out action=allow program="%apps%\Git\bin\sh.exe"         enable=yes remoteip=any localip=any 1> NUL 2> NUL
netsh advfirewall firewall add rule name="@Git cmd\git.exe" dir=out action=allow program="%apps%\Git\cmd\git.exe"        enable=yes remoteip=any localip=any 1> NUL 2> NUL
netsh advfirewall firewall add rule name="@Git cmd\git-gui" dir=out action=allow program="%apps%\Git\cmd\git-gui.exe"    enable=yes remoteip=any localip=any 1> NUL 2> NUL

echo Adicionando regras no firewall para o Oracle JDK & echo Aguarde ...
netsh advfirewall firewall add rule name="@Oracle JDK java"     dir=in action=allow program="C:\Program Files\Java\jdk-11\bin\java.exe"     enable=yes remoteip=any localip=any 1> NUL 2> NUL
netsh advfirewall firewall add rule name="@Oracle JDK javac"    dir=in action=allow program="C:\Program Files\Java\jdk-11\bin\javac.exe"    enable=yes remoteip=any localip=any 1> NUL 2> NUL
netsh advfirewall firewall add rule name="@Oracle JDK javaw"    dir=in action=allow program="C:\Program Files\Java\jdk-11\bin\javaw.exe"    enable=yes remoteip=any localip=any 1> NUL 2> NUL
netsh advfirewall firewall add rule name="@Oracle JDK jshell"   dir=in action=allow program="C:\Program Files\Java\jdk-11\bin\jshell.exe"   enable=yes remoteip=any localip=any 1> NUL 2> NUL
@REM 
netsh advfirewall firewall add rule name="@Oracle JDK java"     dir=out action=allow program="C:\Program Files\Java\jdk-11\bin\java.exe"     enable=yes remoteip=any localip=any 1> NUL 2> NUL
netsh advfirewall firewall add rule name="@Oracle JDK javac"    dir=out action=allow program="C:\Program Files\Java\jdk-11\bin\javac.exe"    enable=yes remoteip=any localip=any 1> NUL 2> NUL
netsh advfirewall firewall add rule name="@Oracle JDK javaw"    dir=out action=allow program="C:\Program Files\Java\jdk-11\bin\javaw.exe"    enable=yes remoteip=any localip=any 1> NUL 2> NUL
netsh advfirewall firewall add rule name="@Oracle JDK jshell"   dir=out action=allow program="C:\Program Files\Java\jdk-11\bin\jshell.exe"   enable=yes remoteip=any localip=any 1> NUL 2> NUL

echo Adicionando regras no firewall para o Apache Maven & echo Aguarde ...
netsh advfirewall firewall add rule name="@Apache Maven"    dir=in action=allow program="%apps%\Apache\Maven\apache-maven-3.9.0\bin\mvn.cmd"    enable=yes remoteip=any localip=any 1> NUL 2> NUL
@REM 
netsh advfirewall firewall add rule name="@Apache Maven"    dir=out action=allow program="%apps%\Apache\Maven\apache-maven-3.9.0\bin\mvn.cmd"    enable=yes remoteip=any localip=any 1> NUL 2> NUL

echo Adicionando regras no firewall para o Gradle & echo Aguarde ...
netsh advfirewall firewall add rule name="@Gradle"  dir=in action=allow program="%apps%\Gradle\gradle-8.0.2\bin\gradle.bat" enable=yes remoteip=any localip=any 1> NUL 2> NUL
@REM 
netsh advfirewall firewall add rule name="@Gradle"  dir=out action=allow program="%apps%\Gradle\gradle-8.0.2\bin\gradle.bat" enable=yes remoteip=any localip=any 1> NUL 2> NUL

echo Adicionando regras no firewall para o Python & echo Aguarde ...
netsh advfirewall firewall add rule name="@Python"      dir=in action=allow program="%apps%\Python\311\python.exe"  enable=yes remoteip=any localip=any 1> NUL 2> NUL
netsh advfirewall firewall add rule name="@Python IDLE" dir=in action=allow program="%apps%\Python\311\pythonw.exe" enable=yes remoteip=any localip=any 1> NUL 2> NUL
@REM 
netsh advfirewall firewall add rule name="@Python"      dir=out action=allow program="%apps%\Python\311\python.exe"  enable=yes remoteip=any localip=any 1> NUL 2> NUL
netsh advfirewall firewall add rule name="@Python IDLE" dir=out action=allow program="%apps%\Python\311\pythonw.exe" enable=yes remoteip=any localip=any 1> NUL 2> NUL

echo Adicionando regras no firewall para o NVM e NodeJS & echo Aguarde ...
netsh advfirewall firewall add rule name="@Node Version Manager"    dir=in action=allow program="%apps%\nvm\nvm.exe"                enable=yes remoteip=any localip=any 1> NUL 2> NUL
netsh advfirewall firewall add rule name="@NodeJS"                  dir=in action=allow program="C:\Program Files\nodejs\node.exe"  enable=yes remoteip=any localip=any 1> NUL 2> NUL
netsh advfirewall firewall add rule name="@NodeJS npm"              dir=in action=allow program="C:\Program Files\nodejs\npm.cmd"   enable=yes remoteip=any localip=any 1> NUL 2> NUL
netsh advfirewall firewall add rule name="@NodeJS npx"              dir=in action=allow program="C:\Program Files\nodejs\npmx.cmd"  enable=yes remoteip=any localip=any 1> NUL 2> NUL
@REM 
netsh advfirewall firewall add rule name="@Node Version Manager"    dir=out action=allow program="%apps%\nvm\nvm.exe"                enable=yes remoteip=any localip=any 1> NUL 2> NUL
netsh advfirewall firewall add rule name="@NodeJS"                  dir=out action=allow program="C:\Program Files\nodejs\node.exe"  enable=yes remoteip=any localip=any 1> NUL 2> NUL
netsh advfirewall firewall add rule name="@NodeJS npm"              dir=out action=allow program="C:\Program Files\nodejs\npm.cmd"   enable=yes remoteip=any localip=any 1> NUL 2> NUL
netsh advfirewall firewall add rule name="@NodeJS npx"              dir=out action=allow program="C:\Program Files\nodejs\npmx.cmd"  enable=yes remoteip=any localip=any 1> NUL 2> NUL

echo Adicionando regras no firewall para o Android Studio e Android SDK & echo Aguarde ...
netsh advfirewall firewall add rule name="@Android Studio"  dir=in action=allow program="%apps%\Android\android-studio\bin\studio64.exe"    enable=yes remoteip=any localip=any 1> NUL 2> NUL
netsh advfirewall firewall add rule name="@Android SDK adb" dir=in action=allow program="%apps%\Android\android-sdk\platform-tools\adb.exe" enable=yes remoteip=any localip=any 1> NUL 2> NUL
@REM 
echo Adicionando regras no firewall para o Android Studio e Android SDK & echo Aguarde ...
netsh advfirewall firewall add rule name="@Android Studio"  dir=out action=allow program="%apps%\Android\android-studio\bin\studio64.exe"    enable=yes remoteip=any localip=any 1> NUL 2> NUL
netsh advfirewall firewall add rule name="@Android SDK adb" dir=out action=allow program="%apps%\Android\android-sdk\platform-tools\adb.exe" enable=yes remoteip=any localip=any 1> NUL 2> NUL

echo Adicionando regras no firewall para o Microsoft VS Code & echo Aguarde ...
netsh advfirewall firewall add rule name="@Microsoft VS Code"   dir=in action=allow program="%apps%\Microsoft\Microsoft VS Code\Code.exe"   enable=yes remoteip=any localip=any 1> NUL 2> NUL
@REM 
echo Adicionando regras no firewall para o Microsoft VS Code & echo Aguarde ...
netsh advfirewall firewall add rule name="@Microsoft VS Code"   dir=out action=allow program="%apps%\Microsoft\Microsoft VS Code\Code.exe"   enable=yes remoteip=any localip=any 1> NUL 2> NUL

echo Adicionando regras no firewall para o Evolus Pencil & echo Aguarde ...
netsh advfirewall firewall add rule name="@Evolus Pencil"   dir=in action=allow program="%apps%\Pencil\Pencil.exe"   enable=yes remoteip=any localip=any 1> NUL 2> NUL
@REM 
echo Adicionando regras no firewall para o Evolus Pencil & echo Aguarde ...
netsh advfirewall firewall add rule name="@Evolus Pencil"   dir=out action=allow program="%apps%\Pencil\Pencil.exe"   enable=yes remoteip=any localip=any 1> NUL 2> NUL

powershell "[console]::beep(264,300);[console]::beep(297,300);[console]::beep(330,300)"





@REM ###############################################################################
@REM ###############################################################################
@REM ###############################################################################
@REM ###############################################################################
@REM ###############################################################################
echo Copiando atalhos do Ambiente de Desenvolvimento & echo Aguarde ...

start "Copiar atalhos" /min /wait cmd /c rd /S /Q "C:\ProgramData\Microsoft\Windows\Menu Iniciar\Programas\Ambiente de Desenvolvimento"   1> NUL 2> NUL
start "Copiar atalhos" /min /wait cmd /c rd /S /Q "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Ambiente de Desenvolvimento"     1> NUL 2> NUL
start "Copiar atalhos" /min /wait cmd /c xcopy /S /E /C /I /Q /G /H /R /Y /Z "%pexec%\Ambiente de Desenvolvimento" "C:\ProgramData\Microsoft\Windows\Menu Iniciar\Programas\Ambiente de Desenvolvimento"  1> NUL 2> NUL
start "Copiar atalhos" /min /wait cmd /c xcopy /S /E /C /I /Q /G /H /R /Y /Z "%pexec%\Ambiente de Desenvolvimento" "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Ambiente de Desenvolvimento"    1> NUL 2> NUL
@REM 
start "Copiar atalhos" /min /wait cmd /c rd /S /Q "C:\Users\Public\Desktop\Ambiente de Desenvolvimento"  1> NUL 2> NUL
start "Copiar atalhos" /min /wait cmd /c xcopy /S /E /C /I /Q /G /H /R /Y /Z "%pexec%\Ambiente de Desenvolvimento" "C:\Users\Public\Desktop\Ambiente de Desenvolvimento" 1> NUL 2> NUL
powershell "[console]::beep(264,300);[console]::beep(297,300);[console]::beep(330,300)"





@REM ###############################################################################
@REM ###############################################################################
@REM ###############################################################################
@REM ###############################################################################
@REM ###############################################################################
echo Limpando diretorio de instaladores & echo Aguarde ...
start "Limpar diretorio de instaladores" /min /wait cmd /c rd /S /Q %inst% 1> NUL 2> NUL
powershell "[console]::beep(264,300);[console]::beep(297,300);[console]::beep(330,300)"





@REM ###############################################################################
@REM ###############################################################################
@REM ###############################################################################
@REM ###############################################################################
@REM ###############################################################################
echo Definindo permissoes para o diretorio C:\Work & echo Aguarde ...
@REM taskkill /IM explorer.exe /F
start "Definir permissoes" /min /wait cmd /c takeown /F %work% /A /R /D Y 
start "Definir permissoes" /min /wait cmd /c icacls %wspc% /grant administrators:(OI)(CI)(F,M,RX,D)   /inheritance:E /T /C /Q 
start "Definir permissoes" /min /wait cmd /c icacls %work% /grant administrators:(OI)(CI)(F,M,RX,D)   /inheritance:E /T /C /Q 
start "Definir permissoes" /min /wait cmd /c icacls %work% /grant administradores:(OI)(CI)(F,M,RX,D)  /inheritance:E /T /C /Q 
start "Definir permissoes" /min /wait cmd /c icacls %work% /grant everyone:(OI)(CI)(F,M,RX,D)         /inheritance:E /T /C /Q 
start "Definir permissoes" /min /wait cmd /c icacls %work% /grant todos:(OI)(CI)(F,M,RX,D)            /inheritance:E /T /C /Q 
start "Definir permissoes" /min /wait cmd /c icacls %work% /grant users:(OI)(CI)(F,M,RX,D)            /inheritance:E /T /C /Q 
start "Definir permissoes" /min /wait cmd /c icacls %work% /grant usuários:(OI)(CI)(F,M,RX,D)         /inheritance:E /T /C /Q 
@REM start explorer.exe 
powershell "[console]::beep(264,300);[console]::beep(297,300);[console]::beep(330,300)"
@REM 
echo Definindo permissoes para o diretorio C:\Program Files\nodejs & echo Aguarde ...
@REM taskkill /IM explorer.exe /F
start "Definir permissoes" /min /wait cmd /c takeown /F "C:\Program Files\nodejs" /A /R /D Y
start "Definir permissoes" /min /wait cmd /c icacls "C:\Program Files\nodejs" /grant administrators:(OI)(CI)(F,M,RX,D)   /inheritance:E /T /C /Q 
start "Definir permissoes" /min /wait cmd /c icacls "C:\Program Files\nodejs" /grant administradores:(OI)(CI)(F,M,RX,D)  /inheritance:E /T /C /Q 
start "Definir permissoes" /min /wait cmd /c icacls "C:\Program Files\nodejs" /grant everyone:(OI)(CI)(F,M,RX,D)         /inheritance:E /T /C /Q 
start "Definir permissoes" /min /wait cmd /c icacls "C:\Program Files\nodejs" /grant todos:(OI)(CI)(F,M,RX,D)            /inheritance:E /T /C /Q 
start "Definir permissoes" /min /wait cmd /c icacls "C:\Program Files\nodejs" /grant users:(OI)(CI)(F,M,RX,D)            /inheritance:E /T /C /Q 
start "Definir permissoes" /min /wait cmd /c icacls "C:\Program Files\nodejs" /grant usuários:(OI)(CI)(F,M,RX,D)         /inheritance:E /T /C /Q 
@REM start explorer.exe 1> NUL 2> NUL
powershell "[console]::beep(264,300);[console]::beep(297,300);[console]::beep(330,300)"
@REM 
echo Definindo permissoes para o diretorio C:\Users\Public\Desktop & echo Aguarde ...
@REM taskkill /IM explorer.exe /F 1> NUL 2> NUL
start "Definir permissoes" /min /wait cmd /c takeown /F "C:\Users\Public\Desktop" /A /R /D Y
start "Definir permissoes" /min /wait cmd /c icacls "C:\Users\Public\Desktop" /grant administrators:(OI)(CI)(F,M,RX,D)   /inheritance:E /T /C /Q 
start "Definir permissoes" /min /wait cmd /c icacls "C:\Users\Public\Desktop" /grant administradores:(OI)(CI)(F,M,RX,D)  /inheritance:E /T /C /Q 
start "Definir permissoes" /min /wait cmd /c icacls "C:\Users\Public\Desktop" /grant everyone:(OI)(CI)(RX)               /inheritance:E /T /C /Q 
start "Definir permissoes" /min /wait cmd /c icacls "C:\Users\Public\Desktop" /grant todos:(OI)(CI)(RX)                  /inheritance:E /T /C /Q 
start "Definir permissoes" /min /wait cmd /c icacls "C:\Users\Public\Desktop" /grant users:(OI)(CI)(RX)                  /inheritance:E /T /C /Q 
start "Definir permissoes" /min /wait cmd /c icacls "C:\Users\Public\Desktop" /grant usuários:(OI)(CI)(RX)               /inheritance:E /T /C /Q 
@REM start explorer.exe 1> NUL 2> NUL
powershell "[console]::beep(264,300);[console]::beep(297,300);[console]::beep(330,300)"
@REM 
echo Definindo permissoes para o diretorio Menu Iniciar\Programas\Ambiente de Desenvolvimento & echo Aguarde ...
@REM taskkill /IM explorer.exe /F 1> NUL 2> NUL
start "Definir permissoes" /min /wait cmd /c takeown /F "C:\ProgramData\Microsoft\Windows\Menu Iniciar\Programas\Ambiente de Desenvolvimento" /A /R /D Y
start "Definir permissoes" /min /wait cmd /c icacls "C:\ProgramData\Microsoft\Windows\Menu Iniciar\Programas\Ambiente de Desenvolvimento" /grant administrators:(OI)(CI)(F,M,RX,D)   /inheritance:E /T /C /Q 
start "Definir permissoes" /min /wait cmd /c icacls "C:\ProgramData\Microsoft\Windows\Menu Iniciar\Programas\Ambiente de Desenvolvimento" /grant administradores:(OI)(CI)(F,M,RX,D)  /inheritance:E /T /C /Q 
start "Definir permissoes" /min /wait cmd /c icacls "C:\ProgramData\Microsoft\Windows\Menu Iniciar\Programas\Ambiente de Desenvolvimento" /grant everyone:(OI)(CI)(RX)               /inheritance:E /T /C /Q 
start "Definir permissoes" /min /wait cmd /c icacls "C:\ProgramData\Microsoft\Windows\Menu Iniciar\Programas\Ambiente de Desenvolvimento" /grant todos:(OI)(CI)(RX)                  /inheritance:E /T /C /Q 
start "Definir permissoes" /min /wait cmd /c icacls "C:\ProgramData\Microsoft\Windows\Menu Iniciar\Programas\Ambiente de Desenvolvimento" /grant users:(OI)(CI)(RX)                  /inheritance:E /T /C /Q 
start "Definir permissoes" /min /wait cmd /c icacls "C:\ProgramData\Microsoft\Windows\Menu Iniciar\Programas\Ambiente de Desenvolvimento" /grant usuários:(OI)(CI)(RX)               /inheritance:E /T /C /Q 
@REM start explorer.exe 1> NUL 2> NUL
powershell "[console]::beep(264,300);[console]::beep(297,300);[console]::beep(330,300)"
@REM 
echo Definindo permissoes para o diretorio Start Menu\Programs\Ambiente de Desenvolvimento & echo Aguarde ...
@REM taskkill /IM explorer.exe /F 1> NUL 2> NUL
start "Definir permissoes" /min /wait cmd /c takeown /F "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Ambiente de Desenvolvimento" /A /R /D Y
start "Definir permissoes" /min /wait cmd /c icacls "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Ambiente de Desenvolvimento" /grant administrators:(OI)(CI)(F,M,RX,D)   /inheritance:E /T /C /Q 
start "Definir permissoes" /min /wait cmd /c icacls "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Ambiente de Desenvolvimento" /grant administradores:(OI)(CI)(F,M,RX,D)  /inheritance:E /T /C /Q 
start "Definir permissoes" /min /wait cmd /c icacls "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Ambiente de Desenvolvimento" /grant everyone:(OI)(CI)(RX)               /inheritance:E /T /C /Q 
start "Definir permissoes" /min /wait cmd /c icacls "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Ambiente de Desenvolvimento" /grant todos:(OI)(CI)(RX)                  /inheritance:E /T /C /Q 
start "Definir permissoes" /min /wait cmd /c icacls "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Ambiente de Desenvolvimento" /grant users:(OI)(CI)(RX)                  /inheritance:E /T /C /Q 
start "Definir permissoes" /min /wait cmd /c icacls "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Ambiente de Desenvolvimento" /grant usuários:(OI)(CI)(RX)               /inheritance:E /T /C /Q 
@REM start explorer.exe 1> NUL 2> NUL
powershell "[console]::beep(264,300);[console]::beep(297,300);[console]::beep(330,300)"





@REM ###############################################################################
@REM ###############################################################################
@REM ###############################################################################
@REM ###############################################################################
@REM ###############################################################################
cls
echo ########################################
echo ########################################
echo #      Procedimentos finalizados.      #
echo ########################################
echo ########################################
powershell "[console]::beep(330,300);[console]::beep(330,300);[console]::beep(330,300)"
powershell "[console]::beep(330,300);[console]::beep(330,300);[console]::beep(330,300)"
powershell "[console]::beep(330,300);[console]::beep(330,300);[console]::beep(330,300)"
powershell "[console]::beep(330,300);[console]::beep(330,300);[console]::beep(330,300)"
powershell "[console]::beep(330,300);[console]::beep(330,300);[console]::beep(330,300)"
shutdown -r -t 00 -f -c "Instalação e configuração do ambiente de desenvolvimento" -d 4:2
