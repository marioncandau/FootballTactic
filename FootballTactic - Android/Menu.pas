unit Menu;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Objects, System.Actions, FMX.ActnList,
  FMX.StdActns, FMX.MediaLibrary.Actions;

type
  TForm7 = class(TForm)
    SpeedButton1: TSpeedButton;
    ToolBar2: TToolBar;
    Rectangle12: TRectangle;
    Label1: TLabel;
    Rectangle1: TRectangle;
    Label2: TLabel;
    Rectangle2: TRectangle;
    Label3: TLabel;
    Rectangle3: TRectangle;
    Label4: TLabel;
    Rectangle5: TRectangle;
    Label6: TLabel;
    Rectangle6: TRectangle;
    Label7: TLabel;
    Rectangle4: TRectangle;
    Label5: TLabel;
    Rectangle7: TRectangle;
    Label8: TLabel;
    procedure SpeedButton1Click(Sender: TObject);
    procedure Rectangle1Click(Sender: TObject);
    procedure Label6Click(Sender: TObject);
    procedure Label4Click(Sender: TObject);
    procedure Label3Click(Sender: TObject);
    procedure Label7Click(Sender: TObject);
    procedure Label5Click(Sender: TObject);
    procedure Label8Click(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Form7: TForm7;

implementation

{$R *.fmx}

uses AddTactic, OpenTactic, ChangeColor, EditTactic, DeleteTactic, MainForm,
  BugReport, APropos;

procedure TForm7.Label3Click(Sender: TObject);
begin
  Form5.Show;
  Close;
end;

procedure TForm7.Label4Click(Sender: TObject);
begin
  Form10.Show;
  Close;
end;

procedure TForm7.Label5Click(Sender: TObject);
begin
  Form11.Show;
  Close;
end;

procedure TForm7.Label6Click(Sender: TObject);
begin
  Form8.Show;
  Close;
end;

procedure TForm7.Label7Click(Sender: TObject);
begin
  Form1.Show;
  Close;
end;

procedure TForm7.Label8Click(Sender: TObject);
begin
  Form12.Show;
  Close;
end;

procedure TForm7.Rectangle1Click(Sender: TObject);
begin
  Form2.Show;
  Close;
end;

procedure TForm7.SpeedButton1Click(Sender: TObject);
begin
  Close;
end;

end.
