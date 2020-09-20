unit AddTactic;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Edit, FMX.Controls.Presentation, System.IOUtils, FMX.Objects;

type
  TForm2 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    EditNbPlayer: TEdit;
    EditNbDef: TEdit;
    EditNbMDef: TEdit;
    EditNbMil: TEdit;
    EditNbMOff: TEdit;
    EditNomTact: TEdit;
    ButtonOK: TButton;
    Label7: TLabel;
    EditNbAtt: TEdit;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    ToolBar2: TToolBar;
    Rectangle12: TRectangle;
    Label9: TLabel;
    SpeedButton1: TSpeedButton;
    procedure ButtonOKClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Déclarations privées }
  public

  end;

var
  Form2: TForm2;

implementation

{$R *.fmx}

uses MainForm, Tactic;

procedure TForm2.ButtonOKClick(Sender: TObject);
var
  nbPlayer, nbDef, nbMil, nbMilDef, nbMilOff, nbAtt: Integer;
begin
  if TryStrToInt(EditNbPlayer.Text, nbPlayer) = false then
    raise Exception.Create('Veuillez entrer un nombre de joueurs');
  if (nbPlayer < 5) or (nbPlayer > 11) then
    raise Exception.Create('Il vous faut entre 5 et 11 joueurs');

  if EditNbDef.Text = '' then
    nbDef := 0
  else if TryStrToInt(EditNbDef.Text, nbDef) = false then
    raise Exception.Create('Veuillez entrer un nombre de défenseurs');

  if EditNbMDef.Text = '' then
    nbMilDef := 0
  else if TryStrToInt(EditNbMDef.Text, nbMilDef) = false then
    raise Exception.Create('Veuillez entrer un nombre de milieux défensifs');

  if EditNbMil.Text = '' then
    nbMil := 0
  else if TryStrToInt(EditNbMil.Text, nbMil) = false then
    raise Exception.Create('Veuillez entrer un nombre de milieux');

  if EditNbMOff.Text = '' then
    nbMilOff := 0
  else if TryStrToInt(EditNbMOff.Text, nbMilOff) = false then
    raise Exception.Create('Veuillez entrer un nombre de milieux offensifs');

  if EditNbAtt.Text = '' then
    nbAtt := 0
  else if TryStrToInt(EditNbAtt.Text, nbAtt) = false then
    raise Exception.Create('Veuillez entrer un nombre d''attaquants');

  if EditNomTact.Text = '' then
    raise Exception.Create('Entrer le nom de votre tactique');

  if nbPlayer <> (1 + nbDef + nbAtt + nbMilDef + nbMilOff + nbMil) then
    raise Exception.Create
      ('Le nombre de joueurs n''est pas bon, pensez au gardien de but qui compte pour un joueur');

  Form6.ActiveTactic := TTactic.Create(EditNomTact.Text, nbPlayer,
    [nbDef, nbMilDef, nbMil, nbMilOff, nbAtt]);
  Form6.ActiveTactic.Save;
  Form6.Image1Resize(Sender);
  Form6.LabelTactique.Visible := true;
  Form6.LabelTactique.Text := EditNomTact.Text;
  Close();
end;

procedure TForm2.FormShow(Sender: TObject);
begin
  EditNbPlayer.Text := '';
  EditNbDef.Text := '';
  EditNbMDef.Text := '';
  EditNbMil.Text := '';
  EditNbMOff.Text := '';
  EditNbAtt.Text := '';
  EditNomTact.Text := '';
end;

procedure TForm2.SpeedButton1Click(Sender: TObject);
begin
  Close();
end;

end.
