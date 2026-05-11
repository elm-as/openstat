# Build OpenStats Desktop — Windows MSI installer
#
# Prérequis :
#   - Python 3.11+ avec venv activé
#   - pip install -e ".[dev,packaging,charts-pg]"
#   - WiX Toolset 3.x (pour candle/light) OU Qt Installer Framework
#
# Usage :
#   .\packaging\windows\build_msi.ps1

$ErrorActionPreference = "Stop"

$ROOT = Split-Path -Parent (Split-Path -Parent $PSScriptRoot)
$DIST = Join-Path $ROOT "dist"
$BUILD = Join-Path $ROOT "build"

Write-Host "== Nettoyage ==" -ForegroundColor Cyan
Remove-Item -Recurse -Force $DIST -ErrorAction SilentlyContinue
Remove-Item -Recurse -Force $BUILD -ErrorAction SilentlyContinue

Write-Host "== Compilation PyInstaller ==" -ForegroundColor Cyan
pyinstaller `
    --noconfirm `
    --windowed `
    --name OpenStats `
    --add-data "$ROOT\plugins;plugins" `
    --collect-submodules openstats `
    --collect-data openstats `
    --hidden-import=PySide6.QtCharts `
    --hidden-import=statsmodels.tsa.statespace `
    --hidden-import=linearmodels.panel `
    --icon "$ROOT\resources\icon.ico" `
    "$ROOT\src\openstats\__main__.py"

if (-not (Test-Path "$DIST\OpenStats")) {
    Write-Error "Build PyInstaller échoué."
    exit 1
}

Write-Host "== Génération MSI (WiX) ==" -ForegroundColor Cyan
$WIX_SRC = Join-Path $PSScriptRoot "openstats.wxs"
$WIX_OBJ = Join-Path $BUILD "openstats.wixobj"
$MSI_OUT = Join-Path $DIST "OpenStats-Setup.msi"

if (-not (Test-Path $WIX_SRC)) {
    Write-Warning "openstats.wxs absent — voir packaging/windows/openstats.wxs.template"
    Write-Host "Build PyInstaller terminé : $DIST\OpenStats" -ForegroundColor Green
    exit 0
}

candle.exe -arch x64 -out $WIX_OBJ $WIX_SRC
light.exe -ext WixUIExtension -out $MSI_OUT $WIX_OBJ

Write-Host "✅ MSI généré : $MSI_OUT" -ForegroundColor Green
