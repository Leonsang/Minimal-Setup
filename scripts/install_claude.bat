@echo off
echo ====================================
echo   INSTALANDO CLAUDE Y CLAUDE CODE
echo ====================================

echo Verificando si Claude Desktop ya esta instalado...
where claude >nul 2>&1
if %errorLevel% equ 0 (
    echo Claude Desktop ya esta instalado
    goto install_claude_code
)

echo Instalando Claude Desktop con winget...
winget install Anthropic.Claude --silent --accept-package-agreements --accept-source-agreements

if %errorLevel% equ 0 (
    echo Claude Desktop instalado correctamente via winget
    goto install_claude_code
)

echo.
echo Winget no disponible o no encontro Claude. Descargando manualmente...
echo Descargando Claude Desktop...
curl -L "https://releases.anthropic.com/claude-desktop/latest/claude-desktop.exe" -o "%TEMP%\claude-desktop-installer.exe"

if %errorLevel% neq 0 (
    echo Error descargando Claude Desktop
    echo Puedes descargarlo manualmente desde: https://claude.ai/download
    goto install_claude_code
)

echo Instalando Claude Desktop...
start /wait "%TEMP%\claude-desktop-installer.exe" /S

if %errorLevel% neq 0 (
    echo Error instalando Claude Desktop
    echo Puedes descargarlo manualmente desde: https://claude.ai/download
)

:install_claude_code
echo.
echo Instalando Claude Code CLI...

REM Verificar si Claude Code ya esta instalado
claude-code --version >nul 2>&1
if %errorLevel% equ 0 (
    echo Claude Code ya esta instalado
    claude-code --version
    goto config_claude
)

echo Instalando Claude Code via npm...
npm install -g @anthropic-ai/claude-code

if %errorLevel% neq 0 (
    echo Error instalando Claude Code via npm
    echo Intentando con winget...
    winget install Anthropic.ClaudeCode --silent --accept-package-agreements --accept-source-agreements

    if %errorLevel% neq 0 (
        echo Error instalando Claude Code
        echo Puedes instalarlo manualmente desde: https://claude.ai/code
        goto end
    )
)

:config_claude
echo.
echo Configurando Claude Code...
echo Para configurar Claude Code, ejecuta:
echo   claude-code login
echo.
echo Para usar Claude Code en VS Code, instala la extension:
echo   - Busca "Claude Code" en VS Code extensions
echo   - O instala desde: https://marketplace.visualstudio.com/items?itemName=Anthropic.claude-code

:end
echo.
echo Claude Desktop y Claude Code instalados
echo.
echo Para empezar:
echo 1. Abre Claude Desktop desde el menu de inicio
echo 2. Ejecuta 'claude-code login' en terminal
echo 3. Instala la extension de VS Code si usas ese editor