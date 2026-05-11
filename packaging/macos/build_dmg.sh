#!/usr/bin/env bash
# Build OpenStats Desktop — macOS DMG
#
# Usage : ./packaging/macos/build_dmg.sh
#
# Notarization (signature Apple) : ajouter `xcrun altool --notarize-app` après la création.

set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
DIST="$ROOT/dist"

echo "== PyInstaller .app =="
pyinstaller \
    --noconfirm \
    --windowed \
    --name OpenStats \
    --osx-bundle-identifier io.elmaslabs.openstats \
    --add-data "$ROOT/plugins:plugins" \
    --collect-submodules openstats \
    --collect-data openstats \
    --hidden-import=PySide6.QtCharts \
    "$ROOT/src/openstats/__main__.py"

if [ ! -d "$DIST/OpenStats.app" ]; then
    echo "Build .app échoué"
    exit 1
fi

echo "== Création DMG =="
hdiutil create \
    -volname "OpenStats" \
    -srcfolder "$DIST/OpenStats.app" \
    -ov -format UDZO \
    "$DIST/OpenStats.dmg"

echo "✅ DMG : $DIST/OpenStats.dmg"
echo "ℹ️  Pour la distribution publique, ajouter notarization Apple :"
echo "   xcrun notarytool submit dist/OpenStats.dmg --keychain-profile <profile> --wait"
