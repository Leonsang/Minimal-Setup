@echo off
echo ====================================
echo   INSTALANDO HERRAMIENTAS DATA ENGINEERING
echo ====================================

echo Instalando herramientas de bases de datos...
choco install -y dbeaver
choco install -y postgresql
choco install -y sqlite

echo.
echo Instalando herramientas Python para Data Science...
uv tool install jupyter
uv tool install ipython
uv tool install streamlit
uv tool install great-expectations
uv tool install prefect
uv tool install dbt-core
uv tool install dagster

echo.
echo Instalando Apache Spark (via Chocolatey)...
choco install -y openjdk11
choco install -y apache-spark

echo.
echo Instalando Azure CLI y AWS CLI...
choco install -y azure-cli
choco install -y awscli

echo.
echo Herramientas de Data Engineering instaladas correctamente