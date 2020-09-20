unit AddTactic;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Edit, FMX.Controls.Presentation, System.IOUtils;

type
  TForm2 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Panel1: TPanel;
    Label6: TLabel;
    Panel2: TPanel;
    EditNbPlayer: TEdit;
    EditNbDef: TEdit;
    EditNbMDef: TEdit;
    EditNbMil: TEdit;
    EditNbMOff: TEdit;
    EditNomTact: TEdit;
    ButtonOK: TButton;
    Label7: TLabel;
    EditNbAtt: TEdit;
    procedure ButtonOKClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Déclarations privées }
  public

  end;

var
  Form2: TForm2;

implementation

{$R *.fmx}

uses Main, Tactic;

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
    raise Exception.Create('Le nombre de joueurs n''est pas bon');

  Form1.ActiveTactic := TTactic.Create(EditNomTact.Text, nbPlayer, [nbDef, nbMilDef, nbMil,
    nbMilOff, nbAtt]);
  Form1.ActiveTactic.Save;
  Form1.Image1Resize(Sender);
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

end.
