{   BePascal - A pascal wrapper around the BeOS API
    Copyright (C) 2002-2003 Olivier Coursiere

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
unit Rect;

interface

uses
  BeObj;

type
  BRect = class;

  BPoint = class(TBeObject)
  public
  	constructor Create; override;
  	constructor Create(x, y : Single); virtual;
  	constructor Create(point : BPoint); virtual;
  	destructor Destroy; override;
  	procedure ConstrainTo(Rect : BRect);
  	procedure PrintToStream;
  	procedure Sept(x, y : Single);
  end;

  // BPoint and BRect are defined in the same unit to avoid circular reference
  BRect = class(TBeObject)
  private
  	function Get_Left   : Single;
  	function Get_Right  : Single;
  	function Get_bottom : Single;
  	function Get_top    : Single;
  public
    constructor Create; override;
    constructor Create(rect : BRect); virtual; // Problème de référence circulaire avec BPoint
    constructor Create(l, t, r, b : Single);
    constructor Create(leftTop, rightBottom : BPoint); virtual;
    destructor Destroy; override;
    procedure PrintToStream;

	procedure SetLeftTop(Rect : TCPlusObject; p : BPoint);
	procedure SetRightBottom(Rect : TCPlusObject; p : BPoint); 
	procedure SetLeftBottom(Rect : TCPlusObject; p : BPoint); 
	procedure SetRightTop(Rect : TCPlusObject; p : BPoint); 
	procedure InsetBy(Rect : TCPlusObject; p : BPoint); 
	procedure InsetBy(Rect : TCPlusObject; dx, dy : Single); 
	procedure OffsetBy(Rect : TCPlusObject; p : BPoint); 
	procedure OffSetBy(Rect : TCPlusObject; dx, dy : Single); 
	procedure OffsetTo(Rect : TCPlusObject; p : BPoint); 
	procedure OffSetTo(Rect : TCPlusObject; dx, dy : Single); 
	function InsetBySelf(Rect : TCPlusObject; p : BPoint) : BRect; 
	function InsetBySelf(Rect : TCPlusObject; dx, dy : Single) : BRect;
	function InsetByCopy(Rect : TCPlusObject; p : BPoint) : BRect; 
	function InsetByCopy(Rect : TCPlusObject; dx, dy : Single) : BRect; 
	function OffSetBySelf(Rect : TCPlusObject; p : BPoint) : BRect; 
	function OffSetBySelf(Rect : TCPlusObject; dx, dy : Single) : BRect;
	function OffSetByCopy(Rect : TCPlusObject; p : BPoint) : BRect; 
	function OffSetByCopy(Rect : TCPlusObject; dx, dy : Single) : BRect; 
	function OffSetToSelf(Rect : TCPlusObject; p : BPoint): BRect; 
	function OffSetToSelf(Rect : TCPlusObject; dx, dy :single): BRect;
	function OffSetToCopy(Rect : TCPlusObject; p : BPoint) : BRect; 
	function OffSetToCopy(Rect : TCPlusObject; dx, dy : Single) : BRect; 
	function Intersects(Rect : TCPlusObject; p : BRect) : Boolean;
	function Contains(Rect : TCPlusObject; p : BPoint) : Boolean; 
	function Contains(Rect : TCPlusObject; p : BRect) : Boolean; 

    property left : Single read Get_left;
    property right : Single read Get_right;
    property bottom : Single read Get_bottom;
    property top : Single read Get_top;
  end;

function BRect_Create(AObject : TBeObject) : TCPlusObject;
         cdecl; external BePascalLibName name 'BRect_Create_1';
function BRect_Create(AObject : TBeObject; rect : TCPlusObject) : TCPlusObject;
         cdecl; external BePascalLibName name 'BRect_Create_2';
function BRect_Create(AObject : TBeObject; l, t, r, b : Single) : TCPlusObject;
         cdecl; external BePascalLibName name 'BRect_Create_3';
function BRect_Create(AObject : TBeObject; leftTop, rightBottom : TCPlusObject)
         : TCPlusObject; cdecl; external BePascalLibName name 'BRect_Create_4';
procedure BRect_Free(rect : TCPlusObject);
          cdecl; external BePascalLibName name 'BRect_Free';

procedure BRect_PrintToStream(Rect : TCPlusObject);
          cdecl; external bePascalLibName name 'BRect_PrintToStream';
function BRect_left(Rect : TCPlusObject) : Single;
         cdecl; external bePascalLibName name 'BRect_left';
function BRect_right(Rect : TCPlusObject) : Single;
         cdecl; external bePascalLibName name 'BRect_right';
function BRect_bottom(Rect : TCPlusObject) : Single;
         cdecl; external bePascalLibName name 'BRect_bottom';
function BRect_top(Rect : TCPlusObject) : Single;
         cdecl; external bePascalLibName name 'BRect_top';

procedure BRect_SetLeftTop(Rect : TCPlusObject; p : BPoint);
          cdecl; external bePascalLibName name 'BRect_SetLeftTop';
procedure BRect_SetRightBottom(Rect : TCPlusObject; p : BPoint);
          cdecl; external bePascalLibName name 'BRect_SetRightBottom';
procedure BRect_SetLeftBottom(Rect : TCPlusObject; p : BPoint);
          cdecl; external bePascalLibName name 'BRect_SetLeftBottom';
procedure BRect_SetRightTop(Rect : TCPlusObject; p : BPoint);
          cdecl; external bePascalLibName name 'BRect_SetRightTop';
procedure BRect_InsetBy(Rect : TCPlusObject; p : BPoint);
          cdecl; external bePascalLibName name 'BRect_InsetBy';
procedure BRect_InsetBy(Rect : TCPlusObject; dx, dy : Single);
          cdecl; external bePascalLibName name 'BRect_InsetBy_1';
procedure BRect_OffsetBy(Rect : TCPlusObject; p : BPoint);
          cdecl; external bePascalLibName name 'BRect_OffsetBy';
procedure BRect_OffSetBy(Rect : TCPlusObject; dx, dy : Single);
          cdecl; external bePascalLibName name 'BRect_OffsetBy_1';
procedure BRect_OffsetTo(Rect : TCPlusObject; p : BPoint);
          cdecl; external bePascalLibName name 'BRect_OffsetTo';
procedure BRect_OffSetTo(Rect : TCPlusObject; dx, dy : Single);
          cdecl; external bePascalLibName name 'BRect_OffsetTo_1';
function BRect_InsetBySelf(Rect : TCPlusObject; p : BPoint) : BRect;
         cdecl; external bePascalLibName name 'BRect_InsetBySelf';
function BRect_InsetBySelf(Rect : TCPlusObject; dx, dy : Single) : BRect;
         cdecl; external bePascalLibName name 'BRect_InsetBySelf_1';
function BRect_InsetByCopy(Rect : TCPlusObject; p : BPoint) : BRect;
         cdecl; external bePascalLibName name 'BRect_InsetByCopy';
function BRect_InsetByCopy(Rect : TCPlusObject; dx, dy : Single) : BRect;
         cdecl; external bePascalLibName name 'BRect_InsetByCopy_1';
function BRect_OffSetBySelf(Rect : TCPlusObject; p : BPoint) : BRect;
         cdecl; external bePascalLibName name 'BRect_OffsetBySelf';
function BRect_OffSetBySelf(Rect : TCPlusObject; dx, dy : Single) : BRect;
         cdecl; external bePascalLibName name 'BRect_OffsetBySelf_1';
function BRect_OffSetByCopy(Rect : TCPlusObject; p : BPoint) : BRect;
         cdecl; external bePascalLibName name 'BRect_OffsetByCopy';
function BRect_OffSetByCopy(Rect : TCPlusObject; dx, dy : Single) : BRect;
         cdecl; external bePascalLibName name 'BRect_OffsetByCopy_1';
function BRect_OffSetToSelf(Rect : TCPlusObject; p : BPoint) : BRect;
         cdecl; external bePascalLibName name 'BRect_OffsetToSelf';
function BRect_OffSetToSelf(Rect : TCPlusObject; dx, dy : Single) : BRect;
         cdecl; external bePascalLibName name 'BRect_OffsetToSelf_1';
function BRect_OffSetToCopy(Rect : TCPlusObject; p : BPoint) : BRect;
         cdecl; external bePascalLibName name 'BRect_OffsetToCopy';
function BRect_OffSetToCopy(Rect : TCPlusObject; dx, dy : Single) : BRect;
         cdecl; external bePascalLibName name 'BRect_OffsetToCopy_1';
function BRect_Intersects(Rect : TCPlusObject; p : BRect) : Boolean;
         cdecl; external bePascalLibName name 'BRect_Intersects';
function BRect_Contains(Rect : TCPlusObject; p : BPoint) : Boolean;
         cdecl; external bePascalLibName name 'BRect_Contains';
function BRect_Contains(Rect : TCPlusObject; p : BRect) : Boolean;
         cdecl; external bePascalLibName name 'BRect_Contains_1';

  
function BPoint_Create(AObject : TBeObject; x, y : single) : TCPlusObject;
         cdecl; external BePascalLibName name 'BPoint_Create_1';
function BPoint_Create(AObject : TBeObject; point : TCPlusObject) : TCPlusObject;
         cdecl; external BePascalLibName name 'BPoint_Create_2';
function BPoint_Create(AObject : TBeObject) : TCPlusObject;
         cdecl; external BePascalLibName name 'BPoint_Create_3';
procedure BPoint_Free(Point : TCPlusObject);
          cdecl; external BePascalLibName name 'BPoint_Free';
procedure BPoint_ConstrainTo(Point : TCPlusObject; Rect : TCPlusObject);
          cdecl; external BePascalLibName name 'BPoint_ConstrainTo';
procedure BPoint_PrintToStream(Point : TCPlusObject);
          cdecl; external bePascalLibName name 'BPoint_PrintToStream';
procedure BPoint_Set(Point : TCPlusObject; x, y : Single);
          cdecl; external BePascalLibName name 'BPoint_Set'; 

implementation

constructor BRect.Create;
begin
  inherited Create;
  CPlusObject := BRect_Create(Self);
end;

constructor BRect.Create(rect : BRect);
begin
  inherited Create;
  CPlusObject := BRect_Create(Self, rect.CPlusObject);
end;

constructor BRect.Create(l, t, r, b : Single);
begin
  inherited Create;
  CPlusObject := BRect_Create(Self, l, t, r, b);
end;

constructor BRect.Create(leftTop, rightBottom : BPoint);
begin
  inherited Create;
  CPlusObject := BRect_Create(Self, leftTop.CPlusObject, rightBottom.CPlusObject);
end;

destructor BRect.Destroy;
begin
  BRect_Free(CPlusObject);
  inherited Destroy;
end;

procedure BRect.PrintToStream;
begin
  BRect_PrintToStream(CPlusObject);
end;

function BRect.Get_Left : Single;
begin
  Result := BRect_left(CPlusObject);
end;

function BRect.Get_right : Single;
begin
  Result := BRect_right(CPlusObject);
end;

function BRect.Get_bottom : Single;
begin
  Result := BRect_bottom(CPlusObject);
end;

function BRect.Get_top : Single;
begin
  Result := BRect_top(CPlusObject);
end;

procedure BRect.SetLeftTop(Rect : TCPlusObject; p : BPoint);
begin
  BRect_SetLeftTop(CPlusObject, p);
end;

procedure BRect.SetRightBottom(Rect : TCPlusObject; p : BPoint);
begin
  BRect_SetRightBottom(CPlusObject, p);
end;

procedure BRect.SetLeftBottom(Rect : TCPlusObject; p : BPoint);
begin
  BRect_SetLeftBottom(CPlusObject, p);
end;

procedure BRect.SetRightTop(Rect : TCPlusObject; p : BPoint);
begin
  BRect_SetRightTop(CPlusObject, p);
end;

procedure BRect.InsetBy(Rect : TCPlusObject; p : BPoint);
begin
  BRect_InsetBy(CPlusObject, p);
end;

procedure BRect.InsetBy(Rect : TCPlusObject; dx, dy : Single);
begin
  BRect_InsetBy(CPlusObject, dx, dy);
end;

procedure BRect.OffsetBy(Rect : TCPlusObject; p : BPoint);
begin
  BRect_OffsetBy(CPlusObject, p);
end;

procedure BRect.OffSetBy(Rect : TCPlusObject; dx, dy : Single);
begin
  BRect_OffSetBy(CPlusObject, dx, dy);
end;

procedure BRect.OffsetTo(Rect : TCPlusObject; p : BPoint);
begin
  BRect_OffsetTo(CPlusObject, p);
end;

procedure BRect.OffSetTo(Rect : TCPlusObject; dx, dy : Single);
begin
  BRect_OffSetTo(CPlusObject, dx, dy);
end;

function BRect.InsetBySelf(Rect : TCPlusObject; p : BPoint) : BRect;
begin
  Result := BRect_InsetBySelf(CPlusObject, p);
end;

function BRect.InsetBySelf(Rect : TCPlusObject; dx, dy : Single) : BRect;
begin
  Result := BRect_InsetBySelf(CPlusObject, dx, dy);
end;

function BRect.InsetByCopy(Rect : TCPlusObject; p : BPoint) : BRect;
begin
  Result := BRect_InsetByCopy(CPlusObject, p);
end;

function BRect.InsetByCopy(Rect : TCPlusObject; dx, dy : Single) : BRect;
begin
  Result := BRect_InsetByCopy(CPlusObject, dx, dy);
end;

function BRect.OffSetBySelf(Rect : TCPlusObject; p : BPoint) : BRect;
begin
  Result := BRect_OffSetBySelf(CPlusObject, p);
end;

function BRect.OffSetBySelf(Rect : TCPlusObject; dx, dy : Single) : BRect;
begin
  Result := BRect_OffSetBySelf(CPlusObject, dx, dy);
end;

function BRect.OffSetByCopy(Rect : TCPlusObject; p : BPoint) : BRect;
begin
  Result := BRect_OffSetByCopy(CPlusObject, p);
end;

function BRect.OffSetByCopy(Rect : TCPlusObject; dx, dy : Single) : BRect;
begin
  Result := BRect_OffSetByCopy(CPlusObject, dx, dy);
end;

function BRect.OffSetToSelf(Rect : TCPlusObject; p : BPoint) : BRect;
begin
  Result := BRect_OffSetToSelf(CPlusObject,p);
end;

function BRect.OffSetToSelf(Rect : TCPlusObject; dx, dy : Single) : BRect;
begin
  Result := BRect_OffSetToSelf(CPlusObject, dx, dy);
end;

function BRect.OffSetToCopy(Rect : TCPlusObject; p : BPoint) : BRect;
begin
  Result := BRect_OffSetToCopy(CPlusObject, p);
end;

function BRect.OffSetToCopy(Rect : TCPlusObject; dx, dy : Single) : BRect;
begin
  Result := BRect_OffSetToCopy(CPlusObject, dx, dy);
end;

function BRect.Intersects(Rect : TCPlusObject; p : BRect) : Boolean;
begin
  Result := BRect_Intersects(CPlusObject, p);
end;

function BRect.Contains(Rect : TCPlusObject; p : BPoint) : Boolean;
begin
  Result := BRect_Contains(CPlusObject, p);
end;

function BRect.Contains(Rect : TCPlusObject; p : BRect) : Boolean;
begin
  Result := BRect_Contains(CPlusObject, p);
end;

// BPoint

constructor BPoint.Create(x, y : Single);
begin
  inherited Create;
  CPlusObject := BPoint_Create(Self, x, y);
end;

constructor BPoint.Create(point : BPoint);
begin
  inherited Create;
  CPlusObject := BPoint_Create(Self, point.CPlusObject)	
end;

constructor BPoint.Create;
begin
  inherited Create;
  CPlusObject := BPoint_Create(Self);
end;

destructor BPoint.Destroy;
begin
  BPoint_Free(CPlusObject);
  inherited;
end;

procedure BPoint.ConstrainTo(Rect : BRect);
begin
  BPoint_ConstrainTo(CPlusObject, Rect.CPlusObject);
end;

procedure BPoint.PrintToStream;
begin
  BPoint_PrintToStream(CPlusObject);
end;

procedure BPoint.Sept(x, y : Single);
begin
  BPoint_Set(CPlusObject, x, y);
end;

end.