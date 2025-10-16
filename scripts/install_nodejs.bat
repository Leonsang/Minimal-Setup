@echo off
echo ====================================
echo   INSTALANDO NODE.JS Y HERRAMIENTAS
echo ====================================

echo Instalando Node.js LTS...
choco install -y nodejs-lts

if %errorLevel% neq 0 (
    echo Error instalando Node.js
    exit /b 1
)

call refreshenv

echo.
echo Verificando instalacion...
node --version
npm --version

echo.
echo Instalando herramientas globales de desarrollo...
npm install -g yarn
npm install -g pnpm
npm install -g typescript
npm install -g ts-node
npm install -g nodemon
npm install -g @vue/cli
npm install -g @angular/cli
npm install -g create-react-app
npm install -g vite
npm install -g eslint
npm install -g prettier

echo.
echo Node.js y herramientas instaladas correctamente