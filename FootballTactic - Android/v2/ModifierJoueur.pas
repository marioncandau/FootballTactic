unit ModifierJoueur;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Objects, FMX.Controls.Presentation, FMX.ScrollBox, FMX.Memo, FMX.Edit;

type
  TForm9 = class(TForm)
    ToolBar2: TToolBar;
    Rectangle12: TRectangle;
    Label1: TLabel;
    SpeedButton1: TSpeedButton;
    PanelModifierJoueur: TPanel;
    LabelNumero: TLabel;
    EditNumero: TEdit;
    LabelPoste: TLabel;
    EditPoste: TEdit;
    LabelNom: TLabel;
    LabelRemplacants: TLabel;
    MemoRemplacants: TMemo;
    ButtonModifierJoueur: TButton;
    EditNom: TEdit;
    Panel1: TPanel;
    Panel2: TPanel;
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ButtonModifierJoueurClick(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Form9: TForm9;

implementation

uses MainForm;

{$R *.fmx}

procedure TForm9.ButtonModifierJoueurClick(Sender: TObject);
var
  num, I, activeIndex: Integer;
  LBmp: TBitmap;
begin
  activeIndex := MainFormv2.activeIndex;
  if EditNumero.Text <> '' then
  begin
    if TryStrToInt(EditNumero.Text, num) = false then
      raise Exception.Create('Entrez un numéro');
    MainFormv2.TabText[MainFormv2.activeIndex].Text := EditNumero.Text;
    MainFormv2.ActiveTactic.TabPlayer[MainFormv2.activeIndex].Numero := num;
  end
  else
  begin
    MainFormv2.TabText[MainFormv2.activeIndex].Text := EditPoste.Text;
    MainFormv2.ActiveTactic.TabPlayer[MainFormv2.activeIndex].Poste := EditPoste.Text;
  end;

  MainFormv2.TabRectR3[activeIndex].Visible := false;
  MainFormv2.TabRectR2[activeIndex].Visible := false;
  MainFormv2.TabRectR1[activeIndex].Visible := false;
  MainFormv2.TabRectN[activeIndex].Visible := false;

  MainFormv2.TabName[activeIndex].Text := EditNom.Text;
  MainFormv2.ActiveTactic.TabPlayer[activeIndex].Titulaire := EditNom.Text;

  LBmp := TBitmap.Create(10, 10);
  LBmp.Canvas.Font.Size := MainFormv2.TabName[activeIndex].Font.Size;

  MainFormv2.TabRectName[activeIndex].Width :=
    LBmp.Canvas.TextWidth(MainFormv2.TabName[activeIndex].Text) + 10;
  MainFormv2.TabRectName[activeIndex].Height :=
    Round(LBmp.Canvas.TextHeight(MainFormv2.TabName[activeIndex].Text)) + 2;
  MainFormv2.TabRectN[activeIndex].Width := MainFormv2.TabRectName[activeIndex].Width;
  MainFormv2.TabRectN[activeIndex].Height := MainFormv2.TabRectName[activeIndex].Height;

  if MainFormv2.TabName[activeIndex].Text <> '' then
  begin
    if MemoRemplacants.Lines.Count > 2 then
      raise Exception.Create('On ne peut mettre que 2 remplaçants maximum');

    for I := 0 to MemoRemplacants.Lines.Count - 1 do
    begin
      if MemoRemplacants.Lines.Strings[I] <> '' then
      begin
        if I = 0 then
        begin
          MainFormv2.TabRemp1[activeIndex].Text := MemoRemplacants.Lines.Strings[I];
          MainFormv2.ActiveTactic.TabPlayer[activeIndex].Remp1 :=
            MemoRemplacants.Lines.Strings[I];
          MainFormv2.TabRectRemp1[activeIndex].Width :=
            LBmp.Canvas.TextWidth(MainFormv2.TabRemp1[activeIndex].Text) + 10;
          MainFormv2.TabRectRemp1[activeIndex].Height :=
            Round(LBmp.Canvas.TextHeight(MainFormv2.TabRemp1[activeIndex].Text)) + 2;
          MainFormv2.TabRectR1[activeIndex].Width := MainFormv2.TabRectRemp1
            [activeIndex].Width;
          MainFormv2.TabRectR1[activeIndex].Height := MainFormv2.TabRectRemp1
            [activeIndex].Height;

        end
        else if I = 1 then
        begin
          MainFormv2.TabRemp2[activeIndex].Text := MemoRemplacants.Lines.Strings[I];
          MainFormv2.ActiveTactic.TabPlayer[activeIndex].Remp2 :=
            MemoRemplacants.Lines.Strings[I];
          MainFormv2.TabRectRemp2[activeIndex].Width :=
            LBmp.Canvas.TextWidth(MainFormv2.TabRemp2[activeIndex].Text) + 10;
          MainFormv2.TabRectRemp2[activeIndex].Height :=
            Round(LBmp.Canvas.TextHeight(MainFormv2.TabRemp2[activeIndex].Text)) + 2;
          MainFormv2.TabRectR2[activeIndex].Width := MainFormv2.TabRectRemp2
            [activeIndex].Width;
          MainFormv2.TabRectR2[activeIndex].Height := MainFormv2.TabRectRemp2
            [activeIndex].Height;
        end
        else
        begin
          MainFormv2.TabRemp3[activeIndex].Text := MemoRemplacants.Lines.Strings[I];
          MainFormv2.ActiveTactic.TabPlayer[activeIndex].Remp3 :=
            MemoRemplacants.Lines.Strings[I];
          MainFormv2.TabRectRemp3[activeIndex].Width :=
            LBmp.Canvas.TextWidth(MainFormv2.TabRemp3[activeIndex].Text) + 10;
          MainFormv2.TabRectRemp3[activeIndex].Height :=
            Round(LBmp.Canvas.TextHeight(MainFormv2.TabRemp3[activeIndex].Text)) + 2;
          MainFormv2.TabRectR3[activeIndex].Width := MainFormv2.TabRectRemp3
            [activeIndex].Width;
          MainFormv2.TabRectR3[activeIndex].Height := MainFormv2.TabRectRemp3
            [activeIndex].Height;
        end;
      end
      else
      begin
        MainFormv2.TabRemp1[activeIndex].Text := '';
        MainFormv2.TabRemp2[activeIndex].Text := '';
        MainFormv2.TabRemp3[activeIndex].Text := '';
        MainFormv2.ActiveTactic.TabPlayer[activeIndex].Remp1 := '';
        MainFormv2.ActiveTactic.TabPlayer[activeIndex].Remp2 := '';
        MainFormv2.ActiveTactic.TabPlayer[activeIndex].Remp3 := '';
      end;
    end;
    MainFormv2.TabRectN[activeIndex].Visible := true;
    if (MemoRemplacants.Lines.Count = 1) and
      (MemoRemplacants.Lines.Strings[0] <> '') then
      MainFormv2.TabRectR1[activeIndex].Visible := true
    else if (MemoRemplacants.Lines.Count = 2) and
      (MemoRemplacants.Lines.Strings[1] = '') then
      MainFormv2.TabRectR1[activeIndex].Visible := true
    else if (MemoRemplacants.Lines.Count = 2) and
      (MemoRemplacants.Lines.Strings[1] <> '') then
    begin
      MainFormv2.TabRectR2[activeIndex].Visible := true;
      MainFormv2.TabRectR1[activeIndex].Visible := true;
    end
    else if (MemoRemplacants.Lines.Count = 3) and
      (MemoRemplacants.Lines.Strings[2] = '') then
    begin
      MainFormv2.TabRectR2[activeIndex].Visible := true;
      MainFormv2.TabRectR1[activeIndex].Visible := true;
    end
    else if (MemoRemplacants.Lines.Count = 3) and
      (MemoRemplacants.Lines.Strings[2] <> '') then
    begin
      MainFormv2.TabRectR3[activeIndex].Visible := true;
      MainFormv2.TabRectR2[activeIndex].Visible := true;
      MainFormv2.TabRectR1[activeIndex].Visible := true;
    end;

  end;
  MainFormv2.ActiveTactic.Save;
  Close();
end;

procedure TForm9.FormShow(Sender: TObject);
var
  I: Integer;
begin
  EditNumero.Text := '';
  if TryStrToInt(MainFormv2.TabText[MainFormv2.activeIndex].Text, I) = true then
  begin
    EditNumero.Text := MainFormv2.TabText[MainFormv2.activeIndex].Text;
    EditPoste.Text := MainFormv2.ActiveTactic.TabPlayer[MainFormv2.activeIndex].Poste;
  end
  else
  begin
    EditPoste.Text := MainFormv2.TabText[MainFormv2.activeIndex].Text;
    if MainFormv2.ActiveTactic.TabPlayer[MainFormv2.activeIndex].Numero <> 0 then
      EditNumero.Text :=
        IntToStr(MainFormv2.ActiveTactic.TabPlayer[MainFormv2.activeIndex].Numero);
  end;
  EditNom.Text := MainFormv2.TabName[MainFormv2.activeIndex].Text;
  MemoRemplacants.Lines.Clear;
  if MainFormv2.TabRemp1[MainFormv2.activeIndex].Text <> '' then
    MemoRemplacants.Lines.Add(MainFormv2.TabRemp1[MainFormv2.activeIndex].Text);
  if MainFormv2.TabRemp2[MainFormv2.activeIndex].Text <> '' then
    MemoRemplacants.Lines.Add(MainFormv2.TabRemp2[MainFormv2.activeIndex].Text);
  if MainFormv2.TabRemp3[MainFormv2.activeIndex].Text <> '' then
    MemoRemplacants.Lines.Add(MainFormv2.TabRemp3[MainFormv2.activeIndex].Text);
end;

procedure TForm9.SpeedButton1Click(Sender: TObject);
begin
  Close();
end;

end.
