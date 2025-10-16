@echo off
echo ====================================
echo   INSTALANDO PYTHON Y UV
echo ====================================

echo Instalando uv (Python package manager)...
powershell -Command "& {irm https://astral.sh/uv/install.ps1 | iex}"

if %errorLevel% neq 0 (
    echo Error instalando uv
    exit /b 1
)

echo.
echo Instalando Python via uv...
uv python install 3.12

if %errorLevel% neq 0 (
    echo Error instalando Python
    exit /b 1
)

echo.
echo Configurando Python global...
uv python pin 3.12

echo.
echo Instalando herramientas Python esenciales...
uv tool install black
uv tool install ruff
uv tool install mypy
uv tool install pytest
uv tool install jupyter
uv tool install ipython
uv tool install poetry
uv tool install pipx

echo.
echo Python y uv instalados correctamente
echo Para verificar: uv --version && uv python --version