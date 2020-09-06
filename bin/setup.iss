; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define MyAppName "Discord Integrity Checker"
#define MyAppVersion "1.0"
#define MyAppPublisher "NameLess Inc."
#define MyAppURL "https://thenlg.club/"
#define MyAppExeName "DiscordIntegrityChecker.exe"

[Setup]
; NOTE: The value of AppId uniquely identifies this application. Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{CBE32C12-21B2-447C-97B8-31C20B8852B6}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
;AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={autopf}\{#MyAppName}
DisableDirPage=yes
DisableProgramGroupPage=yes
; Uncomment the following line to run in non administrative install mode (install for current user only.)
;PrivilegesRequired=lowest
OutputBaseFilename=dic
Compression=lzma
SolidCompression=yes
WizardStyle=modern

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked

[Files]
Source: "C:\Users\admin\source\repos\DiscordIntegrityChecker\bin\Release\netcoreapp3.1\DiscordIntegrityChecker.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\admin\source\repos\DiscordIntegrityChecker\bin\Release\netcoreapp3.1\DiscordIntegrityChecker.deps.json"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\admin\source\repos\DiscordIntegrityChecker\bin\Release\netcoreapp3.1\DiscordIntegrityChecker.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\admin\source\repos\DiscordIntegrityChecker\bin\Release\netcoreapp3.1\DiscordIntegrityChecker.pdb"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\admin\source\repos\DiscordIntegrityChecker\bin\Release\netcoreapp3.1\DiscordIntegrityChecker.runtimeconfig.dev.json"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\admin\source\repos\DiscordIntegrityChecker\bin\Release\netcoreapp3.1\DiscordIntegrityChecker.runtimeconfig.json"; DestDir: "{app}"; Flags: ignoreversion
; NOTE: Don't use "Flags: ignoreversion" on any shared system files

[Icons]
Name: "{autoprograms}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"
Name: "{autodesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon
Name: "{userstartup}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; WorkingDir: "{app}" 

[Run]
Filename: "{app}\{#MyAppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Flags: nowait postinstall skipifsilent

