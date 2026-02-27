; Inno Setup Script for Application Caisse
; Cree un installateur executable avec raccourcis bureau et barre des taches

#define MyAppName "Application caisse"
#define MyAppVersion "1.2.0"
#define MyAppPublisher "Fehizoro"
#define MyAppExeName "application_caisse.exe"
#define MyAppDescription "Application de gestion de caisse"

[Setup]
; Identifiant unique de l'application
AppId={{F8E2C4A7-3B9D-4E5F-A1C6-2D8B7E9F0A12}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL=
AppSupportURL=
AppUpdatesURL=
DefaultDirName={autopf}\{#MyAppName}
DefaultGroupName={#MyAppName}
AllowNoIcons=yes
; Fichier de sortie (relatif a l'emplacement de ce script)
OutputDir=..\build\installer
OutputBaseFilename=ApplicationCaisse_Setup_v{#MyAppVersion}
SetupIconFile=..\windows\runner\resources\app_icon.ico
Compression=lzma
SolidCompression=yes
WizardStyle=modern
; Privileges administrateur pour l'installation
PrivilegesRequired=admin
; Architecture 64-bit uniquement
ArchitecturesInstallIn64BitMode=x64compatible
ArchitecturesAllowed=x64compatible

[Languages]
Name: "french"; MessagesFile: "compiler:Languages\French.isl"
Name: "english"; MessagesFile: "compiler:Default.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: checkedonce
Name: "quicklaunchicon"; Description: "Creer un raccourci dans la barre des taches"; GroupDescription: "{cm:AdditionalIcons}"; Flags: checkedonce

[Files]
; Executable principal
Source: "..\build\windows\x64\runner\Release\{#MyAppExeName}"; DestDir: "{app}"; Flags: ignoreversion
; DLLs Flutter runtime
Source: "..\build\windows\x64\runner\Release\flutter_windows.dll"; DestDir: "{app}"; Flags: ignoreversion
; DLLs plugins
Source: "..\build\windows\x64\runner\Release\file_saver_plugin.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\build\windows\x64\runner\Release\open_document_plugin.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\build\windows\x64\runner\Release\share_plus_plugin.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\build\windows\x64\runner\Release\sqlite3.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\build\windows\x64\runner\Release\sqlite3_flutter_libs_plugin.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\build\windows\x64\runner\Release\url_launcher_windows_plugin.dll"; DestDir: "{app}"; Flags: ignoreversion
; Dossier data (flutter_assets, icudtl.dat, etc.)
Source: "..\build\windows\x64\runner\Release\data\*"; DestDir: "{app}\data"; Flags: ignoreversion recursesubdirs createallsubdirs

[Icons]
; Raccourci dans le menu Demarrer
Name: "{group}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Comment: "{#MyAppDescription}"
Name: "{group}\Desinstaller {#MyAppName}"; Filename: "{uninstallexe}"
; Raccourci sur le bureau (optionnel)
Name: "{autodesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon; Comment: "{#MyAppDescription}"
; Raccourci dans la barre des taches (optionnel)
Name: "{userappdata}\Microsoft\Internet Explorer\Quick Launch\User Pinned\TaskBar\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: quicklaunchicon; Comment: "{#MyAppDescription}"

[Run]
; Lancer l'application apres installation
Filename: "{app}\{#MyAppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Flags: nowait postinstall skipifsilent

[UninstallDelete]
; Supprimer les donnees utilisateur lors de la desinstallation
Type: filesandordirs; Name: "{userappdata}\{#MyAppName}"
