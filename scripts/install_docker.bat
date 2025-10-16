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

echo Instalando Docker Desktop con winget...
winget install Docker.DockerDesktop --silent --accept-package-agreements --accept-source-agreements

if %errorLevel% equ 0 (
    echo Docker Desktop instalado correctamente via winget
    goto success
)

echo.
echo Winget no disponible o fallo. Usando metodo alternativo...
echo Descargando Docker Desktop...
curl -L "https://desktop.docker.com/win/main/amd64/Docker%20Desktop%20Installer.exe" -o "%TEMP%\DockerDesktopInstaller.exe"

if %errorLevel% neq 0 (
    echo Error descargando Docker Desktop
    exit /b 1
)

echo Instalando Docker Desktop...
start /wait "%TEMP%\DockerDesktopInstaller.exe" install --quiet

if %errorLevel% neq 0 (
    echo Error instalando Docker Desktop
    exit /b 1
)

:success
echo.
echo Docker Desktop instalado
echo IMPORTANTE: Reinicia tu computadora y luego inicia Docker Desktop

:end
echo Docker configurado correctamente