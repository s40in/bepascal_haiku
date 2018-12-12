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
}

unit Window;

interface

uses
  beobj, looper, rect, os, application, view, message, handler, appdefs,
  button, archivable, supportDefs, GraphicDefs;

const
  // window_type
  B_UNTYPED_WINDOW 		=  0;
  B_TITLED_WINDOW 		=  1;
  B_MODAL_WINDOW		=  3;
  B_DOCUMENT_WINDOW		= 11;
  B_BORDERED_WINDOW		= 20;
  B_FLOATING_WINDOW		= 21;
  
  // window_look
  B_BORDERED_WINDOW_LOOK	= 20;
  B_NO_BORDER_WINDOW_LOOK 	= 19;
  B_TITLED_WINDOW_LOOK		=  1;
  B_DOCUMENT_WINDOW_LOOK	= 11;
  B_MODAL_WINDOW_LOOK		=  3;
  B_FLOATING_WINDOW_LOOK	=  7;
  
  // window_feel
  B_NORMAL_WINDOW_FEEL			= 0;
  B_MODAL_SUBSET_WINDOW_FEEL	= 2;
  B_MODAL_APP_WINDOW_FEEL		= 1;
  B_MODAL_ALL_WINDOW_FEEL		= 3;
  B_FLOATING_SUBSET_WINDOW_FEEL	= 5;
  B_FLOATING_APP_WINDOW_FEEL	= 4;
  B_FLOATING_ALL_WINDOW_FEEL	= 6;
  
  // flags
  B_NOT_MOVABLE					= $00000001;
  B_NOT_CLOSABLE				= $00000020;
  B_NOT_ZOOMABLE				= $00000040;
  B_NOT_MINIMIZABLE				= $00004000;
  B_NOT_RESIZABLE				= $00000002;
  B_NOT_H_RESIZABLE				= $00000004;
  B_NOT_V_RESIZABLE				= $00000008;
  B_AVOID_FRONT					= $00000080;
  B_AVOID_FOCUS					= $00002000;
  B_WILL_ACCEPT_FIRST_CLICK		= $00000010;
  B_OUTLINE_RESIZE				= $00001000;
  B_NO_WORKSPACE_ACTIVATION		= $00000100;
  B_NOT_ANCHORED_ON_ACTIVATE	= $00020000;
  B_ASYNCHRONOUS_CONTROLS		= $00080000;
  B_QUIT_ON_WINDOW_CLOSE		= $00100000;
  
  B_CURRENT_WORKSPACE		= 0;    
  B_ALL_WORKSPACES			= $ffffffff;
  
type
  PCardinal = ^Cardinal;
//  PInteger = ^Integer;
  BWindow = class(BLooper)
  public
    constructor Create(aFrame : BRect; aTitle : PChar; aNewType, SomeFlags, AWorkspaces : Cardinal); virtual;
    destructor Destroy; override;
    procedure Show;
    procedure Hide;
    procedure AddChild(aView : BView; sibling : BView);
    function QuitRequested : boolean; override;    
    function RemoveChild(aView : BView) : boolean;
     // New
    // constructor Create;
    // constructor Create(frame : TRect; title : PChar; look : PCardinal; feel : Cardinal; flags : Cardinal; workspace : Cardinal);
    // destructor Destroy;
    // constructor Create(data : TMessage);
    function Instantiate(data : BMessage) : BArchivable;
    function Archive(data : BMessage; deep : boolean) : Status_t;
    procedure Quit;
//    procedure Close;
    // procedure AddChild(child : TView; before : TView);
    // function RemoveChild(child : TView) : boolean;
    function CountChildren : integer;
    function ChildAt(index : integer) : BView;
    procedure DispatchMessage(message : BMessage; handler : BHandler); override;
    procedure MessageReceived(message : BMessage); override;
    procedure FrameMoved(new_position : BPoint);
    procedure WorkspacesChanged(old_ws : Cardinal; new_ws : Cardinal);
    procedure WorkspaceActivated(ws : integer; state : boolean);
    procedure FrameResized(new_width : double; new_height : double);
    procedure Minimize(aMinimize : boolean);
    procedure Zoom(rec_position : BPoint; rec_width : double; rec_height : double);
    procedure Zoom;
    procedure SetZoomLimits(max_h : double; max_v : double);
    procedure ScreenChanged(screen_size : BRect; depth : Color_Space);
    procedure SetPulseRate(rate : Bigtime_t);
    function PulseRate : Bigtime_t;
    procedure AddShortcut(key : Cardinal; modifiers : Cardinal; msg : BMessage);
    procedure AddShortcut(key : Cardinal; modifiers : Cardinal; msg : BMessage; target : BHandler);
    procedure RemoveShortcut(key : Cardinal; modifiers : Cardinal);
    procedure SetDefaultButton(button : BButton);
    function DefaultButton : BButton;
    procedure MenusBeginning;
    procedure MenusEnded;
    function NeedsUpdate : boolean;
    procedure UpdateIfNeeded;
    function FindView(view_name : PChar) : BView;
    function FindView(aPoint : BPoint) : BView;
    function CurrentFocus : BView;
    procedure Activate(aValue : boolean);
    procedure WindowActivated(state : boolean);
//    procedure ConvertToScreen(var pt : TPoint); overload;
    function ConvertToScreen(pt : BPoint) : BPoint; overload;
//    procedure ConvertFromScreen(var pt : TPoint);
    function ConvertFromScreen(pt : BPoint) : BPoint;
//    procedure ConvertToScreen(var rect : TRect);
//    function ConvertToScreen(rect : TRect) : TRect;
//    procedure ConvertFromScreen(var rect : TRect);
//    function ConvertFromScreen(rect : TRect) : TRect;
    procedure MoveBy(dx : double; dy : double);
    procedure MoveTo(aPoint : BPoint);
    procedure MoveTo(x : double; y : double);
    procedure ResizeBy(dx : double; dy : double);
    procedure ResizeTo(width : double; height : double);
    // procedure Show;
    // procedure Hide;
    function IsHidden : boolean;
    function IsMinimized : boolean;
    procedure Flush;
    procedure Sync;
    function SendBehind(window : BWindow) : Status_t;
    procedure DisableUpdates;
    procedure EnableUpdates;
    procedure BeginViewTransaction;
    procedure EndViewTransaction;
    function Bounds : BRect;
    function GetFrame : BRect;
    function GetTitle : PChar;
    procedure SetTitle(title : PChar);
    function IsFront : boolean;
    function IsActive : boolean;
//    procedure SetKeyMenuBar(bar : TMenuBar);
//    function KeyMenuBar : TMenuBar;
    procedure SetSizeLimits(min_h : double; max_h : double; min_v : double; max_v : double);
    procedure GetSizeLimits(min_h : double; max_h : double; min_v : double; max_v : double);
    function Workspaces : Cardinal;
    procedure SetWorkspaces(aWorkspace : Cardinal);
    function LastMouseMovedView : BView;
    function ResolveSpecifier(msg :BMessage; index : integer; specifier : BMessage; form : integer; aProperty : PChar) : BHandler;
    function GetSupportedSuites(data : BMessage) : Status_t;
    function AddToSubset(window : BWindow) : Status_t;
    function RemoveFromSubset(window : BWindow) : Status_t;
    function Perform(d : Perform_code; arg : Pointer) : Status_t;
    function SetType(aType : Cardinal) : Status_t;
    function GetType : Cardinal;
    function SetLook(look : PCardinal) : Status_t;
    function GetLook : PCardinal;
    function SetFeel(feel : Cardinal) : Status_t;
    function GetFeel : Cardinal;
    function SetFlags(aFlags : Cardinal) : Status_t;
    function GetFlags : Cardinal;
    function IsModal : boolean;
    function IsFloating : boolean;
    function SetWindowAlignment(mode : Cardinal; h : integer; hOffset : integer; width : integer; widthOffset : integer; v : integer; vOffset : integer; height : integer; heightOffset : integer) : Status_t;
    function GetWindowAlignment(mode : PCardinal; var h : integer; var hOffset : integer; var width : integer; var widthOffset : integer; var v : integer; var vOffset : integer; var height : integer; var heightOffset : integer) : Status_t;
//    function QuitRequested : boolean;
    function Run : Thread_id;    
  end;

function BWindow_Create(AObject : TObject; frame : TCPlusObject; title : PChar;
  atype, flags, workspaces : cardinal) : TCplusObject; cdecl; external BePascalLibName name 'BWindow_Create_1';
procedure BWindow_Free(CPlusObject : TCPlusObject); cdecl; external BePascalLibName name 'BWindow_Free';
procedure BWindow_Show(CPlusObject : TCPlusObject); cdecl; external BePascalLibName name 'BWindow_Show';
procedure BWindow_Hide(CPlusObject : TCPlusObject); cdecl; external BePascalLibName name 'BWindow_Hide';
procedure BWindow_AddChild(CPlusObject : TCPlusObject; aView : TCPlusObject; sibling : TCPlusObject); cdecl; external BePascalLibName name 'BWindow_AddChild';
function BWindow_RemoveChild(CPlusObject : TCPlusObject; aView : TCPlusObject) : boolean; cdecl; external BePascalLibName name 'BWindow_RemoveChild';

// New
//function BWindow_Create(AObject : TBeObject; data : TMessage); cdecl; external BePascalLibName name 'BWindow_Create';
function BWindow_Instantiate(AObject : TCPlusObject; data : TCPlusObject) : BArchivable; cdecl; external BePascalLibName name 'BWindow_Instantiate';
function BWindow_Archive(AObject : TCPlusObject; data : TCPlusObject; deep : boolean) : Status_t; cdecl; external BePascalLibName name 'BWindow_Archive';
procedure BWindow_Quit(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BWindow_Quit';
//procedure BWindow_Close(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BWindow_Close';
//procedure BWindow_AddChild(AObject : TCPlusObject; child : TCPlusObject; before : TCPlusObject); cdecl; external BePascalLibName name 'BWindow_AddChild';
function BWindow_RemoveChild(AObject : TCPlusObject; child : BView) : boolean; cdecl; external BePascalLibName name 'BWindow_RemoveChild';
function BWindow_CountChildren(AObject : TCPlusObject) : integer; cdecl; external BePascalLibName name 'BWindow_CountChildren';
function BWindow_ChildAt(AObject : TCPlusObject; index : integer) : BView; cdecl; external BePascalLibName name 'BWindow_ChildAt';
procedure BWindow_DispatchMessage(AObject : TCPlusObject; message : BMessage; handler : BHandler); cdecl; external BePascalLibName name 'BWindow_DispatchMessage';
procedure BWindow_MessageReceived(AObject : TCPlusObject; message : BMessage); cdecl; external BePascalLibName name 'BWindow_MessageReceived';
procedure BWindow_FrameMoved(AObject : TCPlusObject; new_position : TCPlusObject); cdecl; external BePascalLibName name 'BWindow_FrameMoved';
procedure BWindow_WorkspacesChanged(AObject : TCPlusObject; old_ws : Cardinal; new_ws : Cardinal); cdecl; external BePascalLibName name 'BWindow_WorkspacesChanged';
procedure BWindow_WorkspaceActivated(AObject : TCPlusObject; ws : integer; state : boolean); cdecl; external BePascalLibName name 'BWindow_WorkspaceActivated';
procedure BWindow_FrameResized(AObject : TCPlusObject; new_width : double; new_height : double); cdecl; external BePascalLibName name 'BWindow_FrameResized';
procedure BWindow_Minimize(AObject : TCPlusObject; minimize : boolean); cdecl; external BePascalLibName name 'BWindow_Minimize';
procedure BWindow_Zoom(AObject : TCPlusObject; rec_position : TCPlusObject; rec_width : double; rec_height : double); cdecl; external BePascalLibName name 'BWindow_Zoom';
procedure BWindow_Zoom(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BWindow_Zoom';
procedure BWindow_SetZoomLimits(AObject : TCPlusObject; max_h : double; max_v : double); cdecl; external BePascalLibName name 'BWindow_SetZoomLimits';
procedure BWindow_ScreenChanged(AObject : TCPlusObject; screen_size : TCPlusObject; depth : Color_Space); cdecl; external BePascalLibName name 'BWindow_ScreenChanged';
procedure BWindow_SetPulseRate(AObject : TCPlusObject; rate : Bigtime_t); cdecl; external BePascalLibName name 'BWindow_SetPulseRate';
function BWindow_PulseRate(AObject : TCPlusObject) : Bigtime_t; cdecl; external BePascalLibName name 'BWindow_PulseRate';
procedure BWindow_AddShortcut(AObject : TCPlusObject; key : Cardinal; modifiers : Cardinal; msg : TCPlusObject); cdecl; external BePascalLibName name 'BWindow_AddShortcut';
procedure BWindow_AddShortcut(AObject : TCPlusObject; key : Cardinal; modifiers : Cardinal; msg : TCPlusObject; target : TCPlusObject); cdecl; external BePascalLibName name 'BWindow_AddShortcut';
procedure BWindow_RemoveShortcut(AObject : TCPlusObject; key : Cardinal; modifiers : Cardinal); cdecl; external BePascalLibName name 'BWindow_RemoveShortcut';
procedure BWindow_SetDefaultButton(AObject : TCPlusObject; button : TCPlusObject); cdecl; external BePascalLibName name 'BWindow_SetDefaultButton';
function BWindow_DefaultButton(AObject : TCPlusObject) : BButton; cdecl; external BePascalLibName name 'BWindow_DefaultButton';
procedure BWindow_MenusBeginning(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BWindow_MenusBeginning';
procedure BWindow_MenusEnded(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BWindow_MenusEnded';
function BWindow_NeedsUpdate(AObject : TCPlusObject) : boolean; cdecl; external BePascalLibName name 'BWindow_NeedsUpdate';
procedure BWindow_UpdateIfNeeded(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BWindow_UpdateIfNeeded';
function BWindow_FindView(AObject : TCPlusObject; view_name : PChar) : BView; cdecl; external BePascalLibName name 'BWindow_FindView';
function BWindow_FindView(AObject : TCPlusObject;  aPoint : BPoint) : BView; cdecl; external BePascalLibName name 'BWindow_FindView';
function BWindow_CurrentFocus(AObject : TCPlusObject) : BView; cdecl; external BePascalLibName name 'BWindow_CurrentFocus';
procedure BWindow_Activate(AObject : TCPlusObject; aState : boolean); cdecl; external BePascalLibName name 'BWindow_Activate';
procedure BWindow_WindowActivated(AObject : TCPlusObject; state : boolean); cdecl; external BePascalLibName name 'BWindow_WindowActivated';
//procedure BWindow_ConvertToScreen(AObject : TCPlusObject; var pt : TCPlusObject); cdecl; external BePascalLibName name 'BWindow_ConvertToScreen';
function BWindow_ConvertToScreen(AObject : TCPlusObject; pt : TCPlusObject) : BPoint; cdecl; external BePascalLibName name 'BWindow_ConvertToScreen_1';
//procedure BWindow_ConvertFromScreen(AObject : TCPlusObject; var pt : TCPlusObject); cdecl; external BePascalLibName name 'BWindow_ConvertFromScreen';
function BWindow_ConvertFromScreen(AObject : TCPlusObject; pt : TCPlusObject) : BPoint; cdecl; external BePascalLibName name 'BWindow_ConvertFromScreen_1';
//procedure BWindow_ConvertToScreen(AObject : TCPlusObject; var rect : TCPlusObject); cdecl; external BePascalLibName name 'BWindow_ConvertToScreen';
//function BWindow_ConvertToScreen(AObject : TCPlusObject; rect : TCPlusObject) : TRect; cdecl; external BePascalLibName name 'BWindow_ConvertToScreen';
//procedure BWindow_ConvertFromScreen(AObject : TCPlusObject; var rect : TRect); cdecl; external BePascalLibName name 'BWindow_ConvertFromScreen';
//function BWindow_ConvertFromScreen(AObject : TCPlusObject; rect : TRect) : TRect; cdecl; external BePascalLibName name 'BWindow_ConvertFromScreen';
procedure BWindow_MoveBy(AObject : TCPlusObject; dx : double; dy : double); cdecl; external BePascalLibName name 'BWindow_MoveBy';
procedure BWindow_MoveTo(AObject : TCPlusObject; aPoint : TCPlusObject); cdecl; external BePascalLibName name 'BWindow_MoveTo';
procedure BWindow_MoveTo(AObject : TCPlusObject; x : double; y : double); cdecl; external BePascalLibName name 'BWindow_MoveTo';
procedure BWindow_ResizeBy(AObject : TCPlusObject; dx : double; dy : double); cdecl; external BePascalLibName name 'BWindow_ResizeBy';
procedure BWindow_ResizeTo(AObject : TCPlusObject; width : double; height : double); cdecl; external BePascalLibName name 'BWindow_ResizeTo';
//procedure BWindow_Show(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BWindow_Show';
//procedure BWindow_Hide(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BWindow_Hide';
function BWindow_IsHidden(AObject : TCPlusObject) : boolean; cdecl; external BePascalLibName name 'BWindow_IsHidden';
function BWindow_IsMinimized(AObject : TCPlusObject) : boolean; cdecl; external BePascalLibName name 'BWindow_IsMinimized';
procedure BWindow_Flush(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BWindow_Flush';
procedure BWindow_Sync(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BWindow_Sync';
function BWindow_SendBehind(AObject : TCPlusObject; window : BWindow) : Status_t; cdecl; external BePascalLibName name 'BWindow_SendBehind';
procedure BWindow_DisableUpdates(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BWindow_DisableUpdates';
procedure BWindow_EnableUpdates(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BWindow_EnableUpdates';
procedure BWindow_BeginViewTransaction(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BWindow_BeginViewTransaction';
procedure BWindow_EndViewTransaction(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BWindow_EndViewTransaction';
function BWindow_Bounds(AObject : TCPlusObject) : TCPlusObject; cdecl; external BePascalLibName name 'BWindow_Bounds';
function BWindow_Frame(AObject : TCPlusObject) : BRect; cdecl; external BePascalLibName name 'BWindow_Frame';
function BWindow_Title(AObject : TCPlusObject) : PChar; cdecl; external BePascalLibName name 'BWindow_Title';
procedure BWindow_SetTitle(AObject : TCPlusObject; title : PChar); cdecl; external BePascalLibName name 'BWindow_SetTitle';
function BWindow_IsFront(AObject : TCPlusObject) : boolean; cdecl; external BePascalLibName name 'BWindow_IsFront';
function BWindow_IsActive(AObject : TCPlusObject) : boolean; cdecl; external BePascalLibName name 'BWindow_IsActive';
//procedure BWindow_SetKeyMenuBar(AObject : TCPlusObject; bar : TMenuBar); cdecl; external BePascalLibName name 'BWindow_SetKeyMenuBar';
//function BWindow_KeyMenuBar(AObject : TCPlusObject) : TMenuBar; cdecl; external BePascalLibName name 'BWindow_KeyMenuBar';
procedure BWindow_SetSizeLimits(AObject : TCPlusObject; min_h : double; max_h : double; min_v : double; max_v : double); cdecl; external BePascalLibName name 'BWindow_SetSizeLimits';
procedure BWindow_GetSizeLimits(AObject : TCPlusObject; min_h : double; max_h : double; min_v : double; max_v : double); cdecl; external BePascalLibName name 'BWindow_GetSizeLimits';
function BWindow_Workspaces(AObject : TCPlusObject) : Cardinal; cdecl; external BePascalLibName name 'BWindow_Workspaces';
procedure BWindow_SetWorkspaces(AObject : TCPlusObject; Workspaces : Cardinal); cdecl; external BePascalLibName name 'BWindow_SetWorkspaces';
function BWindow_LastMouseMovedView(AObject : TCPlusObject) : BView; cdecl; external BePascalLibName name 'BWindow_LastMouseMovedView';
function BWindow_ResolveSpecifier(AObject : TCPlusObject; msg : TCPlusObject; index : integer; specifier : TCPlusObject; form : integer; aProperty : PChar) : BHandler; cdecl; external BePascalLibName name 'BWindow_ResolveSpecifier';
function BWindow_GetSupportedSuites(AObject : TCPlusObject; data : TCPlusObject) : Status_t; cdecl; external BePascalLibName name 'BWindow_GetSupportedSuites';
function BWindow_AddToSubset(AObject : TCPlusObject; window : TCPlusObject) : Status_t; cdecl; external BePascalLibName name 'BWindow_AddToSubset';
function BWindow_RemoveFromSubset(AObject : TCPlusObject; window : TCPlusObject) : Status_t; cdecl; external BePascalLibName name 'BWindow_RemoveFromSubset';
function BWindow_Perform(AObject : TCPlusObject; d : Perform_code; arg : Pointer) : Status_t; cdecl; external BePascalLibName name 'BWindow_Perform';
function BWindow_SetType(AObject : TCPlusObject; aType : Cardinal) : Status_t; cdecl; external BePascalLibName name 'BWindow_SetType';
function BWindow_Type(AObject : TCPlusObject) : Cardinal; cdecl; external BePascalLibName name 'BWindow_Type';
function BWindow_SetLook(AObject : TCPlusObject; look : PCardinal) : Status_t; cdecl; external BePascalLibName name 'BWindow_SetLook';
function BWindow_Look(AObject : TCPlusObject) : PCardinal; cdecl; external BePascalLibName name 'BWindow_Look';
function BWindow_SetFeel(AObject : TCPlusObject; feel : Cardinal) : Status_t; cdecl; external BePascalLibName name 'BWindow_SetFeel';
function BWindow_Feel(AObject : TCPlusObject) : Cardinal; cdecl; external BePascalLibName name 'BWindow_Feel';
function BWindow_SetFlags(AObject : TCPlusObject; aFlags : Cardinal) : Status_t; cdecl; external BePascalLibName name 'BWindow_SetFlags';
function BWindow_Flags(AObject : TCPlusObject) : Cardinal; cdecl; external BePascalLibName name 'BWindow_Flags';
function BWindow_IsModal(AObject : TCPlusObject) : boolean; cdecl; external BePascalLibName name 'BWindow_IsModal';
function BWindow_IsFloating(AObject : TCPlusObject) : boolean; cdecl; external BePascalLibName name 'BWindow_IsFloating';
function BWindow_SetWindowAlignment(AObject : TCPlusObject; mode : Cardinal; h : integer; hOffset : integer; width : integer; widthOffset : integer; v : integer; vOffset : integer; height : integer; heightOffset : integer) : Status_t; cdecl; external BePascalLibName name 'BWindow_SetWindowAlignment';
function BWindow_GetWindowAlignment(AObject : TCPlusObject; mode : PCardinal; var h : integer; var hOffset : integer; var width : integer; widthOffset : integer; var v : integer; var vOffset : integer; var height : integer; var heightOffset : integer) : Status_t; cdecl; external BePascalLibName name 'BWindow_GetWindowAlignment';
function BWindow_QuitRequested(AObject : TCPlusObject) : boolean; cdecl; external BePascalLibName name 'BWindow_QuitRequested';
function BWindow_Run(AObject : TCPlusObject) : Thread_id; cdecl; external BePascalLibName name 'BWindow_Run';
procedure BWindow_BLooper(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BWindow_BLooper inherited';
//procedure BWindow__ReservedWindow1(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BWindow__ReservedWindow1';
//procedure BWindow__ReservedWindow2(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BWindow__ReservedWindow2';
//procedure BWindow__ReservedWindow3(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BWindow__ReservedWindow3';
//procedure BWindow__ReservedWindow4(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BWindow__ReservedWindow4';
//procedure BWindow__ReservedWindow5(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BWindow__ReservedWindow5';
//procedure BWindow__ReservedWindow6(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BWindow__ReservedWindow6';
//procedure BWindow__ReservedWindow7(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BWindow__ReservedWindow7';
//procedure BWindow__ReservedWindow8(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BWindow__ReservedWindow8';
//function BWindow_Create(AObject : TBeObject); cdecl; external BePascalLibName name 'BWindow_Create';
//function BWindow_Create(AObject : TBeObject;  : TWindow); cdecl; external BePascalLibName name 'BWindow_Create';
//function BWindow_operator=(AObject : TCPlusObject;  : TWindow) : TWindow; cdecl; external BePascalLibName name 'BWindow_operator=';
//function BWindow_Create(AObject : TBeObject; frame : TRect; depth : TColor_Space; bitmapFlags : Cardinal; rowBytes : integer); cdecl; external BePascalLibName name 'BWindow_Create';
//procedure BWindow_InitData(AObject : TCPlusObject; frame : TRect; title : PChar; look : PCadinal; feel : Cardinal; flags : Cardinal; workspace : Cardinal); cdecl; external BePascalLibName name 'BWindow_InitData';
//function BWindow_ArchiveChildren(AObject : TCPlusObject; data : TMessage; deep : boolean) : TStatus_t; cdecl; external BePascalLibName name 'BWindow_ArchiveChildren';
//function BWindow_UnarchiveChildren(AObject : TCPlusObject; data : TMessage) : TStatus_t; cdecl; external BePascalLibName name 'BWindow_UnarchiveChildren';
//procedure BWindow_BitmapClose(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BWindow_BitmapClose';
//procedure BWindow_task_looper(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BWindow_task_looper';
//procedure BWindow_start_drag(AObject : TCPlusObject; msg : TMessage; token : integer; offset : TPoint; track_rect : TRect; reply_to : THandler); cdecl; external BePascalLibName name 'BWindow_start_drag';
//procedure BWindow_start_drag(AObject : TCPlusObject; msg : TMessage; token : integer; offset : TPoint; bitmap_token : integer; dragMode : TDrawing_Mode; reply_to : THandler); cdecl; external BePascalLibName name 'BWindow_start_drag';
//procedure BWindow_view_builder(AObject : TCPlusObject; a_view : TView); cdecl; external BePascalLibName name 'BWindow_view_builder';
//procedure BWindow_attach_builder(AObject : TCPlusObject; a_view : TView); cdecl; external BePascalLibName name 'BWindow_attach_builder';
//procedure BWindow_detach_builder(AObject : TCPlusObject; a_view : TView); cdecl; external BePascalLibName name 'BWindow_detach_builder';
//function BWindow_get_server_token(AObject : TCPlusObject) : integer; cdecl; external BePascalLibName name 'BWindow_get_server_token';
//function BWindow_extract_drop(AObject : TCPlusObject; an_event : TMessage; target : THandler) : TMessage; cdecl; external BePascalLibName name 'BWindow_extract_drop';
//procedure BWindow_movesize(AObject : TCPlusObject; opcode : Cardinal; h : double; v : double); cdecl; external BePascalLibName name 'BWindow_movesize';
//function BWindow_ReadMessageFromPort(AObject : TCPlusObject; tout : TBigtime_t) : TMessage; cdecl; external BePascalLibName name 'BWindow_ReadMessageFromPort';
//function BWindow_MessagesWaiting(AObject : TCPlusObject) : integer; cdecl; external BePascalLibName name 'BWindow_MessagesWaiting';
//procedure BWindow_handle_activate(AObject : TCPlusObject; an_event : TMessage); cdecl; external BePascalLibName name 'BWindow_handle_activate';
//procedure BWindow_do_view_frame(AObject : TCPlusObject; an_event : TMessage); cdecl; external BePascalLibName name 'BWindow_do_view_frame';
//procedure BWindow_do_value_change(AObject : TCPlusObject; an_event : TMessage; handler : THandler); cdecl; external BePascalLibName name 'BWindow_do_value_change';
//procedure BWindow_do_mouse_down(AObject : TCPlusObject; an_event : TMessage; target : TView); cdecl; external BePascalLibName name 'BWindow_do_mouse_down';
//procedure BWindow_do_mouse_moved(AObject : TCPlusObject; an_event : TMessage; target : TView); cdecl; external BePascalLibName name 'BWindow_do_mouse_moved';
//procedure BWindow_do_key_down(AObject : TCPlusObject; an_event : TMessage; handler : THandler); cdecl; external BePascalLibName name 'BWindow_do_key_down';
//procedure BWindow_do_key_up(AObject : TCPlusObject; an_event : TMessage; handler : THandler); cdecl; external BePascalLibName name 'BWindow_do_key_up';
//procedure BWindow_do_menu_event(AObject : TCPlusObject; an_event : TMessage); cdecl; external BePascalLibName name 'BWindow_do_menu_event';
//procedure BWindow_do_draw_views(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BWindow_do_draw_views';
//function BWindow_ConvertToMessage(AObject : TCPlusObject; raw : Pointer; code : integer) : TMessage; cdecl; external BePascalLibName name 'BWindow_ConvertToMessage';
//function BWindow_allocShortcut(AObject : TCPlusObject; key : Cardinal; modifiers : Cardinal) : TCmd_Key; cdecl; external BePascalLibName name 'BWindow_allocShortcut';
//function BWindow_FindShortcut(AObject : TCPlusObject; key : Cardinal; modifiers : Cardinal) : TCmd_Key; cdecl; external BePascalLibName name 'BWindow_FindShortcut';
//procedure BWindow_AddShortcut(AObject : TCPlusObject; key : Cardinal; modifiers : Cardinal; item : TMenuItem); cdecl; external BePascalLibName name 'BWindow_AddShortcut';
//procedure BWindow_post_message(AObject : TCPlusObject; message : TMessage); cdecl; external BePascalLibName name 'BWindow_post_message';
//procedure BWindow_SetLocalTitle(AObject : TCPlusObject; new_title : PChar); cdecl; external BePascalLibName name 'BWindow_SetLocalTitle';
//procedure BWindow_enable_pulsing(AObject : TCPlusObject; enable : boolean); cdecl; external BePascalLibName name 'BWindow_enable_pulsing';
//function BWindow_determine_target(AObject : TCPlusObject; msg : TMessage; target : THandler; pref : boolean) : THandler; cdecl; external BePascalLibName name 'BWindow_determine_target';
//procedure BWindow_kb_navigate(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BWindow_kb_navigate';
//procedure BWindow_navigate_to_next(AObject : TCPlusObject; direction : integer; group : boolean); cdecl; external BePascalLibName name 'BWindow_navigate_to_next';
//procedure BWindow_set_focus(AObject : TCPlusObject; focus : TView; notify_input_server : boolean); cdecl; external BePascalLibName name 'BWindow_set_focus';
//function BWindow_InUpdate(AObject : TCPlusObject) : boolean; cdecl; external BePascalLibName name 'BWindow_InUpdate';
//procedure BWindow_DequeueAll(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BWindow_DequeueAll';
//function BWindow_find_token_and_handler(AObject : TCPlusObject; msg : TMessage; token : ^integer; handler : THandler) : boolean; cdecl; external BePascalLibName name 'BWindow_find_token_and_handler';
//function BWindow_compose_type(AObject : TCPlusObject; look : PCadinal; feel : Cardinal) : Cardinal; cdecl; external BePascalLibName name 'BWindow_compose_type';
//procedure BWindow_decompose_type(AObject : TCPlusObject; type : Cardinal; look : PCardinal; feel : PCardinal); cdecl; external BePascalLibName name 'BWindow_decompose_type';
//procedure BWindow_SetIsFilePanel(AObject : TCPlusObject; panel : boolean); cdecl; external BePascalLibName name 'BWindow_SetIsFilePanel';
//function BWindow_IsFilePanel(AObject : TCPlusObject) : boolean; cdecl; external BePascalLibName name 'BWindow_IsFilePanel';
//procedure BWindow_AddFloater(AObject : TCPlusObject; a_floating_window : TWindow); cdecl; external BePascalLibName name 'BWindow_AddFloater';
//procedure BWindow_RemoveFloater(AObject : TCPlusObject; a_floating_window : TWindow); cdecl; external BePascalLibName name 'BWindow_RemoveFloater';
//function BWindow_WindowType(AObject : TCPlusObject) : Cardinal; cdecl; external BePascalLibName name 'BWindow_WindowType';
//procedure BWindow_char *fTitle(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BWindow_char *fTitle';
//procedure BWindow_int32 server_token(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BWindow_int32 server_token';
//procedure BWindow_char fInUpdate(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BWindow_char fInUpdate';
//procedure BWindow_char f_active(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BWindow_char f_active';
//procedure BWindow_short fShowLevel(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BWindow_short fShowLevel';
//procedure BWindow_uint32 fFlags(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BWindow_uint32 fFlags';
//procedure BWindow_port_id send_port(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BWindow_port_id send_port';
//procedure BWindow_port_id receive_port(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BWindow_port_id receive_port';
//procedure BWindow_BView *top_view(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BWindow_BView *top_view';
//procedure BWindow_BView *fFocus(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BWindow_BView *fFocus';
//procedure BWindow_BView *fLastMouseMovedView(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BWindow_BView *fLastMouseMovedView';
//procedure BWindow__BSession_ *a_session(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BWindow__BSession_ *a_session';
//procedure BWindow_BMenuBar *fKeyMenuBar(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BWindow_BMenuBar *fKeyMenuBar';
//procedure BWindow_BButton *fDefaultButton(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BWindow_BButton *fDefaultButton';
//procedure BWindow_BList accelList(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BWindow_BList accelList';
//procedure BWindow_int32 top_view_token(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BWindow_int32 top_view_token';
//procedure BWindow_bool pulse_enabled(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BWindow_bool pulse_enabled';
//procedure BWindow_bool fViewsNeedPulse(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BWindow_bool fViewsNeedPulse';
//procedure BWindow_bool fIsFilePanel(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BWindow_bool fIsFilePanel';
//procedure BWindow_bool fUnused1(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BWindow_bool fUnused1';
//procedure BWindow_bigtime_t pulse_rate(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BWindow_bigtime_t pulse_rate';
//procedure BWindow_bool fWaitingForMenu(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BWindow_bool fWaitingForMenu';
//procedure BWindow_bool fOffscreen(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BWindow_bool fOffscreen';
//procedure BWindow_sem_id fMenuSem(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BWindow_sem_id fMenuSem';
//procedure BWindow_float fMaxZoomH(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BWindow_float fMaxZoomH';
//procedure BWindow_float fMaxZoomV(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BWindow_float fMaxZoomV';
//procedure BWindow_float fMinWindH(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BWindow_float fMinWindH';
//procedure BWindow_float fMinWindV(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BWindow_float fMinWindV';
//procedure BWindow_float fMaxWindH(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BWindow_float fMaxWindH';
//procedure BWindow_float fMaxWindV(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BWindow_float fMaxWindV';
//procedure BWindow_BRect fFrame(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BWindow_BRect fFrame';
//procedure BWindow_window_look fLook(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BWindow_window_look fLook';
//procedure BWindow__view_attr_ *fCurDrawViewState(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BWindow__view_attr_ *fCurDrawViewState';
//procedure BWindow_window_feel fFeel(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BWindow_window_feel fFeel';
//procedure BWindow_int32 fLastViewToken(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BWindow_int32 fLastViewToken';
//procedure BWindow__CEventPort_ *fEventPort(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BWindow__CEventPort_ *fEventPort';
//procedure BWindow_BMessageRunner *fPulseRunner(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BWindow_BMessageRunner *fPulseRunner';
//procedure BWindow_BRect fCurrentFrame(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BWindow_BRect fCurrentFrame';
//procedure BWindow_uint32 _reserved[2](AObject : TCPlusObject); cdecl; external BePascalLibName name 'BWindow_uint32 _reserved[2]';
//procedure BWindow_uint32 _more_reserved[4](AObject : TCPlusObject); cdecl; external BePascalLibName name 'BWindow_uint32 _more_reserved[4]';
//  
implementation

function BWindow.QuitRequested : boolean;
begin
  Result := inherited;
  be_app.PostMessage(B_QUIT_REQUESTED);
end;

constructor BWindow.Create(aFrame : BRect; aTitle : PChar; aNewType, SomeFlags, aWorkspaces : Cardinal);
begin
  inherited Create;
  CPlusObject := BWindow_Create(Self, aFrame.CPlusObject, aTitle, aNewType, SomeFlags, aWorkspaces);
end;

destructor BWindow.Destroy;
begin
  BWindow_Free(CPlusObject);  
  inherited;
end;

procedure BWindow.Show;
begin
  BWindow_Show(Self.CPlusObject);
end;

procedure BWindow.Hide;
begin
  BWindow_Hide(Self.CPlusObject);
end;

procedure BWindow.AddChild(aView : BView; sibling : BView);
begin
  BWindow_AddChild(Self.CPlusObject, aView.CPlusObject, nil{sibling.CPlusObject});
end;

function BWindow.RemoveChild(aView : BView) : boolean;
begin
  result :=  BWindow_RemoveChild(Self.CPlusObject, aView.CPlusObject);
end;

function BWindow.Instantiate(data : BMessage) : BArchivable;
begin
  Result := BWindow_Instantiate(CPlusObject, data.CPlusObject);
end;

function BWindow.Archive(data : BMessage; deep : boolean) : Status_t;
begin
  Result := BWindow_Archive(CPlusObject, data.CPlusObject, deep);
end;

procedure BWindow.Quit;
begin
  BWindow_Quit(CPlusObject);
end;

//procedure TWindow.Close;
//begin
//  BWindow_Close(CPlusObject);
//end;

//procedure TWindow.AddChild(child : TView; before : TView);
//begin
//  BWindow_AddChild(CPlusObject, child.CPlusObject, before.CPlusObject);
//end;

//function TWindow.RemoveChild(child : TView) : boolean;
//begin
//  Result := BWindow_RemoveChild(CPlusObject, child.CPlusObject);
//end;

function BWindow.CountChildren : integer;
begin
  Result := BWindow_CountChildren(CPlusObject);
end;

function BWindow.ChildAt(index : integer) : BView;
begin
  Result := BWindow_ChildAt(CPlusObject, index);
end;

procedure BWindow.DispatchMessage(message : BMessage; handler : BHandler);
begin

end;

procedure BWindow.MessageReceived(message : BMessage);
begin

end;

procedure BWindow.FrameMoved(new_position : BPoint);
begin
  BWindow_FrameMoved(CPlusObject, new_position.CPlusObject);
end;

procedure BWindow.WorkspacesChanged(old_ws : Cardinal; new_ws : Cardinal);
begin
  BWindow_WorkspacesChanged(CPlusObject, old_ws, new_ws);
end;

procedure BWindow.WorkspaceActivated(ws : integer; state : boolean);
begin
  BWindow_WorkspaceActivated(CPlusObject, ws, state);
end;

procedure BWindow.FrameResized(new_width : double; new_height : double);
begin
  BWindow_FrameResized(CPlusObject, new_width, new_height);
end;

procedure BWindow.Minimize(aMinimize : boolean);
begin
  BWindow_Minimize(CPlusObject, aMinimize);
end;

procedure BWindow.Zoom(rec_position : BPoint; rec_width : double; rec_height : double);
begin
  BWindow_Zoom(CPlusObject, rec_position.CPlusObject, rec_width, rec_height);
end;

procedure BWindow.Zoom;
begin
  BWindow_Zoom(CPlusObject);
end;

procedure BWindow.SetZoomLimits(max_h : double; max_v : double);
begin
  BWindow_SetZoomLimits(CPlusObject, max_h, max_v);
end;

procedure BWindow.ScreenChanged(screen_size : BRect; depth : Color_Space);
begin
  BWindow_ScreenChanged(CPlusObject, screen_size.CPlusObject, depth);
end;

procedure BWindow.SetPulseRate(rate : Bigtime_t);
begin
  BWindow_SetPulseRate(CPlusObject, rate);
end;

function BWindow.PulseRate : Bigtime_t;
begin
  Result := BWindow_PulseRate(CPlusObject);
end;

procedure BWindow.AddShortcut(key : Cardinal; modifiers : Cardinal; msg : BMessage);
begin
  BWindow_AddShortcut(CPlusObject, key, modifiers, msg.CPlusObject);
end;

procedure BWindow.AddShortcut(key : Cardinal; modifiers : Cardinal; msg : BMessage; target : BHandler);
begin
  BWindow_AddShortcut(CPlusObject, key, modifiers, msg.CPlusObject, target.CPlusObject);
end;

procedure BWindow.RemoveShortcut(key : Cardinal; modifiers : Cardinal);
begin
  BWindow_RemoveShortcut(CPlusObject, key, modifiers);
end;

procedure BWindow.SetDefaultButton(button : BButton);
begin
  BWindow_SetDefaultButton(CPlusObject, button.CPlusObject);
end;

function BWindow.DefaultButton : BButton;
begin
  Result := BWindow_DefaultButton(CPlusObject);
end;

procedure BWindow.MenusBeginning;
begin
  BWindow_MenusBeginning(CPlusObject);
end;

procedure BWindow.MenusEnded;
begin
  BWindow_MenusEnded(CPlusObject);
end;

function BWindow.NeedsUpdate : boolean;
begin
//  Result := BWindow_NeedsUpdate(CPlusObject);
  Result := True;
end;

procedure BWindow.UpdateIfNeeded;
begin
  BWindow_UpdateIfNeeded(CPlusObject);
end;

function BWindow.FindView(view_name : PChar) : BView;
begin
  Result := BWindow_FindView(CPlusObject, view_name);
end;

function BWindow.FindView(aPoint : BPoint) : BView;
begin
  Result := BWindow_FindView(CPlusObject, aPoint.CPlusObject);
end;

function BWindow.CurrentFocus : BView;
begin
  Result := BWindow_CurrentFocus(CPlusObject);
end;

procedure BWindow.Activate(aValue : boolean);
begin
  BWindow_Activate(CPlusObject, aValue);
end;

procedure BWindow.WindowActivated(state : boolean);
begin
//  BWindow_WindowActivated(CPlusObject, state);
end;

//procedure TWindow.ConvertToScreen(pt : TPoint);
//begin
//  BWindow_ConvertToScreen(CPlusObject, pt.CPlusObject);
//end;

function BWindow.ConvertToScreen(pt : BPoint) : BPoint;
begin
  Result := BWindow_ConvertToScreen(CPlusObject, pt.CPlusObject);
end;

//procedure TWindow.ConvertFromScreen(pt : TPoint);
//begin
//  BWindow_ConvertFromScreen(CPlusObject, pt.CPlusObject);
//end;

function BWindow.ConvertFromScreen(pt : BPoint) : BPoint;
begin
  Result := BWindow_ConvertFromScreen(CPlusObject, pt.CPlusObject);
end;

//procedure TWindow.ConvertToScreen(rect : TRect);
//begin
//  BWindow_ConvertToScreen(CPlusObject, rect.CPlusObject);
//end;

//function TWindow.ConvertToScreen(rect : TRect) : TRect;
//begin
//  Result := BWindow_ConvertToScreen(CPlusObject, rect.CPlusObject);
//end;

//procedure TWindow.ConvertFromScreen(rect : TRect);
//begin
//  BWindow_ConvertFromScreen(CPlusObject, rect.CPlusObject);
//end;

//function TWindow.ConvertFromScreen(rect : TRect) : TRect;
//begin
//  Result := BWindow_ConvertFromScreen(CPlusObject, rect.CPlusObject);
//end;

procedure BWindow.MoveBy(dx : double; dy : double);
begin
  BWindow_MoveBy(CPlusObject, dx, dy);
end;

procedure BWindow.MoveTo(aPoint : BPoint);
begin
  BWindow_MoveTo(CPlusObject, aPoint.CPlusObject);
end;

procedure BWindow.MoveTo(x : double; y : double);
begin
  BWindow_MoveTo(CPlusObject, x, y);
end;

procedure BWindow.ResizeBy(dx : double; dy : double);
begin
  BWindow_ResizeBy(CPlusObject, dx, dy);
end;

procedure BWindow.ResizeTo(width : double; height : double);
begin
  BWindow_ResizeTo(CPlusObject, width, height);
end;

//procedure TWindow.Show;
//begin
//  BWindow_Show(CPlusObject);
//end;

//procedure TWindow.Hide;
//begin
//  BWindow_Hide(CPlusObject);
//end;

function BWindow.IsHidden : boolean;
begin
  Result := BWindow_IsHidden(CPlusObject);
end;

function BWindow.IsMinimized : boolean;
begin
  Result := BWindow_IsMinimized(CPlusObject);
end;

procedure BWindow.Flush;
begin
  BWindow_Flush(CPlusObject);
end;

procedure BWindow.Sync;
begin
  BWindow_Sync(CPlusObject);
end;

function BWindow.SendBehind(window : BWindow) : Status_t;
begin
  Result := BWindow_SendBehind(CPlusObject, window);
end;

procedure BWindow.DisableUpdates;
begin
  BWindow_DisableUpdates(CPlusObject);
end;

procedure BWindow.EnableUpdates;
begin
  BWindow_EnableUpdates(CPlusObject);
end;

procedure BWindow.BeginViewTransaction;
begin
  BWindow_BeginViewTransaction(CPlusObject);
end;

procedure BWindow.EndViewTransaction;
begin
  BWindow_EndViewTransaction(CPlusObject);
end;

function BWindow.Bounds : BRect;
begin
  Result := BRect.Wrap(BWindow_Bounds(CPlusObject));
end;

function BWindow.GetFrame : BRect;
begin
  Result := BWindow_Frame(CPlusObject);
end;

function BWindow.GetTitle : PChar;
begin
  Result := BWindow_Title(CPlusObject);
end;

procedure BWindow.SetTitle(title : PChar);
begin
  BWindow_SetTitle(CPlusObject, title);
end;

function BWindow.IsFront : boolean;
begin
  Result := BWindow_IsFront(CPlusObject);
end;

function BWindow.IsActive : boolean;
begin
  Result := BWindow_IsActive(CPlusObject);
end;

//procedure TWindow.SetKeyMenuBar(bar : TMenuBar);
//begin
//  BWindow_SetKeyMenuBar(CPlusObject, bar.CPlusObject);
//end;

//function TWindow.KeyMenuBar : TMenuBar;
//begin
//  Result := BWindow_KeyMenuBar(CPlusObject);
//end;

procedure BWindow.SetSizeLimits(min_h : double; max_h : double; min_v : double; max_v : double);
begin
  BWindow_SetSizeLimits(CPlusObject, min_h, max_h, min_v, max_v);
end;

procedure BWindow.GetSizeLimits(min_h : double; max_h : double; min_v : double; max_v : double);
begin
  BWindow_GetSizeLimits(CPlusObject, min_h, max_h, min_v, max_v);
end;

function BWindow.Workspaces : Cardinal;
begin
  Result := BWindow_Workspaces(CPlusObject);
end;

procedure BWindow.SetWorkspaces(aWorkspace : Cardinal);
begin
  BWindow_SetWorkspaces(CPlusObject, aWorkspace);
end;

function BWindow.LastMouseMovedView : BView;
begin
  Result := BWindow_LastMouseMovedView(CPlusObject);
end;

function BWindow.ResolveSpecifier(msg : BMessage; index : integer; specifier : BMessage; form : integer; aProperty : PChar) : BHandler;
begin
  Result := BWindow_ResolveSpecifier(CPlusObject, msg.CPlusObject, index, specifier.CPlusObject, form, aProperty);
end;

function BWindow.GetSupportedSuites(data : BMessage) : Status_t;
begin
  Result := BWindow_GetSupportedSuites(CPlusObject, data.CPlusObject);
end;

function BWindow.AddToSubset(window : BWindow) : Status_t;
begin
  Result := BWindow_AddToSubset(CPlusObject, window.CPlusObject);
end;

function BWindow.RemoveFromSubset(window : BWindow) : Status_t;
begin
  Result := BWindow_RemoveFromSubset(CPlusObject, window.CPlusObject);
end;

function BWindow.Perform(d : Perform_code; arg : Pointer) : Status_t;
begin
  Result := BWindow_Perform(CPlusObject, d, arg);
end;

function BWindow.SetType(aType : Cardinal) : Status_t;
begin
  Result := BWindow_SetType(CPlusObject, aType);
end;

function BWindow.GetType : Cardinal;
begin
  Result := BWindow_Type(CPlusObject);
end;

function BWindow.SetLook(look : PCardinal) : Status_t;
begin
  Result := BWindow_SetLook(CPlusObject, look);
end;

function BWindow.GetLook : PCardinal;
begin
  Result := BWindow_Look(CPlusObject);
end;

function BWindow.SetFeel(feel : Cardinal) : Status_t;
begin
  Result := BWindow_SetFeel(CPlusObject, feel);
end;

function BWindow.GetFeel : Cardinal;
begin
  Result := BWindow_Feel(CPlusObject);
end;

function BWindow.SetFlags(aFlags : Cardinal) : Status_t;
begin
  Result := BWindow_SetFlags(CPlusObject, aFlags);
end;

function BWindow.GetFlags : Cardinal;
begin
  Result := BWindow_Flags(CPlusObject);
end;

function BWindow.IsModal : boolean;
begin
  Result := BWindow_IsModal(CPlusObject);
end;

function BWindow.IsFloating : boolean;
begin
  Result := BWindow_IsFloating(CPlusObject);
end;

function BWindow.SetWindowAlignment(mode : Cardinal; h : integer; hOffset : integer; width : integer; widthOffset : integer; v : integer; vOffset : integer; height : integer; heightOffset : integer) : Status_t;
begin
  Result := BWindow_SetWindowAlignment(CPlusObject, mode, h, hOffset, width, widthOffset, v, vOffset, height, heightOffset);
end;

function BWindow.GetWindowAlignment(mode : PCardinal; var h : integer; var hOffset : integer; var width : integer; var widthOffset : integer; var v : integer; var vOffset : integer; var height : integer; var heightOffset : integer) : Status_t;
begin
  Result := BWindow_GetWindowAlignment(CPlusObject, mode, h, hOffset, width, widthOffset, v, vOffset, height, heightOffset);
end;

function BWindow.Run : Thread_id;
begin
  Result := BWindow_Run(CPlusObject);
end;

//procedure TWindow.BLooper;
//begin
//  BWindow_BLooper inherited(CPlusObject);
//end;

//procedure TWindow._ReservedWindow1;
//begin
//  BWindow__ReservedWindow1(CPlusObject);
//end;
//
//procedure TWindow._ReservedWindow2;
//begin
//  BWindow__ReservedWindow2(CPlusObject);
//end;
//
//procedure TWindow._ReservedWindow3;
//begin
//  BWindow__ReservedWindow3(CPlusObject);
//end;
//
//procedure TWindow._ReservedWindow4;
//begin
//  BWindow__ReservedWindow4(CPlusObject);
//end;
//
//procedure TWindow._ReservedWindow5;
//begin
//  BWindow__ReservedWindow5(CPlusObject);
//end;
//
//procedure TWindow._ReservedWindow6;
//begin
//  BWindow__ReservedWindow6(CPlusObject);
//end;
//
//procedure TWindow._ReservedWindow7;
//begin
//  BWindow__ReservedWindow7(CPlusObject);
//end;
//
//procedure TWindow._ReservedWindow8;
//begin
//  BWindow__ReservedWindow8(CPlusObject);
//end;
//
//constructor TWindow.Create;
//begin
//  CPlusObject := BWindow_Create(Self);
//end;
//
//constructor TWindow.Create( : TWindow);
//begin
//  CPlusObject := BWindow_Create(Self, .CPlusObject);
//end;
//
//function TWindow.operator=( : TWindow) : TWindow;
//begin
//  Result := BWindow_operator=(CPlusObject, .CPlusObject);
//end;
//
//constructor TWindow.Create(frame : TRect; depth : TColor_Space; bitmapFlags : Cardinal; rowBytes : integer);
//begin
//  CPlusObject := BWindow_Create(Self, frame.CPlusObject, depth, bitmapFlags, rowBytes);
//end;
//
//procedure TWindow.InitData(frame : TRect; title : PChar; look : PCadinal; feel : Cardinal; flags : Cardinal; workspace : Cardinal);
//begin
//  BWindow_InitData(CPlusObject, frame.CPlusObject, title, look, feel, flags, workspace);
//end;
//
//function TWindow.ArchiveChildren(data : TMessage; deep : boolean) : TStatus_t;
//begin
//  Result := BWindow_ArchiveChildren(CPlusObject, data.CPlusObject, deep);
//end;
//
//function TWindow.UnarchiveChildren(data : TMessage) : TStatus_t;
//begin
//  Result := BWindow_UnarchiveChildren(CPlusObject, data.CPlusObject);
//end;
//
//procedure TWindow.BitmapClose;
//begin
//  BWindow_BitmapClose(CPlusObject);
//end;
//
//procedure TWindow.task_looper;
//begin
//  BWindow_task_looper(CPlusObject);
//end;
//
//procedure TWindow.start_drag(msg : TMessage; token : integer; offset : TPoint; track_rect : TRect; reply_to : THandler);
//begin
//  BWindow_start_drag(CPlusObject, msg.CPlusObject, token, offset.CPlusObject, track_rect.CPlusObject, reply_to.CPlusObject);
//end;
//
//procedure TWindow.start_drag(msg : TMessage; token : integer; offset : TPoint; bitmap_token : integer; dragMode : TDrawing_Mode; reply_to : THandler);
//begin
//  BWindow_start_drag(CPlusObject, msg.CPlusObject, token, offset.CPlusObject, bitmap_token, dragMode, reply_to.CPlusObject);
//end;
//
//procedure TWindow.view_builder(a_view : TView);
//begin
//  BWindow_view_builder(CPlusObject, a_view.CPlusObject);
//end;
//
//procedure TWindow.attach_builder(a_view : TView);
//begin
//  BWindow_attach_builder(CPlusObject, a_view.CPlusObject);
//end;
//
//procedure TWindow.detach_builder(a_view : TView);
//begin
//  BWindow_detach_builder(CPlusObject, a_view.CPlusObject);
//end;
//
//function TWindow.get_server_token : integer;
//begin
//  Result := BWindow_get_server_token(CPlusObject);
//end;
//
//function TWindow.extract_drop(an_event : TMessage; target : THandler) : TMessage;
//begin
//  Result := BWindow_extract_drop(CPlusObject, an_event.CPlusObject, target.CPlusObject);
//end;
//
//procedure TWindow.movesize(opcode : Cardinal; h : double; v : double);
//begin
//  BWindow_movesize(CPlusObject, opcode, h, v);
//end;
//
//function TWindow.ReadMessageFromPort(tout : TBigtime_t) : TMessage;
//begin
//  Result := BWindow_ReadMessageFromPort(CPlusObject, tout);
//end;
//
//function TWindow.MessagesWaiting : integer;
//begin
//  Result := BWindow_MessagesWaiting(CPlusObject);
//end;
//
//procedure TWindow.handle_activate(an_event : TMessage);
//begin
//  BWindow_handle_activate(CPlusObject, an_event.CPlusObject);
//end;
//
//procedure TWindow.do_view_frame(an_event : TMessage);
//begin
//  BWindow_do_view_frame(CPlusObject, an_event.CPlusObject);
//end;
//
//procedure TWindow.do_value_change(an_event : TMessage; handler : THandler);
//begin
//  BWindow_do_value_change(CPlusObject, an_event.CPlusObject, handler.CPlusObject);
//end;
//
//procedure TWindow.do_mouse_down(an_event : TMessage; target : TView);
//begin
//  BWindow_do_mouse_down(CPlusObject, an_event.CPlusObject, target.CPlusObject);
//end;
//
//procedure TWindow.do_mouse_moved(an_event : TMessage; target : TView);
//begin
//  BWindow_do_mouse_moved(CPlusObject, an_event.CPlusObject, target.CPlusObject);
//end;
//
//procedure TWindow.do_key_down(an_event : TMessage; handler : THandler);
//begin
//  BWindow_do_key_down(CPlusObject, an_event.CPlusObject, handler.CPlusObject);
//end;
//
//procedure TWindow.do_key_up(an_event : TMessage; handler : THandler);
//begin
//  BWindow_do_key_up(CPlusObject, an_event.CPlusObject, handler.CPlusObject);
//end;
//
//procedure TWindow.do_menu_event(an_event : TMessage);
//begin
//  BWindow_do_menu_event(CPlusObject, an_event.CPlusObject);
//end;
//
//procedure TWindow.do_draw_views;
//begin
//  BWindow_do_draw_views(CPlusObject);
//end;
//
//function TWindow.ConvertToMessage(raw : Pointer; code : integer) : TMessage;
//begin
//  Result := BWindow_ConvertToMessage(CPlusObject, raw, code);
//end;
//
//function TWindow.allocShortcut(key : Cardinal; modifiers : Cardinal) : TCmd_Key;
//begin
//  Result := BWindow_allocShortcut(CPlusObject, key, modifiers);
//end;
//
//function TWindow.FindShortcut(key : Cardinal; modifiers : Cardinal) : TCmd_Key;
//begin
//  Result := BWindow_FindShortcut(CPlusObject, key, modifiers);
//end;
//
//procedure TWindow.AddShortcut(key : Cardinal; modifiers : Cardinal; item : TMenuItem);
//begin
//  BWindow_AddShortcut(CPlusObject, key, modifiers, item.CPlusObject);
//end;
//
//procedure TWindow.post_message(message : TMessage);
//begin
//  BWindow_post_message(CPlusObject, message.CPlusObject);
//end;
//
//procedure TWindow.SetLocalTitle(new_title : PChar);
//begin
//  BWindow_SetLocalTitle(CPlusObject, new_title);
//end;
//
//procedure TWindow.enable_pulsing(enable : boolean);
//begin
//  BWindow_enable_pulsing(CPlusObject, enable);
//end;
//
//function TWindow.determine_target(msg : TMessage; target : THandler; pref : boolean) : THandler;
//begin
//  Result := BWindow_determine_target(CPlusObject, msg.CPlusObject, target.CPlusObject, pref);
//end;
//
//procedure TWindow.kb_navigate;
//begin
//  BWindow_kb_navigate(CPlusObject);
//end;
//
//procedure TWindow.navigate_to_next(direction : integer; group : boolean);
//begin
//  BWindow_navigate_to_next(CPlusObject, direction, group);
//end;
//
//procedure TWindow.set_focus(focus : TView; notify_input_server : boolean);
//begin
//  BWindow_set_focus(CPlusObject, focus.CPlusObject, notify_input_server);
//end;
//
//function TWindow.InUpdate : boolean;
//begin
//  Result := BWindow_InUpdate(CPlusObject);
//end;
//
//procedure TWindow.DequeueAll;
//begin
//  BWindow_DequeueAll(CPlusObject);
//end;
//
//function TWindow.find_token_and_handler(msg : TMessage; token : ^integer; handler : THandler) : boolean;
//begin
//  Result := BWindow_find_token_and_handler(CPlusObject, msg.CPlusObject, token, handler.CPlusObject);
//end;
//
//function TWindow.compose_type(look : PCadinal; feel : Cardinal) : Cardinal;
//begin
//  Result := BWindow_compose_type(CPlusObject, look, feel);
//end;
//
//procedure TWindow.decompose_type(type : Cardinal; look : PCardinal; feel : PCardinal);
//begin
//  BWindow_decompose_type(CPlusObject, type, look, feel);
//end;
//
//procedure TWindow.SetIsFilePanel(panel : boolean);
//begin
//  BWindow_SetIsFilePanel(CPlusObject, panel);
//end;
//
//function TWindow.IsFilePanel : boolean;
//begin
//  Result := BWindow_IsFilePanel(CPlusObject);
//end;
//
//procedure TWindow.AddFloater(a_floating_window : TWindow);
//begin
//  BWindow_AddFloater(CPlusObject, a_floating_window.CPlusObject);
//end;
//
//procedure TWindow.RemoveFloater(a_floating_window : TWindow);
//begin
//  BWindow_RemoveFloater(CPlusObject, a_floating_window.CPlusObject);
//end;
//
//function TWindow.WindowType : Cardinal;
//begin
//  Result := BWindow_WindowType(CPlusObject);
//end;
//
//procedure TWindow.char *fTitle;
//begin
//  BWindow_char *fTitle(CPlusObject);
//end;
//
//procedure TWindow.int32 server_token;
//begin
//  BWindow_int32 server_token(CPlusObject);
//end;
//
//procedure TWindow.char fInUpdate;
//begin
//  BWindow_char fInUpdate(CPlusObject);
//end;
//
//procedure TWindow.char f_active;
//begin
//  BWindow_char f_active(CPlusObject);
//end;
//
//procedure TWindow.short fShowLevel;
//begin
//  BWindow_short fShowLevel(CPlusObject);
//end;
//
//procedure TWindow.uint32 fFlags;
//begin
//  BWindow_uint32 fFlags(CPlusObject);
//end;
//
//procedure TWindow.port_id send_port;
//begin
//  BWindow_port_id send_port(CPlusObject);
//end;
//
//procedure TWindow.port_id receive_port;
//begin
//  BWindow_port_id receive_port(CPlusObject);
//end;
//
//procedure TWindow.BView *top_view;
//begin
//  BWindow_BView *top_view(CPlusObject);
//end;
//
//procedure TWindow.BView *fFocus;
//begin
//  BWindow_BView *fFocus(CPlusObject);
//end;
//
//procedure TWindow.BView *fLastMouseMovedView;
//begin
//  BWindow_BView *fLastMouseMovedView(CPlusObject);
//end;
//
//procedure TWindow._BSession_ *a_session;
//begin
//  BWindow__BSession_ *a_session(CPlusObject);
//end;
//
//procedure TWindow.BMenuBar *fKeyMenuBar;
//begin
//  BWindow_BMenuBar *fKeyMenuBar(CPlusObject);
//end;
//
//procedure TWindow.BButton *fDefaultButton;
//begin
//  BWindow_BButton *fDefaultButton(CPlusObject);
//end;
//
//procedure TWindow.BList accelList;
//begin
//  BWindow_BList accelList(CPlusObject);
//end;
//
//procedure TWindow.int32 top_view_token;
//begin
//  BWindow_int32 top_view_token(CPlusObject);
//end;
//
//procedure TWindow.bool pulse_enabled;
//begin
//  BWindow_bool pulse_enabled(CPlusObject);
//end;
//
//procedure TWindow.bool fViewsNeedPulse;
//begin
//  BWindow_bool fViewsNeedPulse(CPlusObject);
//end;
//
//procedure TWindow.bool fIsFilePanel;
//begin
//  BWindow_bool fIsFilePanel(CPlusObject);
//end;
//
//procedure TWindow.bool fUnused1;
//begin
//  BWindow_bool fUnused1(CPlusObject);
//end;
//
//procedure TWindow.bigtime_t pulse_rate;
//begin
//  BWindow_bigtime_t pulse_rate(CPlusObject);
//end;
//
//procedure TWindow.bool fWaitingForMenu;
//begin
//  BWindow_bool fWaitingForMenu(CPlusObject);
//end;
//
//procedure TWindow.bool fOffscreen;
//begin
//  BWindow_bool fOffscreen(CPlusObject);
//end;
//
//procedure TWindow.sem_id fMenuSem;
//begin
//  BWindow_sem_id fMenuSem(CPlusObject);
//end;
//
//procedure TWindow.float fMaxZoomH;
//begin
//  BWindow_float fMaxZoomH(CPlusObject);
//end;
//
//procedure TWindow.float fMaxZoomV;
//begin
//  BWindow_float fMaxZoomV(CPlusObject);
//end;
//
//procedure TWindow.float fMinWindH;
//begin
//  BWindow_float fMinWindH(CPlusObject);
//end;
//
//procedure TWindow.float fMinWindV;
//begin
//  BWindow_float fMinWindV(CPlusObject);
//end;
//
//procedure TWindow.float fMaxWindH;
//begin
//  BWindow_float fMaxWindH(CPlusObject);
//end;
//
//procedure TWindow.float fMaxWindV;
//begin
//  BWindow_float fMaxWindV(CPlusObject);
//end;
//
//procedure TWindow.BRect fFrame;
//begin
//  BWindow_BRect fFrame(CPlusObject);
//end;
//
//procedure TWindow.window_look fLook;
//begin
//  BWindow_window_look fLook(CPlusObject);
//end;
//
//procedure TWindow._view_attr_ *fCurDrawViewState;
//begin
//  BWindow__view_attr_ *fCurDrawViewState(CPlusObject);
//end;
//
//procedure TWindow.window_feel fFeel;
//begin
//  BWindow_window_feel fFeel(CPlusObject);
//end;
//
//procedure TWindow.int32 fLastViewToken;
//begin
//  BWindow_int32 fLastViewToken(CPlusObject);
//end;
//
//procedure TWindow._CEventPort_ *fEventPort;
//begin
//  BWindow__CEventPort_ *fEventPort(CPlusObject);
//end;
//
//procedure TWindow.BMessageRunner *fPulseRunner;
//begin
//  BWindow_BMessageRunner *fPulseRunner(CPlusObject);
//end;
//
//procedure TWindow.BRect fCurrentFrame;
//begin
//  BWindow_BRect fCurrentFrame(CPlusObject);
//end;
//
//{procedure TWindow.uint32 _reserved[2];
//begin
//  BWindow_uint32 _reserved[2](CPlusObject);
//end;
//
//procedure TWindow.uint32 _more_reserved[4];
//begin
//  BWindow_uint32 _more_reserved[4](CPlusObject);
//end;}


initialization

end.
