unit ExportToPicture;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.ScrollBox, FMX.Memo, FMX.Edit, FMX.Controls.Presentation;

type
  TForm4 = class(TForm)
    ButtonExporter: TButton;
    Label3: TLabel;
    EditNomDossier: TEdit;
    SpeedButton1: TSpeedButton;
    Label4: TLabel;
    EditNomFichier: TEdit;
    Panel1: TPanel;
    OpenDialog1: TOpenDialog;
    procedure ButtonExporterClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Form4: TForm4;

implementation

{$R *.fmx}

uses MainForm, System.IOUtils;

procedure TForm4.ButtonExporterClick(Sender: TObject);
var
  Bmp: TBitmap;
  filepath: string;
begin
  if EditNomFichier.Text = '' then
    raise Exception.Create('Entrez un nom de fichier');
  Bmp := TBitmap.Create;
  Bmp := Form6.Layout1.MakeScreenshot;

  if Pos('.', EditNomFichier.Text) = 0 then
    EditNomFichier.Text := EditNomFichier.Text + '.jpg';
  filepath := EditNomDossier.Text + '/' + EditNomFichier.Text;
  Bmp.SaveToFile(filepath);
  Bmp.Free;
  Close;
end;

procedure TForm4.FormShow(Sender: TObject);
begin
  EditNomDossier.Text := '';
  EditNomFichier.Text := '';
end;

procedure TForm4.SpeedButton1Click(Sender: TObject);
var
  res: String;
begin
  if SelectDirectory('Sélectionnez un dossier',
    System.IOUtils.TPath.GetDocumentsPath, res) then
    EditNomDossier.Text := res;
end;

end.
