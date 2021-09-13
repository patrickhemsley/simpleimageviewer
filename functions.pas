unit functions;

interface

uses
  classes;

function GetImageFiles(const directory: string): TStrings;

function FindFiles(const directory, prefix, extension: string): TStringList; //Build222

function CombinePath(const path: string; const subPath: string): string; overload;

function Minimum(const x, y: double): double; overload;

function Minimum(const x, y: integer): integer; overload;


implementation

uses
  SysUtils;

function GetImageFiles(const directory: string): TStrings;

  procedure AddFiles(const ext: string);
  var
    i: integer;
    sl: TStrings;
  begin
    sl := FindFiles(directory, '', ext);
    for i := 0 to sl.count-1 do
      result.Add(sl[i]);
    FreeAndNil(sl);
  end;

begin
  result := TStringList.Create();
  AddFiles('png');
  AddFiles('bmp');
  AddFiles('jpg');
  AddFiles('jpeg');
  AddFiles('ico');
  AddFiles('emf');
  AddFiles('wmf');
end;

//Return a list of files where
//  directory is the directory to search (sub-directories are ignored)
//  prefix is the first part of the filename to match
//  extension is a ; seperated list of file extensions to match
//Note: client is responsible for freeing result of this function
function FindFiles(const directory, prefix, extension: string): TStringList;
  procedure FindThisExt(const result: TStrings; const directory, prefix: string; extension: string);
  var
    SR: TSearchRec;
    s: string;
    N: integer;
  begin
    S := directory;
    if copy(directory, length(directory), 1) <> PathDelim then
      s := s + PathDelim;
    s := s + prefix + '*';
    if extension = '*' then
      extension := '.*'
    else if copy(extension, 1, 1) <> '.'  then
      extension := '.' + extension;
    s := s + extension;
    N := FindFirst(S, 0, SR);
    if (N = 0) then
    begin
      while (N = 0) do
      begin
        //Workaround FindFirst()
        S := UpperCase(SR.Name);
        if (Copy(S, 1, length(UpperCase(prefix))) = UpperCase(prefix)) then
          result.Add(SR.Name);
        N := FindNext(SR);
      end;
    end;
    FindClose(SR);
  end;

var
  extensions: TStringList;
  i: integer;
begin
  result := TStringList.Create;
  extensions := TStringList.Create;
  try
    ExtractStrings([';'], [], PChar(extension), extensions);
    for i := 0 to extensions.count-1 do
      FindThisExt(result, directory, prefix, extensions[i]);
  finally
    extensions.Free;
  end;
end;


function ExcludeTrailingBackslash(const S: string): string;
begin
  Result := S;
  if IsPathDelimiter(Result, Length(Result)) then
    SetLength(Result, Length(Result)-1);
end;



function CombinePath(const path: string; const subPath: string): string;
begin
  result := ExcludeTrailingBackslash(path) + PathDelim + ExcludeTrailingBackslash(subPath);
end;

function Minimum(const x, y: double): double;
begin
  if x < y then
    result := x
  else
    result := y;
end;

function Minimum(const x, y: integer): integer;
begin
  if x < y then
    result := x
  else
    result := y;
end;


end.
