[Setup]
AppName=Horizon
AppVersion=1.0.0
DefaultDirName={pf}\Horizon
DefaultGroupName=Horizon
OutputBaseFilename=HorizonSetup
Compression=lzma
SolidCompression=yes

[Files]
Source: "build\windows\x64\runner\Release\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs

[Icons]
Name: "{group}\Horizon"; Filename: "{app}\horizon.exe"
Name: "{commondesktop}\Horizon"; Filename: "{app}\horizon.exe"

[Run]
Filename: "{app}\horizon.exe"; Description: "{cm:LaunchProgram,Horizon}"; Flags: nowait postinstall skipifsilent