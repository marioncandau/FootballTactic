program FootTacticv2;

uses
  System.StartUpCopy,
  FMX.Forms,
  MainForm in 'MainForm.pas' {MainFormv2},
  AddTactic in 'AddTactic.pas' {Form2},
  APropos in 'APropos.pas' {Form12},
  BugReport in 'BugReport.pas' {Form11},
  ChangeColor in 'ChangeColor.pas' {Form10},
  DeleteTactic in 'DeleteTactic.pas' {Form1},
  EditTactic in 'EditTactic.pas' {Form5},
  ExportToPicture in 'ExportToPicture.pas' {Form4},
  Menu in 'Menu.pas' {Form7},
  ModifierJoueur in 'ModifierJoueur.pas' {Form9},
  OpenTactic in 'OpenTactic.pas' {Form8},
  Player in 'Player.pas',
  SaveTactic in 'SaveTactic.pas' {Form3},
  Tactic in 'Tactic.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TMainFormv2, MainFormv2);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm12, Form12);
  Application.CreateForm(TForm11, Form11);
  Application.CreateForm(TForm10, Form10);
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm5, Form5);
  Application.CreateForm(TForm4, Form4);
  Application.CreateForm(TForm7, Form7);
  Application.CreateForm(TForm9, Form9);
  Application.CreateForm(TForm8, Form8);
  Application.CreateForm(TForm3, Form3);
  Application.Run;
end.
