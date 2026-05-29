#!/bin/bash

# Couleurs
RED='\033[0;31m'
GREEN='\033[0;32m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Se placer à la racine du projet (le dossier parent de "installer")
cd "$(dirname "$0")/.."

# Extraire la version depuis pubspec.yaml
VERSION=$(grep '^version:' pubspec.yaml | sed 's/version: *//')

if [ -z "$VERSION" ]; then
    echo -e "${RED}ERREUR: Impossible de lire la version depuis pubspec.yaml${NC}"
    exit 1
fi

echo -e "${CYAN}========================================"
echo -e "  Build Application Caisse v${VERSION}"
echo -e "========================================${NC}"
echo

# ============================================================
# ETAPE 1 : Compilation Flutter Windows Release
# ============================================================
echo -e "[1/2] Compilation Flutter Windows Release..."
echo

# Détection de flutter ou fvm
FLUTTER_CMD="flutter"
if ! command -v flutter &> /dev/null; then
    if command -v fvm &> /dev/null; then
        echo -e "${CYAN}Flutter non trouvé, utilisation de fvm...${NC}"
        FLUTTER_CMD="fvm flutter"
    else
        echo -e "${RED}ERREUR : Ni flutter ni fvm ne sont installés.${NC}"
        exit 1
    fi
fi

echo -e "Utilisation de: ${CYAN}$FLUTTER_CMD${NC}"
echo
$FLUTTER_CMD build windows --release

if [ $? -ne 0 ]; then
    echo
    echo -e "${RED}ERREUR: La compilation Flutter a échoué.${NC}"
    exit 1
fi

echo
echo -e "${GREEN}Build Flutter terminé avec succès.${NC}"
echo

# ============================================================
# ETAPE 2 : Création de l'installateur avec Inno Setup
# ============================================================
echo -e "[2/2] Création de l'installateur Inno Setup..."
echo

# Recherche de Inno Setup 6
ISCC_PATH=""
if [ -f "/c/Program Files (x86)/Inno Setup 6/ISCC.exe" ]; then
    ISCC_PATH="/c/Program Files (x86)/Inno Setup 6/ISCC.exe"
elif [ -f "/c/Program Files/Inno Setup 6/ISCC.exe" ]; then
    ISCC_PATH="/c/Program Files/Inno Setup 6/ISCC.exe"
fi

if [ -z "$ISCC_PATH" ]; then
    echo -e "${RED}ERREUR: Inno Setup 6 n'est pas installé.${NC}"
    echo
    echo "Veuillez télécharger et installer Inno Setup depuis:"
    echo "https://jrsoftware.org/isdl.php"
    echo
    exit 1
fi

echo -e "Inno Setup trouvé: ${CYAN}$ISCC_PATH${NC}"
echo

# Créer le dossier de sortie s'il n'existe pas
mkdir -p "build/installer"

# Compiler le script Inno Setup avec la version en paramètre
echo -e "Compilation avec version: ${CYAN}$VERSION${NC}"
"$ISCC_PATH" "/DMyAppVersion=$VERSION" "installer/setup.iss"

if [ $? -eq 0 ]; then
    echo
    echo -e "${GREEN}========================================"
    echo -e "  Installateur créé avec succès!"
    echo -e "========================================${NC}"
    echo
    echo "Fichier: build/installer/ApplicationCaisse_Setup_v${VERSION}.exe"
    echo

    # Ouvrir le dossier (fonctionne sous Git Bash Windows)
    explorer "build/installer" 2>/dev/null || echo "Ouvrez manuellement: build/installer/"
else
    echo
    echo -e "${RED}ERREUR: La compilation Inno Setup a échoué.${NC}"
    exit 1
fi
