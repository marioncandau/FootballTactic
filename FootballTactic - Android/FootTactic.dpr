program FootTactic;

uses
  System.StartUpCopy,
  FMX.Forms,
  MainForm in 'MainForm.pas' {Form6},
  AddTactic in 'AddTactic.pas' {Form2},
  ChangeColor in 'ChangeColor.pas' {Form10},
  EditTactic in 'EditTactic.pas' {Form5},
  Menu in 'Menu.pas' {Form7},
  ModifierJoueur in 'ModifierJoueur.pas' {Form9},
  OpenTactic in 'OpenTactic.pas' {Form8},
  Player in 'Player.pas',
  Tactic in 'Tactic.pas',
  APropos in 'APropos.pas' {Form12},
  BugReport in 'BugReport.pas' {Form11},
  DeleteTactic in 'DeleteTactic.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.FormFactor.Orientations := [TFormOrientation.Portrait];
  Application.CreateForm(TForm6, Form6);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm10, Form10);
  Application.CreateForm(TForm5, Form5);
  Application.CreateForm(TForm7, Form7);
  Application.CreateForm(TForm9, Form9);
  Application.CreateForm(TForm8, Form8);
  Application.CreateForm(TForm12, Form12);
  Application.CreateForm(TForm11, Form11);
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
