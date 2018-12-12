{  BePascal - A pascal wrapper around the BeOS API
    Copyright (C) 2002 Olivier Coursiere

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
    
   24/5/2003 : Eric : Add Show,Hide,IsHidden 
}

unit View;

interface

uses
  beobj, handler, rect, os, application, appdefs, message,font,SupportDefs,
  graphicdefs,bitmap,region,picture,cursor,interfacedefs,polygon,shape,Archivable;
  
type
  BBitmap =class;
  
  BView = class(BHandler)
  public
    constructor Create(frame1 : BRect; name : PChar; resizingMode1, flags1 : Cardinal);
    destructor Destroy; override;
    // hook functions
    procedure AllAttached; virtual;
    procedure AllDetached; virtual;
    procedure AttachedToWindow; virtual;
    procedure DetachedFromWindow; virtual;
    procedure Draw(updateRect : BRect); virtual;
    procedure DrawAfterChildren(updateRect : BRect); virtual;
    procedure FrameMoved(parenBPoint : BPoint); virtual;
    procedure FrameResized(width, height : double); virtual;
    procedure KeyDown(bytes : PChar; numBytes : integer); virtual;
    procedure KeyUp(bytes : PChar; numBytes : integer); virtual;
    procedure MouseDown(point : BPoint); virtual;
    procedure MouseMoved(point : BPoint; transit : Cardinal; message : BMessage); virtual;
    procedure MouseUp(point : BPoint); virtual;
    procedure Pulse; virtual;
//    procedure TargetedByScrollView(scroller : TScrollView); virtual; // Need BScrollView
    procedure WindowActivated(active : boolean); virtual;
    procedure MessageReceived(aMessage : BMessage); override;
    // End hook functions
    
    function RemoveSelf : boolean;
    procedure AddChild(aView, before : BView);
    function RemoveChild(aView : BView) : boolean;
    function CountChildren : integer;
    function ChildAt(index : integer) : BView;
    function NextSibling : BView;
    function PreviousSibling : BView;
//    function Window : TWindow;
    procedure SetViewColor(rgb_color : RGB_color);
    procedure SetOrigin(pt : BPoint);
    procedure SetOrigin(x : double; y : double);
    
    // I can't write a function and a procedure with the same name so i decide just to write function  ! why not
	function ConvertToScreen(pt :BPoint ) : BPoint; 
	function ConvertFromScreen(pt :BPoint) : BPoint; 
	function ConvertToScreen(r :BRect) : BRect; 
	function ConvertFromScreen( r :BRect) :Brect; 
	function ConvertToParent(pt :BPoint) :BPoint; 
	function ConvertFromParent(pt :BPoint ) :Bpoint; 
	function ConvertToParent(r:BRect ) :Brect; 
	function ConvertFromParent( r : BRect) :BRect; 
	function LeftTop :BPoint; 
	
    procedure BeginRectTracking(startRect : BRect; style : Integer);
    procedure EndRectTracking;
    procedure GetMouse(var location : BPoint; var buttons : Integer; checkMessageQueue : boolean);
    procedure DragMessage( aMessage : BMessage; dragRect : BRect; reply_to : BHandler);
    procedure DragMessage( aMessage : BMessage; anImage : BBitmap; offset : BPoint; reply_to : BHandler);
    procedure DragMessage(aMessage : BMessage; anImage : BBitmap; dragMode : Drawing_Mode; offset : BPoint; reply_to : BHandler);
    function FindView(name : PChar) : BView;
    function Parent : BView;
    function Bounds : BRect;
    function Frame : BRect;
    procedure GetClippingRegion(region :  BRegion);
    procedure ConstrainClippingRegion(region :  BRegion);
	
    procedure ClipToPicture(picture : BPicture; where : BPoint; ssync : boolean);
    procedure ClipToInversePicture(picture : BPicture; where : BPoint; ssync : boolean);
    procedure SetDrawingMode(mode : Drawing_Mode);
    function DrawingMode : Drawing_Mode;
    procedure SetBlendingMode(srcAlpha : source_alpha; alphaFunc : alpha_function );
    procedure GetBlendingMode(srcAlpha : source_alpha; alphaFunc : alpha_function);
    procedure SetPenSize(size : double);
    function PenSize : double;
    procedure SetViewCursor(cursor : BCursor; ssync : boolean);
 //   procedure SetViewColor(r : byte ; g : byte ; b :byte ; a :byte );
    function ViewColor : rgb_color;
    procedure ClearViewBitmap;
    procedure ClearViewOverlay;
    procedure SetHighColor(a_color : rgb_color);
    procedure SetHighColor(r : byte; g : byte; b : byte; a : byte);
    function HighColor : rgb_color;
    procedure SetLowColor(a_color : rgb_color);
    procedure SetLowColor(r :byte ; g :byte ; b : byte; a : byte);
    function LowColor : rgb_color;
    procedure SetLineMode(lineCap : cap_mode; lineJoin : join_mode; miterLimit : double);
    function LineJoinMode : join_mode;
    function LineCapMode : cap_mode;
    function LineMiterLimit : double;

    function Origin : BPoint;
    procedure PushState;
    procedure PopState;
    procedure MovePenTo(pt : BPoint);
    procedure MovePenTo(x : double; y : double);
    procedure MovePenBy(x : double; y : double);
    function PenLocation : BPoint;
    procedure StrokeLine(toPt : BPoint; p : pattern);
    procedure StrokeLine(pt0 : BPoint; pt1 : BPoint; p : pattern);
    procedure BeginLineArray(count : integer);
    procedure AddLine(pt0 : BPoint; pt1 : BPoint; col : rgb_color);
    procedure EndLineArray;
    procedure StrokePolygon(aPolygon : BPolygon; closed : boolean; p : pattern);
    procedure StrokePolygon(ptArray : BPoint; numPts : integer; closed : boolean; p : pattern);
    procedure StrokePolygon(ptArray : BPoint; numPts : integer; sbounds : BRect; closed : boolean; p : pattern);
    procedure FillPolygon(aPolygon : BPolygon; p : pattern);
    procedure FillPolygon(ptArray : BPoint; numPts : integer; p : pattern);
    procedure FillPolygon(ptArray : BPoint; numPts : integer; sbounds : BRect; p : pattern);
    procedure StrokeTriangle(pt1 : BPoint; pt2 : BPoint; pt3 : BPoint; sbounds : BRect; p : pattern);
    procedure StrokeTriangle(pt1 : BPoint; pt2 : BPoint; pt3 : BPoint; p : pattern);
    procedure FillTriangle(pt1 : BPoint; pt2 : BPoint; pt3 : BPoint; p : pattern);
    procedure FillTriangle(pt1 : BPoint; pt2 : BPoint; pt3 : BPoint; sbounds : BRect; p : pattern);
    procedure StrokeRect(r : BRect; p : pattern);
    procedure FillRect(r : BRect; p : pattern);
    procedure FillRegion(a_region :  BRegion; p : pattern);
    procedure InvertRect(r : BRect);
    procedure StrokeRoundRect(r : BRect; xRadius : double; yRadius : double; p : pattern);
    procedure FillRoundRect(r : BRect; xRadius : double; yRadius : double; p : pattern);
    procedure StrokeEllipse(center : BPoint; xRadius : double; yRadius : double; p : pattern);
    procedure StrokeEllipse(r : BRect; p : pattern);
    procedure FillEllipse(center : BPoint; xRadius : double; yRadius : double; p : pattern);
    procedure FillEllipse(r : BRect; p : pattern);
    procedure StrokeArc(center : BPoint; xRadius : double; yRadius : double; start_angle : double; arc_angle : double; p : pattern);
    procedure StrokeArc(r : BRect; start_angle : double; arc_angle : double; p : pattern);
    procedure FillArc(center : BPoint; xRadius : double; yRadius : double; start_angle : double; arc_angle : double; p : pattern);
    procedure FillArc(r : BRect; start_angle : double; arc_angle : double; p : pattern);
    procedure StrokeBezier(controlPoints : BPoint; p : pattern);
    procedure FillBezier(controlPoints : BPoint; p : pattern);
    procedure StrokeShape(shape : BShape; p : pattern);
    procedure FillShape(shape : BShape; p : pattern);
    procedure CopyBits(src : BRect; dst : BRect);
    procedure DrawBitmapAsync(aBitmap : BBitmap; srcRect : BRect; dstRect : BRect);
    procedure DrawBitmapAsync(aBitmap : BBitmap);
    procedure DrawBitmapAsync(aBitmap : BBitmap; where : BPoint);
    procedure DrawBitmapAsync(aBitmap : BBitmap; dstRect : BRect);
    procedure DrawBitmap(aBitmap : BBitmap; srcRect : BRect; dstRect : BRect);
    procedure DrawBitmap(aBitmap : BBitmap);
    procedure DrawBitmap(aBitmap : BBitmap; where : BPoint);
    procedure DrawBitmap(aBitmap : BBitmap; dstRect : BRect);
    procedure DrawChar(aChar : char);
    procedure DrawChar(aChar : char ; location : BPoint);
    procedure DrawString(aString : PChar; delta : escapement_delta);
    procedure DrawString(aString : PChar; location : BPoint; delta : escapement_delta);
    procedure DrawString(aString : PChar; length : integer; delta : escapement_delta);
    procedure DrawString(aString : PChar; length : integer; location : BPoint; delta : escapement_delta);

    procedure SetFont(font :  BFont; mask : Integer);
   procedure GetFont(var font :  BFont);
    function StringWidth(string1 : PChar) : double;
    function StringWidth(string1 : PChar; length : integer) : double;
    procedure GetStringWidths(stringArray : PChar; lengthArray : integer; numStrings : integer; widthArray : double);

    procedure SetFontSize(size : double);
    procedure ForceFontAliasing(enable : boolean);
    procedure GetFontHeight(height : font_height);
    procedure Invalidate(invalRect : BRect);
    procedure Invalidate(invalRegion : BRegion);
    procedure Invalidate;

    procedure SetDiskMode(filename : PChar; offset : integer);
    procedure BeginPicture(a_picture : BPicture);
    procedure AppendToPicture(a_picture : BPicture);
    function EndPicture : BPicture;
    procedure DrawPicture(a_picture : BPicture);
    procedure DrawPicture(a_picture : BPicture; where : BPoint);
    procedure DrawPicture(filename : PChar; offset : integer; where : BPoint);
    procedure DrawPictureAsync(a_picture : BPicture);
    procedure DrawPictureAsync(a_picture : BPicture; where : BPoint);
    procedure DrawPictureAsync(filename : PChar; offset : integer; where : BPoint);
    function SetEventMask(mask : Integer; options : Integer) : status_t;
    function EventMask : Integer;
    function SetMouseEventMask(mask : Integer; options :Integer ) : status_t;
    procedure SetFlags(flags1 :Integer );
    function GetFlags : Integer;
    procedure SetResizingMode(mode : Integer);
    function ResizingMode : Integer;
    procedure MoveBy(dh : double; dv : double);
    procedure MoveTo(where : BPoint);
    procedure MoveTo(x : double; y : double);
    procedure ResizeBy(dh : double; dv : double);
    procedure ResizeTo(width : double; height : double);
    procedure ScrollBy(dh : double; dv : double);
//    procedure ScrollTo(x : double; y : double);
    procedure ScrollTo(where : BPoint);
    procedure MakeFocus(focusState : boolean);
    function IsFocus : boolean;
    procedure Show;
    procedure Hide;
    function IsHidden : boolean;
    function IsHidden(looking_from : BView) : boolean;
    procedure Flush;
    procedure Sync;
    procedure GetPreferredSize(width : double; height : double); virtual;
    procedure ResizeToPreferred; virtual;
//    function ScrollBar(posture : orientation) :  BScrollBar;
    function ResolveSpecifier(msg : BMessage; index : integer; specifier : BMessage; form : integer; properti : PChar) : BHandler;
    function GetSupportedSuites(data : BMessage) : status_t;
    function IsPrinting : boolean;
    procedure SetScale(scale : double);
  end;

function BView_Create(AObject : TObject; frame : TCPlusObject; name : PChar;
  resizingMode, flags : cardinal) : TCplusObject; cdecl; external BePascalLibName name 'BView_Create_1';
procedure BView_Free(CPlusObject : TCPlusObject); cdecl; external BePascalLibName name 'BView_Free';
function BView_RemoveSelf(CPlusObject : TCPlusObject) : boolean; cdecl; external BePascalLibName name 'BView_RemoveSelf';
procedure BView_AddChild(CPlusObject : TCPlusObject; aView : TCPlusObject; before : TCPlusObject); cdecl; external BePascalLibName name 'BView_AddChild';
function BView_RemoveChild(CPlusObject : TCPlusObject; aView : TCPlusObject) : boolean; cdecl; external BePascalLibName name 'BView_RemoveChild';
function BView_CountChildren(CPlusObject : TCPlusObject) : integer; cdecl; external BePascalLibName name 'BView_CountChildren';
function BView_NextSibling(CPlusObject : TCPlusObject) : TCPlusObject; cdecl; external BePascalLibName name 'BView_NextSibling';
function BView_PreviousSibling(CPlusObject : TCPlusObject) : TCPlusObject; cdecl; external BePascalLibName name 'BView_NextSibling';
function BView_ChildAt(CPlusObject : TCPlusObject; index : integer) : TCPlusObject; cdecl; external BePascalLibName name 'BView_ChildAt';
function BView_Window(CPlusObject : TCPlusObject) : TCPlusObject; cdecl; external BePascalLibName name 'BView_Window';
procedure BView_Draw(CPlusObject : TCPlusObject; aRect : TCPlusObject); cdecl; external BePascalLibName name 'BView_Draw';
procedure BView_SeBViewColor(CPlusObject : TCPlusObject; c : RGB_color); cdecl; external BePascalLibName name 'BView_SetViewColor';

procedure BView_ConvertToScreen(CPlusObject : TCPlusObject; var pt :BPoint) ; cdecl; external BePascalLibName name 'BView_ConvertToScreen';
function BView_ConvertToScreen_1(CPlusObject : TCPlusObject; pt :BPoint ) : BPoint; cdecl; external BePascalLibName name 'BView_ConvertToScreen_1';
procedure BView_ConvertFromScreen(CPlusObject : TCPlusObject; var pt :BPoint) ; cdecl; external BePascalLibName name 'BView_ConvertFromScreen';
function BView_ConvertFromScreen_1(CPlusObject : TCPlusObject; pt :BPoint) : BPoint; cdecl; external BePascalLibName name 'BView_ConvertFromScreen_1';
procedure BView_ConvertToScreen(CPlusObject : TCPlusObject; var r :BRect) ; cdecl; external BePascalLibName name 'BView_ConvertToScreen_r';
function BView_ConvertToScreen_1(CPlusObject : TCPlusObject; r :BRect) : BRect; cdecl; external BePascalLibName name 'BView_ConvertToScreen_r_1';
procedure BView_ConvertFromScreen(CPlusObject : TCPlusObject; var r :BRect) ; cdecl; external BePascalLibName name 'BView_ConvertFromScreen';
function BView_ConvertFromScreen_1(CPlusObject : TCPlusObject; r :BRect) :Brect; cdecl; external BePascalLibName name 'BView_ConvertFromScreen_1';
procedure BView_ConvertToParent(CPlusObject : TCPlusObject; var pt :BPoint) ; cdecl; external BePascalLibName name 'BView_ConvertToParent';
function BView_ConvertToParent_1(CPlusObject : TCPlusObject; pt :BPoint) :BPoint; cdecl; external BePascalLibName name 'BView_ConvertToParent_1';
procedure BView_ConvertFromParent(CPlusObject : TCPlusObject; var pt :BPoint) ; cdecl; external BePascalLibName name 'BView_ConvertFromParent';
function BView_ConvertFromParent_1(CPlusObject : TCPlusObject; pt :BPoint ) :Bpoint; cdecl; external BePascalLibName name 'BView_ConvertFromParent_1';
procedure BView_ConvertToParent(CPlusObject : TCPlusObject; var r :BRect) ; cdecl; external BePascalLibName name 'BView_ConvertToParent_r';
function BView_ConvertToParent_1(CPlusObject : TCPlusObject; r:BRect ) :Brect; cdecl; external BePascalLibName name 'BView_ConvertToParent_r_1';
procedure BView_ConvertFromParent(CPlusObject : TCPlusObject; var r :BRect ) ; cdecl; external BePascalLibName name 'BView_ConvertFromParent_r';
function BView_ConvertFromParent_1(CPlusObject : TCPlusObject; r : BRect) :BRect; cdecl; external BePascalLibName name 'BView_ConvertFromParent_r_1';
function BView_LeftTop(CPlusObject : TCPlusObject) :BPoint; cdecl; external BePascalLibName name 'BView_LeftTop';

procedure BView_BeginRectTracking(AObject : TCPlusObject; startRect : TCPlusObject; style : Integer); cdecl; external BePascalLibName name 'BView_BeginRectTracking';
procedure BView_EndRectTracking(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BView_EndRectTracking';
procedure BView_GetMouse( AObject : TCPlusObject; var location : TCPlusObject; var buttons : Integer ; checkMessageQueue : boolean); cdecl; external BePascalLibName name 'BView_GetMouse';
procedure BView_DragMessage(AObject : TCPlusObject; aMessage : TCPlusObject; dragRect : TCPlusObject; reply_to : TCPlusObject); cdecl; external BePascalLibName name 'BView_DragMessage';
procedure BView_DragMessage(AObject : TCPlusObject; aMessage : TCPlusObject; anImage : TCPlusObject; offset : TCPlusObject; reply_to : TCPlusObject); cdecl; external BePascalLibName name 'BView_DragMessage';
procedure BView_DragMessage(AObject : TCPlusObject; aMessage : TCPlusObject; anImage : TCPlusObject; dragMode : Drawing_Mode; offset : TCPlusObject; reply_to : TCPlusObject); cdecl; external BePascalLibName name 'BView_DragMessage';
function BView_FindView(AObject : TCPlusObject; name : PChar) : BView; cdecl; external BePascalLibName name 'BView_FindView';
function BView_Parent(AObject : TCPlusObject) : BView; cdecl; external BePascalLibName name 'BView_Parent';
function BView_Bounds(AObject : TCPlusObject) : BRect; cdecl; external BePascalLibName name 'BView_Bounds';
function BView_Frame(AObject : TCPlusObject) : BRect; cdecl; external BePascalLibName name 'BView_Frame';
procedure BView_GetClippingRegion(AObject : TCPlusObject; region : TCPlusObject); cdecl; external BePascalLibName name 'BView_GetClippingRegion';
procedure BView_ConstrainClippingRegion(AObject : TCPlusObject; region : TCPlusObject); cdecl; external BePascalLibName name 'BView_ConstrainClippingRegion';

procedure BView_ClipToPicture(AObject : TCPlusObject; picture : TCPlusObject; where : TCPlusObject; sync : boolean); cdecl; external BePascalLibName name 'BView_ClipToPicture';
procedure BView_ClipToInversePicture(AObject : TCPlusObject; picture : TCPlusObject; where : TCPlusObject; sync : boolean); cdecl; external BePascalLibName name 'BView_ClipToInversePicture';
procedure BView_SetDrawingMode(AObject : TCPlusObject; mode : Drawing_Mode); cdecl; external BePascalLibName name 'BView_SetDrawingMode';
function BView_DrawingMode(AObject : TCPlusObject) : Drawing_Mode; cdecl; external BePascalLibName name 'BView_DrawingMode';
procedure BView_SetBlendingMode(AObject : TCPlusObject; srcAlpha : source_alpha; alphaFunc : Alpha_Function); cdecl; external BePascalLibName name 'BView_SetBlendingMode';
procedure BView_GetBlendingMode(AObject : TCPlusObject; srcAlpha : source_alpha; alphaFunc : Alpha_Function); cdecl; external BePascalLibName name 'BView_GetBlendingMode';
procedure BView_SetPenSize(AObject : TCPlusObject; size : double); cdecl; external BePascalLibName name 'BView_SetPenSize';
function BView_PenSize(AObject : TCPlusObject) : double; cdecl; external BePascalLibName name 'BView_PenSize';
procedure BView_SetViewCursor(AObject : TCPlusObject; cursor : BCursor; sync : boolean); cdecl; external BePascalLibName name 'BView_SetViewCursor';
procedure BView_SetViewColor(AObject : TCPlusObject; c : rgb_color); cdecl; external BePascalLibName name 'BView_SetViewColor';
//procedure BView_SetViewColor(AObject : TCPlusObject; r : byte; g :byte ; b :byte ; a :byte ); cdecl; external BePascalLibName name 'BView_SetViewColor_1';
function BView_ViewColor(AObject : TCPlusObject) : rgb_color; cdecl; external BePascalLibName name 'BView_ViewColor';
procedure BView_ClearViewBitmap(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BView_ClearViewBitmap';
procedure BView_ClearViewOverlay(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BView_ClearViewOverlay';
procedure BView_SetHighColor(AObject : TCPlusObject; a_color : rgb_color); cdecl; external BePascalLibName name 'BView_SetHighColor';
procedure BView_SetHighColor(AObject : TCPlusObject; r : byte; g : byte; b : byte; a : byte); cdecl; external BePascalLibName name 'BView_SetHighColor';
function BView_HighColor(AObject : TCPlusObject) : rgb_color; cdecl; external BePascalLibName name 'BView_HighColor';
procedure BView_SetLowColor(AObject : TCPlusObject; a_color : rgb_color); cdecl; external BePascalLibName name 'BView_SetLowColor';
procedure BView_SetLowColor(AObject : TCPlusObject; r : byte; g :byte ; b : byte; a : byte); cdecl; external BePascalLibName name 'BView_SetLowColor';
function BView_LowColor(AObject : TCPlusObject) : rgb_color; cdecl; external BePascalLibName name 'BView_LowColor';
procedure BView_SetLineMode(AObject : TCPlusObject; lineCap : cap_mode; lineJoin : join_mode; miterLimit : double); cdecl; external BePascalLibName name 'BView_SetLineMode';
function BView_LineJoinMode(AObject : TCPlusObject) : join_mode; cdecl; external BePascalLibName name 'BView_LineJoinMode';
function BView_LineCapMode(AObject : TCPlusObject) : cap_mode; cdecl; external BePascalLibName name 'BView_LineCapMode';
function BView_LineMiterLimit(AObject : TCPlusObject) : double; cdecl; external BePascalLibName name 'BView_LineMiterLimit';
procedure BView_SetOrigin(AObject : TCPlusObject; pt : TCPlusObject); cdecl; external BePascalLibName name 'BView_SetOrigin';
procedure BView_SetOrigin(AObject : TCPlusObject; x : double; y : double); cdecl; external BePascalLibName name 'BView_SetOrigin_1';
function BView_Origin(AObject : TCPlusObject) : BPoint; cdecl; external BePascalLibName name 'BView_Origin';
procedure BView_PushState(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BView_PushState';
procedure BView_PopState(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BView_PopState';
procedure BView_MovePenTo(AObject : TCPlusObject; pt : TCPlusObject); cdecl; external BePascalLibName name 'BView_MovePenTo';
procedure BView_MovePenTo(AObject : TCPlusObject; x : double; y : double); cdecl; external BePascalLibName name 'BView_MovePenTo_1';
procedure BView_MovePenBy(AObject : TCPlusObject; x : double; y : double); cdecl; external BePascalLibName name 'BView_MovePenBy';
function BView_PenLocation(AObject : TCPlusObject) : BPoint; cdecl; external BePascalLibName name 'BView_PenLocation';
procedure BView_StrokeLine(AObject : TCPlusObject; toPt : TCPlusObject; p : pattern); cdecl; external BePascalLibName name 'BView_StrokeLine';
procedure BView_StrokeLine(AObject : TCPlusObject; pt0 : TCPlusObject; pt1 : TCPlusObject; p : pattern); cdecl; external BePascalLibName name 'BView_StrokeLine_1';
procedure BView_BeginLineArray(AObject : TCPlusObject; count : integer); cdecl; external BePascalLibName name 'BView_BeginLineArray';
procedure BView_AddLine(AObject : TCPlusObject; pt0 : TCPlusObject; pt1 : TCPlusObject; col : rgb_color); cdecl; external BePascalLibName name 'BView_AddLine';
procedure BView_EndLineArray(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BView_EndLineArray';
procedure BView_StrokePolygon(AObject : TCPlusObject; aPolygon : BPolygon; closed : boolean; p : pattern); cdecl; external BePascalLibName name 'BView_StrokePolygon';
procedure BView_StrokePolygon(AObject : TCPlusObject; ptArray : BPoint; numPts : integer; closed : boolean; p : pattern); cdecl; external BePascalLibName name 'BView_StrokePolygon_1';
procedure BView_StrokePolygon(AObject : TCPlusObject; ptArray : BPoint; numPts : integer; bounds : TCPlusObject; closed : boolean; p : pattern); cdecl; external BePascalLibName name 'BView_StrokePolygon_2';
procedure BView_FillPolygon(AObject : TCPlusObject; aPolygon : BPolygon; p : pattern); cdecl; external BePascalLibName name 'BView_FillPolygon';
procedure BView_FillPolygon(AObject : TCPlusObject; ptArray : BPoint; numPts : integer; p : pattern); cdecl; external BePascalLibName name 'BView_FillPolygon_1';
procedure BView_FillPolygon(AObject : TCPlusObject; ptArray : BPoint; numPts : integer; bounds : TCPlusObject; p : pattern); cdecl; external BePascalLibName name 'BView_FillPolygon_2';
procedure BView_StrokeTriangle(AObject : TCPlusObject; pt1 : TCPlusObject; pt2 : TCPlusObject; pt3 : TCPlusObject; bounds : TCPlusObject; p : pattern); cdecl; external BePascalLibName name 'BView_StrokeTriangle';
procedure BView_StrokeTriangle(AObject : TCPlusObject; pt1 : TCPlusObject; pt2 : TCPlusObject; pt3 : TCPlusObject; p : pattern); cdecl; external BePascalLibName name 'BView_StrokeTriangle_1';
procedure BView_FillTriangle(AObject : TCPlusObject; pt1 : TCPlusObject; pt2 : TCPlusObject; pt3 : TCPlusObject; p : pattern); cdecl; external BePascalLibName name 'BView_FillTriangle';
procedure BView_FillTriangle(AObject : TCPlusObject; pt1 : TCPlusObject; pt2 : TCPlusObject; pt3 : TCPlusObject; bounds : TCPlusObject; p : pattern); cdecl; external BePascalLibName name 'BView_FillTriangle_1';
procedure BView_StrokeRect(AObject : TCPlusObject; r : TCPlusObject; p : pattern); cdecl; external BePascalLibName name 'BView_StrokeRect';
procedure BView_FillRect(AObject : TCPlusObject; r : TCPlusObject; p : pattern); cdecl; external BePascalLibName name 'BView_FillRect';
procedure BView_FillRegion(AObject : TCPlusObject; a_region : TCPlusObject; p : pattern); cdecl; external BePascalLibName name 'BView_FillRegion';
procedure BView_InvertRect(AObject : TCPlusObject; r : TCPlusObject); cdecl; external BePascalLibName name 'BView_InvertRect';
procedure BView_StrokeRoundRect(AObject : TCPlusObject; r : TCPlusObject; xRadius : double; yRadius : double; p : pattern); cdecl; external BePascalLibName name 'BView_StrokeRoundRect';
procedure BView_FillRoundRect(AObject : TCPlusObject; r : TCPlusObject; xRadius : double; yRadius : double; p : pattern); cdecl; external BePascalLibName name 'BView_FillRoundRect';
procedure BView_StrokeEllipse(AObject : TCPlusObject; center : TCPlusObject; xRadius : double; yRadius : double; p : pattern); cdecl; external BePascalLibName name 'BView_StrokeEllipse';
procedure BView_StrokeEllipse(AObject : TCPlusObject; r : TCPlusObject; p : pattern); cdecl; external BePascalLibName name 'BView_StrokeEllipse_1';
procedure BView_FillEllipse(AObject : TCPlusObject; center : TCPlusObject; xRadius : double; yRadius : double; p : pattern); cdecl; external BePascalLibName name 'BView_FillEllipse';
procedure BView_FillEllipse(AObject : TCPlusObject; r : TCPlusObject; p : pattern); cdecl; external BePascalLibName name 'BView_FillEllipse_1';
procedure BView_StrokeArc(AObject : TCPlusObject; center : TCPlusObject; xRadius : double; yRadius : double; start_angle : double; arc_angle : double; p : pattern); cdecl; external BePascalLibName name 'BView_StrokeArc';
procedure BView_StrokeArc(AObject : TCPlusObject; r : TCPlusObject; start_angle : double; arc_angle : double; p : pattern); cdecl; external BePascalLibName name 'BView_StrokeArc_1';
procedure BView_FillArc(AObject : TCPlusObject; center : TCPlusObject; xRadius : double; yRadius : double; start_angle : double; arc_angle : double; p : pattern); cdecl; external BePascalLibName name 'BView_FillArc';
procedure BView_FillArc(AObject : TCPlusObject; r : TCPlusObject; start_angle : double; arc_angle : double; p : pattern); cdecl; external BePascalLibName name 'BView_FillArc_1';
procedure BView_StrokeBezier(AObject : TCPlusObject; controlPoints : TCPlusObject; p : pattern); cdecl; external BePascalLibName name 'BView_StrokeBezier';
procedure BView_FillBezier(AObject : TCPlusObject; controlPoints : TCPlusObject; p : pattern); cdecl; external BePascalLibName name 'BView_FillBezier';
procedure BView_StrokeShape(AObject : TCPlusObject; shape : TCPlusObject; p : pattern); cdecl; external BePascalLibName name 'BView_StrokeShape';
procedure BView_FillShape(AObject : TCPlusObject; shape : TCPlusObject; p : pattern); cdecl; external BePascalLibName name 'BView_FillShape';
procedure BView_CopyBits(AObject : TCPlusObject; src : TCPlusObject; dst : TCPlusObject); cdecl; external BePascalLibName name 'BView_CopyBits';
procedure BView_DrawBitmapAsync(AObject : TCPlusObject; aBitmap : BBitmap; srcRect : TCPlusObject; dstRect : TCPlusObject); cdecl; external BePascalLibName name 'BView_DrawBitmapAsync';
procedure BView_DrawBitmapAsync(AObject : TCPlusObject; aBitmap : BBitmap); cdecl; external BePascalLibName name 'BView_DrawBitmapAsync_1';
procedure BView_DrawBitmapAsync(AObject : TCPlusObject; aBitmap : BBitmap; where : TCPlusObject); cdecl; external BePascalLibName name 'BView_DrawBitmapAsync_2';
//procedure BView_DrawBitmapAsync(AObject : TCPlusObject; aBitmap : BBitmap; dstRect : TCPlusObject); cdecl; external BePascalLibName name 'BView_DrawBitmapAsync_3';
procedure BView_DrawBitmap(AObject : TCPlusObject; aBitmap : BBitmap; srcRect : TCPlusObject; dstRect : TCPlusObject); cdecl; external BePascalLibName name 'BView_DrawBitmap';
procedure BView_DrawBitmap(AObject : TCPlusObject; aBitmap : BBitmap); cdecl; external BePascalLibName name 'BView_DrawBitmap_1';
procedure BView_DrawBitmap(AObject : TCPlusObject; aBitmap : BBitmap; where : TCPlusObject); cdecl; external BePascalLibName name 'BView_DrawBitmap_2';
//procedure BView_DrawBitmap(AObject : TCPlusObject; aBitmap : BBitmap; dstRect : TCPlusObject); cdecl; external BePascalLibName name 'BView_DrawBitmap_3';
procedure BView_DrawChar(AObject : TCPlusObject; aChar : char); cdecl; external BePascalLibName name 'BView_DrawChar';
procedure BView_DrawChar(AObject : TCPlusObject; aChar : char; location : TCPlusObject); cdecl; external BePascalLibName name 'BView_DrawChar_1';
procedure BView_DrawString(AObject : TCPlusObject; aString : PChar; delta : escapement_delta); cdecl; external BePascalLibName name 'BView_DrawString';
procedure BView_DrawString(AObject : TCPlusObject; aString : PChar; location : TCPlusObject; delta : escapement_delta); cdecl; external BePascalLibName name 'BView_DrawString_1';
procedure BView_DrawString(AObject : TCPlusObject; aString : PChar; length : integer; delta : escapement_delta); cdecl; external BePascalLibName name 'BView_DrawString_2';
procedure BView_DrawString(AObject : TCPlusObject; aString : PChar; length : integer; location : TCPlusObject; delta : escapement_delta); cdecl; external BePascalLibName name 'BView_DrawString_3';

procedure BView_SetFont(AObject : TCPlusObject; font :  BFont; mask : Integer); cdecl; external BePascalLibName name 'BView_SetFont';
procedure BView_GetFont(AObject : TCPlusObject; var font : TCPlusObject); cdecl; external BePascalLibName name 'BView_GetFont';
//procedure BView_GetFont(AObject : TCPlusObject; font : TCPlusObject); cdecl; external BePascalLibName name 'BView_GetFont_1';
function BView_StringWidth(AObject : TCPlusObject; string1 : PChar) : double; cdecl; external BePascalLibName name 'BView_StringWidth';
function BView_StringWidth(AObject : TCPlusObject; string1 : PChar; length : integer) : double; cdecl; external BePascalLibName name 'BView_StringWidth_1';
procedure BView_GetStringWidths(AObject : TCPlusObject; stringArray : PChar; lengthArray : integer; numStrings : integer; widthArray : double); cdecl; external BePascalLibName name 'BView_GetStringWidths';
procedure BView_SetFontSize(AObject : TCPlusObject; size : double); cdecl; external BePascalLibName name 'BView_SetFontSize';
procedure BView_ForceFontAliasing(AObject : TCPlusObject; enable : boolean); cdecl; external BePascalLibName name 'BView_ForceFontAliasing';
procedure BView_GetFontHeight(AObject : TCPlusObject; height : font_height); cdecl; external BePascalLibName name 'BView_GetFontHeight';
procedure BView_Invalidate(AObject : TCPlusObject; invalRect : TCPlusObject); cdecl; external BePascalLibName name 'BView_Invalidate';
procedure BView_Invalidate(AObject : TCPlusObject; invalRegion : BRegion); cdecl; external BePascalLibName name 'BView_Invalidate_1';
procedure BView_Invalidate(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BView_Invalidate_2';

procedure BView_SetDiskMode(AObject : TCPlusObject; filename : PChar; offset : integer); cdecl; external BePascalLibName name 'BView_SetDiskMode';
procedure BView_BeginPicture(AObject : TCPlusObject; a_picture : TCPlusObject); cdecl; external BePascalLibName name 'BView_BeginPicture';
procedure BView_AppendToPicture(AObject : TCPlusObject; a_picture : TCPlusObject); cdecl; external BePascalLibName name 'BView_AppendToPicture';
function BView_EndPicture(AObject : TCPlusObject) : BPicture; cdecl; external BePascalLibName name 'BView_EndPicture';
procedure BView_DrawPicture(AObject : TCPlusObject; a_picture : BPicture); cdecl; external BePascalLibName name 'BView_DrawPicture';
procedure BView_DrawPicture(AObject : TCPlusObject; a_picture : BPicture; where : TCPlusObject); cdecl; external BePascalLibName name 'BView_DrawPicture_1';
procedure BView_DrawPicture(AObject : TCPlusObject; filename : PChar; offset : integer; where : TCPlusObject); cdecl; external BePascalLibName name 'BView_DrawPicture_2';
procedure BView_DrawPictureAsync(AObject : TCPlusObject; a_picture : BPicture); cdecl; external BePascalLibName name 'BView_DrawPictureAsync_3';
procedure BView_DrawPictureAsync(AObject : TCPlusObject; a_picture : BPicture; where : TCPlusObject); cdecl; external BePascalLibName name 'BView_DrawPictureAsync_4';
procedure BView_DrawPictureAsync(AObject : TCPlusObject; filename : PChar; offset : integer; where : TCPlusObject); cdecl; external BePascalLibName name 'BView_DrawPictureAsync_5';
function BView_SetEventMask(AObject : TCPlusObject; mask : integer; options : integer) : status_t; cdecl; external BePascalLibName name 'BView_SetEventMask';
function BView_EventMask(AObject : TCPlusObject) : integer; cdecl; external BePascalLibName name 'BView_EventMask';
function BView_SetMouseEventMask(AObject : TCPlusObject; mask :integer ; options : integer) : status_t; cdecl; external BePascalLibName name 'BView_SetMouseEventMask';
procedure BView_SetFlags(AObject : TCPlusObject; flags : integer); cdecl; external BePascalLibName name 'BView_SetFlags';
function BView_Flags(AObject : TCPlusObject) : integer; cdecl; external BePascalLibName name 'BView_Flags';
procedure BView_SetResizingMode(AObject : TCPlusObject; mode : integer); cdecl; external BePascalLibName name 'BView_SetResizingMode';
function BView_ResizingMode(AObject : TCPlusObject) : integer; cdecl; external BePascalLibName name 'BView_ResizingMode';
procedure BView_MoveBy(AObject : TCPlusObject; dh : double; dv : double); cdecl; external BePascalLibName name 'BView_MoveBy';
procedure BView_MoveTo(AObject : TCPlusObject; where : TCPlusObject); cdecl; external BePascalLibName name 'BView_MoveTo';
procedure BView_MoveTo(AObject : TCPlusObject; x : double; y : double); cdecl; external BePascalLibName name 'BView_MoveTo_1';
procedure BView_ResizeBy(AObject : TCPlusObject; dh : double; dv : double); cdecl; external BePascalLibName name 'BView_ResizeBy';
procedure BView_ResizeTo(AObject : TCPlusObject; width : double; height : double); cdecl; external BePascalLibName name 'BView_ResizeTo';
procedure BView_ScrollBy(AObject : TCPlusObject; dh : double; dv : double); cdecl; external BePascalLibName name 'BView_ScrollBy';
//procedure BView_ScrollTo(AObject : TCPlusObject; x : double; y : double); cdecl; external BePascalLibName name 'BView_ScrollTo';
procedure BView_ScrollTo(AObject : TCPlusObject; where : TCPlusObject); cdecl; external BePascalLibName name 'BView_ScrollTo';
procedure BView_MakeFocus(AObject : TCPlusObject; focusState : boolean); cdecl; external BePascalLibName name 'BView_MakeFocus';
function BView_IsFocus(AObject : TCPlusObject) : boolean; cdecl; external BePascalLibName name 'BView_IsFocus';
procedure BView_Show(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BView_Show';
procedure BView_Hide(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BView_Hide';
function BView_IsHidden(AObject : TCPlusObject) : boolean; cdecl; external BePascalLibName name 'BView_IsHidden';
function BView_IsHidden(AObject : TCPlusObject; looking_from : BView) : boolean; cdecl; external BePascalLibName name 'BView_IsHidden_1';
procedure BView_Flush(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BView_Flush';
procedure BView_Sync(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BView_Sync';
procedure BView_GetPreferredSize(AObject : TCPlusObject; width : double; height : double); cdecl; external BePascalLibName name 'BView_GetPreferredSize';
procedure BView_ResizeToPreferred(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BView_ResizeToPreferred';
//function BView_ScrollBar(AObject : TCPlusObject; posture : orientation) :  BScrollBar; cdecl; external BePascalLibName name 'BView_ScrollBar';
function BView_ResolveSpecifier(AObject : TCPlusObject; msg : TCPlusObject; index : integer; specifier : TCPlusObject; form : integer; properti : PChar) : BHandler; cdecl; external BePascalLibName name 'BView_ResolveSpecifier';
function BView_GetSupportedSuites(AObject : TCPlusObject; data : TCPlusObject) : status_t; cdecl; external BePascalLibName name 'BView_GetSupportedSuites';
function BView_IsPrinting(AObject : TCPlusObject) : boolean; cdecl; external BePascalLibName name 'BView_IsPrinting';
procedure BView_SetScale(AObject : TCPlusObject; scale : double); cdecl; external BePascalLibName name 'BView_SetScale';



var
    // resizingMode mask
  B_FOLLOW_NONE : Cardinal;
  B_FOLLOW_ALL_SIDES : Cardinal;
  
  B_FOLLOW_ALL : Cardinal;
  
  B_FOLLOW_LEFT : Cardinal;
  B_FOLLOW_RIGHT : Cardinal;
  B_FOLLOW_LEFT_RIGHT : Cardinal;
  B_FOLLOW_H_CENTER : Cardinal;
  
  B_FOLLOW_TOP : Cardinal;
  B_FOLLOW_BOTTOM : Cardinal;
  B_FOLLOW_TOP_BOTTOM : Cardinal;
  B_FOLLOW_V_CENTER : Cardinal; 

const
    // flags
  B_FULL_UPDATE_ON_RESIZE 	: Cardinal = $80000000;//31;
  _B_RESERVED1_ 			: Cardinal = $40000000;//30;
  B_WILL_DRAW				: Cardinal = $20000000;//29;
  B_PULSE_NEEDED			: Cardinal = $10000000;//28;
  B_NAVIGABLE_JUMP			: Cardinal = $08000000;//27;
  B_FRAME_EVENTS			: Cardinal = $04000000;//26;
  B_NAVIGABLE				: Cardinal = $02000000;//25;
  B_SUBPIXEL_PRECISE		: Cardinal = $00800000;//24;
  B_DRAW_ON_CHILDREN		: Cardinal = $00400000;//23;
  _B_RESERVED7_				: Cardinal = $00200000;//22;

  B_FONT_FAMILY_AND_STYLE	= 1;
  B_FONT_SIZE				= 2;
  B_FONT_SHEAR				= 4;
  B_FONT_ROTATION			= 8;
  B_FONT_SPACING     		= 16;
  B_FONT_ENCODING			= 32;
  B_FONT_FACE				= 64;
  B_FONT_FLAGS				= 128;
  B_FONT_ALL				= 255;
  
  
  
  
// Bitmap
type
 BBitmap = class(BArchivable)
  private
  public
    // OCO B_MAIN_SCREEN_ID is a record. It is not possible to assign a record 
    // as a default value in fpc 1.9.5.
    constructor Create(_bounds : BRect; flags : Longword; depth : color_space;
                       bytesPerRow_ : Longint (*{$ifndef VER1_0}= B_ANY_BYTES_PER_ROW{$endif}*);
                       screenID : screen_id (*{$ifndef VER1_0}= B_MAIN_SCREEN_ID{$endif}*));
    constructor Create(_bounds : BRect; depth : color_space;
                       accepts_views : Boolean {$ifndef VER1_0}= false{$endif};
                       need_contiguous : Boolean {$ifndef VER1_0}= false{$endif});
    constructor Create(const source : BBitmap; accepts_views : Boolean {$ifndef VER1_0}= false{$endif};
                       need_contiguous : Boolean {$ifndef VER1_0}= false{$endif});
    constructor Create(data : BMessage);

    destructor Destroy; override;

    function Instantiate(data : BMessage) : BArchivable;
    function Archive(data : BMessage; deep : Boolean{$ifndef VER1_0}= true{$endif}) : status_t;
    function InitCheck : status_t;
    function IsValid : Boolean;
    function LockBits(state : PLongword {$ifndef VER1_0}= nil{$endif}) : status_t;
    procedure UnlockBits;
    function Area : area_id;
    function Bits : Pointer;
    function BitsLength : Longint;
    function BytesPerRow : Longint;
    function ColorSpace : color_space;
    function Bounds : BRect;
    procedure SetBits(const data : Pointer; length : Longint; offset : Longint;
                      cs : color_space);
    function GetOverlayRestrictions(var restrict : overlay_restrictions)
             : status_t;

    // to mimic a BWindow
    procedure AddChild(view : BView); virtual;
    function RemoveChild(view : BView) : Boolean; virtual;
    function CountChildren : Longint;
    function ChildAt(index : Longint) : BView;
    function FindView(const view_name : PChar) : BView;
    function FindView(point : BPoint) : BView;
    function Lock : Boolean;
    procedure Unlock;
    function IsLocked : Boolean;

    function Perform(d : perform_code; arg : Pointer) : status_t;
  end;

function BBitmap_Create(AObject : TBeObject; frame : TCPlusObject;
                        flags : Longword; depth : color_space;
                        bytesPerRow_ : Longint; screenID : screen_id)
         : TCPlusObject; cdecl; external BePascalLibName name 'BBitmap_Create';

function BBitmap_Create_1(AObject : TBeObject; frame : TCPlusObject;
                          depth : color_space; accepts_views : Boolean;
                          need_contiguous : Boolean)
         : TCPlusObject; cdecl; external BePascalLibName name 'BBitmap_Create_1';

function BBitmap_Create_2(AObject : TBeObject; source : BBitmap;
                          accepts_views : Boolean; need_contiguous : Boolean)
         : TCPlusObject; cdecl; external BePascalLibName name 'BBitmap_Create_2';

function BBitmap_Create_3(AObject : TBeObject; data : TCPlusObject)
         : TCPlusObject; cdecl; external BePascalLibName name 'BBitmap_Create_3';


procedure BBitmap_Free(AObject : TCPlusObject);
          cdecl; external BePascalLibName name 'BBitmap_Free';

function BBitmap_Instantiate(AObject : TCPlusObject; data : TCPlusObject)
         : BArchivable;
         cdecl; external BePascalLibName name 'BBitmap_Instantiate';

function BBitmap_Archive(AObject : TCPlusObject; data : TCPlusObject;
                         deep : Boolean) : status_t;
         cdecl; external BePascalLibName name 'BBitmap_Archive';

function BBitmap_InitCheck(AObject : TCPlusObject) : status_t;
         cdecl; external BePascalLibName name 'BBitmap_InitCheck';

function BBitmap_IsValid(AObject : TCPlusObject) : Boolean;
         cdecl; external BePascalLibName name 'BBitmap_IsValid';

function BBitmap_LockBits(AObject : TCPlusObject; state : PCardinal) : status_t;
         cdecl; external BePascalLibName name 'BBitmap_LockBits';

procedure BBitmap_UnlockBits(AObject : TCPlusObject);
          cdecl; external BePascalLibName name 'BBitmap_UnlockBits';

function BBitmap_Area(AObject : TCPlusObject) : Area_ID;
         cdecl; external BePascalLibName name 'BBitmap_Area';

function BBitmap_Bits(AObject : TCPlusObject) : Pointer;
         cdecl; external BePascalLibName name 'BBitmap_Bits';

function BBitmap_BitsLength(AObject : TCPlusObject) : Longint;
         cdecl; external BePascalLibName name 'BBitmap_BitsLength';

function BBitmap_BytesPerRow(AObject : TCPlusObject) : Longint;
         cdecl; external BePascalLibName name 'BBitmap_BytesPerRow';

function BBitmap_ColorSpace(AObject : TCPlusObject) : Color_Space;
         cdecl; external BePascalLibName name 'BBitmap_ColorSpace';

function BBitmap_Bounds(AObject : TCPlusObject) : BRect;
         cdecl; external BePascalLibName name 'BBitmap_Bounds';

procedure BBitmap_SetBits(AObject : TCPlusObject; data : Pointer; length : Longint;
                          offset : Longint; cs : Color_Space);
          cdecl; external BePascalLibName name 'BBitmap_SetBits';

function BBitmap_GetOverlayRestrictions(AObject : TCPlusObject; restrict : overlay_restrictions)
         : status_t; cdecl; external BePascalLibName name 'BBitmap_GetOverlayRestrictions';

procedure BBitmap_AddChild(AObject : TCPlusObject; view : TCPlusObject);
          cdecl; external BePascalLibName name 'BBitmap_AddChild';

function BBitmap_RemoveChild(AObject : TCPlusObject; view : TCPlusObject)
         : Boolean; cdecl; external BePascalLibName name 'BBitmap_RemoveChild';

function BBitmap_CountChildren(AObject : TCPlusObject) : Longint;
         cdecl; external BePascalLibName name 'BBitmap_CountChildren';

function BBitmap_ChildAt(AObject : TCPlusObject; index : Longint) : BView;
         cdecl; external BePascalLibName name 'BBitmap_ChildAt';

function BBitmap_FindView(AObject : TCPlusObject; view_name : PChar) : BView;
         cdecl; external BePascalLibName name 'BBitmap_FindView';

function BBitmap_FindView(AObject : TCPlusObject; point : {BPoint}TCPlusObject)
         : BView; cdecl; external BePascalLibName name 'BBitmap_FindView';

function BBitmap_Lock(AObject : TCPlusObject) : Boolean;
         cdecl; external BePascalLibName name 'BBitmap_Lock';

procedure BBitmap_Unlock(AObject : TCPlusObject);
          cdecl; external BePascalLibName name 'BBitmap_Unlock';

function BBitmap_IsLocked(AObject : TCPlusObject) : Boolean;
         cdecl; external BePascalLibName name 'BBitmap_IsLocked';

function BBitmap_Perform(AObject : TCPlusObject; d : perform_code; arg : Pointer)
         :  status_t; cdecl; external BePascalLibName name 'BBitmap_Perform';

   
implementation
var
  View_AllAttached_hook : Pointer; cvar; external;
  View_AllDetached_hook : Pointer; cvar; external;
  View_AttachedToWindow_hook : Pointer; cvar; external;
  View_DetachedFromWindow_hook : Pointer; cvar; external;
  View_Draw_hook : Pointer; cvar; external;
  View_DrawAfterChildren_hook : Pointer; cvar; external;
  View_FrameMoved_hook : Pointer; cvar; external;
  View_FrameResized_hook : Pointer; cvar; external;
  View_GetPreferredSize_hook : Pointer; cvar; external;
  View_ResizeToPreferred_hook : Pointer; cvar; external;
  View_KeyDown_hook : Pointer; cvar; external;
  View_KeyUp_hook : Pointer; cvar; external;
  View_MouseDown_hook : Pointer; cvar; external;
  View_MouseMoved_hook : Pointer; cvar; external;
  View_MouseUp_hook : Pointer; cvar; external;
  View_Pulse_hook : Pointer; cvar; external;
  View_TargetedByScrollView_hook : Pointer; cvar; external;
  View_WindowActivated_hook : Pointer; cvar; external;

// View hook functions
{
  View_AllAttached_hook
  View_AllDetached_hook
  View_AttachedToWindow_hook
  View_DetachedFromWindow_hook
  View_Draw_hook
  View_DrawAfterChildren_hook
  View_FrameMoved_hook
  View_FrameResized_hook
  View_GetPreferredSize_hook
  View_ResizeToPreferred_hook
  View_KeyDown_hook
  View_KeyUp_hook
  View_MouseDown_hook
  View_MouseMoved_hook
  View_MouseUp_hook
  View_Pulse_hook
  View_TargetedByScrollView_hook
  View_WindowActivated_hook}
  
 
constructor BView.Create(frame1 : BRect; name : PChar; resizingMode1, flags1 : Cardinal);
begin
  inherited Create;
  CPlusObject := BView_Create(Self, frame1.CPlusObject, name, resizingMode1, flags1);
end;

destructor BView.Destroy;
begin
  BView_Free(Self.CPlusObject);  
  inherited;
end;

// Hook functions
procedure BView.AllAttached; 
begin
end;

procedure BView.AllDetached;
begin
end;

procedure BView.AttachedToWindow;
begin
end;

procedure BView.DetachedFromWindow;
begin
end;

procedure BView.Draw(updateRect : BRect);
begin
  SendText('Drawing view');
  
end;

procedure BView.DrawAfterChildren(updateRect : BRect);
begin
end;

procedure BView.FrameMoved(parenBPoint : BPoint);
begin
end;

procedure BView.FrameResized(width, height : double);
begin
end;



procedure BView.KeyDown(bytes : PChar; numBytes : integer);
begin
end;

procedure BView.KeyUp(bytes : PChar; numBytes : integer);
begin
end;

procedure BView.MouseDown(point : BPoint);
begin
end;

procedure BView.MouseMoved(point : BPoint; transit : Cardinal; message : BMessage);
begin
end;

procedure BView.MouseUp(point : BPoint);
begin
end;

procedure BView.Pulse;
begin
end;

//    procedure BView.TargetedByScrollView(); // Need BScrollView
//begin
//end;

procedure BView.WindowActivated(active : boolean);
begin
end;

procedure BView.MessageReceived(aMessage : BMessage);
begin
  inherited;
end;

function BView.RemoveSelf : boolean;
begin
  Result := BView_RemoveSelf(Self.CPlusObject);
end;

procedure BView.AddChild(aView, before : BView);
begin
  if before <> nil then
    BView_AddChild(Self.CPlusObject, aView.CPlusObject, before.CPlusObject)
  else
    BView_AddChild(Self.CPlusObject, aView.CPlusObject, nil);
end;

function BView.RemoveChild(aView : BView) : boolean;
begin
  Result := BView_RemoveChild(Self.CPlusObject, aView);
end;

function BView.CountChildren : integer;
begin
  Result := BView_CountChildren(Self.CPlusObject);
end;

function BView.ChildAt(index : integer) : BView;
begin
  Result := BView.Wrap(BView_ChildAt(Self.CPlusObject, index));
end;

function BView.NextSibling : BView;
begin
  Result := BView.Wrap(BView_NextSibling(Self.CPlusObject));
end;

function BView.PreviousSibling : BView;
begin
  Result := BView.Wrap(BView_PreviousSibling(Self.CPlusObject));
end;

{function BView.Window : TWindow;
begin
  Result := TWindow.Wrap(BView_Window(Self.CPlusObject));
end;}

procedure BView.SetViewColor(rgb_color : RGB_color);
begin
  BView_SeBViewColor(Self.CPlusObject, rgb_color);  
end;



function BView.ConvertToScreen(pt :BPoint ) : BPoint; 
begin
	result:=BView_ConvertToScreen_1(Self.CPlusObject, pt);
End;

function BView.ConvertFromScreen(pt :BPoint) : BPoint; 
begin
	result:=BView_ConvertFromScreen_1(Self.CPlusObject, pt);
End;
function BView.ConvertToScreen(r :BRect) : BRect; 
begin
	result:=BView_ConvertToScreen_1(Self.CPlusObject, r);
End;
function BView.ConvertFromScreen( r :BRect) :Brect; 
begin
	result:=BView_ConvertFromScreen_1(Self.CPlusObject, r);
End;
function BView.ConvertToParent(pt :BPoint) :BPoint; 
begin
	result:=BView_ConvertToParent_1(Self.CPlusObject, pt);
End;
function BView.ConvertFromParent(pt :BPoint ) :Bpoint; 
begin
	result:=BView_ConvertFromParent_1(Self.CPlusObject, pt);
End;
function BView.ConvertToParent(r:BRect ) :Brect; 
begin
	result:=BView_ConvertToParent_1(Self.CPlusObject, r);
End;
function BView.ConvertFromParent( r : BRect) :BRect; 
begin
	result:=BView_ConvertFromParent_1(Self.CPlusObject, r);
End;
function BView.LeftTop :BPoint; 
begin
	result:=BView_LeftTop(Self.CPlusObject);
End;


procedure BView.SetOrigin(pt : BPoint);
begin
  BView_SetOrigin(CPlusObject, pt.CPlusObject);
end;

procedure BView.SetOrigin(x : double; y : double);
begin
  BView_SetOrigin(CPlusObject, x, y);
end;

procedure BView.SetFont(font :  BFont; mask : Integer);
begin
  BView_SetFont(CPlusObject, font, mask);
end;

procedure BView.GetFont(var font :  BFont);
begin
 // BView_GetFont(CPlusObject, font.CPlusObject);
end;




function BView.StringWidth(string1 : PChar) : double;
begin
  Result := BView_StringWidth(CPlusObject, string1);
end;

function BView.StringWidth(string1 : PChar; length : integer) : double;
begin
  Result := BView_StringWidth(CPlusObject, string1, length);
end;

procedure BView.GetStringWidths(stringArray : PChar; lengthArray : integer; numStrings : integer; widthArray : double);
begin
  BView_GetStringWidths(CPlusObject, stringArray, lengthArray, numStrings, widthArray);
end;

procedure BView.SetFontSize(size : double);
begin
  BView_SetFontSize(CPlusObject, size);
end;

procedure BView.ForceFontAliasing(enable : boolean);
begin
  BView_ForceFontAliasing(CPlusObject, enable);
end;

procedure BView.GetFontHeight(height : font_height);
begin
  BView_GetFontHeight(CPlusObject, height);
end;

procedure BView.Invalidate(invalRect : BRect);
begin
  BView_Invalidate(CPlusObject, invalRect.CPlusObject);
end;

procedure BView.Invalidate(invalRegion : BRegion);
begin
  BView_Invalidate(CPlusObject, invalRegion);
end;

procedure BView.Invalidate;
begin
  BView_Invalidate(CPlusObject);
end;

procedure BView.SetDiskMode(filename : PChar; offset : integer);
begin
  BView_SetDiskMode(CPlusObject, filename, offset);
end;

procedure BView.BeginPicture(a_picture : BPicture);
begin
  BView_BeginPicture(CPlusObject, a_picture.CPlusObject);
end;

procedure BView.AppendToPicture(a_picture : BPicture);
begin
  BView_AppendToPicture(CPlusObject, a_picture.CPlusObject);
end;

function BView.EndPicture : BPicture;
begin
  Result := BView_EndPicture(CPlusObject);
end;

procedure BView.DrawPicture(a_picture : BPicture);
begin
  BView_DrawPicture(CPlusObject, a_picture);
end;

procedure BView.DrawPicture(a_picture : BPicture; where : BPoint);
begin
  BView_DrawPicture(CPlusObject, a_picture, where.CPlusObject);
end;

procedure BView.DrawPicture(filename : PChar; offset : integer; where : BPoint);
begin
  BView_DrawPicture(CPlusObject, filename, offset, where.CPlusObject);
end;

procedure BView.DrawPictureAsync(a_picture : BPicture);
begin
  BView_DrawPictureAsync(CPlusObject, a_picture);
end;

procedure BView.DrawPictureAsync(a_picture : BPicture; where : BPoint);
begin
  BView_DrawPictureAsync(CPlusObject, a_picture, where.CPlusObject);
end;

procedure BView.DrawPictureAsync(filename : PChar; offset : integer; where : BPoint);
begin
  BView_DrawPictureAsync(CPlusObject, filename, offset, where.CPlusObject);
end;

function BView.SetEventMask(mask : integer; options : integer) : status_t;
begin
  Result := BView_SetEventMask(CPlusObject, mask, options);
end;

function BView.EventMask :integer ;
begin
  Result := BView_EventMask(CPlusObject);
end;

function BView.SetMouseEventMask(mask : integer; options : integer) : status_t;
begin
  Result := BView_SetMouseEventMask(CPlusObject, mask, options);
end;

procedure BView.SetFlags(flags1 : integer);
begin
  BView_SetFlags(CPlusObject, flags1);
end;

function BView.getFlags : integer;
begin
 // Result := BView_Flags(CPlusObject);
end;

procedure BView.SetResizingMode(mode :integer );
begin
  BView_SetResizingMode(CPlusObject, mode);
end;

function BView.ResizingMode : integer;
begin
  Result := BView_ResizingMode(CPlusObject);
end;

procedure BView.MoveBy(dh : double; dv : double);
begin
 BView_MoveBy(CPlusObject, dh, dv);
end;

procedure BView.MoveTo(where : BPoint);
begin
  BView_MoveTo(CPlusObject, where.CPlusObject);
end;

procedure BView.MoveTo(x : double; y : double);
begin
 BView_MoveTo(CPlusObject, x, y);
end;

procedure BView.ResizeBy(dh : double; dv : double);
begin
  BView_ResizeBy(CPlusObject, dh, dv);
end;

procedure BView.ResizeTo(width : double; height : double);
begin
  BView_ResizeTo(CPlusObject, width, height);
end;

procedure BView.ScrollBy(dh : double; dv : double);
begin
 BView_ScrollBy(CPlusObject, dh, dv);
end;

{procedure BView.ScrollTo(x : double; y : double);
begin
  BView_ScrollTo(CPlusObject, x, y);
end;
}
procedure BView.ScrollTo(where : BPoint);
begin
  BView_ScrollTo(CPlusObject, where.CPlusObject);
end;

procedure BView.MakeFocus(focusState : boolean);
begin
  BView_MakeFocus(CPlusObject, focusState);
end;

function BView.IsFocus : boolean;
begin
 Result := BView_IsFocus(CPlusObject);
end;

procedure BView.Show;
begin
  BView_Show(CPlusObject);
end;

procedure BView.Hide;
begin
  BView_Hide(CPlusObject);
end;

function BView.IsHidden : boolean;
begin
  Result := BView_IsHidden(CPlusObject);
end;

function BView.IsHidden(looking_from : BView) : boolean;
begin
  Result := BView_IsHidden(CPlusObject, looking_from);
end;

procedure BView.Flush;
begin
  BView_Flush(CPlusObject);
end;

procedure BView.Sync;
begin
  BView_Sync(CPlusObject);
end;

procedure BView.GetPreferredSize(width : double; height : double);
begin
  BView_GetPreferredSize(CPlusObject, width, height);
end;

procedure BView.ResizeToPreferred;
begin
  BView_ResizeToPreferred(CPlusObject);
end;

{function BView.ScrollBar(posture : orientation) :  BScrollBar;
begin
  Result := BView_ScrollBar(CPlusObject, posture);
end;
}
function BView.ResolveSpecifier(msg : BMessage; index : integer; specifier : BMessage; form : integer; properti : PChar) : BHandler;
begin
  Result := BView_ResolveSpecifier(CPlusObject, msg.CPlusObject, index, specifier.CPlusObject, form, properti);
end;

function BView.GetSupportedSuites(data : BMessage) : status_t;
begin
  Result := BView_GetSupportedSuites(CPlusObject, data.CPlusObject);
end;

function BView.IsPrinting : boolean;
begin
  Result := BView_IsPrinting(CPlusObject);
end;

procedure BView.SetScale(scale : double);
begin
  BView_SetScale(CPlusObject, scale);
end;

procedure BView.BeginRectTracking(startRect : BRect; style : Integer);
begin
  BView_BeginRectTracking(CPlusObject, startRect.CPlusObject, style);
end;

procedure BView.EndRectTracking;
begin
  BView_EndRectTracking(CPlusObject);
end;

procedure BView.GetMouse(var location : BPoint; var buttons : Integer ; checkMessageQueue : boolean);
begin
//  BView_GetMouse(CPlusObject, location.CPlusObject, buttons, checkMessageQueue);
end;

procedure BView.DragMessage(aMessage : BMessage; dragRect : BRect; reply_to : BHandler);
begin
  BView_DragMessage(CPlusObject, aMessage.CPlusObject, dragRect.CPlusObject, reply_to.CPlusObject);
end;

procedure BView.DragMessage(aMessage : BMessage; anImage : BBitmap; offset : BPoint; reply_to : BHandler);
begin
  BView_DragMessage(CPlusObject, aMessage.CPlusObject, anImage.CPlusObject, offset.CPlusObject, reply_to.CPlusObject);
end;

procedure BView.DragMessage(aMessage : BMessage; anImage : BBitmap; dragMode : Drawing_Mode; offset : BPoint; reply_to : BHandler);
begin
  BView_DragMessage(CPlusObject, aMessage.CPlusObject, anImage.CPlusObject, dragMode, offset.CPlusObject, reply_to.CPlusObject);
end;

function BView.FindView(name : PChar) : BView;
begin
  Result := BView_FindView(CPlusObject, name);
end;

function BView.Parent : BView;
begin
  Result := BView_Parent(CPlusObject);
end;

function BView.Bounds : BRect;
begin
  Result := BView_Bounds(CPlusObject);
end;

function BView.Frame : BRect;
begin
  Result := BView_Frame(CPlusObject);
end;




procedure BView.GetClippingRegion(region :  BRegion);
begin
  BView_GetClippingRegion(CPlusObject, region.CPlusObject);
end;

procedure BView.ConstrainClippingRegion(region :  BRegion);
begin
  BView_ConstrainClippingRegion(CPlusObject, region.CPlusObject);
end;

procedure BView.ClipToPicture(picture : BPicture; where : BPoint; ssync : boolean);
begin
  BView_ClipToPicture(CPlusObject, picture.CPlusObject, where.CPlusObject, ssync);
end;

procedure BView.ClipToInversePicture(picture : BPicture; where : BPoint; ssync : boolean);
begin
  BView_ClipToInversePicture(CPlusObject, picture.CPlusObject, where.CPlusObject, ssync);
end;

procedure BView.SetDrawingMode(mode : Drawing_Mode);
begin
  BView_SetDrawingMode(CPlusObject, mode);
end;

function BView.DrawingMode : Drawing_Mode;
begin
  Result := BView_DrawingMode(CPlusObject);
end;

procedure BView.SetBlendingMode(srcAlpha : source_alpha; alphaFunc : alpha_function );
begin
  BView_SetBlendingMode(CPlusObject, srcAlpha, alphaFunc);
end;

procedure BView.GetBlendingMode(srcAlpha : source_alpha; alphaFunc : alpha_function);
begin
  BView_GetBlendingMode(CPlusObject, srcAlpha, alphaFunc);
end;

procedure BView.SetPenSize(size : double);
begin
  BView_SetPenSize(CPlusObject, size);
end;

function BView.PenSize : double;
begin
  Result := BView_PenSize(CPlusObject);
end;

procedure BView.SetViewCursor(cursor : BCursor; ssync : boolean);
begin
  BView_SetViewCursor(CPlusObject, cursor, ssync);
end;


{procedure BView.SetViewColor(r : byte; g : byte; b : byte; a : byte);
begin
  BView_SetViewColor(CPlusObject, r, g, b, a);
end;
}
function BView.ViewColor : rgb_color;
begin
  Result := BView_ViewColor(CPlusObject);
end;

procedure BView.ClearViewBitmap;
begin
  BView_ClearViewBitmap(CPlusObject);
end;

procedure BView.ClearViewOverlay;
begin
  BView_ClearViewOverlay(CPlusObject);
end;

procedure BView.SetHighColor(a_color : rgb_color);
begin
  BView_SetHighColor(CPlusObject, a_color);
end;

procedure BView.SetHighColor(r :byte ; g :byte ; b :byte ; a : byte);
begin
  BView_SetHighColor(CPlusObject, r, g, b, a);
end;

function BView.HighColor : rgb_color;
begin
  Result := BView_HighColor(CPlusObject);
end;

procedure BView.SetLowColor(a_color : rgb_color);
begin
  BView_SetLowColor(CPlusObject, a_color);
end;

procedure BView.SetLowColor(r : byte; g :byte ; b : byte; a :byte );
begin
  BView_SetLowColor(CPlusObject, r, g, b, a);
end;

function BView.LowColor : rgb_color;
begin
  Result := BView_LowColor(CPlusObject);
end;

procedure BView.SetLineMode(lineCap : cap_mode; lineJoin : join_mode; miterLimit : double);
begin
  BView_SetLineMode(CPlusObject, lineCap, lineJoin, miterLimit);
end;

function BView.LineJoinMode : join_mode;
begin
  Result := BView_LineJoinMode(CPlusObject);
end;

function BView.LineCapMode : cap_mode;
begin
  Result := BView_LineCapMode(CPlusObject);
end;

function BView.LineMiterLimit : double;
begin
  Result := BView_LineMiterLimit(CPlusObject);
end;




function BView.Origin : BPoint;
begin
  Result := BView_Origin(CPlusObject);
end;

procedure BView.PushState;
begin
  BView_PushState(CPlusObject);
end;

procedure BView.PopState;
begin
  BView_PopState(CPlusObject);
end;

procedure BView.MovePenTo(pt : BPoint);
begin
  BView_MovePenTo(CPlusObject, pt.CPlusObject);
end;

procedure BView.MovePenTo(x : double; y : double);
begin
  BView_MovePenTo(CPlusObject, x, y);
end;

procedure BView.MovePenBy(x : double; y : double);
begin
  BView_MovePenBy(CPlusObject, x, y);
end;

function BView.PenLocation : BPoint;
begin
  Result := BView_PenLocation(CPlusObject);
end;

procedure BView.StrokeLine(toPt : BPoint; p : pattern);
begin
  BView_StrokeLine(CPlusObject, toPt.CPlusObject, p);
end;

procedure BView.StrokeLine(pt0 : BPoint; pt1 : BPoint; p : pattern);
begin
  BView_StrokeLine(CPlusObject, pt0.CPlusObject, pt1.CPlusObject, p);
end;

procedure BView.BeginLineArray(count : integer);
begin
  BView_BeginLineArray(CPlusObject, count);
end;

procedure BView.AddLine(pt0 : BPoint; pt1 : BPoint; col : rgb_color);
begin
  BView_AddLine(CPlusObject, pt0.CPlusObject, pt1.CPlusObject, col);
end;

procedure BView.EndLineArray;
begin
  BView_EndLineArray(CPlusObject);
end;

procedure BView.StrokePolygon(aPolygon : BPolygon; closed : boolean; p : pattern);
begin
  BView_StrokePolygon(CPlusObject, aPolygon, closed, p);
end;

procedure BView.StrokePolygon(ptArray : BPoint; numPts : integer; closed : boolean; p : pattern);
begin
  BView_StrokePolygon(CPlusObject, ptArray, numPts, closed, p);
end;

procedure BView.StrokePolygon(ptArray : BPoint; numPts : integer; sbounds : BRect; closed : boolean; p : pattern);
begin
  BView_StrokePolygon(CPlusObject, ptArray, numPts, sbounds.CPlusObject, closed, p);
end;

procedure BView.FillPolygon(aPolygon : BPolygon; p : pattern);
begin
  BView_FillPolygon(CPlusObject, aPolygon, p);
end;

procedure BView.FillPolygon(ptArray : BPoint; numPts : integer; p : pattern);
begin
  BView_FillPolygon(CPlusObject, ptArray, numPts, p);
end;

procedure BView.FillPolygon(ptArray : BPoint; numPts : integer; sbounds : BRect; p : pattern);
begin
  BView_FillPolygon(CPlusObject, ptArray, numPts, sbounds.CPlusObject, p);
end;

procedure BView.StrokeTriangle(pt1 : BPoint; pt2 : BPoint; pt3 : BPoint; sbounds : BRect; p : pattern);
begin
  BView_StrokeTriangle(CPlusObject, pt1.CPlusObject, pt2.CPlusObject, pt3.CPlusObject, sbounds.CPlusObject, p);
end;

procedure BView.StrokeTriangle(pt1 : BPoint; pt2 : BPoint; pt3 : BPoint; p : pattern);
begin
  BView_StrokeTriangle(CPlusObject, pt1.CPlusObject, pt2.CPlusObject, pt3.CPlusObject, p);
end;

procedure BView.FillTriangle(pt1 : BPoint; pt2 : BPoint; pt3 : BPoint; p : pattern);
begin
  BView_FillTriangle(CPlusObject, pt1.CPlusObject, pt2.CPlusObject, pt3.CPlusObject, p);
end;

procedure BView.FillTriangle(pt1 : BPoint; pt2 : BPoint; pt3 : BPoint; sbounds : BRect; p : pattern);
begin
  BView_FillTriangle(CPlusObject, pt1.CPlusObject, pt2.CPlusObject, pt3.CPlusObject, sbounds.CPlusObject, p);
end;

procedure BView.StrokeRect(r : BRect; p : pattern);
begin
  BView_StrokeRect(CPlusObject, r.CPlusObject, p);
end;

procedure BView.FillRect(r : BRect; p : pattern);
begin
  BView_FillRect(CPlusObject, r.CPlusObject, p);
end;

procedure BView.FillRegion(a_region :  BRegion; p : pattern);
begin
  BView_FillRegion(CPlusObject, a_region.CPlusObject, p);
end;

procedure BView.InvertRect(r : BRect);
begin
  BView_InvertRect(CPlusObject, r.CPlusObject);
end;

procedure BView.StrokeRoundRect(r : BRect; xRadius : double; yRadius : double; p : pattern);
begin
  BView_StrokeRoundRect(CPlusObject, r.CPlusObject, xRadius, yRadius, p);
end;

procedure BView.FillRoundRect(r : BRect; xRadius : double; yRadius : double; p : pattern);
begin
  BView_FillRoundRect(CPlusObject, r.CPlusObject, xRadius, yRadius, p);
end;

procedure BView.StrokeEllipse(center : BPoint; xRadius : double; yRadius : double; p : pattern);
begin
  BView_StrokeEllipse(CPlusObject, center.CPlusObject, xRadius, yRadius, p);
end;

procedure BView.StrokeEllipse(r : BRect; p : pattern);
begin
  BView_StrokeEllipse(CPlusObject, r.CPlusObject, p);
end;

procedure BView.FillEllipse(center : BPoint; xRadius : double; yRadius : double; p : pattern);
begin
  BView_FillEllipse(CPlusObject, center.CPlusObject, xRadius, yRadius, p);
end;

procedure BView.FillEllipse(r : BRect; p : pattern);
begin
  BView_FillEllipse(CPlusObject, r.CPlusObject, p);
end;

procedure BView.StrokeArc(center : BPoint; xRadius : double; yRadius : double; start_angle : double; arc_angle : double; p : pattern);
begin
  BView_StrokeArc(CPlusObject, center.CPlusObject, xRadius, yRadius, start_angle, arc_angle, p);
end;

procedure BView.StrokeArc(r : BRect; start_angle : double; arc_angle : double; p : pattern);
begin
  BView_StrokeArc(CPlusObject, r.CPlusObject, start_angle, arc_angle, p);
end;

procedure BView.FillArc(center : BPoint; xRadius : double; yRadius : double; start_angle : double; arc_angle : double; p : pattern);
begin
  BView_FillArc(CPlusObject, center.CPlusObject, xRadius, yRadius, start_angle, arc_angle, p);
end;

procedure BView.FillArc(r : BRect; start_angle : double; arc_angle : double; p : pattern);
begin
  BView_FillArc(CPlusObject, r.CPlusObject, start_angle, arc_angle, p);
end;

procedure BView.StrokeBezier(controlPoints : BPoint; p : pattern);
begin
  BView_StrokeBezier(CPlusObject, controlPoints.CPlusObject, p);
end;

procedure BView.FillBezier(controlPoints : BPoint; p : pattern);
begin
  BView_FillBezier(CPlusObject, controlPoints.CPlusObject, p);
end;

procedure BView.StrokeShape(shape : BShape; p : pattern);
begin
  BView_StrokeShape(CPlusObject, shape.CPlusObject, p);
end;

procedure BView.FillShape(shape : BShape; p : pattern);
begin
  BView_FillShape(CPlusObject, shape.CPlusObject, p);
end;

procedure BView.CopyBits(src : BRect; dst : BRect);
begin
  BView_CopyBits(CPlusObject, src.CPlusObject, dst.CPlusObject);
end;

procedure BView.DrawBitmapAsync(aBitmap : BBitmap; srcRect : BRect; dstRect : BRect);
begin
  BView_DrawBitmapAsync(CPlusObject, aBitmap, srcRect.CPlusObject, dstRect.CPlusObject);
end;

procedure BView.DrawBitmapAsync(aBitmap : BBitmap);
begin
  BView_DrawBitmapAsync(CPlusObject, aBitmap);
end;

procedure BView.DrawBitmapAsync(aBitmap : BBitmap; where : BPoint);
begin
  BView_DrawBitmapAsync(CPlusObject, aBitmap, where.CPlusObject);
end;

procedure BView.DrawBitmapAsync(aBitmap : BBitmap; dstRect : BRect);
begin
  BView_DrawBitmapAsync(CPlusObject, aBitmap, dstRect.CPlusObject);
end;

procedure BView.DrawBitmap(aBitmap : BBitmap; srcRect : BRect; dstRect : BRect);
begin
  BView_DrawBitmap(CPlusObject, aBitmap, srcRect.CPlusObject, dstRect.CPlusObject);
end;

procedure BView.DrawBitmap(aBitmap : BBitmap);
begin
  BView_DrawBitmap(CPlusObject, aBitmap);
end;

procedure BView.DrawBitmap(aBitmap : BBitmap; where : BPoint);
begin
  BView_DrawBitmap(CPlusObject, aBitmap, where.CPlusObject);
end;

procedure BView.DrawBitmap(aBitmap : BBitmap; dstRect : BRect);
begin
  BView_DrawBitmap(CPlusObject, aBitmap, dstRect.CPlusObject);
end;

procedure BView.DrawChar(aChar : char);
begin
  BView_DrawChar(CPlusObject, aChar);
end;

procedure BView.DrawChar(aChar : char; location : BPoint);
begin
  BView_DrawChar(CPlusObject, aChar, location.CPlusObject);
end;

procedure BView.DrawString(aString : PChar; delta : escapement_delta);
begin
  BView_DrawString(CPlusObject, aString, delta);
end;

procedure BView.DrawString(aString : PChar; location : BPoint; delta : escapement_delta);
begin
  BView_DrawString(CPlusObject, aString, location.CPlusObject, delta);
end;

procedure BView.DrawString(aString : PChar; length : integer; delta : escapement_delta);
begin
  BView_DrawString(CPlusObject, aString, length, delta);
end;

procedure BView.DrawString(aString : PChar; length : integer; location : BPoint; delta : escapement_delta);
begin
  BView_DrawString(CPlusObject, aString, length, location.CPlusObject, delta);
end;




////////////////////////////////////////////////////////////////////////
// Hook functions
////////////////////////////////////////////////////////////////////////
procedure View_AllAttached_hook_func(View : BView); cdecl;
begin
  if View <> nil then
    View.AllAttached;
end;

procedure View_AllDetached_hook_func(View : BView); cdecl;
begin
  if View <> nil then
    View.AllDetached;
end;

procedure View_AttachedToWindow_hook_func(View : BView); cdecl;
begin
  if View <> nil then
    View.AttachedToWindow;
end;

procedure View_DetachedFromWindow_hook_func(View : BView); cdecl;
begin
  if View <> nil then
    View.DetachedFromWindow;
end;

procedure View_Draw_hook_func(View : BView; aRect : TCPlusObject); cdecl;
var
  Rect : BRect;
begin
  Rect := BRect.Wrap(aRect);
  try
  if View <> nil then
    View.Draw(Rect);
  finally
    Rect.UnWrap;
  end;
end;

procedure View_DrawAfterChildren_hook_func(View : BView; aRect : TCPlusObject); cdecl;
var
  Rect : BRect;
begin
  Rect := BRect.Wrap(aRect);
  try
    if View <> nil then
      View.DrawAfterChildren(Rect);
  finally
    Rect.UnWrap;
  end;
end;

procedure View_FrameMoved_hook_func(View : BView; aPoint : TCPlusObject); cdecl;
var
  Point : BPoint;
begin
  Point := BPoint.Wrap(aPoint);
  try
    if View <> nil then
      View.FrameMoved(Point);
  finally
    Point.UnWrap;
  end;
end;

procedure View_FrameResized_hook_func(View : BView; width, height : double); cdecl;
begin
  if View <> nil then
    View.FrameResized(width, height);
end;

procedure View_GetPreferredSize_hook_func(View : BView; var width, height : double); cdecl;
begin
  if View <> nil then
    View.GetPreferredSize(width, height);
end;

procedure View_ResizeToPreferred_hook_func(View : BView); cdecl;
begin
  if View <> nil then
    View.ResizeToPreferred;
end;

procedure View_KeyDown_hook_func(View : BView; bytes : PChar; numBytes : integer); cdecl;
begin
  if View <> nil then
    View.KeyDown(bytes, numBytes);
end;

procedure View_KeyUp_hook_func(View : BView; bytes : PChar; numBytes : integer); cdecl;
begin
  if View <> nil then
    View.KeyUp(bytes, numBytes);
end;

procedure View_MouseDown_hook_func(View : BView; aPoint : TCPlusObject); cdecl;
var
  Point : BPoint;
begin
  Point := BPoint.Wrap(aPoint);
  try
    if View <> nil then
      View.MouseDown(Point);
  finally
    Point.UnWrap;
  end;
end;

procedure View_MouseMoved_hook_func(View : BView; aPoint : TCPlusObject; transit : Cardinal; aMessage : TCPlusObject); cdecl;
var
  Point : BPoint;
  Message : BMessage;  
begin
  Point := BPoint.Wrap(aPoint);
  try
    Message := BMessage.Wrap(aMessage);
    try
      if View <> nil then
        View.MouseMoved(Point, transit, Message);
    finally
      Message.UnWrap;
    end;
  finally
    Point.UnWrap;
  end;
end;

procedure View_MouseUp_hook_func(View : BView; aPoint : TCPlusObject); cdecl;
var
  Point : BPoint;
begin
  Point := BPoint.Wrap(aPoint);
  try
    if View <> nil then
      View.MouseDown(Point);
  finally
    Point.UnWrap;
  end;
end;

procedure View_Pulse_hook_func(View : BView); cdecl;
begin
  if View <> nil then
    View.Pulse;
end;

//procedure View_TargetedByScrollView_hook_func(View : BView; scroller : TScrollView); cdecl;
//var
//  ScrollView : TScrollView;
//begin
//  ScrollView := TScrollView.Wrap(scroller);
//  try
//    if View <> nil then  
//      View.TargetedByScrollView(ScrollView);
//  finally
//    ScrollView.UnWrap;
//  end; 
//end;







constructor BBitmap.Create(_bounds : BRect; flags : Longword;	depth : color_space;
                           bytesPerRow_ : Longint; screenID : screen_id);
begin
  inherited Create;
  CPlusObject := BBitmap_Create(Self, _bounds, flags, depth, bytesPerRow_, screenID);
end;

constructor BBitmap.Create(_bounds : BRect; depth : color_space;
                           accepts_views : Boolean; need_contiguous : Boolean);
begin
  inherited Create;
  CPlusObject := BBitmap_Create_1(Self, _bounds.CPlusObject, depth, accepts_views,
                                  need_contiguous);
end;

constructor BBitmap.Create(const source : BBitmap; accepts_views : Boolean;
                           need_contiguous : Boolean);
begin
  inherited Create;
  CPlusObject := BBitmap_Create_2(Self, source, accepts_views, need_contiguous);
end;

constructor BBitmap.Create(data : BMessage);
begin
  inherited Create;
  CPlusObject := BBitmap_Create_3(Self, data.CPlusObject);
end;

destructor BBitmap.Destroy;
begin
  BBitmap_Free(CPlusObject);
  inherited;
end;

function BBitmap.Instantiate(data : BMessage) : BArchivable;
begin
  Result := BBitmap_Instantiate(CPlusObject, data.CPlusObject);
end;

function BBitmap.Archive(data : BMessage; deep : Boolean) : status_t;
begin
  Result := BBitmap_Archive(CPlusObject, data.CPlusObject, deep);
end;

function BBitmap.InitCheck : status_t;
begin
  Result := BBitmap_InitCheck(CPlusObject);
end;

function BBitmap.IsValid : Boolean;
begin
  Result := BBitmap_IsValid(CPlusObject);
end;

function BBitmap.LockBits(state : PLongword) : status_t;
begin
  Result := BBitmap_LockBits(CPlusObject, state);
end;

procedure BBitmap.UnlockBits;
begin
  BBitmap_UnlockBits(CPlusObject);
end;

function BBitmap.Area : area_id;
begin
  Result := BBitmap_Area(CPlusObject);
end;

function BBitmap.Bits : Pointer;
begin
  Result := BBitmap_Bits(CPlusObject);
end;

function BBitmap.BitsLength : Longint;
begin
  Result := BBitmap_BitsLength(CPlusObject);
end;

function BBitmap.BytesPerRow : Longint;
begin
  Result := BBitmap_BytesPerRow(CPlusObject);
end;

function BBitmap.ColorSpace : color_space;
begin
  Result := BBitmap_ColorSpace(CPlusObject);
end;

function BBitmap.Bounds : BRect;
begin
  Result := BBitmap_Bounds(CPlusObject);
end;

procedure BBitmap.SetBits(const data : Pointer; length : Longint; offset : Longint;
                          cs : color_space);
begin
  BBitmap_SetBits(CPlusObject, data, length, offset, cs);
end;

function BBitmap.GetOverlayRestrictions(var restrict : overlay_restrictions) : status_t;
begin
  Result := BBitmap_GetOverlayRestrictions(CPlusObject, restrict);
end;

procedure BBitmap.AddChild(view : BView);
begin
  BBitmap_AddChild(CPlusObject, view.CPlusObject);
end;

function BBitmap.RemoveChild(view : BView) : Boolean;
begin
  Result := BBitmap_RemoveChild(CPlusObject, view.CPlusObject);
end;

function BBitmap.CountChildren : Longint;
begin
  Result := BBitmap_CountChildren(CPlusObject);
end;

function BBitmap.ChildAt(index : Longint) : BView;
begin
  Result := BBitmap_ChildAt(CPlusObject, index);
end;

function BBitmap.FindView(const view_name : PChar) : BView;
begin
  Result := BBitmap_FindView(CPlusObject, view_name);
end;

function BBitmap.FindView(point : BPoint) : BView;
begin
  Result := BBitmap_FindView(CPlusObject, point.CPlusObject);
end;

function BBitmap.Lock : Boolean;
begin
  Result := BBitmap_Lock(CPlusObject);
end;

procedure BBitmap.Unlock;
begin
  BBitmap_Unlock(CPlusObject);
end;

function BBitmap.IsLocked : Boolean;
begin
  Result := BBitmap_IsLocked(CPlusObject);
end;

function BBitmap.Perform(d : perform_code; arg : Pointer) : status_t;
begin
  Result := BBitmap_Perform(CPlusObject, d, arg);
end;





procedure View_WindowActivated_hook_func(View : BView; active : boolean); cdecl;
begin
  if View <> nil then
    View.WindowActivated(active);
end;

var
  _B_FOLLOW_NONE : Cardinal; cvar; external;
  _B_FOLLOW_ALL_SIDES : Cardinal; cvar; external;
  
  _B_FOLLOW_ALL : Cardinal; cvar; external;
  
  _B_FOLLOW_LEFT : Cardinal; cvar; external;
  _B_FOLLOW_RIGHT : Cardinal; cvar; external;
  _B_FOLLOW_LEFT_RIGHT : Cardinal; cvar; external;
  _B_FOLLOW_H_CENTER : Cardinal; cvar; external;
  
  _B_FOLLOW_TOP : Cardinal; cvar; external;
  _B_FOLLOW_BOTTOM : Cardinal; cvar; external;
  _B_FOLLOW_TOP_BOTTOM : Cardinal; cvar; external;
  _B_FOLLOW_V_CENTER : Cardinal; cvar; external;

initialization
  B_FOLLOW_NONE := _B_FOLLOW_NONE;
  B_FOLLOW_ALL_SIDES := _B_FOLLOW_ALL_SIDES;
  
  B_FOLLOW_ALL := _B_FOLLOW_ALL;
  
  B_FOLLOW_LEFT := _B_FOLLOW_LEFT;
  B_FOLLOW_RIGHT := _B_FOLLOW_RIGHT;
  B_FOLLOW_LEFT_RIGHT := _B_FOLLOW_LEFT_RIGHT;
  B_FOLLOW_H_CENTER := _B_FOLLOW_H_CENTER;
  
  B_FOLLOW_TOP := _B_FOLLOW_TOP;
  B_FOLLOW_BOTTOM := _B_FOLLOW_BOTTOM;
  B_FOLLOW_TOP_BOTTOM := _B_FOLLOW_TOP_BOTTOM;
  B_FOLLOW_V_CENTER := _B_FOLLOW_V_CENTER;
  
    // Connecting hook functions
  View_AllAttached_hook := @View_AllAttached_hook_func;
  View_AllDetached_hook := @View_AllDetached_hook_func;
  View_AttachedToWindow_hook := @View_AttachedToWindow_hook_func;
  View_DetachedFromWindow_hook := @View_DetachedFromWindow_hook_func;
  View_Draw_hook := @View_Draw_hook_func;
  View_DrawAfterChildren_hook := @View_DrawAfterChildren_hook_func;
  View_FrameMoved_hook := @View_FrameMoved_hook_func;
  View_FrameResized_hook := @View_FrameResized_hook_func;
  View_GetPreferredSize_hook := @View_GetPreferredSize_hook_func;
  View_ResizeToPreferred_hook := @View_ResizeToPreferred_hook_func;
  View_KeyDown_hook := @View_KeyDown_hook_func;
  View_KeyUp_hook := @View_KeyUp_hook_func;
  View_MouseDown_hook := @View_MouseDown_hook_func;
  View_MouseMoved_hook := @View_MouseMoved_hook_func;
  View_MouseUp_hook := @View_MouseUp_hook_func;
  View_Pulse_hook := @View_Pulse_hook_func;
//  View_TargetedByScrollView_hook := @View_TargetedByScrollView_hook_func;
  View_WindowActivated_hook := @View_WindowActivated_hook_func;

end.
