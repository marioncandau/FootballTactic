unit DeleteTactic;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Objects, FMX.Controls.Presentation, FMX.Layouts, FMX.ListBox, Posix.Unistd;

type
  TForm1 = class(TForm)
    ToolBar2: TToolBar;
    Rectangle12: TRectangle;
    Label1: TLabel;
    SpeedButton1: TSpeedButton;
    ListBox1: TListBox;
    Button1: TButton;
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

uses System.IOUtils;

procedure TForm1.Button1Click(Sender: TObject);
var
  I: Integer;
begin
  for I := 0 to ListBox1.Items.Count - 1 do
  begin
    if ListBox1.ListItems[I].isSelected = true then
      DeleteFile(TPath.GetDocumentsPath + '/FootballTactic/' +
        ListBox1.Items.Strings[I]);
  end;
  Close;
end;

procedure TForm1.FormShow(Sender: TObject);
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

procedure TForm1.SpeedButton1Click(Sender: TObject);
begin
  Close;
end;

end.
