@echo off & cls

@REM ##################################################
@REM # Script para inicialização do Android Studio
@REM # Desenvolvido por: João Ferreira <joaoferreirape@gmail.com>
@REM ##################################################



echo Instalando extensoes do VSCode & echo Aguarde ...
cd "C:\"
start "Abrir VS Code" /min /wait cmd /c taskkill /IM Code.exe /F    1> NUL 2> NUL
start "Abrir VS Code" /min /wait cmd /c "code --force --install-extension Angular.ng-template"
start "Abrir VS Code" /min /wait cmd /c "code --force --install-extension christian-kohler.path-intellisense"
start "Abrir VS Code" /min /wait cmd /c "code --force --install-extension Dart-Code.dart-code"
start "Abrir VS Code" /min /wait cmd /c "code --force --install-extension Dart-Code.flutter"
start "Abrir VS Code" /min /wait cmd /c "code --force --install-extension dbaeumer.vscode-eslint"
start "Abrir VS Code" /min /wait cmd /c "code --force --install-extension esbenp.prettier-vscode"
start "Abrir VS Code" /min /wait cmd /c "code --force --install-extension formulahendry.auto-close-tag"
start "Abrir VS Code" /min /wait cmd /c "code --force --install-extension formulahendry.auto-rename-tag"
start "Abrir VS Code" /min /wait cmd /c "code --force --install-extension Ionic.ionic"
start "Abrir VS Code" /min /wait cmd /c "code --force --install-extension ms-python.isort"
start "Abrir VS Code" /min /wait cmd /c "code --force --install-extension ms-python.pylint"
start "Abrir VS Code" /min /wait cmd /c "code --force --install-extension ms-python.python"
start "Abrir VS Code" /min /wait cmd /c "code --force --install-extension ms-python.vscode-pylance"
start "Abrir VS Code" /min /wait cmd /c "code --force --install-extension ms-vscode.js-debug-nightly"
start "Abrir VS Code" /min /wait cmd /c "code --force --install-extension ms-vscode.vscode-typescript-next"
start "Abrir VS Code" /min /wait cmd /c "code --force --install-extension msjsdiag.cordova-tools"
start "Abrir VS Code" /min /wait cmd /c "code --force --install-extension msjsdiag.vscode-react-native"
start "Abrir VS Code" /min /wait cmd /c "code --force --install-extension rangav.vscode-thunder-client"
start "Abrir VS Code" /min /wait cmd /c "code --force --install-extension redhat.java"
start "Abrir VS Code" /min /wait cmd /c "code --force --install-extension redhat.vscode-xml"
start "Abrir VS Code" /min /wait cmd /c "code --force --install-extension redhat.vscode-yaml"
start "Abrir VS Code" /min /wait cmd /c "code --force --install-extension richie5um2.vscode-sort-json"
start "Abrir VS Code" /min /wait cmd /c "code --force --install-extension ryanolsonx.solarized"
start "Abrir VS Code" /min /wait cmd /c "code --force --install-extension streetsidesoftware.code-spell-checker"
start "Abrir VS Code" /min /wait cmd /c "code --force --install-extension streetsidesoftware.code-spell-checker-portuguese-brazilian"
start "Abrir VS Code" /min /wait cmd /c "code --force --install-extension vscjava.vscode-gradle"
start "Abrir VS Code" /min /wait cmd /c "code --force --install-extension vscjava.vscode-java-debug"
start "Abrir VS Code" /min /wait cmd /c "code --force --install-extension vscjava.vscode-java-dependency"
start "Abrir VS Code" /min /wait cmd /c "code --force --install-extension vscjava.vscode-java-pack"
start "Abrir VS Code" /min /wait cmd /c "code --force --install-extension vscjava.vscode-java-test"
start "Abrir VS Code" /min /wait cmd /c "code --force --install-extension vscjava.vscode-maven"
start "Abrir VS Code" /min /wait cmd /c "code --force --install-extension vscode-icons-team.vscode-icons"
start "Abrir VS Code" /min /wait cmd /c "code --force --install-extension Vue.volar"
start "Abrir VS Code" /min /wait cmd /c taskkill /IM Code.exe /F    1> NUL 2> NUL
start C:\Work\Apps\Microsoft\VSCode\Code.exe

cls

exit 0
