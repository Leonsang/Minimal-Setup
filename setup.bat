@echo off
echo ====================================
echo   CONFIGURACION RAPIDA DE DESARROLLO
echo ====================================
echo.

REM Verificar permisos de administrador
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo ADVERTENCIA: Se recomienda ejecutar como administrador para algunas instalaciones
    echo Presiona cualquier tecla para continuar sin permisos de admin...
    pause >nul
)

echo Selecciona el tipo de configuracion:
echo.
echo 1. Configuracion completa (Python + Docker + Git + VS Code)
echo 2. Solo Python con uv
echo 3. Solo Docker
echo 4. Solo herramientas de desarrollo
echo 5. Data Engineering completo
echo 6. Web Development
echo 7. Configuracion con WSL (Linux en Windows)
echo 8. Solo Terminal mejorado
echo.
set /p choice="Ingresa tu opcion (1-8): "

if "%choice%"=="1" goto full_setup
if "%choice%"=="2" goto python_only
if "%choice%"=="3" goto docker_only
if "%choice%"=="4" goto dev_tools
if "%choice%"=="5" goto data_eng
if "%choice%"=="6" goto web_dev
if "%choice%"=="7" goto wsl_setup
if "%choice%"=="8" goto terminal_only

echo Opcion invalida
pause
exit /b 1

:full_setup
echo Iniciando configuracion completa...
call "%~dp0scripts\install_base.bat"
call "%~dp0scripts\install_python_uv.bat"
call "%~dp0scripts\install_docker.bat"
call "%~dp0scripts\install_vscode.bat"
call "%~dp0scripts\configure_git.bat"
goto end

:python_only
echo Instalando solo Python con uv...
call "%~dp0scripts\install_python_uv.bat"
goto end

:docker_only
echo Instalando solo Docker...
call "%~dp0scripts\install_docker.bat"
goto end

:dev_tools
echo Instalando herramientas de desarrollo...
call "%~dp0scripts\install_base.bat"
call "%~dp0scripts\install_vscode.bat"
call "%~dp0scripts\configure_git.bat"
goto end

:data_eng
echo Configuracion para Data Engineering...
call "%~dp0scripts\install_base.bat"
call "%~dp0scripts\install_python_uv.bat"
call "%~dp0scripts\install_docker.bat"
call "%~dp0scripts\install_data_tools.bat"
call "%~dp0scripts\install_vscode.bat"
call "%~dp0scripts\configure_git.bat"
goto end

:web_dev
echo Configuracion para Web Development...
call "%~dp0scripts\install_base.bat"
call "%~dp0scripts\install_nodejs.bat"
call "%~dp0scripts\install_docker.bat"
call "%~dp0scripts\install_vscode.bat"
call "%~dp0scripts\configure_git.bat"
goto end

:wsl_setup
echo Configuracion con WSL (Linux en Windows)...
call "%~dp0scripts\install_base.bat"
call "%~dp0scripts\install_wsl.bat"
call "%~dp0scripts\install_terminal.bat"
call "%~dp0scripts\install_vscode.bat"
call "%~dp0scripts\configure_git.bat"
goto end

:terminal_only
echo Instalando solo Terminal mejorado...
call "%~dp0scripts\install_terminal.bat"
goto end

:end
echo.
echo ====================================
echo   CONFIGURACION COMPLETADA
echo ====================================
echo.
echo Reinicia tu terminal para aplicar todos los cambios
echo.
pause