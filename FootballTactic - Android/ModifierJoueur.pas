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
  activeIndex := Form6.activeIndex;
  if EditNumero.Text <> '' then
  begin
    if TryStrToInt(EditNumero.Text, num) = false then
      raise Exception.Create('Entrez un numéro');
    Form6.TabText[Form6.activeIndex].Text := EditNumero.Text;
    Form6.ActiveTactic.TabPlayer[Form6.activeIndex].Numero := num;
  end
  else
  begin
    Form6.TabText[Form6.activeIndex].Text := EditPoste.Text;
    Form6.ActiveTactic.TabPlayer[Form6.activeIndex].Poste := EditPoste.Text;
  end;

  Form6.TabRectR3[activeIndex].Visible := false;
  Form6.TabRectR2[activeIndex].Visible := false;
  Form6.TabRectR1[activeIndex].Visible := false;
  Form6.TabRectN[activeIndex].Visible := false;

  Form6.TabName[activeIndex].Text := EditNom.Text;
  Form6.ActiveTactic.TabPlayer[activeIndex].Titulaire := EditNom.Text;

  LBmp := TBitmap.Create(10, 10);
  LBmp.Canvas.Font.Size := Form6.TabName[activeIndex].Font.Size;

  Form6.TabRectName[activeIndex].Width :=
    LBmp.Canvas.TextWidth(Form6.TabName[activeIndex].Text) + 10;
  Form6.TabRectName[activeIndex].Height :=
    Round(LBmp.Canvas.TextHeight(Form6.TabName[activeIndex].Text)) + 2;
  Form6.TabRectN[activeIndex].Width := Form6.TabRectName[activeIndex].Width;
  Form6.TabRectN[activeIndex].Height := Form6.TabRectName[activeIndex].Height;

  if Form6.TabName[activeIndex].Text <> '' then
  begin
    if MemoRemplacants.Lines.Count > 2 then
      raise Exception.Create('On ne peut mettre que 2 remplaçants maximum');

    for I := 0 to MemoRemplacants.Lines.Count - 1 do
    begin
      if MemoRemplacants.Lines.Strings[I] <> '' then
      begin
        if I = 0 then
        begin
          Form6.TabRemp1[activeIndex].Text := MemoRemplacants.Lines.Strings[I];
          Form6.ActiveTactic.TabPlayer[activeIndex].Remp1 :=
            MemoRemplacants.Lines.Strings[I];
          Form6.TabRectRemp1[activeIndex].Width :=
            LBmp.Canvas.TextWidth(Form6.TabRemp1[activeIndex].Text) + 10;
          Form6.TabRectRemp1[activeIndex].Height :=
            Round(LBmp.Canvas.TextHeight(Form6.TabRemp1[activeIndex].Text)) + 2;
          Form6.TabRectR1[activeIndex].Width := Form6.TabRectRemp1
            [activeIndex].Width;
          Form6.TabRectR1[activeIndex].Height := Form6.TabRectRemp1
            [activeIndex].Height;

        end
        else if I = 1 then
        begin
          Form6.TabRemp2[activeIndex].Text := MemoRemplacants.Lines.Strings[I];
          Form6.ActiveTactic.TabPlayer[activeIndex].Remp2 :=
            MemoRemplacants.Lines.Strings[I];
          Form6.TabRectRemp2[activeIndex].Width :=
            LBmp.Canvas.TextWidth(Form6.TabRemp2[activeIndex].Text) + 10;
          Form6.TabRectRemp2[activeIndex].Height :=
            Round(LBmp.Canvas.TextHeight(Form6.TabRemp2[activeIndex].Text)) + 2;
          Form6.TabRectR2[activeIndex].Width := Form6.TabRectRemp2
            [activeIndex].Width;
          Form6.TabRectR2[activeIndex].Height := Form6.TabRectRemp2
            [activeIndex].Height;
        end
        else
        begin
          Form6.TabRemp3[activeIndex].Text := MemoRemplacants.Lines.Strings[I];
          Form6.ActiveTactic.TabPlayer[activeIndex].Remp3 :=
            MemoRemplacants.Lines.Strings[I];
          Form6.TabRectRemp3[activeIndex].Width :=
            LBmp.Canvas.TextWidth(Form6.TabRemp3[activeIndex].Text) + 10;
          Form6.TabRectRemp3[activeIndex].Height :=
            Round(LBmp.Canvas.TextHeight(Form6.TabRemp3[activeIndex].Text)) + 2;
          Form6.TabRectR3[activeIndex].Width := Form6.TabRectRemp3
            [activeIndex].Width;
          Form6.TabRectR3[activeIndex].Height := Form6.TabRectRemp3
            [activeIndex].Height;
        end;
      end
      else
      begin
        Form6.TabRemp1[activeIndex].Text := '';
        Form6.TabRemp2[activeIndex].Text := '';
        Form6.TabRemp3[activeIndex].Text := '';
        Form6.ActiveTactic.TabPlayer[activeIndex].Remp1 := '';
        Form6.ActiveTactic.TabPlayer[activeIndex].Remp2 := '';
        Form6.ActiveTactic.TabPlayer[activeIndex].Remp3 := '';
      end;
    end;
    Form6.TabRectN[activeIndex].Visible := true;
    if (MemoRemplacants.Lines.Count = 1) and
      (MemoRemplacants.Lines.Strings[0] <> '') then
      Form6.TabRectR1[activeIndex].Visible := true
    else if (MemoRemplacants.Lines.Count = 2) and
      (MemoRemplacants.Lines.Strings[1] = '') then
      Form6.TabRectR1[activeIndex].Visible := true
    else if (MemoRemplacants.Lines.Count = 2) and
      (MemoRemplacants.Lines.Strings[1] <> '') then
    begin
      Form6.TabRectR2[activeIndex].Visible := true;
      Form6.TabRectR1[activeIndex].Visible := true;
    end
    else if (MemoRemplacants.Lines.Count = 3) and
      (MemoRemplacants.Lines.Strings[2] = '') then
    begin
      Form6.TabRectR2[activeIndex].Visible := true;
      Form6.TabRectR1[activeIndex].Visible := true;
    end
    else if (MemoRemplacants.Lines.Count = 3) and
      (MemoRemplacants.Lines.Strings[2] <> '') then
    begin
      Form6.TabRectR3[activeIndex].Visible := true;
      Form6.TabRectR2[activeIndex].Visible := true;
      Form6.TabRectR1[activeIndex].Visible := true;
    end;

  end;
  Form6.ActiveTactic.Save;
  Close();
end;

procedure TForm9.FormShow(Sender: TObject);
var
  I: Integer;
begin
  EditNumero.Text := '';
  if TryStrToInt(Form6.TabText[Form6.activeIndex].Text, I) = true then
  begin
    EditNumero.Text := Form6.TabText[Form6.activeIndex].Text;
    EditPoste.Text := Form6.ActiveTactic.TabPlayer[Form6.activeIndex].Poste;
  end
  else
  begin
    EditPoste.Text := Form6.TabText[Form6.activeIndex].Text;
    if Form6.ActiveTactic.TabPlayer[Form6.activeIndex].Numero <> 0 then
      EditNumero.Text :=
        IntToStr(Form6.ActiveTactic.TabPlayer[Form6.activeIndex].Numero);
  end;
  EditNom.Text := Form6.TabName[Form6.activeIndex].Text;
  MemoRemplacants.Lines.Clear;
  if Form6.TabRemp1[Form6.activeIndex].Text <> '' then
    MemoRemplacants.Lines.Add(Form6.TabRemp1[Form6.activeIndex].Text);
  if Form6.TabRemp2[Form6.activeIndex].Text <> '' then
    MemoRemplacants.Lines.Add(Form6.TabRemp2[Form6.activeIndex].Text);
  if Form6.TabRemp3[Form6.activeIndex].Text <> '' then
    MemoRemplacants.Lines.Add(Form6.TabRemp3[Form6.activeIndex].Text);
end;

procedure TForm9.SpeedButton1Click(Sender: TObject);
begin
  Close();
end;

end.
