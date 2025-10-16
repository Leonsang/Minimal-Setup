@echo off
echo ====================================
echo   INSTALANDO WINDOWS TERMINAL
echo ====================================

echo Instalando Windows Terminal...
choco install -y microsoft-windows-terminal

if %errorLevel% neq 0 (
    echo Intentando instalar via Microsoft Store...
    powershell -Command "Start-Process ms-windows-store://pdp/?productid=9N0DX20HK701"
    echo Por favor completa la instalacion desde Microsoft Store
    pause
)

echo.
echo Instalando PowerShell 7...
choco install -y powershell-core

echo.
echo Configurando perfil de PowerShell...
if not exist "%USERPROFILE%\Documents\PowerShell" mkdir "%USERPROFILE%\Documents\PowerShell"

echo # Perfil personalizado > "%USERPROFILE%\Documents\PowerShell\Microsoft.PowerShell_profile.ps1"
echo Set-PSReadLineOption -EditMode Emacs >> "%USERPROFILE%\Documents\PowerShell\Microsoft.PowerShell_profile.ps1"
echo Set-PSReadLineKeyHandler -Key Tab -Function Complete >> "%USERPROFILE%\Documents\PowerShell\Microsoft.PowerShell_profile.ps1"

echo.
echo Terminal mejorado instalado correctamente