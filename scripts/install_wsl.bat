@echo off
echo ====================================
echo   INSTALANDO WSL (Windows Subsystem for Linux)
echo ====================================

echo Verificando si WSL ya esta habilitado...
wsl --status >nul 2>&1
if %errorLevel% equ 0 (
    echo WSL ya esta instalado
    wsl --list --verbose
    goto end
)

echo Habilitando caracteristicas de Windows necesarias...
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart

echo.
echo Instalando WSL...
wsl --install

if %errorLevel% neq 0 (
    echo Error instalando WSL. Intentando metodo alternativo...
    powershell -Command "Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux"
)

echo.
echo Configurando WSL 2 como version por defecto...
wsl --set-default-version 2

echo.
echo Instalando Ubuntu (distribucion por defecto)...
wsl --install -d Ubuntu

:end
echo.
echo WSL configurado correctamente
echo IMPORTANTE: Reinicia tu computadora para completar la instalacion
echo Despues del reinicio, ejecuta 'wsl' para configurar tu usuario de Linux