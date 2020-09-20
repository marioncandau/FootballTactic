unit Player;

interface

uses System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants;

type
  TPlayer = class(TObject)
  private
    Fposte: string;
    Fnumero: Integer;
    Ftitulaire: string;
    Fremp1: string;
    Fremp2: string;
    Fremp3: string;
    FposLat: Integer;
    FposLon: Integer;

    procedure setNumero(num: Integer);
    procedure setPosLat(p: Integer);
    procedure setPosLon(p: Integer);

  public
    Constructor Create;
    Destructor Destroy;

    function ToStringList: TStringList;
    procedure FromTStringList(s : TStringList);

  published
    property Poste:string read Fposte write Fposte;
    property Numero: Integer read Fnumero write setNumero;
    property Titulaire: string read Ftitulaire write Ftitulaire;
    property Remp1: string read Fremp1 write Fremp1;
    property Remp2: string read Fremp2 write Fremp2;
    property Remp3: string read Fremp3 write Fremp3;
    property PosLat: Integer read FposLat write setPosLat;
    property PosLon: Integer read FposLon write setPosLon;
  end;

implementation

Constructor TPlayer.Create;
begin
  Ftitulaire := '';
  Fremp1 := '';
  Fremp2 := '';
  Fremp3 := '';
end;

Destructor TPlayer.Destroy;
begin
  Ftitulaire := '';
  Fremp1 := '';
  Fremp2 := '';
  Fremp3 := '';
end;

procedure TPlayer.setNumero(num: Integer);
begin
  if (num < 1) or (num > 99) then
    raise Exception.Create('Le numéro doit être compris entre 1 et 99');
  Fnumero := num;
end;

procedure TPlayer.setPosLat(p: Integer);
begin
  if (p < 0) or (p > 100) then
    raise Exception.Create('la position doit être comprise entre 0 et 100');
  FposLat := p;
end;

procedure TPlayer.setPosLon(p: Integer);
begin
  if (p < 0) or (p > 100) then
    raise Exception.Create('la position doit être comprise entre 0 et 100');
  FposLon := p;
end;

function TPlayer.ToStringList: TStringList;
begin
  Result := TStringList.Create;
  Result.Add(self.Fposte);
  if self.Fnumero <> 0 then
    Result.Add(IntToStr(self.Fnumero))
  else
    Result.Add('');
  Result.Add(self.Titulaire);
  Result.Add(self.Remp1);
  Result.Add(self.Remp2);
  Result.Add(self.Remp3);
  Result.Add(IntToStr(self.PosLat));
  Result.Add(IntToStr(self.PosLon));
end;

procedure TPlayer.FromTStringList(s: TStringList);
begin
  self.poste := s.Strings[0];
  if s.Strings[1] <> '' then
    self.numero := StrToInt(s.Strings[1]);
  self.Titulaire := s.Strings[2];
  self.Remp1 := s.Strings[3];
  self.Remp2 := s.Strings[4];
  self.Remp3 := s.Strings[5];
  self.PosLat := StrToInt(s.Strings[6]);
  self.PosLon := StrToInt(s.Strings[7]);
end;

end.
