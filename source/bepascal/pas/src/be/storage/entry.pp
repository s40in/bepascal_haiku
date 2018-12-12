{   BePascal - A pascal wrapper around the BeOS API
    Copyright (C) 2002-2003 Olivier Coursiere
                            Eric Jourde
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
unit Entry;

interface

uses
  BeObj, StorageDefs, SupportDefs;

type
  entry_ref = packed record
    device    : dev_t;
    directory : ino_t;
    name      : PChar;
  end;

  Pentry_ref = ^entry_ref;

  BEntry = class(TBeObject)
  public
    constructor Create;
//    constructor Create(dir : BDirectory; path : PChar; traverse : boolean);
    constructor Create(ref : entry_ref; traverse : Boolean);
    constructor Create(path : PChar; traverse : Boolean);
    constructor Create(entry : BEntry);
    destructor Destroy; override;
    function InitCheck : status_t;
    function Exists : Boolean;
//    function GetStat(st : stat) : status_t;
//    function SetTo(dir : BDirectory; path : PChar; traverse : boolean) : status_t;
    function SetTo(ref : entry_ref; traverse : Boolean) : status_t;
    function SetTo(path : PChar; traverse : Boolean) : status_t;
    procedure Unset;
    function GetRef(ref : entry_ref) : status_t;
//    function GetPath(path : BPath) : status_t;
    function GetParent(entry : BEntry) : status_t;
//    function GetParent(dir : BDirectory) : status_t;
    function GetName( var buffer : PChar) : status_t;
    function Rename(path : PChar; clobber : Boolean) : status_t;
//    function MoveTo(dir : BDirectory; path : PChar; clobber : boolean) : status_t;
    function Remove : status_t;
  end;

function BEntry_Create(AObject : TBeObject) : TCPlusObject;
         cdecl; external BePascalLibName name 'BEntry_Create';
//function BEntry_Create(AObject : TBeObject; dir : BDirectory; path : PChar; traverse : Boolean); cdecl; external BePascalLibName name 'BEntry_Create';
function BEntry_Create(AObject : TBeObject; ref : entry_ref; traverse : Boolean) : TCPlusObject;
         cdecl; external BePascalLibName name 'BEntry_Create';
function BEntry_Create(AObject : TBeObject; path : PChar; traverse : Boolean) : TCPlusObject;
         cdecl; external BePascalLibName name 'BEntry_Create';
function BEntry_Create(AObject : TBeObject; entry : BEntry) : TCPlusObject;
         cdecl; external BePascalLibName name 'BEntry_Create';
procedure BEntry_Free(AObject : TCPlusObject);
          cdecl; external BePascalLibName name 'BEntry_Free';
function BEntry_InitCheck(AObject : TCPlusObject) : status_t;
         cdecl; external BePascalLibName name 'BEntry_InitCheck';
function BEntry_Exists(AObject : TCPlusObject) : Boolean;
         cdecl; external BePascalLibName name 'BEntry_Exists';
//function BEntry_GetStat(AObject : TCPlusObject; st : stat) : status_t; cdecl; external BePascalLibName name 'BEntry_GetStat';
//function BEntry_SetTo(AObject : TCPlusObject; dir : BDirectory; path : PChar; traverse : Boolean) : status_t; cdecl; external BePascalLibName name 'BEntry_SetTo';
function BEntry_SetTo(AObject : TCPlusObject; ref : entry_ref; traverse : Boolean) : status_t;
         cdecl; external BePascalLibName name 'BEntry_SetTo';
function BEntry_SetTo(AObject : TCPlusObject; path : PChar; traverse : Boolean) : status_t;
         cdecl; external BePascalLibName name 'BEntry_SetTo';
procedure BEntry_Unset(AObject : TCPlusObject);
          cdecl; external BePascalLibName name 'BEntry_Unset';
function BEntry_GetRef(AObject : TCPlusObject; ref : entry_ref) : status_t;
         cdecl; external BePascalLibName name 'BEntry_GetRef';
//function BEntry_GetPath(AObject : TCPlusObject; path : TCPlusObject) : status_t; cdecl; external BePascalLibName name 'BEntry_GetPath';
function BEntry_GetParent(AObject : TCPlusObject; entry : TCPlusObject) : status_t;
         cdecl; external BePascalLibName name 'BEntry_GetParent';
//function BEntry_GetParent(AObject : TCPlusObject; dir : TCPlusObject) : status_t; cdecl; external BePascalLibName name 'BEntry_GetParent';
function BEntry_GetName(AObject : TCPlusObject; buffer : PChar) : status_t;
         cdecl; external BePascalLibName name 'BEntry_GetName';
function BEntry_Rename(AObject : TCPlusObject; path : PChar; clobber : Boolean) : status_t;
         cdecl; external BePascalLibName name 'BEntry_Rename';
function BEntry_MoveTo(AObject : TCPlusObject; dir : TCPlusObject; path : PChar; clobber : Boolean) : status_t;
         cdecl; external BePascalLibName name 'BEntry_MoveTo';
function BEntry_Remove(AObject : TCPlusObject) : status_t;
         cdecl; external BePascalLibName name 'BEntry_Remove';

implementation


constructor BEntry.Create;
begin
  CreatePas;
  CPlusObject := BEntry_Create(Self);
end;

{constructor BEntry.Create(dir : BDirectory; path : PChar; traverse : Boolean);
begin
  CPlusObject := BEntry_Create(Self, dir, path, traverse);
end;
}
constructor BEntry.Create(ref : entry_ref; traverse : Boolean);
begin
  CreatePas;
  CPlusObject := BEntry_Create(Self, ref, traverse);
end;

constructor BEntry.Create(path : PChar; traverse : Boolean);
begin
  CreatePas;
  CPlusObject := BEntry_Create(Self, path, traverse);
end;

constructor BEntry.Create(entry : BEntry);
begin
  CreatePas;
  CPlusObject := BEntry_Create(Self, entry);
end;

destructor BEntry.Destroy;
begin
  BEntry_Free(CPlusObject);
  inherited;
end;

function BEntry.InitCheck : Status_t;
begin
  Result := BEntry_InitCheck(CPlusObject);
end;

function BEntry.Exists : Boolean;
begin
  Result := BEntry_Exists(CPlusObject);
end;

{
function BEntry.GetStat(st : stat) : status_t;
begin
  Result := BEntry_GetStat(CPlusObject, st);
end;
}

{
function BEntry.SetTo(dir : BDirectory; path : PChar; traverse : Boolean) : status_t;
begin
  Result := BEntry_SetTo(CPlusObject, dir, path, traverse);
end;
}

function BEntry.SetTo(ref : entry_ref; traverse : Boolean) : status_t;
begin
  Result := BEntry_SetTo(CPlusObject, ref, traverse);
end;

function BEntry.SetTo(path : PChar; traverse : Boolean) : status_t;
begin
  Result := BEntry_SetTo(CPlusObject, path, traverse);
end;

procedure BEntry.Unset;
begin
  BEntry_Unset(CPlusObject);
end;

function BEntry.GetRef(ref : entry_ref) : status_t;
begin
  Result := BEntry_GetRef(CPlusObject, ref);
end;

{
function BEntry.GetPath(path : BPath) : status_t;
begin
  Result := BEntry_GetPath(CPlusObject, path.CPlusObject);
end;
}

function BEntry.GetParent(entry : BEntry) : status_t;
begin
  Result := BEntry_GetParent(CPlusObject, entry.CPlusObject);
end;

{
function BEntry.GetParent(dir : BDirectory) : status_t;
begin
  Result := BEntry_GetParent(CPlusObject, dir.CPlusObject);
end;
}

function BEntry.GetName(var buffer : PChar) : status_t;
begin
  Result := BEntry_GetName(CPlusObject, buffer);
end;

function BEntry.Rename(path : PChar; clobber : Boolean) : status_t;
begin
  Result := BEntry_Rename(CPlusObject, path, clobber);
end;

{
function BEntry.MoveTo(dir : BDirectory; path : PChar; clobber : Boolean) : status_t;
begin
  Result := BEntry_MoveTo(CPlusObject, dir.CPlusObject, path, clobber);
end;
}

function BEntry.Remove : status_t;
begin
  Result := BEntry_Remove(CPlusObject);
end;

end.
