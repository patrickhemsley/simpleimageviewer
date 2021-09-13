unit main;

interface

uses
  Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrls, Menus, ExtCtrls, StdCtrls, Buttons;

type

  { TMainForm }

  TMainForm = class(TForm)
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Panel3: TPanel;
    Image1: TImage;
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    FDirectory: string;
    FLoadedFile: string;
    FFileNames: TStrings;
    FFilePos: integer;
    procedure ShowNext();
    procedure ShowPrevious();
    procedure ShowFirst();
    procedure ShowLast();
    procedure OpenDirectory();
    procedure LoadPicture(const filename: string);
    procedure RenameImage();
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

uses
  functions;


procedure TMainForm.OpenDirectory();

  procedure HideHelp();
  begin
    Label1.Visible := false;
    Label10.Visible := false;
    Label2.Visible := false;
    Label3.Visible := false;
    Label4.Visible := false;
    Label5.Visible := false;
    Label6.Visible := false;
    Label7.Visible := false;
    Label8.Visible := false;
    Label9.Visible := false;
    Label11.Visible := false;
    Label12.Visible := false;
  end;

var
  chosenDirectory: string;
  options : TSelectDirOpts;
begin
  options := [];
  if SelectDirectory(chosenDirectory, options, 1) then
  begin
     FreeAndNil(FFileNames);
     FFileNames := GetImageFiles(chosenDirectory);
     if FFileNames.count = 0 then
       Showmessage('No image files found')
     else
     begin
       HideHelp();
       FDirectory := chosenDirectory;
       FFilePos := -1;
       ShowNext();
     end;
   end;
end;




procedure TMainForm.ShowNext();
begin
 if FDirectory = '' then
   exit;
 Inc(FFilePos);
 if FFilePos >= FFileNames.Count then
   FFilePos := FFileNames.Count - 1;
 if FFilePos >= 0 then
   LoadPicture(FFileNames[FFilePos]);
end;

procedure TMainForm.ShowPrevious();
begin
 if FDirectory = '' then
   exit;
 Dec(FFilePos);
 if FFilePos < 0 then
   FFilePos := 0;
 if FFilePos < FFileNames.Count then
   LoadPicture(FFileNames[FFilePos]);
end;

procedure TMainForm.ShowFirst();
begin
 FFilePos := 0;
 if FFilePos < FFileNames.Count then
   LoadPicture(FFileNames[FFilePos]);
end;

procedure TMainForm.ShowLast();
begin
 FFilePos := FFileNames.Count - 1;
 if FFilePos >= 0 then
   LoadPicture(FFileNames[FFilePos]);
end;


procedure TMainForm.FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  shf: boolean;
const
  LEFT_KEY = 37; RIGHT_KEY = 39; UP_KEY = 38; DOWN_KEY = 40; O_KEY = 79;
  ESC_KEY = 27; R_KEY = 82;
begin
   shf := ssShift in Shift;
//   ShowMessage(IntToStr(key));

  if (Key = LEFT_KEY) then
    ShowPrevious
  else if (Key = RIGHT_KEY) then
    ShowNext
  else if (Key = DOWN_KEY) then
    ShowFirst
  else if (Key = UP_KEY) then
    ShowLast
  else if (Key = O_KEY) and shf then
    OpenDirectory()
  else if (Key = R_KEY) and shf then
    RenameImage()
  else if (Key = ESC_KEY ) then
    Close();


{  if ssAlt in Shift then ShowMessage('ALT');
    if ssShift in Shift then ShowMessage('SHIFT');
    if ssCtrl in Shift then ShowMessage('STRG');
    if ssAltGr in Shift then ShowMessage('ALT GR');
    if ssLeft in Shift then ShowMessage('Left Mouse Key');
    if ssRight in Shift then ShowMessage('Right Mouse Key');
    if ssMiddle in Shift then ShowMessage('Middle Mouse Key');
//    if ssDoubleClick in Shift then ShowMessage('Double Click');
}
end;

procedure TMainForm.LoadPicture(const filename: string);
var
   maxWidth, maxHeight: integer;
   scaleWidth, scaleHeight, scale: double;
   path: string;
begin
   path := CombinePath(FDirectory, filename);
   Image1.Picture.LoadFromFile(path);
   FLoadedFile := filename;

   maxWidth := Minimum(Screen.Width, Image1.Picture.Width);
   maxHeight := Minimum(Screen.Height, Image1.Picture.Height);
   scaleWidth := maxWidth/Image1.Picture.Width;
   scaleHeight := maxHeight/Image1.Picture.Height;
   scale := Minimum(scaleWidth, scaleHeight);

   Width := Trunc(scale * Image1.Picture.Width);
   Height := Trunc(scale * Image1.Picture.Height);

 Caption := path;
end;

procedure TMainForm.RenameImage();
var
   newfilename, oldPath, newPath: string;
begin
  if FLoadedFile = '' then
    exit;
  newfilename := FLoadedFile;
  if InputQuery('Change filename', 'New filename', newfilename) then
  begin
    oldPath := CombinePath(FDirectory, FLoadedFile);
    newPath := CombinePath(FDirectory, newfilename);
    if RenameFile(oldPath, newPath) then
    begin
      FFileNames[FFilePos] := newfilename;
      LoadPicture(FFileNames[FFilePos]);
    end
    else
      ShowMessage('Error renaming file');
  end;
end;



procedure TMainForm.FormCreate(Sender: TObject);
begin
  FFileNames := nil;
end;


end.
