@echo off
echo Instalando herramientas base...

REM Verificar si Chocolatey esta instalado
choco --version >nul 2>&1
if %errorLevel% neq 0 (
    echo Instalando Chocolatey...
    powershell -Command "Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))"

    if %errorLevel% neq 0 (
        echo Error instalando Chocolatey
        exit /b 1
    )

    REM Actualizar PATH
    call refreshenv
)

echo Instalando herramientas esenciales...
choco install -y curl wget 7zip notepadplusplus

echo Herramientas base instaladas correctamente