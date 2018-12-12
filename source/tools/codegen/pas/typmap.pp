unit typmap;

interface

uses
  SysUtils, Classes;

function CppToPas(CppType : string) : string;
function PasToCpp(PasType : string) : string;
  
implementation

const
  TypMapFileName = 'typemap.txt';
var
  aTypMap : TStringList;
  NewTypMap : TStringList;

function CppToPas(CppType : string) : string;
var
  i : integer;
begin
  Result := aTypMap.Values[CppType];
  if Result = '' then
  begin
    if not NewTypMap.Find(CppType + '=', i) then
      NewTypMap.Add(CppType + '=');
  end;
end;

function PasToCpp(PasType : string) : string;
begin
    // To implement if necessary
  Result := '';
end;

initialization
  aTypMap := TStringList.Create;
  aTypMap.LoadFromFile(TypMapFileName);
  aTypMap.Sorted := True;
  NewTypMap := TStringList.Create;
	NewTypMap.Sorted := True;
  
finalization
//  WriteLn(aTypMap.Text);
  aTypMap.SaveToFile(TypMapFileName);
  aTypMap.Free;
  NewTypMap.SaveToFile(TypMapFileName + '.new');
  NewTypMap.Free;
  
end.
