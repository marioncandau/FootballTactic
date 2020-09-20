unit MainForm;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, System.Actions, FMX.ActnList, FMX.StdActns,
  FMX.MediaLibrary.Actions, FMX.Layouts, FMX.Objects, Tactic, IOUtils;

type

  TIntegerArray = array of Integer;

  TMainFormv2 = class(TForm)
    ToolBar1: TToolBar;
    SpeedButtonMenu: TSpeedButton;
    SpeedButtonShare: TSpeedButton;
    LabelTitreForm: TLabel;
    PanelRectangles: TPanel;
    Rectangle13: TRectangle;
    Image1: TImage;
    Rectangle1: TRectangle;
    Rect1: TRectangle;
    RectN1: TRectangle;
    RectName1: TRectangle;
    Name1: TText;
    RectR1_1: TRectangle;
    RectRemp1_1: TRectangle;
    Remp1_1: TText;
    RectR1_2: TRectangle;
    RectRemp1_2: TRectangle;
    Remp1_2: TText;
    RectR1_3: TRectangle;
    RectRemp1_3: TRectangle;
    Remp1_3: TText;
    Circle1: TCircle;
    Text1: TText;
    Rectangle10: TRectangle;
    Rect10: TRectangle;
    RectN10: TRectangle;
    RectName10: TRectangle;
    Name10: TText;
    RectR10_3: TRectangle;
    RectRemp10_3: TRectangle;
    Remp10_3: TText;
    RectR10_2: TRectangle;
    RectRemp10_2: TRectangle;
    Remp10_2: TText;
    RectR10_1: TRectangle;
    RectRemp10_1: TRectangle;
    Remp10_1: TText;
    Circle10: TCircle;
    Text10: TText;
    Rectangle11: TRectangle;
    Rect11: TRectangle;
    RectN11: TRectangle;
    RectName11: TRectangle;
    Name11: TText;
    RectR11_1: TRectangle;
    RectRemp11_1: TRectangle;
    Remp11_1: TText;
    RectR11_2: TRectangle;
    RectRemp11_2: TRectangle;
    Remp11_2: TText;
    RectR11_3: TRectangle;
    RectRemp11_3: TRectangle;
    Remp11_3: TText;
    Circle11: TCircle;
    Text11: TText;
    Rectangle2: TRectangle;
    Rect2: TRectangle;
    RectN2: TRectangle;
    RectName2: TRectangle;
    Name2: TText;
    RectR2_1: TRectangle;
    RectRemp2_1: TRectangle;
    Remp2_1: TText;
    RectR2_2: TRectangle;
    RectRemp2_2: TRectangle;
    Remp2_2: TText;
    RectR2_3: TRectangle;
    RectRemp2_3: TRectangle;
    Remp2_3: TText;
    Circle2: TCircle;
    Text2: TText;
    Rectangle3: TRectangle;
    Rect3: TRectangle;
    RectN3: TRectangle;
    RectName3: TRectangle;
    Name3: TText;
    RectR3_2: TRectangle;
    RectRemp3_2: TRectangle;
    Remp3_2: TText;
    RectR3_3: TRectangle;
    RectRemp3_3: TRectangle;
    Remp3_3: TText;
    RectR3_1: TRectangle;
    RectRemp3_1: TRectangle;
    Remp3_1: TText;
    Circle3: TCircle;
    Text3: TText;
    Rectangle4: TRectangle;
    Rect4: TRectangle;
    RectN4: TRectangle;
    RectName4: TRectangle;
    Name4: TText;
    RectR4_3: TRectangle;
    RectRemp4_3: TRectangle;
    Remp4_3: TText;
    RectR4_1: TRectangle;
    RectRemp4_1: TRectangle;
    Remp4_1: TText;
    RectR4_2: TRectangle;
    RectRemp4_2: TRectangle;
    Remp4_2: TText;
    Circle4: TCircle;
    Text4: TText;
    Rectangle5: TRectangle;
    Rect5: TRectangle;
    RectN5: TRectangle;
    RectName5: TRectangle;
    Name5: TText;
    RectR5_3: TRectangle;
    RectRemp5_3: TRectangle;
    Remp5_3: TText;
    RectR5_1: TRectangle;
    RectRemp5_1: TRectangle;
    Remp5_1: TText;
    RectR5_2: TRectangle;
    RectRemp5_2: TRectangle;
    Remp5_2: TText;
    Circle5: TCircle;
    Text5: TText;
    Rectangle6: TRectangle;
    Rect6: TRectangle;
    RectN6: TRectangle;
    RectName6: TRectangle;
    Name6: TText;
    RectR6_3: TRectangle;
    RectRemp6_3: TRectangle;
    Remp6_3: TText;
    RectR6_2: TRectangle;
    RectRemp6_2: TRectangle;
    Remp6_2: TText;
    RectR6_1: TRectangle;
    RectRemp6_1: TRectangle;
    Remp6_1: TText;
    Circle6: TCircle;
    Text6: TText;
    Rectangle7: TRectangle;
    Rect7: TRectangle;
    RectN7: TRectangle;
    RectName7: TRectangle;
    Name7: TText;
    RectR7_3: TRectangle;
    RectRemp7_3: TRectangle;
    Remp7_3: TText;
    RectR7_2: TRectangle;
    RectRemp7_2: TRectangle;
    Remp7_2: TText;
    RectR7_1: TRectangle;
    RectRemp7_1: TRectangle;
    Remp7_1: TText;
    Circle7: TCircle;
    Text7: TText;
    Rectangle8: TRectangle;
    Rect8: TRectangle;
    RectN8: TRectangle;
    RectName8: TRectangle;
    Name8: TText;
    RectR8_1: TRectangle;
    RectRemp8_1: TRectangle;
    Remp8_1: TText;
    RectR8_2: TRectangle;
    RectRemp8_2: TRectangle;
    Remp8_2: TText;
    RectR8_3: TRectangle;
    RectRemp8_3: TRectangle;
    Remp8_3: TText;
    Circle8: TCircle;
    Text8: TText;
    Rectangle9: TRectangle;
    Rect9: TRectangle;
    RectN9: TRectangle;
    RectName9: TRectangle;
    Name9: TText;
    RectR9_1: TRectangle;
    RectRemp9_1: TRectangle;
    Remp9_1: TText;
    RectR9_2: TRectangle;
    RectRemp9_2: TRectangle;
    Remp9_2: TText;
    RectR9_3: TRectangle;
    RectRemp9_3: TRectangle;
    Remp9_3: TText;
    Circle9: TCircle;
    Text9: TText;
    LabelTactique: TLabel;
    Layout1: TLayout;
    ActionList1: TActionList;
    ShowShareSheetAction1: TShowShareSheetAction;
    procedure Circle1Click(Sender: TObject);
    procedure Circle10Click(Sender: TObject);
    procedure Circle11Click(Sender: TObject);
    procedure Circle2Click(Sender: TObject);
    procedure Circle3Click(Sender: TObject);
    procedure Circle4Click(Sender: TObject);
    procedure Circle5Click(Sender: TObject);
    procedure Circle6Click(Sender: TObject);
    procedure Circle7Click(Sender: TObject);
    procedure Circle8Click(Sender: TObject);
    procedure Circle9Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Image1Resize(Sender: TObject);
    procedure ShowShareSheetAction1BeforeExecute(Sender: TObject);
    procedure SpeedButtonMenuClick(Sender: TObject);
  private
    procedure PlacePlayer(lbit: Integer; hbit: Integer; ImgX: Integer;
      ImgY: Integer);
    function InfoBitmap: TIntegerArray;
  public
    ActiveIndex: Integer;
    TabTactiques: array of TTactic;
    TabCircle: array of TCircle;
    TabText: array of TText;
    TabName: array of TText;
    TabRectName: array of TRectangle;
    TabRectangle: array of TRectangle;
    TabRemp1: array of TText;
    TabRemp2: array of TText;
    TabRemp3: array of TText;
    TabRectN: array of TRectangle;
    TabRectR1: array of TRectangle;
    TabRectR2: array of TRectangle;
    TabRectR3: array of TRectangle;
    TabRect: array of TRectangle;
    TabRectRemp1: array of TRectangle;
    TabRectRemp2: array of TRectangle;
    TabRectRemp3: array of TRectangle;

    ActiveTactic: TTactic;

    procedure LoadColor;
  end;

var
  MainFormv2: TMainFormv2;

implementation

uses AddTactic, SaveTactic, Player, ExportToPicture, EditTactic, Menu,
  ModifierJoueur;

{$R *.fmx}

procedure TMainFormv2.PlacePlayer(lbit: Integer; hbit: Integer; ImgX: Integer;
  ImgY: Integer);
var
  I: Integer;
  LBmp: TBitmap;
begin
  for I := 0 to 10 do
    TabRectangle[I].Visible := true;

  for I := 0 to 10 do
  begin
    if I < ActiveTactic.nbPlayer then
    begin
      TabRectangle[I].Width := Round(lbit * 10 / 100);
      TabCircle[I].Height := TabCircle[I].Width;
      TabText[I].Font.Size := Round(hbit * 2 / 100);
      if ActiveTactic.TabPlayer[I].Numero <> 0 then
        TabText[I].Text := IntToStr(ActiveTactic.TabPlayer[I].Numero)
      else
        TabText[I].Text := ActiveTactic.TabPlayer[I].Poste;

      TabRemp1[I].Font.Size := Round(hbit * 1.4 / 100);
      TabRemp2[I].Font.Size := Round(hbit * 1.4 / 100);
      TabRemp3[I].Font.Size := Round(hbit * 1.4 / 100);
      TabName[I].Font.Size := Round(hbit * 1.4 / 100);

      TabName[I].Text := '';
      TabRemp1[I].Text := '';
      TabRemp2[I].Text := '';
      TabRemp3[I].Text := '';

      if ActiveTactic.TabPlayer[I].Titulaire <> '' then
      begin
        TabRectN[I].Visible := true;
        TabName[I].Text := ActiveTactic.TabPlayer[I].Titulaire;
        if ActiveTactic.TabPlayer[I].Remp1 <> '' then
        begin
          TabRectR1[I].Visible := true;
          TabRemp1[I].Text := ActiveTactic.TabPlayer[I].Remp1;
          if ActiveTactic.TabPlayer[I].Remp2 <> '' then
          begin
            TabRectR2[I].Visible := true;
            TabRemp2[I].Text := ActiveTactic.TabPlayer[I].Remp2;
            if ActiveTactic.TabPlayer[I].Remp3 <> '' then
            begin
              TabRectR3[I].Visible := true;
              TabRemp3[I].Text := ActiveTactic.TabPlayer[I].Remp3;
            end
            else
            begin
              TabRectR3[I].Visible := false;
            end;
          end
          else
          begin
            TabRectR2[I].Visible := false;
            TabRectR3[I].Visible := false;
          end;
        end
        else
        begin
          TabRectR1[I].Visible := false;
          TabRectR2[I].Visible := false;
          TabRectR3[I].Visible := false;
        end;
      end
      else
      begin
        TabRectN[I].Visible := false;
        TabRectR1[I].Visible := false;
        TabRectR2[I].Visible := false;
        TabRectR3[I].Visible := false;
      end;
      Application.ProcessMessages;
      LBmp := TBitmap.Create(10, 10);
      LBmp.Canvas.Font.Size := TabName[I].Font.Size;
      TabRectName[I].Width :=
        Round(LBmp.Canvas.TextWidth(TabName[I].Text)) + 10;
      TabRectRemp1[I].Width :=
        Round(LBmp.Canvas.TextWidth(TabRemp1[I].Text)) + 10;
      TabRectRemp2[I].Width :=
        Round(LBmp.Canvas.TextWidth(TabRemp2[I].Text)) + 10;
      TabRectRemp3[I].Width :=
        Round(LBmp.Canvas.TextWidth(TabRemp3[I].Text)) + 10;

      TabRectName[I].Height :=
        Round(LBmp.Canvas.TextHeight(TabName[I].Text)) + 2;
      TabRectRemp1[I].Height :=
        Round(LBmp.Canvas.TextHeight(TabRemp1[I].Text)) + 2;
      TabRectRemp2[I].Height :=
        Round(LBmp.Canvas.TextHeight(TabRemp2[I].Text)) + 2;
      TabRectRemp3[I].Height :=
        Round(LBmp.Canvas.TextHeight(TabRemp3[I].Text)) + 2;
      LBmp.Free;

      TabRectN[I].Width := TabRectName[I].Width;
      TabRectR1[I].Width := TabRectRemp1[I].Width;
      TabRectR2[I].Width := TabRectRemp2[I].Width;
      TabRectR3[I].Width := TabRectRemp3[I].Width;

      TabRectN[I].Height := TabRectName[I].Height;
      TabRectR1[I].Height := TabRectRemp1[I].Height;
      TabRectR2[I].Height := TabRectRemp2[I].Height;
      TabRectR3[I].Height := TabRectRemp3[I].Height;

      TabRectangle[I].Height := Round(hbit * 10 / 100) + TabRectName[I].Height +
        TabRectRemp1[I].Height + TabRectRemp2[I].Height + TabRectRemp3
        [I].Height;

    end
    else
      TabRectangle[I].Visible := false;

    if TabRectangle[I].Visible = true then
    begin
      TabRectangle[I].Position.X :=
        Round(lbit * ActiveTactic.TabPlayer[I].PosLat / 100 + ImgX -
        TabCircle[I].Width / 2);
      TabRectangle[I].Position.Y :=
        Round(hbit * ActiveTactic.TabPlayer[I].PosLon / 100 + ImgY -
        TabCircle[I].Height / 2);
    end;
  end;

end;

procedure TMainFormv2.LoadColor;
var
 I: integer;
begin
  for I := 0 to ActiveTactic.nbPlayer - 1 do
  begin
    TabCircle[I].Fill.Color := TAlphaColor('#FF' + self.ActiveTactic.Color[0]);
    TabCircle[I].Stroke.Color := TAlphaColor('#FF' + self.ActiveTactic.Color[1]);
    TabText[I].Color := TAlphaColor('#FF' + self.ActiveTactic.Color[2]);
  end;
end;

procedure TMainFormv2.ShowShareSheetAction1BeforeExecute(Sender: TObject);
var
  Bmp: TBitmap;
begin
  Bmp := TBitmap.Create;
  Bmp := Layout1.MakeScreenshot;
  ShowShareSheetAction1.Bitmap.Assign(Bmp);
  Bmp.Free;
end;

procedure TMainFormv2.SpeedButtonMenuClick(Sender: TObject);
begin
  Form7.Show;
end;

procedure TMainFormv2.Circle10Click(Sender: TObject);
begin
  ActiveIndex := 9;
  Form9.Show;
end;

procedure TMainFormv2.Circle11Click(Sender: TObject);
begin
  ActiveIndex := 10;
  Form9.Show;
end;

procedure TMainFormv2.Circle1Click(Sender: TObject);
begin
  ActiveIndex := 0;
  Form9.Show;
end;

procedure TMainFormv2.Circle2Click(Sender: TObject);
begin
  ActiveIndex := 1;
  Form9.Show;
end;

procedure TMainFormv2.Circle3Click(Sender: TObject);
begin
  ActiveIndex := 2;
  Form9.Show;
end;

procedure TMainFormv2.Circle4Click(Sender: TObject);
begin
  ActiveIndex := 3;
  Form9.Show;
end;

procedure TMainFormv2.Circle5Click(Sender: TObject);
begin
  ActiveIndex := 4;
  Form9.Show;
end;

procedure TMainFormv2.Circle6Click(Sender: TObject);
begin
  ActiveIndex := 5;
  Form9.Show;
end;

procedure TMainFormv2.Circle7Click(Sender: TObject);
begin
  ActiveIndex := 6;
  Form9.Show;
end;

procedure TMainFormv2.Circle8Click(Sender: TObject);
begin
  ActiveIndex := 7;
  Form9.Show;
end;

procedure TMainFormv2.Circle9Click(Sender: TObject);
begin
  ActiveIndex := 8;
  Form9.Show;
end;

procedure TMainFormv2.FormCreate(Sender: TObject);
var
  I: Integer;
begin
  if DirectoryExists(TPath.GetDocumentsPath + '/FootballTactic') = false then
    CreateDir(TPath.GetDocumentsPath + '/FootballTactic');

  SetLength(TabCircle, 11);
  TabCircle[0] := Circle1;
  TabCircle[1] := Circle2;
  TabCircle[2] := Circle3;
  TabCircle[3] := Circle4;
  TabCircle[4] := Circle5;
  TabCircle[5] := Circle6;
  TabCircle[6] := Circle7;
  TabCircle[7] := Circle8;
  TabCircle[8] := Circle9;
  TabCircle[9] := Circle10;
  TabCircle[10] := Circle11;

  SetLength(TabRectangle, 11);
  TabRectangle[0] := Rectangle1;
  TabRectangle[1] := Rectangle2;
  TabRectangle[2] := Rectangle3;
  TabRectangle[3] := Rectangle4;
  TabRectangle[4] := Rectangle5;
  TabRectangle[5] := Rectangle6;
  TabRectangle[6] := Rectangle7;
  TabRectangle[7] := Rectangle8;
  TabRectangle[8] := Rectangle9;
  TabRectangle[9] := Rectangle10;
  TabRectangle[10] := Rectangle11;

  SetLength(TabRect, 11);
  TabRect[0] := Rect1;
  TabRect[1] := Rect2;
  TabRect[2] := Rect3;
  TabRect[3] := Rect4;
  TabRect[4] := Rect5;
  TabRect[5] := Rect6;
  TabRect[6] := Rect7;
  TabRect[7] := Rect8;
  TabRect[8] := Rect9;
  TabRect[9] := Rect10;
  TabRect[10] := Rect11;

  SetLength(TabText, 11);
  TabText[0] := Text1;
  TabText[1] := Text2;
  TabText[2] := Text3;
  TabText[3] := Text4;
  TabText[4] := Text5;
  TabText[5] := Text6;
  TabText[6] := Text7;
  TabText[7] := Text8;
  TabText[8] := Text9;
  TabText[9] := Text10;
  TabText[10] := Text11;

  SetLength(TabName, 11);
  TabName[0] := Name1;
  TabName[1] := Name2;
  TabName[2] := Name3;
  TabName[3] := Name4;
  TabName[4] := Name5;
  TabName[5] := Name6;
  TabName[6] := Name7;
  TabName[7] := Name8;
  TabName[8] := Name9;
  TabName[9] := Name10;
  TabName[10] := Name11;

  SetLength(TabRectN, 11);
  TabRectN[0] := RectN1;
  TabRectN[1] := RectN2;
  TabRectN[2] := RectN3;
  TabRectN[3] := RectN4;
  TabRectN[4] := RectN5;
  TabRectN[5] := RectN6;
  TabRectN[6] := RectN7;
  TabRectN[7] := RectN8;
  TabRectN[8] := RectN9;
  TabRectN[9] := RectN10;
  TabRectN[10] := RectN11;

  SetLength(TabRectR1, 11);
  TabRectR1[0] := RectR1_1;
  TabRectR1[1] := RectR2_1;
  TabRectR1[2] := RectR3_1;
  TabRectR1[3] := RectR4_1;
  TabRectR1[4] := RectR5_1;
  TabRectR1[5] := RectR6_1;
  TabRectR1[6] := RectR7_1;
  TabRectR1[7] := RectR8_1;
  TabRectR1[8] := RectR9_1;
  TabRectR1[9] := RectR10_1;
  TabRectR1[10] := RectR11_1;

  SetLength(TabRectR2, 11);
  TabRectR2[0] := RectR1_2;
  TabRectR2[1] := RectR2_2;
  TabRectR2[2] := RectR3_2;
  TabRectR2[3] := RectR4_2;
  TabRectR2[4] := RectR5_2;
  TabRectR2[5] := RectR6_2;
  TabRectR2[6] := RectR7_2;
  TabRectR2[7] := RectR8_2;
  TabRectR2[8] := RectR9_2;
  TabRectR2[9] := RectR10_2;
  TabRectR2[10] := RectR11_2;

  SetLength(TabRectR3, 11);
  TabRectR3[0] := RectR1_3;
  TabRectR3[1] := RectR2_3;
  TabRectR3[2] := RectR3_3;
  TabRectR3[3] := RectR4_3;
  TabRectR3[4] := RectR5_3;
  TabRectR3[5] := RectR6_3;
  TabRectR3[6] := RectR7_3;
  TabRectR3[7] := RectR8_3;
  TabRectR3[8] := RectR9_3;
  TabRectR3[9] := RectR10_3;
  TabRectR3[10] := RectR11_3;

  SetLength(TabRectName, 11);
  TabRectName[0] := RectName1;
  TabRectName[1] := RectName2;
  TabRectName[2] := RectName3;
  TabRectName[3] := RectName4;
  TabRectName[4] := RectName5;
  TabRectName[5] := RectName6;
  TabRectName[6] := RectName7;
  TabRectName[7] := RectName8;
  TabRectName[8] := RectName9;
  TabRectName[9] := RectName10;
  TabRectName[10] := RectName11;

  SetLength(TabRectRemp1, 11);
  TabRectRemp1[0] := RectRemp1_1;
  TabRectRemp1[1] := RectRemp2_1;
  TabRectRemp1[2] := RectRemp3_1;
  TabRectRemp1[3] := RectRemp4_1;
  TabRectRemp1[4] := RectRemp5_1;
  TabRectRemp1[5] := RectRemp6_1;
  TabRectRemp1[6] := RectRemp7_1;
  TabRectRemp1[7] := RectRemp8_1;
  TabRectRemp1[8] := RectRemp9_1;
  TabRectRemp1[9] := RectRemp10_1;
  TabRectRemp1[10] := RectRemp11_1;

  SetLength(TabRectRemp2, 11);
  TabRectRemp2[0] := RectRemp1_2;
  TabRectRemp2[1] := RectRemp2_2;
  TabRectRemp2[2] := RectRemp3_2;
  TabRectRemp2[3] := RectRemp4_2;
  TabRectRemp2[4] := RectRemp5_2;
  TabRectRemp2[5] := RectRemp6_2;
  TabRectRemp2[6] := RectRemp7_2;
  TabRectRemp2[7] := RectRemp8_2;
  TabRectRemp2[8] := RectRemp9_2;
  TabRectRemp2[9] := RectRemp10_2;
  TabRectRemp2[10] := RectRemp11_2;

  SetLength(TabRectRemp3, 11);
  TabRectRemp3[0] := RectRemp1_3;
  TabRectRemp3[1] := RectRemp2_3;
  TabRectRemp3[2] := RectRemp3_3;
  TabRectRemp3[3] := RectRemp4_3;
  TabRectRemp3[4] := RectRemp5_3;
  TabRectRemp3[5] := RectRemp6_3;
  TabRectRemp3[6] := RectRemp7_3;
  TabRectRemp3[7] := RectRemp8_3;
  TabRectRemp3[8] := RectRemp9_3;
  TabRectRemp3[9] := RectRemp10_3;
  TabRectRemp3[10] := RectRemp11_3;

  SetLength(TabRemp1, 11);
  TabRemp1[0] := Remp1_1;
  TabRemp1[1] := Remp2_1;
  TabRemp1[2] := Remp3_1;
  TabRemp1[3] := Remp4_1;
  TabRemp1[4] := Remp5_1;
  TabRemp1[5] := Remp6_1;
  TabRemp1[6] := Remp7_1;
  TabRemp1[7] := Remp8_1;
  TabRemp1[8] := Remp9_1;
  TabRemp1[9] := Remp10_1;
  TabRemp1[10] := Remp11_1;

  SetLength(TabRemp2, 11);
  TabRemp2[0] := Remp1_2;
  TabRemp2[1] := Remp2_2;
  TabRemp2[2] := Remp3_2;
  TabRemp2[3] := Remp4_2;
  TabRemp2[4] := Remp5_2;
  TabRemp2[5] := Remp6_2;
  TabRemp2[6] := Remp7_2;
  TabRemp2[7] := Remp8_2;
  TabRemp2[8] := Remp9_2;
  TabRemp2[9] := Remp10_2;
  TabRemp2[10] := Remp11_2;

  SetLength(TabRemp3, 11);
  TabRemp3[0] := Remp1_3;
  TabRemp3[1] := Remp2_3;
  TabRemp3[2] := Remp3_3;
  TabRemp3[3] := Remp4_3;
  TabRemp3[4] := Remp5_3;
  TabRemp3[5] := Remp6_3;
  TabRemp3[6] := Remp7_3;
  TabRemp3[7] := Remp8_3;
  TabRemp3[8] := Remp9_3;
  TabRemp3[9] := Remp10_3;
  TabRemp3[10] := Remp11_3;

  ActiveTactic := nil;

  for I := 0 to 10 do
    TabRectangle[I].Visible := false;

  LabelTactique.Visible := false;
end;

procedure TMainFormv2.FormDestroy(Sender: TObject);
begin
  if Assigned(ActiveTactic) then
    ActiveTactic.Save;
end;

procedure TMainFormv2.Image1Resize(Sender: TObject);
var
  t: TIntegerArray;
  ImgX, ImgY: Integer;
  lbit, hbit: Integer;
begin
  SetLength(t, 4);
  t := InfoBitmap;
  lbit := t[0];
  hbit := t[1];
  ImgX := t[2];
  ImgY := t[3];

  if Assigned(ActiveTactic) then
    PlacePlayer(lbit, hbit, ImgX, ImgY);
end;

function TMainFormv2.InfoBitmap: TIntegerArray;
var
  ImgX, ImgY: Integer;
  lbit, hbit: Integer;
begin
  if Assigned(Image1.Bitmap) then // is there an image assigned?
  begin
    if Image1.Width > 351 then
    begin
      lbit := Round((Image1.Height * Image1.Bitmap.Width) /
        Image1.Bitmap.Height);
      hbit := Round(Image1.Height);
      ImgX := (Round(Image1.Width) - lbit) div 2;
      ImgY := 0;
    end
    else
    begin
      lbit := Round(Image1.Width);
      hbit := Round((Image1.Width * Image1.Bitmap.Height) /
        Image1.Bitmap.Width);
      ImgY := (Round(Image1.Height) - hbit) div 2;
      ImgX := 0;
    end;
    Result := [lbit, hbit, ImgX, ImgY];
  end
  else
    Result := nil;

end;

end.
