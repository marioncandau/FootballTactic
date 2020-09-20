unit APropos;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Objects, FMX.Controls.Presentation, FMX.ScrollBox, FMX.Memo;

type
  TForm12 = class(TForm)
    ToolBar2: TToolBar;
    Rectangle12: TRectangle;
    Label1: TLabel;
    SpeedButton1: TSpeedButton;
    Memo1: TMemo;
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Form12: TForm12;

implementation

{$R *.fmx}

procedure TForm12.SpeedButton1Click(Sender: TObject);
begin
  Close;
end;

end.
