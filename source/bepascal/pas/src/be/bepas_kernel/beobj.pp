{   BePascal - A pascal wrapper around the BeOS API
    Copyright (C) 2002 - 2003 Olivier Coursiere
                              Oscar Lesta

    This library is free software; you can redistribute it and/or
    modify it under the terms of the GNU Library General Public
    License as published by the Free Software Foundation; either
    version 2 of the License, or (at your option) any later version.

    This library is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
    Library General Public License for more details.

    You should have received a copy of the GNU Library General Public
    License along with this library; if not, write to the Free
    Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
}
unit BeObj;

interface

{$M+}

// FreePascal use ld on BeOS (like on LINUX) to link to libraries.
// ld use the environment variable BELIBRARIES to find libraries.

const
  BePascalLibName = 'bepascal';

type
  // BePascal types
  TCPlusObject = Pointer;
  THandle = Pointer;
  
  TBeObject = class(TObject)
  private
    procedure Debug;
  protected
    FCPlusObject : TCPlusObject;
  public
    constructor Create; virtual; // XXX "An inherited method is hidden by TBEOBJECT.CREATE"
    constructor CreatePas; virtual;
    constructor Wrap(ACPlusObject : TCPlusObject); virtual;
    destructor UnWrap; virtual;
    property CPlusObject : TCPlusObject read FCPlusObject write FCPlusObject;
  end;
  function GetCPlusObj(anObject : TBeObject) : TCPlusObject;

type
  TSendTextProc = procedure(aText : string);

procedure SendText(aText : string);
procedure SetSendTextProc(aProc : TSendTextProc);

{
  This operator is added to mimic (at least to some point) BeAPI's
  const uint32 B_SOME_CONST = '_SMC';

  With this operator, we can do something like this on pascal:

  const
    _B_SOME_CONST = '_SMC';
  var
    B_SOME_CONST : Longword;

  And in the initialization:
  B_SOME_CONST := _B_SOME_CONST; // Or just use 'TEXT' here and avoid the const.
}
operator := (ValueStr : string) : Longword;

implementation

uses
  SysUtils;

operator := (ValueStr : string) : Longword;
const
  kOpErrorMsg = 'This operator (:=) requires four-characters strings.';
var
  Num : array[1..4] of Byte;
  i : Integer;
begin
{$IFOPT C+} {$define assert_was_on} {$ENDIF}
  {$C+}
  Assert(Length(ValueStr) = 4, kOpErrorMsg);
{$IFNDEF assert_was_on} {$C-} {$ENDIF}

  for i := 1 to 4 do
{$IFDEF ENDIAN_LITTLE}
    Num[i] := Ord(ValueStr[5 - i]);
{$ELSE}
    Num[i] := Ord(ValueStr[i]);
{$ENDIF}

  Result := Longword(Num);
end;

function GetCPlusObj(anObject : TBeObject) : TCPlusObject;
begin
  if Assigned(anObject) then
    Result := anObject.CPlusObject
  else
    Result := nil;
end;

var
  PasObject_GetPasClassName_hook : Pointer; cvar; external;
  SendTextProc : TSendTextProc;

procedure SendText(aText : string);
begin
  if Assigned(SendTextProc) then
  begin
    SendTextProc(aText);
  end;
end;

procedure SetSendTextProc(aProc : TSendTextProc);
begin
  SendTextProc := aProc;
end;
 
function PasObject_GetPasClassName_hook_func(PasObject : TBeObject) : PChar;
begin
  if PasObject <> nil then
	  Result := StrPCopy(Result, PasObject.ClassName)
  else
    Result := '';
end;

  // Not really a useful function. Un jour peut être...
function BPasObject_GetPasObject(ACPlusObject : TCPlusObject) : TObject; cdecl; external BePascalLibName name 'BPasObject_GetPasObject';

  // start TBeObject
constructor TBeObject.Create;
begin
  inherited;
  Debug;
end;

  // Constructeur utilisé pour créer une instance Pascal à partir d'un objet C++.
  // Nécessaire notamment pour encapsuler les objets C++ passé en paramètre des
  // fonctions de hook.
constructor TBeObject.Wrap(ACPlusObject : TCPlusObject); 
begin
  Self.CPlusObject := ACPlusObject;
  Debug;
end;

constructor TBeObject.CreatePas;
begin
  Create;
end;

procedure TBeObject.Debug;
{$IFDEF DEBUG}
var
  size : cardinal;
{$ENDIF}
begin
{$IFDEF DEBUG}
  size := 0;
  size := SizeOf(Self.ClassType);
  SendText('Instance de ' + Self.ClassName + '(' + HexStr(longint(pointer(Self)), 8) + ')' + 
          '(' + IntToStr(size) + ')' +
          ' ');
{$ENDIF}
end;
  // Destructeur utilisé pour libérer l'objet pascal sans
  // détruire l'objet C++ correspondant. Utile pour
  // libérer la mémoire coté pascal dans le cas d'objets
  // C++ qui ne sont pas propriété de l'application
  // (cas des messages passés aux fonctions de rappel)
destructor TBeObject.UnWrap;
begin
{$IFDEF DEBUG}
  SendText('UnWrap');
{$ENDIF}
    // On passe CPlusObject à nil pour éviter de libérer
    // l'objet C++ lors de l'appel de free    
  Self.CPlusObject := nil;
end;

// end TBeObject

initialization
  PasObject_GetPasClassName_hook := @PasObject_GetPasClassName_hook_func;
  if not Assigned(SendTextProc) then
    SendTextProc := nil;

finalization
  PasObject_GetPasClassName_hook := nil;
end.
