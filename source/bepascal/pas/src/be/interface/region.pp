{   BePascal - A pascal wrapper around the BeOS API                             
    Copyright (C) 2002 Olivier Coursiere                                        
                       Eric Jourde                                              
                                                                                
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
unit region;

interface

uses
  beobj,rect;



type clipping_rect=record
	left :integer;
	top:integer;
	right:integer;
	bottom:integer;
end;

type
   BRegion = class(TBeObject)
  private
  public
    constructor Create;
    constructor Create(region :BRegion );
    constructor Create(rect : Brect);
    destructor Destroy;override;
    function Frame : BRect;
    function FrameInt : clipping_rect;
    function RectAt(index : integer) : BRect;
    function RectAtInt(index : integer) :clipping_rect ;
    function CountRects : integer;
    procedure SetRect(newBounds : BRect);
    procedure Setclipping_rect(newBounds : clipping_rect);
    function Intersects(r : BRect) : boolean;
    function Intersects(r : clipping_rect) : boolean;
    function Contains(pt : BPoint) : boolean;
    function Contains(x : integer; y : integer) : boolean;
    procedure PrintToStream;
    procedure OffsetBy(dh : integer; dv : integer);
    procedure MakeEmpty;
    procedure Include(r : BRect);
    procedure Include(r : clipping_rect);
    procedure Include( r: BRegion);
    procedure Exclude(r : BRect);
    procedure Exclude(r : clipping_rect);
    procedure Exclude(r : BRegion);
    procedure IntersectWith(r : BRegion);
  
  end;

function BRegion_Create(AObject : TBeObject): TCPlusObject; cdecl; external BePascalLibName name 'BRegion_Create';
function BRegion_Create(AObject : TBeObject; region : BRegion): TCPlusObject; cdecl; external BePascalLibName name 'BRegion_Create';
function BRegion_Create(AObject : TBeObject; rect : Brect): TCPlusObject; cdecl; external BePascalLibName name 'BRegion_Create';
procedure BRegion_Free(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BRegion_Free';
function BRegion_Frame(AObject : TCPlusObject) : BRect; cdecl; external BePascalLibName name 'BRegion_Frame';
function BRegion_FrameInt(AObject : TCPlusObject) :clipping_rect ; cdecl; external BePascalLibName name 'BRegion_FrameInt_1';
function BRegion_RectAt(AObject : TCPlusObject; index : integer) : BRect; cdecl; external BePascalLibName name 'BRegion_RectAt';
function BRegion_RectAtInt(AObject : TCPlusObject; index : integer) : clipping_rect; cdecl; external BePascalLibName name 'BRegion_RectAtInt_1';
function BRegion_CountRects(AObject : TCPlusObject) : integer; cdecl; external BePascalLibName name 'BRegion_CountRects';
procedure BRegion_Set(AObject : TCPlusObject; newBounds : TCPlusObject); cdecl; external BePascalLibName name 'BRegion_Set';
procedure BRegion_Set(AObject : TCPlusObject; newBounds : clipping_rect); cdecl; external BePascalLibName name 'BRegion_Set';
function BRegion_Intersects(AObject : TCPlusObject; r : TCPlusObject) : boolean; cdecl; external BePascalLibName name 'BRegion_Intersects';
function BRegion_Intersects(AObject : TCPlusObject; r : clipping_rect) : boolean; cdecl; external BePascalLibName name 'BRegion_Intersects';
function BRegion_Contains(AObject : TCPlusObject; pt : TCPlusObject) : boolean; cdecl; external BePascalLibName name 'BRegion_Contains';
function BRegion_Contains(AObject : TCPlusObject; x : integer; y : integer) : boolean; cdecl; external BePascalLibName name 'BRegion_Contains';
procedure BRegion_PrintToStream(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BRegion_PrintToStream';
procedure BRegion_OffsetBy(AObject : TCPlusObject; dh : integer; dv : integer); cdecl; external BePascalLibName name 'BRegion_OffsetBy';
procedure BRegion_MakeEmpty(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BRegion_MakeEmpty';
procedure BRegion_Include(AObject : TCPlusObject; r : TCPlusObject); cdecl; external BePascalLibName name 'BRegion_Include';
procedure BRegion_Include(AObject : TCPlusObject; r : clipping_rect); cdecl; external BePascalLibName name 'BRegion_Include';
procedure BRegion_Include(AObject : TCPlusObject; r : BRegion); cdecl; external BePascalLibName name 'BRegion_Include';
procedure BRegion_Exclude(AObject : TCPlusObject; r : TCPlusObject); cdecl; external BePascalLibName name 'BRegion_Exclude';
procedure BRegion_Exclude(AObject : TCPlusObject; r :clipping_rect ); cdecl; external BePascalLibName name 'BRegion_Exclude';
procedure BRegion_Exclude(AObject : TCPlusObject; r: BRegion); cdecl; external BePascalLibName name 'BRegion_Exclude';
procedure BRegion_IntersectWith(AObject : TCPlusObject;  r: BRegion); cdecl; external BePascalLibName name 'BRegion_IntersectWith';

implementation

constructor  BRegion.Create;
begin
  CreatePas;
  CPlusObject := BRegion_Create(Self);
end;

constructor  BRegion.Create(region : BRegion);
begin
  CreatePas;
  CPlusObject := BRegion_Create(Self, region);
end;

constructor  BRegion.Create(rect : BRect);
begin
  CreatePas;
  CPlusObject := BRegion_Create(Self, rect);
end;

destructor  BRegion.Destroy;
begin
  BRegion_Free(CPlusObject);
   inherited;
end;



function  BRegion.Frame : BRect;
begin
  Result := BRegion_Frame(CPlusObject);
end;

function  BRegion.FrameInt :clipping_rect ;
begin
  Result := BRegion_FrameInt(CPlusObject);
end;

function  BRegion.RectAt(index : integer) : BRect;
begin
  Result := BRegion_RectAt(CPlusObject, index);
end;

function  BRegion.RectAtInt(index : integer) :clipping_rect ;
begin
  Result := BRegion_RectAtInt(CPlusObject, index);
end;

function  BRegion.CountRects : integer;
begin
  Result := BRegion_CountRects(CPlusObject);
end;

procedure  BRegion.Setrect(newBounds : BRect);
begin
  BRegion_Set(CPlusObject, newBounds.CPlusObject);
end;

procedure  BRegion.Setclipping_rect(newBounds : clipping_rect);
begin
  BRegion_Set(CPlusObject, newBounds);
end;

function  BRegion.Intersects(r : BRect) : boolean;
begin
  Result := BRegion_Intersects(CPlusObject, r.CPlusObject);
end;

function  BRegion.Intersects(r : clipping_rect) : boolean;
begin
  Result := BRegion_Intersects(CPlusObject, r);
end;

function  BRegion.Contains(pt : BPoint) : boolean;
begin
  Result := BRegion_Contains(CPlusObject, pt.CPlusObject);
end;

function  BRegion.Contains(x : integer; y : integer) : boolean;
begin
  Result := BRegion_Contains(CPlusObject, x, y);
end;

procedure  BRegion.PrintToStream;
begin
  BRegion_PrintToStream(CPlusObject);
end;

procedure  BRegion.OffsetBy(dh : integer; dv : integer);
begin
  BRegion_OffsetBy(CPlusObject, dh, dv);
end;

procedure  BRegion.MakeEmpty;
begin
  BRegion_MakeEmpty(CPlusObject);
end;

procedure  BRegion.Include(r : BRect);
begin
  BRegion_Include(CPlusObject, r.CPlusObject);
end;

procedure  BRegion.Include(r : clipping_rect);
begin
  BRegion_Include(CPlusObject, r);
end;

procedure  BRegion.Include(r : BRegion);
begin
  BRegion_Include(CPlusObject, r);
end;

procedure  BRegion.Exclude(r : BRect);
begin
  BRegion_Exclude(CPlusObject, r.CPlusObject);
end;

procedure  BRegion.Exclude(r :  clipping_rect);
begin
  BRegion_Exclude(CPlusObject, r);
end;

procedure  BRegion.Exclude( r: BRegion);
begin
  BRegion_Exclude(CPlusObject, r);
end;

procedure  BRegion.IntersectWith( r: BRegion);
begin
  BRegion_IntersectWith(CPlusObject, r);
end;


end.
