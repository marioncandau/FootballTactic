program FootballTactic;

uses
  System.StartUpCopy,
  FMX.Forms,
  Main in 'Main.pas' {Form1},
  AddTactic in 'AddTactic.pas' {Form2},
  SaveTactic in 'SaveTactic.pas' {Form3},
  Player in 'Player.pas',
  Tactic in 'Tactic.pas',
  ExportToPicture in 'ExportToPicture.pas' {Form4},
  EditTactic in 'EditTactic.pas' {Form5};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TForm4, Form4);
  Application.CreateForm(TForm5, Form5);
  Application.Run;
end.
