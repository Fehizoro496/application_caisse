@echo off
echo ========================================
echo   Build Application Caisse v1.2.0
echo ========================================
echo.

REM Se placer a la racine du projet (le dossier parent de "installer")
cd /d "%~dp0.."

REM ============================================================
REM ETAPE 1 : Compilation Flutter Windows Release
REM ============================================================
echo [1/2] Compilation Flutter Windows Release...
echo.

flutter build windows --release

if %ERRORLEVEL% neq 0 (
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

if "%ISCC_PATH%"=="" (
    echo ERREUR: Inno Setup 6 n'est pas installe.
    echo.
    echo Veuillez telecharger et installer Inno Setup depuis:
    echo https://jrsoftware.org/isdl.php
    echo.
    pause
    exit /b 1
)

echo Inno Setup trouve: %ISCC_PATH%
echo.

REM Creer le dossier de sortie s'il n'existe pas
if not exist "build\installer" mkdir "build\installer"

REM Compiler le script Inno Setup
"%ISCC_PATH%" "installer\setup.iss"

if %ERRORLEVEL% equ 0 (
    echo.
    echo ========================================
    echo   Installateur cree avec succes!
    echo ========================================
    echo.
    echo Fichier: build\installer\ApplicationCaisse_Setup.exe
    echo.
    explorer "build\installer"
) else (
    echo.
    echo ERREUR: La compilation Inno Setup a echoue.
)

pause
