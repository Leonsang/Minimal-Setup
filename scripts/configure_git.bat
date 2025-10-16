@echo off
echo ====================================
echo   CONFIGURANDO GIT
echo ====================================

echo Verificando si Git ya esta instalado...
git --version >nul 2>&1
if %errorLevel% neq 0 (
    echo Instalando Git...
    choco install -y git
    call refreshenv
)

echo.
echo Configurando Git...
echo.

set /p git_name="Ingresa tu nombre completo: "
set /p git_email="Ingresa tu email: "

git config --global user.name "%git_name%"
git config --global user.email "%git_email%"

echo.
echo Configurando opciones adicionales de Git...
git config --global init.defaultBranch main
git config --global core.autocrlf true
git config --global pull.rebase false
git config --global core.editor "code --wait"

echo.
echo Configurando aliases utiles...
git config --global alias.st status
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.unstage "reset HEAD --"
git config --global alias.last "log -1 HEAD"
git config --global alias.visual "!gitk"

echo.
echo ¿Quieres configurar SSH para GitHub? (y/n)
set /p setup_ssh=""

if /i "%setup_ssh%"=="y" (
    echo.
    echo Generando clave SSH...
    ssh-keygen -t ed25519 -C "%git_email%" -f "%USERPROFILE%\.ssh\id_ed25519"

    echo.
    echo Agregando clave al ssh-agent...
    if not exist "%USERPROFILE%\.ssh" mkdir "%USERPROFILE%\.ssh"
    start-ssh-agent
    ssh-add "%USERPROFILE%\.ssh\id_ed25519"

    echo.
    echo Tu clave publica SSH:
    type "%USERPROFILE%\.ssh\id_ed25519.pub"
    echo.
    echo Copia esta clave y agregala a tu cuenta de GitHub en:
    echo https://github.com/settings/keys
    echo.
    pause
)

echo.
echo Git configurado correctamente
git config --global --list