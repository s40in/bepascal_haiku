{   BePascal - A pascal wrapper around the BeOS API
    Copyright (C) 2002-2003 Eric Jourde
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
unit Volume;

interface

uses
  BeObj, Bitmap, Mime, SupportDefs;

type
  BVolume = class(TBeObject)
  public
    constructor Create; override;
    destructor Destroy; override;

    function InitCheck : status_t;
    function SetTo(dev : dev_t) : status_t;
    procedure Unset;
    function Device : dev_t;
    function Capacity : off_t;
    function FreeBytes : off_t;
    function GetName(name : PChar) : status_t;
    function SetName(name : PChar) : status_t;
    function IsRemovable : Boolean;
    function IsReadOnly : Boolean;
    function IsPersistent : Boolean;
    function IsShared : Boolean;
    function KnowsMime : Boolean;
    function KnowsAttr : Boolean;
    function KnowsQuery : Boolean;
  end;

function BVolume_Create : TCPlusObject;
         cdecl; external BePascalLibName name 'BVolume_Create';
function BVolume_Create_1(dev : dev_t) : TCPlusObject;
         cdecl; external BePascalLibName name 'BVolume_Create_1';
function BVolume_Create_2(vol : TCPlusObject) : TCPlusObject;
         cdecl; external BePascalLibName name 'BVolume_Create_2';
procedure BVolume_Free(AObject : TCPlusObject);
          cdecl; external BePascalLibName name 'BVolume_BVolume';

function BVolume_InitCheck(AObject : TCPlusObject) : status_t;
         cdecl; external BePascalLibName name 'BVolume_InitCheck';
function BVolume_SetTo(AObject : TCPlusObject; dev : dev_t) : status_t;
         cdecl; external BePascalLibName name 'BVolume_SetTo';
procedure BVolume_Unset(AObject : TCPlusObject);
          cdecl; external BePascalLibName name 'BVolume_Unset';
function BVolume_Device(AObject : TCPlusObject) : dev_t;
         cdecl; external BePascalLibName name 'BVolume_Device';

//status_t BVolume_GetRootDirectory(BVolume *Volume, BDirectory *dir)
//function BVolume_GetRootDirectory(AObject : TCPlusObject; var dir BDirectory) : status_t;
//         cdecl; external BePascalLibName name 'BVolume_GetRootDirectory';

function BVolume_Capacity(AObject : TCPlusObject) : off_t;
         cdecl; external BePascalLibName name 'BVolume_Capacity';
function BVolume_FreeBytes(AObject : TCPlusObject) : off_t;
         cdecl; external BePascalLibName name 'BVolume_FreeBytes';
function BVolume_GetName(AObject : TCPlusObject; name : PChar) : Status_t;
         cdecl; external BePascalLibName name 'BVolume_GetName';
function BVolume_SetName(AObject : TCPlusObject; name : PChar) : Status_t;
         cdecl; external BePascalLibName name 'BVolume_SetName';
function BVolume_GetIcon(AObject : TCPlusObject; var icon : BBitmap;
                         wich : icon_size) : status_t;
         cdecl; external BePascalLibName name 'BVolume_GetIcon';
function BVolume_IsRemovable(AObject : TCPlusObject) : Boolean;
         cdecl; external BePascalLibName name 'BVolume_IsRemovable';
function BVolume_IsReadOnly(AObject : TCPlusObject) : Boolean;
         cdecl; external BePascalLibName name 'BVolume_IsReadOnly';
function BVolume_IsPersistent(AObject : TCPlusObject) : Boolean;
         cdecl; external BePascalLibName name 'BVolume_IsPersistent';
function BVolume_IsShared(AObject : TCPlusObject) : Boolean;
         cdecl; external BePascalLibName name 'BVolume_IsShared';
function BVolume_KnowsMime(AObject : TCPlusObject) : Boolean;
         cdecl; external BePascalLibName name 'BVolume_KnowsMime';
function BVolume_KnowsAttr(AObject : TCPlusObject) : Boolean;
         cdecl; external BePascalLibName name 'BVolume_KnowsAttr';
function BVolume_KnowsQuery(AObject : TCPlusObject) : Boolean;
         cdecl; external BePascalLibName name 'BVolume_KnowsQuery';

implementation

constructor BVolume.Create;
begin
  inherited;
  CPlusObject := BVolume_Create;
end;

destructor BVolume.Destroy;
begin
  if CPlusObject <> nil then BVolume_Free(CPlusObject);
  inherited;
end;

function BVolume.InitCheck : status_t;
begin
  Result := BVolume_InitCheck(CPlusObject);
end;

function BVolume.SetTo(dev : dev_t) : status_t;
begin
  Result := BVolume_SetTo(CPlusObject, dev);
end;

procedure BVolume.Unset;
begin
  BVolume_Unset(CPlusObject);
end;

function BVolume.Device : dev_t;
begin
  Result := BVolume_Device(CPlusObject);
end;

function BVolume.Capacity : off_t;
begin
  Result := BVolume_Capacity(CPlusObject);
end;

function BVolume.FreeBytes : off_t;
begin
  Result := BVolume_FreeBytes(CPlusObject);
end;

function BVolume.GetName(name : PChar) : status_t;
begin
  Result := BVolume_GetName(CPlusObject, name);
end;

function BVolume.SetName(name : PChar) : status_t;
begin
  Result := BVolume_SetName(CPlusObject, name);
end;

function BVolume.IsRemovable : Boolean;
begin
  Result := BVolume_IsRemovable(CPlusObject);
end;

function BVolume.IsReadOnly : Boolean;
begin
  Result := BVolume_IsReadOnly(CPlusObject);
end;

function BVolume.IsPersistent : Boolean;
begin
  Result := BVolume_IsPersistent(CPlusObject);
end;

function BVolume.IsShared : Boolean;
begin
  Result := BVolume_IsShared(CPlusObject);
end;

function BVolume.KnowsMime : Boolean;
begin
  Result := BVolume_KnowsMime(CPlusObject);
end;

function BVolume.KnowsAttr : Boolean;
begin
  Result := BVolume_KnowsAttr(CPlusObject);
end;

function BVolume.KnowsQuery : Boolean;
begin
  Result := BVolume_KnowsQuery(CPlusObject);
end;

end.