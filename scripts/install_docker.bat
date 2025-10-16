@echo off
echo ====================================
echo   INSTALANDO DOCKER DESKTOP
echo ====================================

echo Verificando si Docker ya esta instalado...
docker --version >nul 2>&1
if %errorLevel% equ 0 (
    echo Docker ya esta instalado
    docker --version
    goto end
)

echo Descargando Docker Desktop...
curl -L "https://desktop.docker.com/win/main/amd64/Docker%20Desktop%20Installer.exe" -o "%TEMP%\DockerDesktopInstaller.exe"

if %errorLevel% neq 0 (
    echo Error descargando Docker Desktop
    exit /b 1
)

echo Instalando Docker Desktop...
echo NOTA: Se abrira el instalador. Sigue las instrucciones y reinicia cuando se complete.

start /wait "%TEMP%\DockerDesktopInstaller.exe" install --quiet

if %errorLevel% neq 0 (
    echo Error instalando Docker Desktop
    exit /b 1
)

echo.
echo Docker Desktop instalado
echo IMPORTANTE: Reinicia tu computadora y luego inicia Docker Desktop

:end
echo Docker configurado correctamente