unit OpenTactic;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Objects, FMX.Controls.Presentation, FMX.Layouts, FMX.ListBox;

type
  TForm8 = class(TForm)
    ToolBar2: TToolBar;
    Rectangle12: TRectangle;
    Label1: TLabel;
    SpeedButton1: TSpeedButton;
    ListBox1: TListBox;
    ButtonOK: TButton;
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ButtonOKClick(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Form8: TForm8;

implementation

uses System.IOUtils, Tactic, MainForm;

{$R *.fmx}

procedure TForm8.ButtonOKClick(Sender: TObject);
var
  Tactic: string;
begin
  Tactic := ListBox1.Selected.Text;

  MainFormv2.ActiveTactic := TTactic.Create(ChangeFileExt(Tactic, ''));
  MainFormv2.ActiveTactic.Import(TPath.GetDocumentsPath + '/FootballTactic/' + Tactic);
  MainFormv2.Image1Resize(Sender);
  MainFormv2.LabelTactique.Visible := true;
  MainFormv2.LabelTactique.Text := ChangeFileExt(Tactic, '');
  MainFormv2.LoadColor;
  Close();
end;

procedure TForm8.FormShow(Sender: TObject);
var
  searchResult: TSearchRec;
begin
  ListBox1.Items.Clear;

  SetCurrentDir(TPath.GetDocumentsPath + '/FootballTactic/');

  if findfirst('*.tac', faAnyFile, searchResult) = 0 then
  begin
    repeat
      ListBox1.Items.Add(searchResult.Name);
    until FindNext(searchResult) <> 0;
    FindClose(searchResult);
  end;
end;

procedure TForm8.SpeedButton1Click(Sender: TObject);
begin
  Close();
end;

end.
