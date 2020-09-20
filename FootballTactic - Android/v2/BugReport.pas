unit BugReport;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Objects, FMX.Controls.Presentation, FMX.ScrollBox, FMX.Memo,
  FMX.Helpers.Android, Androidapi.Helpers,
  Androidapi.JNIBridge,
  Androidapi.JNI.JavaTypes, Androidapi.JNI.app,
  Androidapi.JNI.GraphicsContentViewText;

type
  TForm11 = class(TForm)
    ToolBar2: TToolBar;
    Rectangle12: TRectangle;
    Label1: TLabel;
    SpeedButton1: TSpeedButton;
    Memo1: TMemo;
    Label2: TLabel;
    Button1: TButton;
    procedure SpeedButton1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Form11: TForm11;

implementation

{$R *.fmx}

procedure TForm11.Button1Click(Sender: TObject);
var
  Intent: JIntent;
  I: Integer;
  Recipients: TJavaObjectArray<JString>;
begin
  if Memo1.Lines.Count > 0 then
  begin
    Intent := TJIntent.JavaClass.init(TJIntent.JavaClass.ACTION_SEND);
    Recipients := TJavaObjectArray<JString>.Create(1);
    Recipients.Items[0] := StringToJString('marion@famfoot.fr');
    Intent.putExtra(TJIntent.JavaClass.EXTRA_EMAIL, Recipients);
    Intent.putExtra(TJIntent.JavaClass.EXTRA_SUBJECT, StringToJString('Bug Report'));
    for I := 0 to Memo1.Lines.Count - 1 do
      Intent.putExtra(TJIntent.JavaClass.EXTRA_TEXT, StringToJString(Memo1.Lines.Strings[I]));
    Intent.setType(StringToJString('message/rfc822'));
    SharedActivity.startActivity(TJIntent.JavaClass.createChooser(Intent,
      StrToJCharSequence('Quelle application mail?')));
  end;
end;

procedure TForm11.FormShow(Sender: TObject);
begin
  Memo1.Lines.Clear;
end;

procedure TForm11.SpeedButton1Click(Sender: TObject);
begin
  Close;
end;

end.
