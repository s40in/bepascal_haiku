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
unit scrollbar;

interface

uses
  beobj,view,rect,interfacedefs,Message,Archivable,SupportDefs,Handler;

type
   BScrollBar = class(BView)
  private
  public
    constructor Create(aframe : BRect; name : pchar; atarget : BView; min,max : real; direction : orientation);
    constructor Create_1(data : BMessage);
    destructor Destroy;override;
    function Instantiate(data : BMessage) : BArchivable;
    function Archive(data : BMessage; deep : boolean) : Status_t;
    procedure AttachedToWindow;override;
    procedure SetValue(avalue : double);
    function Value : double;
    procedure SetProportion( avalue: double);
    function Proportion : double;
    procedure ValueChanged(newValue : double);
    procedure SetRange(min : double; max : double);
    procedure GetRange(min : double; max : double);
    procedure SetSteps(smallStep : double; largeStep : double);
    procedure GetSteps(smallStep : double; largeStep : double);
    procedure SetTarget(atarget : BView);
    procedure SetTarget(targetName : PChar);
    function Target : BView;
    function GetOrientation : Orientation;
    procedure MessageReceived(msg : BMessage);override;
    procedure MouseDown(pt : BPoint);override;
    procedure MouseUp(pt : BPoint);override;
    procedure MouseMoved(pt : BPoint; code : Cardinal; msg : BMessage);override;
    procedure DetachedFromWindow;override;
    procedure Draw(updateRect : BRect);override;
    procedure FrameMoved(new_position : BPoint);override;
    procedure FrameResized(new_width : double; new_height : double);override;
    function ResolveSpecifier(msg : BMessage; index : integer; specifier : BMessage; form : integer; properti : PChar) : BHandler;
    procedure ResizeToPreferred;override;
    procedure GetPreferredSize(width : double; height : double);
    procedure MakeFocus(state : boolean);
    procedure AllAttached;override;
    procedure AllDetached;override;
    function GetSupportedSuites(data : BMessage) : Status_t;
    function Perform(d : Perform_code; arg : Pointer) : Status_t;
  end;

function BScrollBar_Create(AObject : TBeObject;frame : TCPlusObject; name : pchar; target : TCPlusObject; min,max : real; direction : Orientation): TCPlusObject; cdecl; external BePascalLibName name 'BScrollBar_Create';
function BScrollBar_Create_1(AObject : TBeObject; data : TCPlusObject):TCPlusObject; cdecl; external BePascalLibName name 'BScrollBar_Create_1';
procedure BScrollBar_Free(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BScrollBar_Free';
function BScrollBar_Instantiate(AObject : TCPlusObject; data : TCPlusObject) : BArchivable; cdecl; external BePascalLibName name 'BScrollBar_Instantiate';
function BScrollBar_Archive(AObject : TCPlusObject; data : TCPlusObject; deep : boolean) : Status_t; cdecl; external BePascalLibName name 'BScrollBar_Archive';
procedure BScrollBar_AttachedToWindow(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BScrollBar_AttachedToWindow';
procedure BScrollBar_SetValue(AObject : TCPlusObject; value : double); cdecl; external BePascalLibName name 'BScrollBar_SetValue';
function BScrollBar_Value(AObject : TCPlusObject) : double; cdecl; external BePascalLibName name 'BScrollBar_Value';
procedure BScrollBar_SetProportion(AObject : TCPlusObject;  avalue: double); cdecl; external BePascalLibName name 'BScrollBar_SetProportion';
function BScrollBar_Proportion(AObject : TCPlusObject) : double; cdecl; external BePascalLibName name 'BScrollBar_Proportion';
procedure BScrollBar_ValueChanged(AObject : TCPlusObject; newValue : double); cdecl; external BePascalLibName name 'BScrollBar_ValueChanged';
procedure BScrollBar_SetRange(AObject : TCPlusObject; min : double; max : double); cdecl; external BePascalLibName name 'BScrollBar_SetRange';
procedure BScrollBar_GetRange(AObject : TCPlusObject; min : double; max : double); cdecl; external BePascalLibName name 'BScrollBar_GetRange';
procedure BScrollBar_SetSteps(AObject : TCPlusObject; smallStep : double; largeStep : double); cdecl; external BePascalLibName name 'BScrollBar_SetSteps';
procedure BScrollBar_GetSteps(AObject : TCPlusObject; smallStep : double; largeStep : double); cdecl; external BePascalLibName name 'BScrollBar_GetSteps';
procedure BScrollBar_SetTarget(AObject : TCPlusObject; target : BView); cdecl; external BePascalLibName name 'BScrollBar_SetTarget';
procedure BScrollBar_SetTarget(AObject : TCPlusObject; targetName : PChar); cdecl; external BePascalLibName name 'BScrollBar_SetTarget';
function BScrollBar_Target(AObject : TCPlusObject) : BView; cdecl; external BePascalLibName name 'BScrollBar_Target';
function BScrollBar_Orientation(AObject : TCPlusObject) : Orientation; cdecl; external BePascalLibName name 'BScrollBar_Orientation';
procedure BScrollBar_MessageReceived(AObject : TCPlusObject; msg : TCPlusObject); cdecl; external BePascalLibName name 'BScrollBar_MessageReceived';
procedure BScrollBar_MouseDown(AObject : TCPlusObject; pt : TCPlusObject); cdecl; external BePascalLibName name 'BScrollBar_MouseDown';
procedure BScrollBar_MouseUp(AObject : TCPlusObject; pt : TCPlusObject); cdecl; external BePascalLibName name 'BScrollBar_MouseUp';
procedure BScrollBar_MouseMoved(AObject : TCPlusObject; pt : TCPlusObject; code : Cardinal; msg : BMessage); cdecl; external BePascalLibName name 'BScrollBar_MouseMoved';
procedure BScrollBar_DetachedFromWindow(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BScrollBar_DetachedFromWindow';
procedure BScrollBar_Draw(AObject : TCPlusObject; updateRect : TCPlusObject); cdecl; external BePascalLibName name 'BScrollBar_Draw';
procedure BScrollBar_FrameMoved(AObject : TCPlusObject; new_position : TCPlusObject); cdecl; external BePascalLibName name 'BScrollBar_FrameMoved';
procedure BScrollBar_FrameResized(AObject : TCPlusObject; new_width : double; new_height : double); cdecl; external BePascalLibName name 'BScrollBar_FrameResized';
function BScrollBar_ResolveSpecifier(AObject : TCPlusObject; msg : TCPlusObject; index : integer; specifier : TCPlusObject; form : integer; properti : PChar) : BHandler; cdecl; external BePascalLibName name 'BScrollBar_ResolveSpecifier';
procedure BScrollBar_ResizeToPreferred(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BScrollBar_ResizeToPreferred';
procedure BScrollBar_GetPreferredSize(AObject : TCPlusObject; width : double; height : double); cdecl; external BePascalLibName name 'BScrollBar_GetPreferredSize';
procedure BScrollBar_MakeFocus(AObject : TCPlusObject; state : boolean); cdecl; external BePascalLibName name 'BScrollBar_MakeFocus';
procedure BScrollBar_AllAttached(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BScrollBar_AllAttached';
procedure BScrollBar_AllDetached(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BScrollBar_AllDetached';
function BScrollBar_GetSupportedSuites(AObject : TCPlusObject; data : TCPlusObject) : Status_t; cdecl; external BePascalLibName name 'BScrollBar_GetSupportedSuites';
function BScrollBar_Perform(AObject : TCPlusObject; d : Perform_code; arg : Pointer) : Status_t; cdecl; external BePascalLibName name 'BScrollBar_Perform';

implementation

constructor  BScrollBar.Create(aframe : BRect; name : pchar; atarget : BView; min,max : real; direction : Orientation);
begin
   CreatePas;
  CPlusObject := BScrollBar_Create(Self,aframe.CPlusObject, name, target.CPlusObject,min,max, direction );
end;

constructor  BScrollBar.Create_1(data : BMessage);
begin
  CreatePas;
  CPlusObject := BScrollBar_Create_1(Self, data.CPlusObject);
end;

destructor  BScrollBar.Destroy;
begin
  BScrollBar_Free(CPlusObject);
  inherited;
end;

function  BScrollBar.Instantiate(data : BMessage) : BArchivable;
begin
  Result := BScrollBar_Instantiate(CPlusObject, data.CPlusObject);
end;

function  BScrollBar.Archive(data : BMessage; deep : boolean) : Status_t;
begin
  Result := BScrollBar_Archive(CPlusObject, data.CPlusObject, deep);
end;

procedure  BScrollBar.AttachedToWindow;
begin
 // BScrollBar_AttachedToWindow(CPlusObject);
end;

procedure  BScrollBar.SetValue(avalue : double);
begin
  BScrollBar_SetValue(CPlusObject, avalue);
end;

function  BScrollBar.Value : double;
begin
  Result := BScrollBar_Value(CPlusObject);
end;

procedure  BScrollBar.SetProportion( avalue: double);
begin
  BScrollBar_SetProportion(CPlusObject, avalue);
end;

function  BScrollBar.Proportion : double;
begin
  Result := BScrollBar_Proportion(CPlusObject);
end;

procedure  BScrollBar.ValueChanged(newValue : double);
begin
  BScrollBar_ValueChanged(CPlusObject, newValue);
end;

procedure  BScrollBar.SetRange(min : double; max : double);
begin
  BScrollBar_SetRange(CPlusObject, min, max);
end;

procedure  BScrollBar.GetRange(min : double; max : double);
begin
  BScrollBar_GetRange(CPlusObject, min, max);
end;

procedure  BScrollBar.SetSteps(smallStep : double; largeStep : double);
begin
  BScrollBar_SetSteps(CPlusObject, smallStep, largeStep);
end;

procedure  BScrollBar.GetSteps(smallStep : double; largeStep : double);
begin
  BScrollBar_GetSteps(CPlusObject, smallStep, largeStep);
end;

procedure  BScrollBar.SetTarget(atarget : BView);
begin
  BScrollBar_SetTarget(CPlusObject, target.CPlusObject);
end;

procedure  BScrollBar.SetTarget(targetName : PChar);
begin
  BScrollBar_SetTarget(CPlusObject, targetName);
end;

function  BScrollBar.Target : BView;
begin
  Result := BScrollBar_Target(CPlusObject);
end;

function  BScrollBar.GetOrientation : Orientation;
begin
  Result := BScrollBar_Orientation(CPlusObject);
end;

procedure  BScrollBar.MessageReceived(msg : BMessage);
begin
 // BScrollBar_MessageReceived(CPlusObject, msg.CPlusObject);
end;

procedure  BScrollBar.MouseDown(pt : BPoint);
begin
//  BScrollBar_MouseDown(CPlusObject, pt.CPlusObject);
end;

procedure  BScrollBar.MouseUp(pt : BPoint);
begin
//  BScrollBar_MouseUp(CPlusObject, pt.CPlusObject);
end;

procedure  BScrollBar.MouseMoved(pt : BPoint; code : Cardinal; msg : BMessage);
begin
//  BScrollBar_MouseMoved(CPlusObject, pt.CPlusObject, code, msg);
end;

procedure  BScrollBar.DetachedFromWindow;
begin
 // BScrollBar_DetachedFromWindow(CPlusObject);
end;

procedure  BScrollBar.Draw(updateRect : BRect);
begin
  //BScrollBar_Draw(CPlusObject, updateRect.CPlusObject);
end;

procedure  BScrollBar.FrameMoved(new_position : BPoint);
begin
//  BScrollBar_FrameMoved(CPlusObject, new_position.CPlusObject);
end;

procedure  BScrollBar.FrameResized(new_width : double; new_height : double);
begin
//  BScrollBar_FrameResized(CPlusObject, new_width, new_height);
end;

function  BScrollBar.ResolveSpecifier(msg : BMessage; index : integer; specifier : BMessage; form : integer; properti : PChar) : BHandler;
begin
  Result := BScrollBar_ResolveSpecifier(CPlusObject, msg.CPlusObject, index, specifier.CPlusObject, form, properti);
end;

procedure  BScrollBar.ResizeToPreferred;
begin
//  BScrollBar_ResizeToPreferred(CPlusObject);
end;

procedure  BScrollBar.GetPreferredSize(width : double; height : double);
begin
  BScrollBar_GetPreferredSize(CPlusObject, width, height);
end;

procedure  BScrollBar.MakeFocus(state : boolean);
begin
  BScrollBar_MakeFocus(CPlusObject, state);
end;

procedure  BScrollBar.AllAttached;
begin
  BScrollBar_AllAttached(CPlusObject);
end;

procedure  BScrollBar.AllDetached;
begin
  BScrollBar_AllDetached(CPlusObject);
end;

function  BScrollBar.GetSupportedSuites(data : BMessage) : Status_t;
begin
  Result := BScrollBar_GetSupportedSuites(CPlusObject, data.CPlusObject);
end;

function  BScrollBar.Perform(d : Perform_code; arg : Pointer) : Status_t;
begin
  Result := BScrollBar_Perform(CPlusObject, d, arg);
end;


end.
