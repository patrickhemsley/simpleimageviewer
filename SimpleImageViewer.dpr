program SimpleImageViewer;

uses
  Forms,
  main in 'main.pas' {Form1},
  functions in 'functions.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
