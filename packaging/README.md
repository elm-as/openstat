# Packaging OpenStats Desktop

Scripts de génération des installateurs natifs.

## Windows MSI

```powershell
# Prérequis : WiX Toolset 3.x ou Qt Installer Framework
.\packaging\windows\build_msi.ps1
```

Produit : `dist\OpenStats-Setup.msi`

**Signature** : à ajouter via `signtool.exe sign /f cert.pfx /t http://timestamp.digicert.com OpenStats-Setup.msi`

## Linux AppImage

```bash
./packaging/linux/build_appimage.sh
```

Produit : `dist/OpenStats-x86_64.AppImage`

## macOS DMG

```bash
./packaging/macos/build_dmg.sh
```

Produit : `dist/OpenStats.dmg`

**Notarization** : voir commentaires dans le script.

## Auto-update

Stratégie recommandée :
1. Générer un `latest.json` à chaque release (URL + version + signature)
2. Au démarrage de l'app, fetcher `latest.json` depuis le repo GitHub
3. Si version distante > locale : proposer le téléchargement
4. Vérifier la signature avant l'installation

Code de référence : à implémenter dans `openstats/core/updater.py` (Phase 3).
