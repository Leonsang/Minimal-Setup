@echo off
echo ====================================
echo   INSTALANDO VS CODE Y EXTENSIONES
echo ====================================

echo Verificando si VS Code ya esta instalado...
code --version >nul 2>&1
if %errorLevel% equ 0 (
    echo VS Code ya esta instalado
    goto install_extensions
)

echo Instalando VS Code con winget...
winget install Microsoft.VisualStudioCode --silent --accept-package-agreements --accept-source-agreements

if %errorLevel% equ 0 (
    echo VS Code instalado correctamente via winget
    goto refresh_path
)

echo.
echo Winget no disponible. Usando Chocolatey...
choco install -y vscode

if %errorLevel% neq 0 (
    echo Error instalando VS Code
    exit /b 1
)

:refresh_path

REM Actualizar PATH
call refreshenv

:install_extensions
echo.
echo Instalando extensiones esenciales...

REM Python
code --install-extension ms-python.python
code --install-extension ms-python.black-formatter
code --install-extension charliermarsh.ruff

REM Docker
code --install-extension ms-azuretools.vscode-docker

REM Git
code --install-extension eamodio.gitlens

REM Remote Development
code --install-extension ms-vscode-remote.remote-containers
code --install-extension ms-vscode-remote.remote-ssh
code --install-extension github.codespaces

REM General
code --install-extension ms-vscode.powershell
code --install-extension ms-vscode.hexeditor
code --install-extension ms-vscode.vscode-json

REM Data Science
code --install-extension ms-toolsai.jupyter
code --install-extension ms-toolsai.vscode-jupyter-cell-tags

REM Web Development
code --install-extension bradlc.vscode-tailwindcss
code --install-extension esbenp.prettier-vscode
code --install-extension dbaeumer.vscode-eslint

REM Productivity
code --install-extension vscodevim.vim
code --install-extension ms-vscode.theme-monokai-dimmed
code --install-extension pkief.material-icon-theme
code --install-extension streetsidesoftware.code-spell-checker

echo.
echo Configurando settings.json de VS Code...
if not exist "%APPDATA%\Code\User" mkdir "%APPDATA%\Code\User"

echo { > "%APPDATA%\Code\User\settings.json"
echo   "editor.formatOnSave": true, >> "%APPDATA%\Code\User\settings.json"
echo   "editor.codeActionsOnSave": { >> "%APPDATA%\Code\User\settings.json"
echo     "source.organizeImports": true >> "%APPDATA%\Code\User\settings.json"
echo   }, >> "%APPDATA%\Code\User\settings.json"
echo   "python.defaultInterpreterPath": "uv", >> "%APPDATA%\Code\User\settings.json"
echo   "python.formatting.provider": "black", >> "%APPDATA%\Code\User\settings.json"
echo   "workbench.iconTheme": "material-icon-theme", >> "%APPDATA%\Code\User\settings.json"
echo   "editor.minimap.enabled": false >> "%APPDATA%\Code\User\settings.json"
echo } >> "%APPDATA%\Code\User\settings.json"

echo.
echo VS Code y extensiones instalados correctamente