@echo off
setlocal enabledelayedexpansion
REM Se placer a la racine du projet (le dossier parent de "installer")
cd /d "%~dp0.."

REM Extraire la version depuis pubspec.yaml
set "VERSION="
for /f "tokens=2" %%a in ('findstr /r "^version:" pubspec.yaml') do set "VERSION=%%a"

if "!VERSION!"=="" (
    echo ERREUR: Impossible de lire la version depuis pubspec.yaml
    pause
    exit /b 1
)

echo ========================================
echo   Build Application Caisse v!VERSION!
echo ========================================
echo.

REM ============================================================
REM ETAPE 1 : Compilation Flutter Windows Release
REM ============================================================
echo [1/2] Compilation Flutter Windows Release...
echo.

REM Detection de flutter ou fvm
set "FLUTTER_CMD=flutter"
flutter --version >nul 2>&1
if !ERRORLEVEL! neq 0 (
    fvm --version >nul 2>&1
    if !ERRORLEVEL! equ 0 (
        echo Flutter non trouve, utilisation de fvm...
        set "FLUTTER_CMD=fvm flutter"
    ) else (
        echo ERREUR: Ni flutter ni fvm ne sont installes.
        pause
        exit /b 1
    )
)

echo Utilisation de: !FLUTTER_CMD!
echo.
!FLUTTER_CMD! build windows --release

if !ERRORLEVEL! neq 0 (
    echo.
    echo ERREUR: La compilation Flutter a echoue.
    pause
    exit /b 1
)

echo.
echo Build Flutter termine avec succes.
echo.

REM ============================================================
REM ETAPE 2 : Creation de l'installateur avec Inno Setup
REM ============================================================
echo [2/2] Creation de l'installateur Inno Setup...
echo.

REM Recherche de Inno Setup 6
set ISCC_PATH=
if exist "C:\Program Files (x86)\Inno Setup 6\ISCC.exe" (
    set "ISCC_PATH=C:\Program Files (x86)\Inno Setup 6\ISCC.exe"
) else if exist "C:\Program Files\Inno Setup 6\ISCC.exe" (
    set "ISCC_PATH=C:\Program Files\Inno Setup 6\ISCC.exe"
)

if "!ISCC_PATH!"=="" (
    echo ERREUR: Inno Setup 6 n'est pas installe.
    echo.
    echo Veuillez telecharger et installer Inno Setup depuis:
    echo https://jrsoftware.org/isdl.php
    echo.
    pause
    exit /b 1
)

echo Inno Setup trouve: !ISCC_PATH!
echo.

REM Creer le dossier de sortie s'il n'existe pas
if not exist "build\installer" mkdir "build\installer"

REM Compiler le script Inno Setup avec la version en parametre
echo Compilation avec version: !VERSION!
"!ISCC_PATH!" "/DMyAppVersion=!VERSION!" "installer\setup.iss"

if !ERRORLEVEL! equ 0 (
    echo.
    echo ========================================
    echo   Installateur cree avec succes!
    echo ========================================
    echo.
    echo Fichier: build\installer\ApplicationCaisse_Setup_v!VERSION!.exe
    echo.
    explorer "build\installer"
) else (
    echo.
    echo ERREUR: La compilation Inno Setup a echoue.
)

pause
