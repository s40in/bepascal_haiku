{   BePascal - A pascal wrapper around the BeOS API
    Copyright (C) 2003 Olivier Coursiere
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

unit picture;

interface

uses
  BeObj, Archivable, GraphicDefs, Message, OS, Rect, SupportDefs,dataio;

type
  BView = class(TBeObject);

  BPicture = class(BArchivable)
  private
  public
    
    constructor Create;override; 
    constructor Create(data : BMessage);

    destructor Destroy; override;

    function Instantiate(data : BMessage) : BArchivable;
    function Archive(data : BMessage; deep : boolean) : Status_t;

    function Perform(d : Perform_code; arg : Pointer) : Status_t;
    function Flatten(var stream : BDataIO) : Status_t;
    function Unflatten(var stream : BDataIO) : Status_t;
  end;

function BPicture_Create(AObject : TCPlusObject) : TCPlusObject; cdecl;  external BePascalLibName name 'BPicture_Create';
function BPicture_Create(AObject : TCPlusObject;data : BMessage) : TCPlusObject; cdecl;  external BePascalLibName name 'BPicture_Create_2';


procedure BPicture_Free(AObject : TCPlusObject); cdecl;  external BePascalLibName name 'BPicture_Free';
function BPicture_Instantiate(AObject : TCPlusObject; data : TCPlusObject)  : BArchivable; cdecl; external BePascalLibName name 'BPicture_Instantiate';
function BPicture_Archive(AObject : TCPlusObject; data : TCPlusObject;  deep : boolean) : Status_t; cdecl;  external BePascalLibName name 'BPicture_Archive';
function BPicture_Perform(AObject : TCPlusObject; d : Perform_code; arg : Pointer) :  Status_t; cdecl; external BePascalLibName name 'BPicture_Perform';
function BPicture_Flatten(AObject : TCPlusObject;  stream : TCPlusObject) : Status_t; cdecl;  external BePascalLibName name 'BPicture_Flatten';
function BPicture_Unflatten(AObject : TCPlusObject; stream : TCPlusObject) :  Status_t; cdecl; external BePascalLibName name 'BPicture_Unflatten';



implementation



constructor BPicture.Create;
begin
  CreatePas;
  CPlusObject := BPicture_Create(Self);
end;
constructor BPicture.Create(data : BMessage);
begin
  CreatePas;
  CPlusObject := BPicture_Create(Self,data);
end;



destructor BPicture.Destroy;
begin
  BPicture_Free(CPlusObject);
  inherited;
end;

function BPicture.Instantiate(data :BMessage) : BArchivable;
begin
  Result := BPicture_Instantiate(CPlusObject, data.CPlusObject);
end;

function BPicture.Archive(data : BMessage; deep : boolean) : Status_t;
begin
  Result := BPicture_Archive(CPlusObject, data.CPlusObject, deep);
end;



function BPicture.Perform(d : Perform_code; arg : Pointer) : Status_t;
begin
  Result := BPicture_Perform(CPlusObject, d, arg);
end;

function BPicture.Flatten(var stream : BDataIO) : Status_t;
begin
	Result:=BPicture_Flatten(CPlusObject,stream.CPlusObject);
end;

function BPicture.Unflatten(var stream : BDataIO) : Status_t;
begin
	Result:=BPicture_Unflatten(CPlusObject,stream.CPlusObject);
end;


end.
