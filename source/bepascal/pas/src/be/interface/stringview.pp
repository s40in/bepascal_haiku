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
unit stringview;

interface

uses
  beobj, interfacedefs,view,Message, Archivable, SupportDefs, Rect, Handler;

type
   BStringView = class(BView)
  private
  public
    constructor Create(abounds : BRect; name : pchar; texte : pchar; resizeflags, sflags : cardinal); virtual;
    destructor Destroy; override;
    function Instantiate(data : BMessage) : BArchivable;
    function Archive(data : BMessage; deep : boolean) : Status_t;
    procedure SetText(texte : PChar);
    function Text : PChar;
    procedure SeAlignment(flag :  Alignment);
    function GetAlignment :  Alignment;
    procedure AttachedToWindow; override;
    procedure Draw(abounds : BRect); override;
    procedure MessageReceived(msg : BMessage);override;
    procedure MouseDown(pt : BPoint);override;
    procedure MouseUp(pt : BPoint);override;
    procedure MouseMoved(pt : BPoint; code : Cardinal; msg : BMessage);override;
    procedure DetachedFromWindow;override;
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
//    procedure _ReservedStringView1;
//    procedure _ReservedStringView2;
//    procedure _ReservedStringView3;
//    function operator=( :  BStringView) :  BStringView;
//    procedure char *fText;
//    procedure alignment fAlign;
//    procedure uint32 _reserved[3];
  end;

function BStringView_Create(AObject : TBeObject;bounds : TCPlusObject; name : pchar; texte : pchar; resizeflags, flags : cardinal): TCPlusObject; cdecl; external BePascalLibName name 'BStringView_Create';
procedure BStringView_Free(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BStringView_Free';
function BStringView_Instantiate(AObject : TCPlusObject; data : TCPlusObject) : BArchivable; cdecl; external BePascalLibName name 'BStringView_Instantiate';
function BStringView_Archive(AObject : TCPlusObject; data : TCPlusObject; deep : boolean) : Status_t; cdecl; external BePascalLibName name 'BStringView_Archive';
procedure BStringView_SetText(AObject : TCPlusObject; text : PChar); cdecl; external BePascalLibName name 'BStringView_SetText';
function BStringView_Text(AObject : TCPlusObject) : PChar; cdecl; external BePascalLibName name 'BStringView_Text';
procedure BStringView_SeAlignment(AObject : TCPlusObject; flag :  Alignment); cdecl; external BePascalLibName name 'BStringView_SetAlignment';
function BStringView_Alignment(AObject : TCPlusObject) :  Alignment; cdecl; external BePascalLibName name 'BStringView_Alignment';
procedure BStringView_AttachedToWindow(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BStringView_AttachedToWindow';
procedure BStringView_Draw(AObject : TCPlusObject; bounds : TCPlusObject); cdecl; external BePascalLibName name 'BStringView_Draw';
procedure BStringView_MessageReceived(AObject : TCPlusObject; msg : TCPlusObject); cdecl; external BePascalLibName name 'BStringView_MessageReceived';
procedure BStringView_MouseDown(AObject : TCPlusObject; pt : TCPlusObject); cdecl; external BePascalLibName name 'BStringView_MouseDown';
procedure BStringView_MouseUp(AObject : TCPlusObject; pt : TCPlusObject); cdecl; external BePascalLibName name 'BStringView_MouseUp';
procedure BStringView_MouseMoved(AObject : TCPlusObject; pt : TCPlusObject; code : Cardinal; msg : TCPlusObject); cdecl; external BePascalLibName name 'BStringView_MouseMoved';
procedure BStringView_DetachedFromWindow(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BStringView_DetachedFromWindow';
procedure BStringView_FrameMoved(AObject : TCPlusObject; new_position : TCPlusObject); cdecl; external BePascalLibName name 'BStringView_FrameMoved';
procedure BStringView_FrameResized(AObject : TCPlusObject; new_width : double; new_height : double); cdecl; external BePascalLibName name 'BStringView_FrameResized';
function BStringView_ResolveSpecifier(AObject : TCPlusObject; msg : TCPlusObject; index : integer; specifier : TCPlusObject; form : integer; properti : PChar) : BHandler; cdecl; external BePascalLibName name 'BStringView_ResolveSpecifier';
procedure BStringView_ResizeToPreferred(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BStringView_ResizeToPreferred';
procedure BStringView_GetPreferredSize(AObject : TCPlusObject; width : double; height : double); cdecl; external BePascalLibName name 'BStringView_GetPreferredSize';
procedure BStringView_MakeFocus(AObject : TCPlusObject; state : boolean); cdecl; external BePascalLibName name 'BStringView_MakeFocus';
procedure BStringView_AllAttached(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BStringView_AllAttached';
procedure BStringView_AllDetached(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BStringView_AllDetached';
function BStringView_GetSupportedSuites(AObject : TCPlusObject; data : TCPlusObject) : Status_t; cdecl; external BePascalLibName name 'BStringView_GetSupportedSuites';
function BStringView_Perform(AObject : TCPlusObject; d : Perform_code; arg : Pointer) : Status_t; cdecl; external BePascalLibName name 'BStringView_Perform';
//procedure BStringView__ReservedStringView1(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BStringView__ReservedStringView1';
//procedure BStringView__ReservedStringView2(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BStringView__ReservedStringView2';
//procedure BStringView__ReservedStringView3(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BStringView__ReservedStringView3';
//function BStringView_operator=(AObject : TCPlusObject;  :  BStringView) :  BStringView; cdecl; external BePascalLibName name 'BStringView_operator=';
//procedure BStringView_char *fText(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BStringView_char *fText';
//procedure BStringView_alignment fAlign(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BStringView_alignment fAlign';
//procedure BStringView_uint32 _reserved[3](AObject : TCPlusObject); cdecl; external BePascalLibName name 'BStringView_uint32 _reserved[3]';

implementation

constructor  BStringView.Create(abounds : BRect; name : pchar; texte : pchar; resizeflags, sflags : cardinal);
begin
  CreatePas;
  CPlusObject := BStringView_Create(Self,abounds.CPlusObject,name,texte,resizeflags, sflags);
end;

destructor  BStringView.Destroy;
begin
  BStringView_Free(CPlusObject);
  inherited;
end;

function  BStringView.Instantiate(data : BMessage) : BArchivable;
begin
  Result := BStringView_Instantiate(CPlusObject, data.CPlusObject);
end;

function  BStringView.Archive(data : BMessage; deep : boolean) : Status_t;
begin
  Result := BStringView_Archive(CPlusObject, data.CPlusObject, deep);
end;

procedure  BStringView.SetText(texte : PChar);
begin
  BStringView_SetText(CPlusObject, texte);
end;

function  BStringView.Text : PChar;
begin
  Result := BStringView_Text(CPlusObject);
end;

procedure  BStringView.SeAlignment(flag :  Alignment);
begin
  BStringView_SeAlignment(CPlusObject, flag);
end;

function  BStringView.getAlignment :  Alignment;
begin
  Result := BStringView_Alignment(CPlusObject);
end;

procedure  BStringView.AttachedToWindow;
begin
//  BStringView_AttachedToWindow(CPlusObject);
end;

procedure  BStringView.Draw(abounds : BRect);
begin
 // BStringView_Draw(CPlusObject, abounds.CPlusObject);
end;

procedure  BStringView.MessageReceived(msg : BMessage);
begin
  //BStringView_MessageReceived(CPlusObject, msg.CPlusObject);
end;

procedure  BStringView.MouseDown(pt : BPoint);
begin
  //BStringView_MouseDown(CPlusObject, pt.CPlusObject);
end;

procedure  BStringView.MouseUp(pt : BPoint);
begin
 //BStringView_MouseUp(CPlusObject, pt.CPlusObject);
end;

procedure  BStringView.MouseMoved(pt : BPoint; code : Cardinal; msg : BMessage);
begin
  //BStringView_MouseMoved(CPlusObject, pt.CPlusObject, code, msg);
end;

procedure  BStringView.DetachedFromWindow;
begin
  //BStringView_DetachedFromWindow(CPlusObject);
end;

procedure  BStringView.FrameMoved(new_position : BPoint);
begin
  //BStringView_FrameMoved(CPlusObject, new_position.CPlusObject);
end;

procedure  BStringView.FrameResized(new_width : double; new_height : double);
begin
  //BStringView_FrameResized(CPlusObject, new_width, new_height);
end;

function  BStringView.ResolveSpecifier(msg : BMessage; index : integer; specifier : BMessage; form : integer; properti : PChar) : BHandler;
begin
 // Result := BStringView_ResolveSpecifier(CPlusObject, msg.CPlusObject, index, specifier.CPlusObject, form, properti);
end;

procedure  BStringView.ResizeToPreferred;
begin
  //BStringView_ResizeToPreferred(CPlusObject);
end;

procedure  BStringView.GetPreferredSize(width : double; height : double);
begin
  BStringView_GetPreferredSize(CPlusObject, width, height);
end;

procedure  BStringView.MakeFocus(state : boolean);
begin
  BStringView_MakeFocus(CPlusObject, state);
end;

procedure  BStringView.AllAttached;
begin
  //BStringView_AllAttached(CPlusObject);
end;

procedure  BStringView.AllDetached;
begin
  //BStringView_AllDetached(CPlusObject);
end;

function  BStringView.GetSupportedSuites(data : BMessage) : Status_t;
begin
  Result := BStringView_GetSupportedSuites(CPlusObject, data.CPlusObject);
end;

function  BStringView.Perform(d : Perform_code; arg : Pointer) : Status_t;
begin
  //Result := BStringView_Perform(CPlusObject, d, arg);
end;

{procedure  BStringView._ReservedStringView1;
begin
  BStringView__ReservedStringView1(CPlusObject);
end;

procedure  BStringView._ReservedStringView2;
begin
  BStringView__ReservedStringView2(CPlusObject);
end;

procedure  BStringView._ReservedStringView3;
begin
  BStringView__ReservedStringView3(CPlusObject);
end;

function  BStringView.operator=( :  BStringView) :  BStringView;
begin
  Result := BStringView_operator=(CPlusObject, );
end;

procedure  BStringView.char *fText;
begin
  BStringView_char *fText(CPlusObject);
end;

procedure  BStringView.alignment fAlign;
begin
  BStringView_alignment fAlign(CPlusObject);
end;

procedure  BStringView.uint32 _reserved[3];
begin
  BStringView_uint32 _reserved[3](CPlusObject);
end;
}

end.
