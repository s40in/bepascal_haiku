{   BePascal - A pascal wrapper around the BeOS API
    Copyright (C) 2002-2004 Olivier Coursiere
                            Oscar Lesta
                            Mika Lindqvist

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

unit Archivable;

interface

uses
  BeObj, Message, SupportDefs;

type
  BArchivable = class(TBeObject)
  private
  public
(*
    constructor Create;
    constructor Create(from : BMessage);
    destructor Destroy; override;

    function Archive(into : BMessage; deep : Boolean {$ifdef VER1_0}= true{$endif}) : status_t; virtual;
    function ArchiveFromPascal(into : BMessage; deep : Boolean {$ifdef VER1_0}= true{$endif}) : status_t; virtual;
    function Instantiate(from : BMessage) : BArchivable;
*)
  end;

function BArchivable_Create(AObject : TObject) : TCPlusObject; cdecl; external BePascalLibName name 'BArchivable_Create_1';
function BArchivable_Create(AObject : TObject; from : TCPlusObject) : TCPlusObject; cdecl; external BePascalLibName name 'BArchivable_Create_2';
function BArchivable_Archive(archivable : TCPlusObject; into : TCPlusObject; deep : boolean) : status_t;  cdecl; external BePascalLibName name 'BArchivable_Archive';

implementation

//------------------------------------------------------------------------------

{

constructor BArchivable.Create;
begin
  inherited;
  BArchivable_Create(Self);
end;

constructor BArchivable.Create(from : BMessage);
begin
  inherited;
  BArchivable_Create(Self, from);
end;

destructor BArchivable.Destroy; override;
begin

end;

function BArchivable.Archive(into : BMessage; deep : Boolean) : status_t;
begin

end;

function BArchivable.ArchiveFromPascal(into : BMessage; deep : Boolean) : status_t;
begin

end;

function BArchivable.Instantiate(from : BMessage) : BArchivable;
begin

end;

}

//--- Hook Functions -----------------------------------------------------------

var
  Archivable_Instantiate_hook : Pointer; cvar; external;
  Archivable_Archive_hook : Pointer; cvar; external;

function Archivable_Instantiate_hook_func(from : TCPlusObject) : TCPlusObject;
begin
end;

//function Archivable_Archive_hook_func(into : TCPlusObject; deep : boolean) : TCPlusObject;
function Archivable_Archive_hook_func(from : TCPlusObject; into : TCPlusObject; deep : Boolean) : status_t;
begin
  Result := BArchivable_Archive(from, into, deep);
end;

initialization
  Archivable_Instantiate_hook := @Archivable_Instantiate_hook_func;
  Archivable_Archive_hook := @Archivable_Archive_hook_func;
end.
