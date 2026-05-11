#!/usr/bin/env bash
# Build OpenStats Desktop — Linux AppImage
#
# Prérequis :
#   - python3 -m venv .venv && source .venv/bin/activate
#   - pip install -e ".[dev,packaging,charts-pg]"
#   - appimagetool (https://github.com/AppImage/AppImageKit/releases)
#
# Usage : ./packaging/linux/build_appimage.sh

set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
DIST="$ROOT/dist"
APPDIR="$DIST/OpenStats.AppDir"

echo "== Nettoyage =="
rm -rf "$DIST" "$ROOT/build"

echo "== PyInstaller =="
pyinstaller \
    --noconfirm \
    --windowed \
    --name OpenStats \
    --add-data "$ROOT/plugins:plugins" \
    --collect-submodules openstats \
    --collect-data openstats \
    --hidden-import=PySide6.QtCharts \
    --hidden-import=statsmodels.tsa.statespace \
    --hidden-import=linearmodels.panel \
    "$ROOT/src/openstats/__main__.py"

echo "== Préparation AppDir =="
mkdir -p "$APPDIR/usr/bin" "$APPDIR/usr/share/applications" "$APPDIR/usr/share/icons/hicolor/256x256/apps"

cp -r "$DIST/OpenStats/"* "$APPDIR/usr/bin/"

cat > "$APPDIR/openstats.desktop" <<EOF
[Desktop Entry]
Name=OpenStats
Exec=OpenStats
Icon=openstats
Type=Application
Categories=Science;Education;DataVisualization;
EOF
cp "$APPDIR/openstats.desktop" "$APPDIR/usr/share/applications/"

if [ -f "$ROOT/resources/icon.png" ]; then
    cp "$ROOT/resources/icon.png" "$APPDIR/openstats.png"
    cp "$ROOT/resources/icon.png" "$APPDIR/usr/share/icons/hicolor/256x256/apps/openstats.png"
fi

cat > "$APPDIR/AppRun" <<'EOF'
#!/bin/bash
HERE="$(dirname "$(readlink -f "${0}")")"
exec "${HERE}/usr/bin/OpenStats" "$@"
EOF
chmod +x "$APPDIR/AppRun"

echo "== Génération AppImage =="
appimagetool "$APPDIR" "$DIST/OpenStats-x86_64.AppImage"

echo "✅ AppImage : $DIST/OpenStats-x86_64.AppImage"
