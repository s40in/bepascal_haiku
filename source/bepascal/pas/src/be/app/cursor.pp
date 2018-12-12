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

unit cursor;

interface

uses
  BeObj, Archivable, GraphicDefs, Message, OS, Rect, SupportDefs,dataio;

type

  BCursor = class(BArchivable)
  private
  public
    
    constructor Create(cursorData : pointer );
    constructor Create(data : BMessage);

    destructor Destroy; override;

    function Instantiate(data : BMessage) : BArchivable;
    function Archive(data : BMessage; deep : boolean) : Status_t;

    function Perform(d : Perform_code; arg : Pointer) : Status_t;
  end;

function BCursor_Create(AObject : TCPlusObject;cursorData : pointer) : TCPlusObject; cdecl;  external BePascalLibName name 'BCursor_Create';
function BCursor_Create(AObject : TCPlusObject;data : BMessage) : TCPlusObject; cdecl;  external BePascalLibName name 'BCursor_Create_1';


procedure BCursor_Free(AObject : TCPlusObject); cdecl;  external BePascalLibName name 'BCursor_Free';
function BCursor_Instantiate(AObject : TCPlusObject; data : TCPlusObject)  : BArchivable; cdecl; external BePascalLibName name 'BCursor_Instantiate';
function BCursor_Archive(AObject : TCPlusObject; data : TCPlusObject;  deep : boolean) : Status_t; cdecl;  external BePascalLibName name 'BCursor_Archive';
function BCursor_Perform(AObject : TCPlusObject; d : Perform_code; arg : Pointer) :  Status_t; cdecl; external BePascalLibName name 'BCursor_Perform';



implementation



constructor BCursor.Create(cursorData : pointer);
begin
  CreatePas;
  CPlusObject := BCursor_Create(Self,cursorData);
end;
constructor BCursor.Create(data : BMessage);
begin
  CreatePas;
  CPlusObject :=BCursor_Create(Self,data);
end;



destructor BCursor.Destroy;
begin
  BCursor_Free(CPlusObject);
  inherited;
end;

function BCursor.Instantiate(data :BMessage) : BArchivable;
begin
  Result := BCursor_Instantiate(CPlusObject, data.CPlusObject);
end;

function BCursor.Archive(data : BMessage; deep : boolean) : Status_t;
begin
  Result := BCursor_Archive(CPlusObject, data.CPlusObject, deep);
end;



function BCursor.Perform(d : Perform_code; arg : Pointer) : Status_t;
begin
  Result := BCursor_Perform(CPlusObject, d, arg);
end;



end.
