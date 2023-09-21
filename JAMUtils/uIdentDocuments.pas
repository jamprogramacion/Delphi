unit uIdentDocuments;

interface

function IsValidDNI(const sDNI: String): Boolean;

function IsValidCIF(const sCIF: String): Boolean;

implementation

uses
  SysUtils, System.Math;

function IsValidDNI(const sDNI: String): Boolean;

const
  NIF_CONTROL: array[0..22] of Char = ('T', 'R', 'W', 'A', 'G', 'M', 'Y', 'F', 'P', 'D', 'X', 'B',
            'N', 'J', 'Z', 'S', 'Q', 'V', 'H', 'L', 'C', 'K', 'E');
  NIF_TYPE = 'KLM';
  NIF_TYPE_SUM: array[0..2] of Char = ('0', '0', '0');
  NIE_TYPE = 'XYZ';
  NIE_TYPE_SUM: array[0..2] of Char = ('0', '1', '2');

var
  acDNI: TCharArray;
  nDNISum: Integer;
  nPosNIE: Integer;
  nPosNIF: Integer;

begin
  if sDNI = '' then begin
    Result := False;
    Exit;
  end;

  acDNI := sDNI.ToUpper.ToCharArray;
  nPosNIE := NIE_TYPE.IndexOf(acDNI[0]);
  nPosNIF := NIF_TYPE.IndexOf(acDNI[0]);
  if nPosNIE <> -1 then begin
    nDNISum := StrToIntDef(NIE_TYPE_SUM[nPosNIE] + sDNI.SubString(1, Length(sDNI) - 2), -1);
  end else if nPosNIF <> -1 then begin
    nDNISum := StrToIntDef(NIF_TYPE_SUM[nPosNIF] + sDNI.SubString(1, Length(sDNI) - 2), -1);
  end else begin
    nDNISum := StrToIntDef(sDNI.SubString(0, Length(sDNI) - 1), -1);
  end;
  if nDNISum = -1 then begin
    Result := False;
    Exit;
  end;

  Result := NIF_CONTROL[nDNISum mod 23] = acDNI[Length(sDNI) - 1];
end;

function IsValidCIF(const sCIF: String): Boolean;

const
  CIF_CONTROL = 'ABCDEFGHJPQRSUVNW';
  CONTROL_ALPHA = 'PQRSNW';
  CONTROL_LETTER: array[0..9] of Char = ('J', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I');
  CONTROL_NUMBER: array[0..9] of Char = ('0', '1', '2', '3', '4', '5', '6', '7', '8', '9');

var
  acCIF: TCharArray;
  acCIFNum: TCharArray;
  nA: Integer;
  nB: Integer;
  nC: Integer;
  nD: Integer;
  nE: Integer;
  nCont: Integer;
  nOdd: Integer;

begin
  if sCIF = '' then begin
    Result := False;
    Exit;
  end;

  acCIF := sCIF.ToUpper.ToCharArray;
  if CIF_CONTROL.IndexOf(acCIF[0]) = -1 then begin
    Result := False;
    Exit;
  end;

  acCIFNum := sCIF.ToCharArray(1, Length(sCIF) - 2);

  nA := 0;
  nCont := 1;

  try
    while nCont < Length(acCIFNum) do begin
      nA := nA + StrToInt(acCIFNum[nCont]);
      Inc(nCont, 2);
    end;

    nB := 0;
    nCont := 0;
    while nCont < Length(acCIFNum) do begin
      nOdd := 2 * StrToInt(acCIFNum[nCont]);
      nB := nB + (nOdd div 10) + (nOdd mod 10);
      Inc(nCont, 2);
    end;
  except on E: Exception do begin
      Result := False;
      Exit;
    end;
  end;

  nC := nA + nB;
  nE := nc mod 10;
  nD := IfThen(nE > 0, 10 - nE, 0);

  if CONTROL_ALPHA.IndexOf(acCIF[0]) <> -1 then begin
    Result := CONTROL_LETTER[nD] = acCIF[Length(sCIF) - 1];
    Exit;
  end;

  Result := CONTROL_NUMBER[nD] = acCIF[Length(sCIF) - 1];
end;

end.
