[Setup]
AppName=Battlefield 2 Placebo
AppVerName=Battlefield 2 Placebo
AppCopyright=Tema567
AppID={{72427ED2-72A7-4DB3-99CE-D0E36B24307A}
AppMutex={{72427ED2-72A7-4DB3-99CE-D0E36B24307B}
AppPublisher=PLAYBF2.RU
AppPublisherURL=http://www.playbf2.ru
AppSupportURL=http://www.playbf2.ru/go/tiny
AppVersion=1.5
VersionInfoVersion=1.5
VersionInfoCopyright=Tema567
VersionInfoCompany=PLAYBF2.RU
VersionInfoDescription=BattleField 2 Placebo
VersionInfoTextVersion=v1.5
DefaultDirName={code:GetInstallDir}
SetupLogging=true
DiskSpanning=false
LanguageDetectionMethod=uilanguage
ShowUndisplayableLanguages=true
DefaultGroupName=Battlefield 2
DisableStartupPrompt=true
DisableWelcomePage=true
DisableProgramGroupPage=true
DisableReadyPage=yes
ShowLanguageDialog=no
ShowTasksTreeLines=true
AllowRootDirectory=true
AllowNoIcons=true
UninstallDisplayName=Battlefield 2 Placebo
WizardImageFile=data\gfx\box.bmp
SetupIconFile=data\gfx\setup.ico
AppendDefaultDirName=true
ArchitecturesInstallIn64BitMode=x64
ArchitecturesAllowed=x86 x64
InternalCompressLevel=ultra
Compression=lzma
OutputDir=Release
OutputBaseFilename=setup


[Icons]
; English - Common
Name: {group}\{cm:UninstallProgram, Battlefield 2 Placebo v1.5}; Filename: {uninstallexe}; Comment: Uninstall Battlefield 2 Placebo from your computer; Languages: English
Name: {group}\{cm:UninstallProgram, Battlefield 2 Placebo v1.5}; Filename: {uninstallexe}; Comment: Удалить Battlefield 2 Placebo с вашего компьютера; Languages: Russian


[UninstallDelete]
Name: {app}; Type: filesandordirs
Name: {group}; Type: filesandordirs


[Languages]
Name: English; MessagesFile: compiler:Default.isl;
Name: Russian; MessagesFile: compiler:Languages\Russian.isl;


[Registry]
; 32 bit - BF2
Root: HKLM; SubKey: SOFTWARE\EA Games\Battlefield 2; ValueType: string; ValueName: DisplayName; ValueData: Battlefield 2; Check: not IsWin64
Root: HKLM; SubKey: SOFTWARE\EA Games\Battlefield 2 Special Forces; ValueType: string; ValueName: DisplayName; ValueData: Battlefield 2: Special Forces; Check: not IsWin64
Root: HKLM; SubKey: SOFTWARE\Electronic Arts\EA CORE\INSTALLED GAMES\EAGAMES\BF2-2006\ONLINE_CONTENT\BF2-EP1; ValueType: string; ValueName: Version; ValueData: 1.5; Check: not IsWin64
Root: HKLM; SubKey: SOFTWARE\Electronic Arts\EA CORE\INSTALLED GAMES\EAGAMES\BF2-2006\ONLINE_CONTENT\BF2-EP1; ValueType: string; ValueName: GameLauncherParameters; ValueData: +menu 1 +fullscreen 1 +modPath mods/xpack +ignoreAsserts 1; Check: not IsWin64
Root: HKLM; SubKey: SOFTWARE\Electronic Arts\EA CORE\INSTALLED GAMES\EAGAMES\BF2-2006\ONLINE_CONTENT\BF2-EP1; ValueType: string; ValueName: GameLauncherPath; ValueData: {app}\bf2.exe; Check: not IsWin64
Root: HKLM; SubKey: SOFTWARE\Electronic Arts\EA CORE\INSTALLED GAMES\EAGAMES\BF2-2006\ONLINE_CONTENT\BF2-EP1; ValueType: string; ValueName: DisplayName; ValueData: Battlefield 2 Special Forces; Check: not IsWin64
Root: HKLM; SubKey: SOFTWARE\Electronic Arts\EA CORE\INSTALLED GAMES\EAGAMES\BF2-2006\ONLINE_MAP_CONTENT\BF2AF; ValueType: string; ValueName: Version; ValueData: 1.5; Check: not IsWin64
Root: HKLM; SubKey: SOFTWARE\Electronic Arts\EA CORE\INSTALLED GAMES\EAGAMES\BF2-2006\ONLINE_MAP_CONTENT\BF2AF; ValueType: string; ValueName: GameLauncherParameters; ValueData: +menu 1 +fullscreen 1; Check: not IsWin64
Root: HKLM; SubKey: SOFTWARE\Electronic Arts\EA CORE\INSTALLED GAMES\EAGAMES\BF2-2006\ONLINE_MAP_CONTENT\BF2AF; ValueType: string; ValueName: GameLauncherPath; ValueData: {app}\bf2.exe; Check: not IsWin64
Root: HKLM; SubKey: SOFTWARE\Electronic Arts\EA CORE\INSTALLED GAMES\EAGAMES\BF2-2006\ONLINE_MAP_CONTENT\BF2AF; ValueType: string; ValueName: DisplayName; ValueData: Battlefield 2: Armored Fury Booster Pack; Check: not IsWin64
Root: HKLM; SubKey: SOFTWARE\Electronic Arts\EA CORE\INSTALLED GAMES\EAGAMES\BF2-2006\ONLINE_MAP_CONTENT\BF2EF; ValueType: string; ValueName: Version; ValueData: 1.5; Check: not IsWin64
Root: HKLM; SubKey: SOFTWARE\Electronic Arts\EA CORE\INSTALLED GAMES\EAGAMES\BF2-2006\ONLINE_MAP_CONTENT\BF2EF; ValueType: string; ValueName: GameLauncherParameters; ValueData: +menu 1 +fullscreen 1; Check: not IsWin64
Root: HKLM; SubKey: SOFTWARE\Electronic Arts\EA CORE\INSTALLED GAMES\EAGAMES\BF2-2006\ONLINE_MAP_CONTENT\BF2EF; ValueType: string; ValueName: GameLauncherPath; ValueData: {app}\bf2.exe; Check: not IsWin64
Root: HKLM; SubKey: SOFTWARE\Electronic Arts\EA CORE\INSTALLED GAMES\EAGAMES\BF2-2006\ONLINE_MAP_CONTENT\BF2EF; ValueType: string; ValueName: DisplayName; ValueData: Battlefield 2: Euro Force Booster Pack; Check: not IsWin64
Root: HKLM; SubKey: SOFTWARE\Electronic Arts\EA CORE\INSTALLED GAMES\EAGAMES\BF2-2006\ONLINE_MAP_CONTENT\BF2EURO; ValueType: string; ValueName: GameLauncherParameters; ValueData: +menu 1 +fullscreen 1; Check: not IsWin64
Root: HKLM; SubKey: SOFTWARE\Electronic Arts\EA CORE\INSTALLED GAMES\EAGAMES\BF2-2006\ONLINE_MAP_CONTENT\BF2EURO; ValueType: string; ValueName: GameLauncherPath; ValueData: {app}\bf2.exe; Check: not IsWin64
Root: HKLM; SubKey: SOFTWARE\Electronic Arts\EA CORE\INSTALLED GAMES\EAGAMES\BF2-2006\ONLINE_MAP_CONTENT\BF2EURO; ValueType: string; ValueName: DisplayName; ValueData: Battlefield 2: Euro Force Booster Pack; Check: not IsWin64
Root: HKLM; SubKey: SOFTWARE\Electronic Arts\EA CORE\INSTALLED GAMES\EAGAMES\BF2-2006\ONLINE_MAP_CONTENT\BF2EURO; ValueType: string; ValueName: Version; ValueData: 1.5; Check: not IsWin64
Root: HKLM; SubKey: SOFTWARE\Electronic Arts\EA Games\Battlefield 2; ValueType: string; ValueName: InstallDir; ValueData: {app}; Check: not IsWin64
Root: HKLM; SubKey: SOFTWARE\Electronic Arts\EA Games\Battlefield 2; ValueType: string; ValueName: Version; ValueData: 1.5; Check: not IsWin64
Root: HKLM; SubKey: SOFTWARE\Electronic Arts\EA Games\Battlefield 2; ValueType: string; ValueName: Language; ValueData: English; Check: not IsWin64
Root: HKLM; SubKey: SOFTWARE\Electronic Arts\EA Games\Battlefield 2; ValueType: string; ValueName: Locale; ValueData: en_US; Check: not IsWin64
Root: HKLM; SubKey: SOFTWARE\Electronic Arts\EA Games\Battlefield 2; ValueType: string; ValueName: MemberName; ValueData: ; Check: not IsWin64
Root: HKLM; SubKey: SOFTWARE\Electronic Arts\EA Games\Battlefield 2\wdc; ValueType: string; ValueName: ; ValueData: true; Check: not IsWin64
Root: HKLM; SubKey: SOFTWARE\Electronic Arts\EA Games\Battlefield 2 Special Forces; ValueType: string; ValueName: InstallDir; ValueData: {app}; Check: not IsWin64
Root: HKLM; SubKey: SOFTWARE\Electronic Arts\EA Games\Battlefield 2 Special Forces; ValueType: string; ValueName: Version; ValueData: 1.5; Check: not IsWin64
Root: HKLM; SubKey: SOFTWARE\Electronic Arts\EA Games\Battlefield 2 Special Forces; ValueType: string; ValueName: Language; ValueData: English; Check: not IsWin64
Root: HKLM; SubKey: SOFTWARE\Electronic Arts\EA Games\Battlefield 2 Special Forces; ValueType: string; ValueName: Locale; ValueData: en_US; Check: not IsWin64
Root: HKLM; SubKey: SOFTWARE\Electronic Arts\EA Games\Battlefield 2 Special Forces; ValueType: string; ValueName: MemberName; ValueData: ; Check: not IsWin64
Root: HKLM; SubKey: SOFTWARE\Electronic Arts\EA Games\Battlefield 2 Special Forces\wdc; ValueType: string; ValueName: ; ValueData: true; Check: not IsWin64

; 64 bit - BF2
Root: HKLM; SubKey: SOFTWARE\Wow6432Node\EA Games\Battlefield 2; ValueType: string; ValueName: DisplayName; ValueData: Battlefield 2; Check: IsWin64
Root: HKLM; SubKey: SOFTWARE\Wow6432Node\EA Games\Battlefield 2 Special Forces; ValueType: string; ValueName: DisplayName; ValueData: Battlefield 2: Special Forces; Check: IsWin64
Root: HKLM; SubKey: SOFTWARE\Wow6432Node\Electronic Arts\EA CORE\INSTALLED GAMES\EAGAMES\BF2-2006\ONLINE_CONTENT\BF2-EP1; ValueType: string; ValueName: Version; ValueData: 1.5; Check: IsWin64
Root: HKLM; SubKey: SOFTWARE\Wow6432Node\Electronic Arts\EA CORE\INSTALLED GAMES\EAGAMES\BF2-2006\ONLINE_CONTENT\BF2-EP1; ValueType: string; ValueName: GameLauncherParameters; ValueData: +menu 1 +fullscreen 1 +modPath mods/xpack +ignoreAsserts 1; Check: IsWin64
Root: HKLM; SubKey: SOFTWARE\Wow6432Node\Electronic Arts\EA CORE\INSTALLED GAMES\EAGAMES\BF2-2006\ONLINE_CONTENT\BF2-EP1; ValueType: string; ValueName: GameLauncherPath; ValueData: {app}\bf2.exe; Check: IsWin64
Root: HKLM; SubKey: SOFTWARE\Wow6432Node\Electronic Arts\EA CORE\INSTALLED GAMES\EAGAMES\BF2-2006\ONLINE_CONTENT\BF2-EP1; ValueType: string; ValueName: DisplayName; ValueData: Battlefield 2 Special Forces; Check: IsWin64
Root: HKLM; SubKey: SOFTWARE\Wow6432Node\Electronic Arts\EA CORE\INSTALLED GAMES\EAGAMES\BF2-2006\ONLINE_MAP_CONTENT\BF2AF; ValueType: string; ValueName: Version; ValueData: 1.5; Check: IsWin64
Root: HKLM; SubKey: SOFTWARE\Wow6432Node\Electronic Arts\EA CORE\INSTALLED GAMES\EAGAMES\BF2-2006\ONLINE_MAP_CONTENT\BF2AF; ValueType: string; ValueName: GameLauncherParameters; ValueData: +menu 1 +fullscreen 1; Check: IsWin64
Root: HKLM; SubKey: SOFTWARE\Wow6432Node\Electronic Arts\EA CORE\INSTALLED GAMES\EAGAMES\BF2-2006\ONLINE_MAP_CONTENT\BF2AF; ValueType: string; ValueName: GameLauncherPath; ValueData: {app}\bf2.exe; Check: IsWin64
Root: HKLM; SubKey: SOFTWARE\Wow6432Node\Electronic Arts\EA CORE\INSTALLED GAMES\EAGAMES\BF2-2006\ONLINE_MAP_CONTENT\BF2AF; ValueType: string; ValueName: DisplayName; ValueData: Battlefield 2: Armored Fury Booster Pack; Check: IsWin64
Root: HKLM; SubKey: SOFTWARE\Wow6432Node\Electronic Arts\EA CORE\INSTALLED GAMES\EAGAMES\BF2-2006\ONLINE_MAP_CONTENT\BF2EF; ValueType: string; ValueName: Version; ValueData: 1.5; Check: IsWin64
Root: HKLM; SubKey: SOFTWARE\Wow6432Node\Electronic Arts\EA CORE\INSTALLED GAMES\EAGAMES\BF2-2006\ONLINE_MAP_CONTENT\BF2EF; ValueType: string; ValueName: GameLauncherParameters; ValueData: +menu 1 +fullscreen 1; Check: IsWin64
Root: HKLM; SubKey: SOFTWARE\Wow6432Node\Electronic Arts\EA CORE\INSTALLED GAMES\EAGAMES\BF2-2006\ONLINE_MAP_CONTENT\BF2EF; ValueType: string; ValueName: GameLauncherPath; ValueData: {app}\bf2.exe; Check: IsWin64
Root: HKLM; SubKey: SOFTWARE\Wow6432Node\Electronic Arts\EA CORE\INSTALLED GAMES\EAGAMES\BF2-2006\ONLINE_MAP_CONTENT\BF2EF; ValueType: string; ValueName: DisplayName; ValueData: Battlefield 2: Euro Force Booster Pack; Check: IsWin64
Root: HKLM; SubKey: SOFTWARE\Wow6432Node\Electronic Arts\EA CORE\INSTALLED GAMES\EAGAMES\BF2-2006\ONLINE_MAP_CONTENT\BF2EURO; ValueType: string; ValueName: GameLauncherParameters; ValueData: +menu 1 +fullscreen 1; Check: IsWin64
Root: HKLM; SubKey: SOFTWARE\Wow6432Node\Electronic Arts\EA CORE\INSTALLED GAMES\EAGAMES\BF2-2006\ONLINE_MAP_CONTENT\BF2EURO; ValueType: string; ValueName: GameLauncherPath; ValueData: {app}\bf2.exe; Check: IsWin64
Root: HKLM; SubKey: SOFTWARE\Wow6432Node\Electronic Arts\EA CORE\INSTALLED GAMES\EAGAMES\BF2-2006\ONLINE_MAP_CONTENT\BF2EURO; ValueType: string; ValueName: DisplayName; ValueData: Battlefield 2: Euro Force Booster Pack; Check: IsWin64
Root: HKLM; SubKey: SOFTWARE\Wow6432Node\Electronic Arts\EA CORE\INSTALLED GAMES\EAGAMES\BF2-2006\ONLINE_MAP_CONTENT\BF2EURO; ValueType: string; ValueName: Version; ValueData: 1.5; Check: IsWin64
Root: HKLM; SubKey: SOFTWARE\Wow6432Node\Electronic Arts\EA Games\Battlefield 2; ValueType: string; ValueName: InstallDir; ValueData: {app}; Check: IsWin64
Root: HKLM; SubKey: SOFTWARE\Wow6432Node\Electronic Arts\EA Games\Battlefield 2; ValueType: string; ValueName: Version; ValueData: 1.5; Check: IsWin64
Root: HKLM; SubKey: SOFTWARE\Wow6432Node\Electronic Arts\EA Games\Battlefield 2; ValueType: string; ValueName: Language; ValueData: English; Check: IsWin64
Root: HKLM; SubKey: SOFTWARE\Wow6432Node\Electronic Arts\EA Games\Battlefield 2; ValueType: string; ValueName: Locale; ValueData: en_US; Check: IsWin64
Root: HKLM; SubKey: SOFTWARE\Wow6432Node\Electronic Arts\EA Games\Battlefield 2; ValueType: string; ValueName: MemberName; ValueData: ; Check: IsWin64
Root: HKLM; SubKey: SOFTWARE\Wow6432Node\Electronic Arts\EA Games\Battlefield 2\wdc; ValueType: string; ValueName: ; ValueData: true; Check: IsWin64
Root: HKLM; SubKey: SOFTWARE\Wow6432Node\Electronic Arts\EA Games\Battlefield 2 Special Forces; ValueType: string; ValueName: InstallDir; ValueData: {app}; Check: IsWin64
Root: HKLM; SubKey: SOFTWARE\Wow6432Node\Electronic Arts\EA Games\Battlefield 2 Special Forces; ValueType: string; ValueName: Version; ValueData: 1.5; Check: IsWin64
Root: HKLM; SubKey: SOFTWARE\Wow6432Node\Electronic Arts\EA Games\Battlefield 2 Special Forces; ValueType: string; ValueName: Language; ValueData: English; Check: IsWin64
Root: HKLM; SubKey: SOFTWARE\Wow6432Node\Electronic Arts\EA Games\Battlefield 2 Special Forces; ValueType: string; ValueName: Locale; ValueData: en_US; Check: IsWin64
Root: HKLM; SubKey: SOFTWARE\Wow6432Node\Electronic Arts\EA Games\Battlefield 2 Special Forces; ValueType: string; ValueName: MemberName; ValueData: ; Check: IsWin64
Root: HKLM; SubKey: SOFTWARE\Wow6432Node\Electronic Arts\EA Games\Battlefield 2 Special Forces\wdc; ValueType: string; ValueName: ; ValueData: true; Check: IsWin64

[Dirs]
Name: {app}\Admin
Name: {app}\AdminUtils
Name: {app}\Autorun
Name: {app}\mods
Name: {app}\pb
Name: {app}\Profiles
Name: {app}\python
Name: {app}\Redist
Name: {app}\Support
Name: {app}\SupportXP1

[Files]
; Logo image
DestName: "WizardForm.TopLogoImage.bmp"; Source: "data\gfx\topbar.bmp"; Flags: dontcopy solidbreak

; Installer components
Source: data\libs\iswin7.dll; DestDir: {tmp}; Flags: ignoreversion dontcopy solidbreak

; Distribution files actually defined below
; ---

[Code]

// Variables
var
  TopLogoImage: TBitmapImage;


// Windows 7 "Glass" installer
// using iswin7.dll depedency
procedure iswin7_add_glass(Handle:HWND; Left, Top, Right, Bottom : Integer; GDIPLoadMode: boolean); external 'iswin7_add_glass@files:iswin7.dll stdcall';
procedure iswin7_add_button(Handle:HWND); external 'iswin7_add_button@files:iswin7.dll stdcall';
procedure iswin7_free; external 'iswin7_free@files:iswin7.dll stdcall';


// Open up URL when user clicks on logo
procedure BannerClick(Sender: TObject);
var
  ErrorCode:integer;
begin
  ShellExec('open','http://www.playbf2.ru/go/tiny','','',SW_SHOWNORMAL,ewNoWait,ErrorCode);
end;


// Determine installer default path
function GetInstallDir(def: String): String;
var
  d, r: String;
begin
  d := '';
  if IsWin64 then
  begin
    r := 'SOFTWARE\Wow6432Node\Electronic Arts\EA Games\Battlefield 2';
  end else
  begin
    r := 'SOFTWARE\Electronic Arts\EA Games\Battlefield 2';
  end;
  if RegQueryStringValue(HKEY_LOCAL_MACHINE, r, 'InstallDir', d) then
  begin
    Result := d;
  end else
  begin
    Result := ExpandConstant('{pf32}')+'\EA GAMES\Battlefield 2\';
  end;
end;


// Make redesign of installer wizard form
procedure RedesignWizardForm;
begin
  with WizardForm.Bevel do
  begin
    Top := ScaleY(292);
  end;

  with WizardForm.CancelButton do
  begin
    Top := ScaleY(-500);
  end;

  with WizardForm.NextButton do
  begin
    Left := ScaleX(-1);
    Top := ScaleY(297);
    Width := ScaleX(499);
    Height := ScaleY(63);
    Font.Height := -13;
    Font.Name := 'Segoe UI';
    Font.Style := [fsBold];
    ParentFont := False;
  end;

  with WizardForm.BackButton do
  begin
    Top := ScaleY(-500);
  end;

  with WizardForm.OuterNotebook do
  begin
    Height := ScaleY(292);
  end;

  with WizardForm.WizardBitmapImage do
  begin
    Height := ScaleY(284);
  end;

  with WizardForm.Bevel1 do
  begin
    Top := ScaleY(96);
  end;

  with WizardForm.InnerNotebook do
  begin
    Top := ScaleY(106);
    Height := ScaleY(173);
  end;

  with WizardForm.DiskSpaceLabel do
  begin
    Top := ScaleY(112);
  end;

  with WizardForm.ProgressGauge do
  begin
    Height := ScaleY(37);
  end;

  with WizardForm.MainPanel do
  begin
    Height := ScaleY(96);
  end;

  { TopLogoImage }
  TopLogoImage := TBitmapImage.Create(WizardForm);
  with TopLogoImage do
  begin
    Name := 'TopLogoImage';
    Parent := WizardForm.MainPanel;
    OnClick := @BannerClick;
    Cursor:=crHand;
    Left := ScaleX(0);
    Top := ScaleY(0);
    Width := ScaleX(497);
    Height := ScaleY(96);
    ExtractTemporaryFile('WizardForm.TopLogoImage.bmp');
    Bitmap.LoadFromFile(ExpandConstant('{tmp}\WizardForm.TopLogoImage.bmp'));
  end;

  with WizardForm.PageDescriptionLabel do
  begin
    Top := ScaleY(-526);
  end;

  with WizardForm.PageNameLabel do
  begin
    Top := ScaleY(-510);
  end;

  with WizardForm.RunList do
  begin
    Height := ScaleY(139);
  end;

  with WizardForm.BeveledLabel do
  begin
    Top := ScaleY(-306);
  end;
end;


// Rename "Next" button to "Install"
procedure CurPageChanged(CurPageID: Integer);
begin
  if CurPageID = wpSelectDir then
    WizardForm.NextButton.Caption := SetupMessage(msgButtonInstall);
  if CurPageID = wpFinished then
    WizardForm.NextButton.Caption := SetupMessage(msgButtonFinish);
end;


// Prepare user for using latest PunkBuster
procedure PreparePunkBuster;
var
  Path: String;
  Dir: String;
  Str: String;
  PbSetup: String;
  PbSvc: String;
  List: TStringList;
  Res: Integer;
begin
  Dir :=  ExpandConstant('{app}')+'\Redist\PunkBuster\';
  PbSetup := Dir + 'pbsetup.exe';
  PbSvc := Dir + 'pbsvc.exe';
  Path := Dir + 'pbuser.htm';
  Str := '<p> game bf2 '+ExpandConstant('{app}');
  try
    List := TStringList.Create;
    List.Append(Str);
    List.SaveToFile(Path);
    List.Free;
  except end;
  //try
  //  Exec(PbSetup, '/u --i-accept-the-pb-eula', Dir, SW_SHOW, ewWaitUntilTerminated, Res);
  //except end;
  try
    Exec(PbSvc, '/i --no-prompts --no-errors-pba --i-accept-the-pb-eula', Dir, SW_SHOW, ewWaitUntilTerminated, Res);
  except end;
end;


// Init entry point
procedure InitializeWizard;
begin
  // Make our redesign
  RedesignWizardForm;

  // Show About Setup...
  with WizardForm do begin
    Position:=poScreenCenter;
  end;

  // Make installer with glass
  iswin7_add_button(WizardForm.NextButton.Handle);
  iswin7_add_glass(WizardForm.Handle, 0, 0, 0, 68, True);
end;


// Deinit entry point
procedure DeinitializeSetup();
begin
  // Remove glass and deinit
  iswin7_free;
end;