# 🚀 Configuración Rápida de Desarrollo

Este repositorio contiene scripts automatizados para configurar rápidamente un entorno de desarrollo en Windows, optimizado para múltiples tipos de proyectos.

## 📦 Instalación Rápida

1. **Clona este repositorio:**
   ```bash
   git clone https://github.com/Leonsang/Minimal-Setup.git
   cd Minimal-Setup
   ```

2. **Ejecuta el script principal:**
   ```bash
   setup.bat
   ```

3. **Selecciona tu configuración** según el tipo de desarrollo que realizas.

## 🛠️ Tipos de Configuración Disponibles

### 1. **Configuración Completa**
- Python con uv
- Docker Desktop
- Git configurado
- VS Code con extensiones
- Herramientas base

### 2. **Solo Python**
- uv (package manager moderno)
- Python 3.12
- Herramientas esenciales: black, ruff, mypy, pytest, jupyter

### 3. **Solo Docker**
- Docker Desktop
- Configuración básica

### 4. **Herramientas de Desarrollo**
- VS Code + extensiones
- Git configurado
- Herramientas base

### 5. **Data Engineering**
- Todo lo anterior +
- PostgreSQL, SQLite, DBeaver
- Pandas, Polars, DuckDB
- Apache Spark
- Azure CLI, AWS CLI

### 6. **Web Development**
- Node.js LTS
- Yarn, pnpm, TypeScript
- React, Vue, Angular CLIs
- ESLint, Prettier

## 📁 Estructura del Proyecto

```
Minimal-Setup/
├── setup.bat                    # Script principal
├── scripts/                     # Scripts de instalación individuales
│   ├── install_base.bat
│   ├── install_python_uv.bat
│   ├── install_docker.bat
│   ├── install_vscode.bat
│   ├── configure_git.bat
│   ├── install_data_tools.bat
│   └── install_nodejs.bat
├── workspaces/                  # Configuraciones de VS Code
│   ├── python-data-science.json
│   ├── web-development.json
│   └── docker-development.json
├── .devcontainer/              # Para GitHub Codespaces
│   └── devcontainer.json
└── configs/                    # Archivos de configuración adicionales
```

## 🎯 Uso con GitHub Codespaces

Este repositorio incluye configuración para **GitHub Codespaces**:

1. Abre el repositorio en GitHub
2. Haz clic en "Code" → "Codespaces" → "Create codespace"
3. El entorno se configurará automáticamente con Python, Docker y todas las herramientas

## 🔧 Configuraciones de Workspace

### Para proyectos de Data Science:
```bash
code --add workspaces/python-data-science.json
```

### Para proyectos Web:
```bash
code --add workspaces/web-development.json
```

### Para proyectos con Docker:
```bash
code --add workspaces/docker-development.json
```

## 📋 Herramientas Incluidas

### Python Ecosystem
- **uv**: Package manager moderno y rápido
- **Black**: Formateador de código
- **Ruff**: Linter súper rápido
- **MyPy**: Type checker
- **Pytest**: Framework de testing
- **Jupyter**: Notebooks interactivos

### Development Tools
- **Git**: Control de versiones
- **VS Code**: Editor con extensiones optimizadas
- **Docker**: Containerización
- **Chocolatey**: Package manager para Windows

### Data Engineering (opcional)
- **PostgreSQL**: Base de datos relacional
- **DBeaver**: Cliente universal de DB
- **Apache Spark**: Big data processing
- **Cloud CLIs**: Azure y AWS

## 🚨 Requisitos

- **Windows 10/11**
- **PowerShell** (incluido en Windows)
- **Conexión a Internet**
- **Permisos de Administrador** (recomendado)

## 🔄 Actualización

Para actualizar las herramientas:

```bash
git pull origin main
setup.bat
```

## 🤝 Contribuir

1. Fork del repositorio
2. Crea tu branch: `git checkout -b feature/nueva-herramienta`
3. Commit: `git commit -m 'Agregar nueva herramienta'`
4. Push: `git push origin feature/nueva-herramienta`
5. Crea un Pull Request

## 📄 Licencia

MIT License - usa libremente para tus proyectos.

---

⭐ **¡Dale una estrella si te ayudó!** ⭐