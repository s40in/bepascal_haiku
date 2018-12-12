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
unit polygon;

interface

uses
  beobj,rect;

type
   BPolygon = class(TBeObject)
  private
  public
    constructor Create;override; 
//    constructor Create;
    constructor Create(poly : BPolygon);
    destructor Destroy;override;
    function Frame : BRect;
//    procedure AddPoints(ptArray : ; numPoints : integer);
    function CountPoints : integer;
    procedure MapTo(srcRect : BRect; dstRect : BRect);
    procedure PrintToStream;
  end;

function BPolygon_Create(AObject : TBeObject):TCPlusObject; cdecl; external BePascalLibName name 'BPolygon_Create';
//function BPolygon_Create(AObject : TBeObject); cdecl; external BePascalLibName name 'BPolygon_Create_1';
function BPolygon_Create(AObject : TBeObject; poly : TCPlusObject):TCPlusObject; cdecl; external BePascalLibName name 'BPolygon_Create_2';
procedure BPolygon_Free(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BPolygon_Free';
function BPolygon_Frame(AObject : TCPlusObject) : BRect; cdecl; external BePascalLibName name 'BPolygon_Frame';
//procedure BPolygon_AddPoints(AObject : TCPlusObject; ptArray : ; numPoints : integer); cdecl; external BePascalLibName name 'BPolygon_AddPoints';
function BPolygon_CountPoints(AObject : TCPlusObject) : integer; cdecl; external BePascalLibName name 'BPolygon_CountPoints';
procedure BPolygon_MapTo(AObject : TCPlusObject; srcRect : TCPlusObject; dstRect : TCPlusObject); cdecl; external BePascalLibName name 'BPolygon_MapTo';
procedure BPolygon_PrintToStream(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BPolygon_PrintToStream';

implementation

constructor BPolygon.Create;
begin
CreatePas;
  CPlusObject := BPolygon_Create(Self);
end;

{constructor BPolygon.Create;
begin
CreatePas;
  CPlusObject := BPolygon_Create(Self);
end;
}
constructor BPolygon.Create(poly : BPolygon);
begin
CreatePas;  CPlusObject := BPolygon_Create(Self, poly);
end;

destructor BPolygon.Destroy;
begin
  BPolygon_Free(CPlusObject);
  inherited;  
end;


function BPolygon.Frame : BRect;
begin
  Result := BPolygon_Frame(CPlusObject);
end;

{procedure BPolygon.AddPoints(ptArray : ; numPoints : integer);
begin
  BPolygon_AddPoints(CPlusObject, ptArray, numPoints);
end;
}
function BPolygon.CountPoints : integer;
begin
  Result := BPolygon_CountPoints(CPlusObject);
end;

procedure BPolygon.MapTo(srcRect : BRect; dstRect : BRect);
begin
  BPolygon_MapTo(CPlusObject, srcRect.CPlusObject, dstRect.CPlusObject);
end;

procedure BPolygon.PrintToStream;
begin
  BPolygon_PrintToStream(CPlusObject);
end;


end.
