{  BePascal - A pascal wrapper around the BeOS API
    Copyright (C) 2002 Eric Jourde

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

unit List;

interface

uses
  beobj, SupportDefs, os;

type
  BList = class(TBeObject)
  private
  public
    constructor Create; override;
    destructor Destroy; override;

   function AddItem(item : pointer): boolean;
   function AddItem(item : pointer; atindex : cardinal): boolean;
   function AddList(newitem : TCPlusObject): boolean;
   function ItemAt(at : cardinal): pointer;
   function ItemAtFast(at : cardinal): pointer;
   function RemoveItem(item : pointer) : boolean;
   function RemoveItem(index : cardinal) : boolean;
   function RemoveItems(index,count : cardinal) : boolean;
   procedure MakeEmpty;
   function FirstItem : pointer;
   function LastItem : pointer;
   function HasItem (item : pointer) : boolean;
   function IndexOf(item : pointer)  : cardinal;
   function CountItems : cardinal;
   function IsEmpty : boolean;
   function ReplaceItem(index : cardinal; newItem : pointer): boolean;
   function SwapItems(IndexA,IndexB : cardinal) : boolean;
   function MoveItem(FromIndex,ToIndex : cardinal) : boolean;
 end;


function BList_Create( itemsPerBlock:  cardinal) : TCPlusObject; cdecl; external BePascalLibName name 'BList_Create';
procedure BList_Free(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BList_Free';

function BList_AddItem(AObject : TCPlusObject; item : pointer):boolean;cdecl; external BePascalLibName name 'BList_AddItem';
function BList_AddItem(AObject : TCPlusObject; item : pointer; atIndex : cardinal):boolean;cdecl; external BePascalLibName name 'BList_AddItem_1';
function BList_AddList(AObject : TCPlusObject; newitem : TCPlusObject): boolean;cdecl; external BePascalLibName name 'BList_AddList';
function BList_ItemAt(AObject : TCPlusObject;  at : cardinal) : pointer;cdecl; external BePascalLibName name 'BList_ItemAt';
function BList_ItemAtFast(AObject : TCPlusObject;  at : cardinal) : pointer;cdecl; external BePascalLibName name 'BList_ItemAtFast_1';
function BList_RemoveItem(AObject : TCPlusObject; item : pointer): boolean;cdecl; external BePascalLibName name 'BList_RemoveItem';
function BList_RemoveItem(AObject : TCPlusObject; index : cardinal): boolean;cdecl; external BePascalLibName name 'BList_RemoveItem_1';
function BList_RemoveItems(AObject : TCPlusObject; index,count : cardinal): boolean;cdecl; external BePascalLibName name 'BList_RemoveItems_2';
procedure BList_MakeEmpty(AObject : TCPlusObject);cdecl; external BePascalLibName name 'BList_MakeEmpty';
function BList_FirstItem(AObject : TCPlusObject): pointer; cdecl; external BePascalLibName name 'BList_FirstItem';
function BList_LastItem(AObject : TCPlusObject): pointer; cdecl; external BePascalLibName name 'BList_LastItem';
function BList_HasItem(AObject : TCPlusObject; item : pointer) : boolean; cdecl; external BePascalLibName name 'BList_HasItem';
function BList_IndexOf(AObject : TCPlusObject; item : pointer) : cardinal;cdecl; external BePascalLibName name 'BList_IndexOf';
function BList_CountItems(AObject : TCPlusObject) : cardinal;cdecl; external BePascalLibName name 'BList_CountItems';
function BList_IsEmpty(AObject : TCPlusObject) : boolean;cdecl; external BePascalLibName name 'BList_IsEmpty';

function BList_ReplaceItem(AObject : TCPlusObject; index : cardinal; newItem: pointer): boolean;cdecl; external BePascalLibName name 'BList_ReplaceItem';
function BList_SwapItems(AObject : TCPlusObject; indexA : cardinal; indexB : cardinal) : boolean;cdecl; external BePascalLibName name 'BList_SwapItems';
function BList_MoveItem(AObject : TCPlusObject; fromindex : cardinal; Toindex : cardinal) : boolean;cdecl; external BePascalLibName name 'BList_MoveItem';


implementation



constructor BList.Create;
begin
  inherited;
  CPlusObject:=BList_Create( 10); // we can't made a parametre under a constructor -> error : init with 10 items per blocks
end;


destructor BList.Destroy; 
begin
   if CPlusObject <> nil then
    BList_Free(CPlusObject);
  inherited;
end;

function BList.AddItem(item : pointer): boolean;
begin
  result := BList_AddItem(CPlusObject, item );
end;

function BList.AddItem(item : pointer; atindex : cardinal): boolean;
begin
  result := BList_AddItem(CPlusObject, item , atindex);
end;

function BList.AddList(newitem : TCPlusObject): boolean;
begin
  result:=BList_AddList(CPlusObject, newitem );
end;


function BList.ItemAt(at : cardinal): pointer;
begin
  result:=BList_ItemAt(CPlusObject, at );
end;

function BList.ItemAtFast(at : cardinal): pointer;
begin
  result:=BList_ItemAtFast(CPlusObject, at );
end;

function BList.RemoveItem(item : pointer) : boolean;
begin
  result:=BList_RemoveItem(CPlusObject, item);
end;

function BList.RemoveItem(index : cardinal) : boolean;
begin
  result:=BList_RemoveItem(CPlusObject, index);
end;

function BList.RemoveItems(index,count : cardinal) : boolean;
begin
  result:=BList_RemoveItems(CPlusObject, index,count);
end;

procedure BList.MakeEmpty;
begin
  BList_MakeEmpty(CPlusObject);
end;

function BList.FirstItem : pointer;
begin
  result:=BList_FirstItem(CPlusObject);
end;

function BList.LastItem : pointer;
begin
  result:=BList_LastItem(CPlusObject);
end;

function BList.HasItem(item : pointer)  : boolean;
begin
  result:=BList_HasItem(CPlusObject,item);
end;

function BList.IndexOf(item : pointer)  : cardinal;
begin
  result:=BList_IndexOf(CPlusObject,item);
end;

function BList.CountItems : cardinal;
begin
  result:=BList_CountItems(CPlusObject);
end;

function BList.IsEmpty : boolean;
begin
  result:=BList_IsEmpty(CPlusObject);
end;

function BList.ReplaceItem(index : cardinal; newItem : pointer): boolean;
begin
  result:=BList_ReplaceItem(CPlusObject, index , newItem);
end;

function BList.SwapItems(IndexA,IndexB : cardinal) : boolean;
begin
  result:=BList_SwapItems(CPlusObject,indexA,indexB);
end;

function BList.MoveItem(FromIndex,ToIndex : cardinal) : boolean;
begin
  result:=BList_MoveItem(CPlusObject,Fromindex,Toindex);
end;

end.
