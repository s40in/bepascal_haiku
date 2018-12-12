{   BePascal - A pascal wrapper around the BeOS API
    Copyright (C) 2002 - 2003 Olivier Coursiere
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
unit Path;

interface

uses
  BeObj, Classes, Entry, StorageDefs, SupportDefs;

type
  BPath = class(TBeObject)
  public
    constructor Create;
    constructor Create(dir : PChar; aLeaf : PChar; normalize : Boolean);
//    constructor Create(dir : BDirectory; leaf : PChar; normalize : Boolean);
    constructor Create(apath : BPath);
    constructor Create(entry : BEntry);
    constructor Create_1(ref : entry_ref);
    destructor Destroy; override;
    function InitCheck : status_t;
    function SetTo(apath : PChar; aleaf : PChar; normalize : Boolean) : status_t;
//    function SetTo(dir : BDirectory; path : PChar; normalize : Boolean) : status_t;
    function SetTo(entry : BEntry) : status_t;
    function SetTo_1(ref : PEntry_ref) : status_t;
    function Append(aPath : PChar; normalize : Boolean) : status_t;
    procedure Unset;
    function Path : PChar;
    function Leaf : PChar;
    function GetParent(aPath: BPath) : status_t;
  end;

function BPath_Create(AObject : TBeObject) : TCPlusObject;
         cdecl; external BePascalLibName name 'BPath_Create';
function BPath_Create(AObject : TBeObject; dir : PChar; leaf : PChar;
                      normalize : Boolean) : TCPlusObject;
         cdecl; external BePascalLibName name 'BPath_Create';
//function BPath_Create(AObject : TBeObject; dir : BDirectory; leaf : PChar; normalize : Boolean):TCPlusObject; cdecl; external BePascalLibName name 'BPath_Create';
function BPath_Create(AObject : TBeObject; path : BPath) : TCPlusObject;
         cdecl; external BePascalLibName name 'BPath_Create';
function BPath_Create(AObject : TBeObject; entry : BEntry) : TCPlusObject;
         cdecl; external BePascalLibName name 'BPath_Create';
function BPath_Create(AObject : TBeObject; ref : entry_ref) : TCPlusObject;
         cdecl; external BePascalLibName name 'BPath_Create';
procedure BPath_Free(AObject : TCPlusObject);
          cdecl; external BePascalLibName name 'BPath_Free';
function BPath_InitCheck(AObject : TCPlusObject) : status_t;
         cdecl; external BePascalLibName name 'BPath_InitCheck';
function BPath_SetTo(AObject : TCPlusObject; path : PChar; leaf : PChar;
                     normalize : Boolean) : status_t;
         cdecl; external BePascalLibName name 'BPath_SetTo';
//function BPath_SetTo(AObject : TCPlusObject; dir : BDirectory; path : PChar; normalize : Boolean) : Status_t; cdecl; external BePascalLibName name 'BPath_SetTo';
function BPath_SetTo(AObject : TCPlusObject; entry : BEntry) : status_t;
         cdecl; external BePascalLibName name 'BPath_SetTo';
function BPath_SetTo_3(AObject : TCPlusObject; ref : PEntry_ref) : status_t;
         cdecl; external BePascalLibName name 'BPath_SetTo_3';
function BPath_Append(AObject : TCPlusObject; path : PChar; normalize : Boolean) : status_t;
         cdecl; external BePascalLibName name 'BPath_Append';
procedure BPath_Unset(AObject : TCPlusObject);
          cdecl; external BePascalLibName name 'BPath_Unset';
function BPath_Path(AObject : TCPlusObject) : PChar;
         cdecl; external BePascalLibName name 'BPath_Path';
function BPath_Leaf(AObject : TCPlusObject) : PChar;
         cdecl; external BePascalLibName name 'BPath_Leaf';
function BPath_GetParent(AObject : TCPlusObject; aPath : TCPlusObject) : status_t;
         cdecl; external BePascalLibName name 'BPath_GetParent';

implementation

constructor BPath.Create;
begin
  CreatePas;
  CPlusObject := BPath_Create(Self);
end;

constructor BPath.Create(dir : PChar; aLeaf : PChar; normalize : Boolean);
begin
  CreatePas;
  CPlusObject := BPath_Create(Self, dir, aLeaf, normalize);
end;

{
constructor BPath.Create(dir : BDirectory; aLeaf : PChar; normalize : Boolean);
begin
  CreatePas;
  CPlusObject := BPath_Create(Self, dir, aLeaf, normalize);
end;
}

constructor BPath.Create(aPath : BPath);
begin
  CreatePas;
  CPlusObject := BPath_Create(Self, aPath);
end;

constructor BPath.Create(entry : BEntry);
begin
  CreatePas;
  CPlusObject := BPath_Create(Self, entry);
end;

constructor BPath.Create_1(ref : entry_ref);
begin
  CreatePas;
  CPlusObject := BPath_Create(Self, ref);
end;

destructor BPath.Destroy;
begin
  BPath_Free(CPlusObject);
  inherited;
end;

function BPath.InitCheck : status_t;
begin
  Result := BPath_InitCheck(CPlusObject);
end;

function BPath.SetTo(aPath : PChar; aLeaf : PChar; normalize : Boolean) : status_t;
begin
  Result := BPath_SetTo(CPlusObject, aPath, aLeaf, normalize);
end;

{
function BPath.SetTo(dir : BDirectory; path : PChar; normalize : boolean) : Status_t;
begin
  Result := BPath_SetTo(CPlusObject, dir, path, normalize);
end;
}

function BPath.SetTo(entry : BEntry) : status_t;
begin
  Result := BPath_SetTo(CPlusObject, entry);
end;

function BPath.SetTo_1(ref : PEntry_Ref) : status_t;
begin
  Result := BPath_SetTo_3(CPlusObject, ref);
end;

function BPath.Append(aPath : PChar; normalize : Boolean) : status_t;
begin
  Result := BPath_Append(CPlusObject, aPath, normalize);
end;

procedure BPath.Unset;
begin
  BPath_Unset(CPlusObject);
end;

function BPath.Path : PChar;
begin
  Result := BPath_Path(CPlusObject);
end;

function BPath.Leaf : PChar;
begin
  Result := BPath_Leaf(CPlusObject);
end;

function BPath.GetParent(aPath: BPath) : status_t;
begin
  Result := BPath_GetParent(CPlusObject, aPath.CPlusObject);
end;

end.
