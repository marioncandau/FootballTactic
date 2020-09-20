unit SaveTactic;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Edit, System.IOUtils,
  FMX.ListBox;

type
  TForm3 = class(TForm)
    Button1: TButton;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    EditNomFichier: TEdit;
    Panel1: TPanel;
    EditNomDossier: TEdit;
    SpeedButton1: TSpeedButton;
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Form3: TForm3;

implementation

uses MainForm;

{$R *.fmx}

procedure TForm3.Button1Click(Sender: TObject);
begin
  if EditNomFichier.Text = '' then
    raise Exception.Create('Entrez un nom de fichier');

  MainFormv2.ActiveTactic.Export(EditNomDossier.Text + '\\' + EditNomFichier.Text
    + '.tac');
  Close();
end;

procedure TForm3.FormShow(Sender: TObject);
begin
  EditNomDossier.Text := '';
  EditNomFichier.Text := '';
end;

procedure TForm3.SpeedButton1Click(Sender: TObject);
var
  res: String;
begin
  if SelectDirectory('Sélectionnez un dossier',
    System.IOUtils.TPath.GetDocumentsPath, res) then
    EditNomDossier.Text := res;
end;

end.
