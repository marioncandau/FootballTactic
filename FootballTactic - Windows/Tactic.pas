unit Tactic;

interface

uses Player, System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants, System.IOUtils;

type
  PTPlayer = array of TPlayer;
  PPostes = array of Integer;
  PColor = array of string;

  TTactic = class(TObject)
  private
    FnbPlayer: Integer;
    FTabPlayer: PTPlayer;
    Fname: string;
    Fpostes: PPostes;
    Fcolor: PColor;
    Fcommentaire: TStringList;

    procedure setNbPlayer(nb: Integer);
    procedure setPostes(post: PPostes);
    procedure setTabPlayer;
    procedure setColor(col: PColor);
  public
    Constructor Create(FN: string); overload;
    Constructor Create(FN: string; nb: Integer; post: PPostes); overload;
    procedure Save;
    procedure Import(fileName: string);
    procedure Export(fileName: string);
    procedure Edit(post: PPostes);

  published
    property nbPlayer: Integer read FnbPlayer write setNbPlayer;
    property TabPlayer: PTPlayer read FTabPlayer;
    property Name: string read Fname write Fname;
    property Postes: PPostes read Fpostes write setPostes;
    property Color: PColor read Fcolor write setColor;
    property Commentaire: TStringList read Fcommentaire write Fcommentaire;
  end;

implementation

Constructor TTactic.Create(FN: string);
var
  I: Integer;
begin
  Fname := FN;
  FnbPlayer := 11;
  SetLength(Fpostes, 5);
  SetLength(Fcolor, 3);
  SetLength(FTabPlayer, FnbPlayer);
  for I := 0 to FnbPlayer - 1 do
  begin
    FTabPlayer[I] := TPlayer.Create;
  end;
  setPostes([4, 0, 4, 0, 2]);
  setColor(['FF0000', '000000', '000000']);
  Fcommentaire := TStringList.Create;
  setTabPlayer;
end;

Constructor TTactic.Create(FN: string; nb: Integer; post: PPostes);
var
  I: Integer;
begin
  Fname := FN;
  nbPlayer := nb;
  SetLength(Fpostes, 5);
  SetLength(FTabPlayer, FnbPlayer);
  for I := 0 to FnbPlayer - 1 do
  begin
    FTabPlayer[I] := TPlayer.Create;
  end;
  Postes := post;
  setColor(['FF0000', '000000', '000000']);
  Fcommentaire := TStringList.Create;
  setTabPlayer;
end;

procedure TTactic.setPostes(post: PPostes);
var
  total: Integer;
begin
  total := post[0] + post[1] + post[2] + post[3] + post[4] + 1;
  if total <> FnbPlayer then
    raise Exception.Create('le nombre de joueurs ne correspond pas');
  Fpostes := post;
end;

procedure TTactic.setNbPlayer(nb: Integer);
begin
  if (nb < 5) or (nb > 11) then
    raise Exception.Create
      ('Le nombre de joueurs doit être compris entre 5 et 11');
  FnbPlayer := nb;
end;

procedure TTactic.Save;
var
  s: TStringList;
  I: Integer;
begin
  s := TStringList.Create;
  for I := 0 to FnbPlayer - 1 do
    s.AddStrings(TabPlayer[I].ToStringList);

  s.Add(Fcolor[0]);
  s.Add(Fcolor[1]);
  s.Add(Fcolor[2]);
  s.Add('Commentaire');
  s.AddStrings(Fcommentaire);

  s.SaveToFile(TPath.GetHomePath + '\FootballTactic\' + Fname + '.tac');
  s.Free;
end;

procedure TTactic.Import(fileName: string);
var
  s, t: TStringList;
  I, j, nb: Integer;
  p: PPostes;
begin
  s := TStringList.Create;
  s.LoadFromFile(fileName);
  nb := (s.Count - 3) div 8;
  for I := s.Count - 1 downto 0 do
  begin
    if s.Strings[I] = 'Commentaire' then
    begin
      nb := (I - 3) div 8;
      break;
    end;
  end;
  nbPlayer := nb;
  t := TStringList.Create;
  p := [0, 0, 0, 0, 0];
  for I := 0 to nbPlayer - 1 do
  begin
    t.Clear;
    for j := 0 to 7 do
    begin
      t.Add(s.Strings[8 * I + j]);
    end;
    self.FTabPlayer[I].FromTStringList(t);
    if Length(t.Strings[0]) = 2 then
    begin
      if t.Strings[0][Low(t.Strings[0])] = 'D' then
        p[0] := p[0] + 1
      else if t.Strings[0][Low(t.Strings[0])] = 'M' then
        p[2] := p[2] + 1
      else if t.Strings[0][Low(t.Strings[0])] = 'A' then
        p[4] := p[4] + 1;
    end
    else
    begin
      if t.Strings[0][Low(t.Strings[0]) + 1] = 'O' then
        p[3] := p[3] + 1
      else if t.Strings[0][Low(t.Strings[0]) + 1] = 'D' then
        p[1] := p[1] + 1;
    end;
  end;
  setColor([s.Strings[nbPlayer * 8], s.Strings[nbPlayer * 8 + 1],
    s.Strings[nbPlayer * 8 + 2]]);
  setPostes(p);
  Fcommentaire.Clear;
  for I := nbPlayer * 8 + 4 to s.Count - 1 do
    Fcommentaire.Add(s.Strings[I]);
end;

procedure TTactic.Export(fileName: string);
var
  s: TStringList;
  I: Integer;
begin
  s := TStringList.Create;
  for I := 0 to FnbPlayer - 1 do
    s.AddStrings(TabPlayer[I].ToStringList);
  s.Add(Fcolor[0]);
  s.Add(Fcolor[1]);
  s.Add(Fcolor[2]);
  s.Add('Commentaire');
  s.AddStrings(Fcommentaire);
  s.SaveToFile(fileName);
  s.Free;
end;

procedure TTactic.Edit(post: PPostes);
begin
  setPostes(post);
  setTabPlayer;
end;

procedure TTactic.setTabPlayer;
var
  numPlayer: Integer;
  I: Integer;
  h, l: Integer;
begin
  numPlayer := 0;

  FTabPlayer[numPlayer].Poste := 'GB';
  FTabPlayer[numPlayer].PosLat := 50;
  FTabPlayer[numPlayer].PosLon := 91;
  numPlayer := numPlayer + 1;

  h := 78;
  for I := 1 to Fpostes[0] do
  begin
    l := Round((I * 100 / Fpostes[0] - (I - 1) * (100 / Fpostes[0])) / 2 +
      (I - 1) * (100 / Fpostes[0]));
    if l < 25 then
      FTabPlayer[numPlayer].Poste := 'DG'
    else if l > 75 then
      FTabPlayer[numPlayer].Poste := 'DD'
    else
      FTabPlayer[numPlayer].Poste := 'DC';

    FTabPlayer[numPlayer].PosLat := l;
    FTabPlayer[numPlayer].PosLon := h;
    numPlayer := numPlayer + 1;
  end;

  h := 64;
  for I := 1 to Fpostes[1] do
  begin
    l := Round((I * 100 / Fpostes[1] - (I - 1) * (100 / Fpostes[1])) / 2 +
      (I - 1) * (100 / Fpostes[1]));
    if l < 25 then
      FTabPlayer[numPlayer].Poste := 'MDG'
    else if l > 75 then
      FTabPlayer[numPlayer].Poste := 'MDD'
    else
      FTabPlayer[numPlayer].Poste := 'MDC';

    FTabPlayer[numPlayer].PosLat := l;
    FTabPlayer[numPlayer].PosLon := h;
    numPlayer := numPlayer + 1;
  end;

  h := 50;
  for I := 1 to Fpostes[2] do
  begin
    l := Round((I * 100 / Fpostes[2] - (I - 1) * (100 / Fpostes[2])) / 2 +
      (I - 1) * (100 / Fpostes[2]));
    if l < 25 then
      FTabPlayer[numPlayer].Poste := 'MG'
    else if l > 75 then
      FTabPlayer[numPlayer].Poste := 'MD'
    else
      FTabPlayer[numPlayer].Poste := 'MC';

    FTabPlayer[numPlayer].PosLat := l;
    FTabPlayer[numPlayer].PosLon := h;
    numPlayer := numPlayer + 1;
  end;

  h := 36;
  for I := 1 to Fpostes[3] do
  begin
    l := Round((I * 100 / Fpostes[3] - (I - 1) * (100 / Fpostes[3])) / 2 +
      (I - 1) * (100 / Fpostes[3]));
    if l < 25 then
      FTabPlayer[numPlayer].Poste := 'MOG'
    else if l > 75 then
      FTabPlayer[numPlayer].Poste := 'MOD'
    else
      FTabPlayer[numPlayer].Poste := 'MOC';

    FTabPlayer[numPlayer].PosLat := l;
    FTabPlayer[numPlayer].PosLon := h;
    numPlayer := numPlayer + 1;
  end;

  h := 22;
  for I := 1 to Fpostes[4] do
  begin
    l := Round((I * 100 / Fpostes[4] - (I - 1) * (100 / Fpostes[4])) / 2 +
      (I - 1) * (100 / Fpostes[4]));
    if l < 25 then
      FTabPlayer[numPlayer].Poste := 'AG'
    else if l > 75 then
      FTabPlayer[numPlayer].Poste := 'AD'
    else
      FTabPlayer[numPlayer].Poste := 'AC';

    FTabPlayer[numPlayer].PosLat := l;
    FTabPlayer[numPlayer].PosLon := h;
    numPlayer := numPlayer + 1;
  end;

end;

procedure TTactic.setColor(col: PColor);
var
  I, j: Integer;
  b: boolean;
begin
  for I := 0 to 2 do
  begin
    if col[I].Length <> 6 then
      raise Exception.Create('Probleme avec les couleurs');
    for j := 0 to 5 do
    begin
      b := true;
      if (col[I].Chars[j] < Char(48)) then
        b := false
      else if (col[I].Chars[j] < Char(57)) and (col[I].Chars[j] > Char(65)) then
        b := false
      else if (col[I].Chars[j] < Char(70)) and (col[I].Chars[j] > Char(97)) then
        b := false
      else if (col[I].Chars[j] > Char(102)) then
        b := false;

      if b = false then
        raise Exception.Create('Probleme avec les couleurs');
    end;
  end;
  Fcolor := col;
end;

end.
