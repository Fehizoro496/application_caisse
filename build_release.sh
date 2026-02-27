#!/usr/bin/env bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

# ─── Couleurs ───────────────────────────────────────────────────────────────
RED='\033[0;31m'; GREEN='\033[0;32m'; CYAN='\033[0;36m'; NC='\033[0m'

echo -e "${CYAN}========================================"
echo -e "  Build + Installateur Application Caisse"
echo -e "========================================${NC}"
echo

# ─── Étape 1 : Flutter build ────────────────────────────────────────────────
echo -e "[1/2] Flutter build windows --release..."
flutter build windows --release
echo -e "${GREEN}Build Flutter OK.${NC}"
echo

# ─── Étape 2 : Inno Setup ───────────────────────────────────────────────────
echo -e "[2/2] Compilation Inno Setup..."

ISCC=""
for path in \
    "/c/Program Files (x86)/Inno Setup 6/ISCC.exe" \
    "/c/Program Files/Inno Setup 6/ISCC.exe"; do
    [ -f "$path" ] && ISCC="$path" && break
done

if [ -z "$ISCC" ]; then
    echo -e "${RED}ERREUR : Inno Setup 6 introuvable.${NC}"
    echo "Installer depuis : https://jrsoftware.org/isdl.php"
    exit 1
fi

mkdir -p build/installer
"$ISCC" "installer/setup.iss"

echo
echo -e "${GREEN}========================================"
echo -e "  Installateur créé avec succès !"
echo -e "========================================${NC}"
echo "Fichier : build/installer/ApplicationCaisse_Setup.exe"
