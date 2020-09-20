unit EditTactic;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Edit, FMX.Controls.Presentation;

type
  TForm5 = class(TForm)
    Panel1: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Panel2: TPanel;
    EditNbDef: TEdit;
    EditNbMDef: TEdit;
    EditNbMil: TEdit;
    EditNbMOff: TEdit;
    ButtonOK: TButton;
    EditNbAtt: TEdit;
    procedure ButtonOKClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
  public
    { Déclarations publiques }
  end;

var
  Form5: TForm5;

implementation

uses Main, System.IOUtils;

{$R *.fmx}

procedure TForm5.ButtonOKClick(Sender: TObject);
var
  nbDef, nbMil, nbMilDef, nbMilOff, nbAtt: Integer;
begin
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

  Form1.ActiveTactic.Edit([nbDef, nbMilDef, nbMil, nbMilOff, nbAtt]);
  Form1.ActiveTactic.Save;
  Form1.Image1Resize(Sender);
  Close();
end;

procedure TForm5.FormShow(Sender: TObject);
begin
  EditNbDef.Text := IntToStr(Form1.ActiveTactic.Postes[0]);
  EditNbMDef.Text := IntToStr(Form1.ActiveTactic.Postes[1]);
  EditNbMil.Text := IntToStr(Form1.ActiveTactic.Postes[2]);
  EditNbMOff.Text := IntToStr(Form1.ActiveTactic.Postes[3]);
  EditNbAtt.Text := IntToStr(Form1.ActiveTactic.Postes[4]);
end;

end.
