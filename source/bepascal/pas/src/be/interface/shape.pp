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
unit shape;

interface

uses
  beobj, message,interfacedefs,SupportDefs,archivable,rect;

type
  BShape =Class;	

  BShapeIterator = class(TBeObject)
  private
  public
    constructor Create; override;
    destructor Destroy;override;
    function IterateMoveTo(point : BPoint) : Status_t;
    function IterateLineTo(lineCount : integer; linePts : BPoint) : Status_t;
    function IterateBezierTo(bezierCount : integer; bezierPts : BPoint) : Status_t;
    function IterateClose : Status_t;
    function Iterate(shape : BShape) : Status_t;
  end;
type
  BShape = class(BArchivable)
  private
  public
    constructor Create;override;
    constructor Create(copyFrom : BShape);
    constructor Create(data : BMessage);
    destructor Destroy;override;
    function Archive(into : BMessage; deep : boolean) : Status_t;
    function Instantiate(data : BMessage) : BArchivable;
    procedure Clear;
    function Bounds : BRect;
    function AddShape(other : BShape) : Status_t;
    function MoveTo(point : BPoint) : Status_t;
    function LineTo(linePoint : BPoint) : Status_t;
    function BezierTo(controlPoints : BPoint) : Status_t;
    function Close : Status_t;
//    function Perform(d : Perform_code; arg : Pointer) : Status_t;
  end;

function BShapeIterator_Create(AObject : TBeObject):TCPlusObject; cdecl; external BePascalLibName name 'BShapeIterator_Create';
procedure BShapeIterator_Free(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BShapeIterator_Free';
function BShapeIterator_IterateMoveTo(AObject : TCPlusObject; point : TCPlusObject) : Status_t; cdecl; external BePascalLibName name 'BShapeIterator_IterateMoveTo';
function BShapeIterator_IterateLineTo(AObject : TCPlusObject; lineCount : integer; linePts : TCPlusObject) : Status_t; cdecl; external BePascalLibName name 'BShapeIterator_IterateLineTo';
function BShapeIterator_IterateBezierTo(AObject : TCPlusObject; bezierCount : integer; bezierPts : TCPlusObject) : Status_t; cdecl; external BePascalLibName name 'BShapeIterator_IterateBezierTo';
function BShapeIterator_IterateClose(AObject : TCPlusObject) : Status_t; cdecl; external BePascalLibName name 'BShapeIterator_IterateClose';
function BShapeIterator_Iterate(AObject : TCPlusObject; shape : TCPlusObject) : Status_t; cdecl; external BePascalLibName name 'BShapeIterator_Iterate';

function BShape_Create(AObject : TBeObject):TCPlusObject; cdecl; external BePascalLibName name 'BShape_Create';
function BShape_Create(AObject : TBeObject; copyFrom : BShape):TCPlusObject; cdecl; external BePascalLibName name 'BShape_Create_1';
function BShape_Create(AObject : TBeObject; data : TCPlusObject):TCPlusObject; cdecl; external BePascalLibName name 'BShape_Create_2';
procedure BShape_Free(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BShape_Free';
function BShape_Archive(AObject : TCPlusObject; into : TCPlusObject; deep : boolean) : Status_t; cdecl; external BePascalLibName name 'BShape_Archive';
function BShape_Instantiate(AObject : TCPlusObject; data : TCPlusObject) : BArchivable; cdecl; external BePascalLibName name 'BShape_Instantiate';
procedure BShape_Clear(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BShape_Clear';
function BShape_Bounds(AObject : TCPlusObject) : BRect; cdecl; external BePascalLibName name 'BShape_Bounds';
function BShape_AddShape(AObject : TCPlusObject; other : BShape) : Status_t; cdecl; external BePascalLibName name 'BShape_AddShape';
function BShape_MoveTo(AObject : TCPlusObject; point : TCPlusObject) : Status_t; cdecl; external BePascalLibName name 'BShape_MoveTo';
function BShape_LineTo(AObject : TCPlusObject; linePoint : TCPlusObject) : Status_t; cdecl; external BePascalLibName name 'BShape_LineTo';
function BShape_BezierTo(AObject : TCPlusObject; controlPoints : TCPlusObject) : Status_t; cdecl; external BePascalLibName name 'BShape_BezierTo';
function BShape_Close(AObject : TCPlusObject) : Status_t; cdecl; external BePascalLibName name 'BShape_Close';
//function BShape_Perform(AObject : TCPlusObject; d : Perform_code; arg : Pointer) : Status_t; cdecl; external BePascalLibName name 'BShape_Perform';

implementation

constructor BShapeIterator.Create;
begin
  inherited Create;
  CPlusObject := BShapeIterator_Create(Self);
end;

destructor BShapeIterator.Destroy;
begin
  BShapeIterator_Free(CPlusObject);
  inherited Destroy;  
end;

function BShapeIterator.IterateMoveTo(point : BPoint) : Status_t;
begin
  Result := BShapeIterator_IterateMoveTo(CPlusObject, point.CPlusObject);
end;

function BShapeIterator.IterateLineTo(lineCount : integer; linePts : BPoint) : Status_t;
begin
  Result := BShapeIterator_IterateLineTo(CPlusObject, lineCount, linePts.CPlusObject);
end;

function BShapeIterator.IterateBezierTo(bezierCount : integer; bezierPts : BPoint) : Status_t;
begin
  Result := BShapeIterator_IterateBezierTo(CPlusObject, bezierCount, bezierPts.CPlusObject);
end;

function BShapeIterator.IterateClose : Status_t;
begin
  Result := BShapeIterator_IterateClose(CPlusObject);
end;

function BShapeIterator.Iterate(shape : BShape) : Status_t;
begin
  Result := BShapeIterator_Iterate(CPlusObject, shape.CPlusObject);
end;


constructor BShape.Create;
begin
  inherited Create;
   CPlusObject := BShape_Create(Self);
end;

constructor BShape.Create(copyFrom : BShape);
begin
  inherited Create;  
  CPlusObject := BShape_Create(Self, copyFrom);
end;

constructor BShape.Create(data : BMessage);
begin
  inherited Create;
  CPlusObject := BShape_Create(Self, data.CPlusObject);
end;

destructor BShape.Destroy;
begin
  BShape_Free(CPlusObject);
  inherited Destroy;  
end;

function BShape.Archive(into : BMessage; deep : boolean) : Status_t;
begin
  Result := BShape_Archive(CPlusObject, into.CPlusObject, deep);
end;

function BShape.Instantiate(data : BMessage) : BArchivable;
begin
  Result := BShape_Instantiate(CPlusObject, data.CPlusObject);
end;

procedure BShape.Clear;
begin
  BShape_Clear(CPlusObject);
end;

function BShape.Bounds : BRect;
begin
  Result := BShape_Bounds(CPlusObject);
end;

function BShape.AddShape(other : BShape) : Status_t;
begin
  Result := BShape_AddShape(CPlusObject, other);
end;

function BShape.MoveTo(point : BPoint) : Status_t;
begin
  Result := BShape_MoveTo(CPlusObject, point.CPlusObject);
end;

function BShape.LineTo(linePoint : BPoint) : Status_t;
begin
  Result := BShape_LineTo(CPlusObject, linePoint.CPlusObject);
end;

function BShape.BezierTo(controlPoints : BPoint) : Status_t;
begin
  Result := BShape_BezierTo(CPlusObject, controlPoints.CPlusObject);
end;

function BShape.Close : Status_t;
begin
  Result := BShape_Close(CPlusObject);
end;

{function BShape.Perform(d : Perform_code; arg : Pointer) : Status_t;
begin
  Result := BShape_Perform(CPlusObject, d, arg);
end;
}

end.
