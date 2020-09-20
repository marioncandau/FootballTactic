unit ChangeColor;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Objects, FMX.Controls.Presentation, FMX.Colors;

type
  TForm10 = class(TForm)
    ToolBar2: TToolBar;
    Rectangle12: TRectangle;
    Label1: TLabel;
    SpeedButton1: TSpeedButton;
    PanelCouleurs: TPanel;
    ColorButton1: TColorButton;
    ColorButton2: TColorButton;
    ColorButton3: TColorButton;
    ColorPanel1: TColorPanel;
    ColorPanel2: TColorPanel;
    ColorPanel3: TColorPanel;
    ButtonOK: TButton;
    CircleExemple: TCircle;
    TextExemple: TText;
    procedure FormShow(Sender: TObject);
    procedure ColorButton1Click(Sender: TObject);
    procedure ColorButton2Click(Sender: TObject);
    procedure ColorButton3Click(Sender: TObject);
    procedure ColorPanel1Change(Sender: TObject);
    procedure ColorPanel2Change(Sender: TObject);
    procedure ColorPanel3Change(Sender: TObject);
    procedure ButtonOKClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    function ColorToString(tc: TColor): string;
  public
    { Déclarations publiques }
  end;

var
  Form10: TForm10;

implementation

{$R *.fmx}

uses MainForm;

procedure TForm10.ButtonOKClick(Sender: TObject);
begin
  Close();
end;

procedure TForm10.ColorButton1Click(Sender: TObject);
begin
  if ColorPanel1.Visible = true then
    ColorPanel1.Visible := false
  else
  begin
    ColorPanel1.Visible := true;
    ColorPanel2.Visible := false;
    ColorPanel3.Visible := false;
  end;
end;

procedure TForm10.ColorButton2Click(Sender: TObject);
begin
  if ColorPanel2.Visible = true then
    ColorPanel2.Visible := false
  else
  begin
    ColorPanel2.Visible := true;
    ColorPanel1.Visible := false;
    ColorPanel3.Visible := false;
  end;
end;

procedure TForm10.ColorButton3Click(Sender: TObject);
begin
  if ColorPanel3.Visible = true then
    ColorPanel3.Visible := false
  else
  begin
    ColorPanel3.Visible := true;
    ColorPanel1.Visible := false;
    ColorPanel2.Visible := false;
  end;
end;

procedure TForm10.ColorPanel1Change(Sender: TObject);
var
  I: Integer;
begin
  for I := 0 to 10 do
    Form6.TabCircle[I].Fill.Color := ColorPanel1.Color;

  ColorButton1.Color := ColorPanel1.Color;
  if Assigned(Form6.ActiveTactic) then
    Form6.ActiveTactic.Color[0] := ColorToString(ColorPanel1.Color);
  CircleExemple.Fill.Color := ColorPanel1.Color;

end;

procedure TForm10.ColorPanel2Change(Sender: TObject);
var
  I: Integer;
begin
  for I := 0 to 10 do
    Form6.TabCircle[I].Stroke.Color := ColorPanel2.Color;

  ColorButton2.Color := ColorPanel2.Color;
  if Assigned(Form6.ActiveTactic) then
    Form6.ActiveTactic.Color[1] := ColorToString(ColorPanel2.Color);
  CircleExemple.Stroke.Color := ColorPanel2.Color;
end;

procedure TForm10.ColorPanel3Change(Sender: TObject);
var
  I: Integer;
begin
  for I := 0 to 10 do
    Form6.TabText[I].Color := ColorPanel3.Color;

  ColorButton3.Color := ColorPanel3.Color;
  if Assigned(Form6.ActiveTactic) then
    Form6.ActiveTactic.Color[2] := ColorToString(ColorPanel3.Color);
  TextExemple.Color := ColorPanel3.Color;
end;

function TForm10.ColorToString(tc: TColor): string;
begin
  Result := IntToHex(TAlphaColorRec(tc).R, 2) + IntToHex(TAlphaColorRec(tc).G,
    2) + IntToHex(TAlphaColorRec(tc).B, 2);
end;

procedure TForm10.FormShow(Sender: TObject);
begin
  ColorPanel1.Visible := true;
  ColorPanel2.Visible := false;
  ColorPanel3.Visible := false;
  ColorButton1.Color := Form6.Circle1.Fill.Color;
  ColorButton2.Color := Form6.Circle1.Stroke.Color;
  ColorButton3.Color := Form6.Text1.Color;
  CircleExemple.Fill.Color := ColorButton1.Color;
  CircleExemple.Stroke.Color := ColorButton2.Color;
  TextExemple.Color := ColorButton3.Color;
end;

procedure TForm10.SpeedButton1Click(Sender: TObject);
begin
  Close;
end;

end.
