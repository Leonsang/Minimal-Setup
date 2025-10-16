@echo off
echo ====================================
echo   CREAR NUEVO PROYECTO
echo ====================================

set /p project_name="Nombre del proyecto: "
set /p project_type="Tipo (python/web/data): "

if "%project_name%"=="" (
    echo Error: Debes especificar un nombre de proyecto
    pause
    exit /b 1
)

echo.
echo Creando directorio del proyecto...
if not exist "%USERPROFILE%\dev" mkdir "%USERPROFILE%\dev"
mkdir "%USERPROFILE%\dev\%project_name%"
cd /d "%USERPROFILE%\dev\%project_name%"

if /i "%project_type%"=="python" goto create_python
if /i "%project_type%"=="web" goto create_web
if /i "%project_type%"=="data" goto create_data

:create_python
echo Creando proyecto Python...
uv init .
copy "%~dp0..\configs\pyproject.toml" .
copy "%~dp0..\configs\requirements-dev.txt" .
echo # %project_name% > README.md
echo __pycache__/ > .gitignore
echo *.pyc >> .gitignore
echo .env >> .gitignore
goto open_project

:create_web
echo Creando proyecto Web...
npm init -y
echo node_modules/ > .gitignore
echo .env.local >> .gitignore
echo dist/ >> .gitignore
echo # %project_name% > README.md
goto open_project

:create_data
echo Creando proyecto Data Science...
uv init .
copy "%~dp0..\configs\pyproject.toml" .
copy "%~dp0..\configs\requirements-dev.txt" .
mkdir notebooks data output
echo # %project_name% > README.md
echo __pycache__/ > .gitignore
echo *.pyc >> .gitignore
echo .env >> .gitignore
echo .ipynb_checkpoints/ >> .gitignore
echo data/*.csv >> .gitignore
goto open_project

:open_project
echo.
echo Inicializando Git...
git init
git add .
git commit -m "Initial commit"

echo.
echo ¿Abrir en VS Code? (y/n)
set /p open_vscode=""
if /i "%open_vscode%"=="y" code .

echo.
echo Proyecto %project_name% creado en %USERPROFILE%\dev\%project_name%