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
unit textview;

interface

uses
     beobj, view, message, archivable, SupportDefs, rect, list,
  handler, messenger,interfacedefs,font,graphicdefs,clipboard;
type
  text_run = Record
    offset : LongInt;
    font : BFont; 
    color : RGB_color;
end;

type
  text_run_array = Record
    count : LongInt;
     runs : Array[1..1] of text_run ;
  end;
  
type
undo_state =(undo_state_nil,
	B_UNDO_UNAVAILABLE,
	B_UNDO_TYPING,
	B_UNDO_CUT,
	B_UNDO_PASTE,
	B_UNDO_CLEAR,
	B_UNDO_DROP);
  
type
   BTextView = class(BView)
  private
  public
    constructor Create(aframe : BRect; name : pchar;atexBRect: BRect ; resizeMask, sflags : cardinal); virtual;
//    constructor Create(bounds : BRect; name : pchar; texte : pchar; resizeflags, sflags : cardinal); virtual;
    constructor Create(data : BMessage);virtual;
    destructor Destroy;override;
    function Instantiate(data : BMessage) : BArchivable;
    function Archive(data : BMessage; deep : boolean) : Status_t;
    procedure AttachedToWindow;override;
    procedure DetachedFromWindow;override;
    procedure Draw(inRect : BRect);override;
    procedure MouseDown(where : BPoint);override;
    procedure MouseUp(where : BPoint);override;
    procedure MouseMoved(where : BPoint; code : Cardinal; message : BMessage);override;
    procedure WindowActivated(state : boolean);override;
    procedure KeyDown(bytes : PChar; numBytes : integer);override;
    procedure Pulse;override;
    procedure FrameResized(width : double; height : double);override;
    procedure MakeFocus(focusState : boolean);
    procedure MessageReceived(message : BMessage);override;
    function ResolveSpecifier(message : BMessage; index : integer; specifier : BMessage; form : integer; properti : PChar) : BHandler;
    function GetSupportedSuites(data : BMessage) : Status_t;
    function Perform(d : Perform_code; arg : Pointer) : Status_t;
    procedure SetText(inText : PChar; var inRuns :  text_run_array);
    procedure SetText(inText : PChar; inLength : integer; var inRuns :  text_run_array);
//    procedure SetText(inFile : TFile; startOffset : integer; inLength : integer; var inRuns :  text_run_array);
    procedure Insert(inText : PChar; var inRuns :  text_run_array);
    procedure Insert(inText : PChar; inLength : integer; var inRuns :  text_run_array);
    procedure Insert(startOffset : integer; inText : PChar; inLength : integer;var  inRuns :  text_run_array);
    procedure Delete;
    procedure Delete(startOffset : integer; endOffset : integer);
    function aText : PChar;
    function TextLength : integer;
    procedure GetText(offset : integer; length : integer; buffer : PChar);
    function ByteAt(offset : integer) :  PChar;
    function CountLines : integer;
    function CurrentLine : integer;
    procedure GoToLine(lineNum : integer);
    procedure Cut(clipboard : BClipboard);
    procedure Copy(clipboard : BClipboard);
    procedure Paste(clipboard : BClipboard);
    procedure Clear;
    function AcceptsPaste(clipboard : BClipboard) : boolean;
//   function AcceptsDrop(inMessage : BMessage) : boolean;
    procedure Select(startOffset : integer; endOffset : integer);
    procedure SelectAll;
//    procedure GetSelection(outStart : integer; outEnd : integer);
    procedure SetFontAndColor(inFont :  BFont; inMode : Cardinal; var inColor :  RGB_color);
//    procedure SeBFontAndColor(inFont :  BFont; inMode : Cardinal);
//    procedure SeBFontAndColor(inFont :  BFont);
    procedure SeTFontAndColor(startOffset : Cardinal; endOffset : Cardinal; inFont :  BFont; inMode : Cardinal; var inColor :  RGB_color);
    procedure GeTFontAndColor(inOffset : integer; ouBFont :  BFont; outColor : RGB_color);
    procedure GeTFontAndColor(ouBFont :  BFont; outMode :  integer; outColor : RGB_color; outEqColor : boolean);
{   procedure SetRunArray(startOffset : integer; endOffset : integer; inRuns :  Ttext_tun_array);
    function RunArray(startOffset : integer; endOffset : integer; outSize : ^integer) : text_run_array;
}    function LineAt(offset : integer) : integer;
    function LineAt(point : BPoint) : integer;
    function PointAt(inOffset : integer; outHeight : double) : BPoint;
    function OffsetAt(point : BPoint) : integer;
    function OffsetAt(line : integer) : integer;
    procedure FindWord(inOffset : integer; outFromOffset : integer; outToOffset : integer);
    function CanEndLine(offset : integer) : boolean;
    function LineWidth(lineNum : integer) : double;
    function LineHeight(lineNum : integer) : double;
    function TextHeight(startLine : integer; endLine : integer) : double;
//    procedure GetTextRegion(startOffset : integer; endOffset : integer; outRegion :  TRegion);
    procedure ScrollToOffset(inOffset : integer);
    procedure ScrollToSelection;
    procedure Highlight(startOffset : integer; endOffset : integer);
    procedure SetTexBRect(rect : BRect);
    function TexBRect : BRect;
    procedure SetStylable(stylable : boolean);
    function IsStylable : boolean;
    procedure SetTabWidth(width : double);
    function TabWidth : double;
    procedure MakeSelectable(selectable : boolean);
    function IsSelectable : boolean;
    procedure MakeEditable(editable : boolean);
    function IsEditable : boolean;
    procedure SetWordWrap(awrap : boolean);
    function DoesWordWrap : boolean;
    procedure SetMaxBytes(max : integer);
    function MaxBytes : integer;
    procedure DisallowChar(aChar : Cardinal);
    procedure AllowChar(aChar : Cardinal);
    procedure Sealignment(flag : alignment);
    function GetAlignment : alignment;
    procedure SetAutoindent(state : boolean);
    function DoesAutoindent : boolean;
{    procedure SetColorSpace(colors : TColor_Space);
    function ColorSpace : TColor_Space;
}   procedure MakeResizable(resize : boolean; resizeView : BView);
    function IsResizable : boolean;
    procedure SetDoesUndo(undo : boolean);
    function DoesUndo : boolean;
    procedure HideTyping(enabled : boolean);
    function IsTypingHidden : boolean;
    procedure ResizeToPreferred;override;
    procedure GetPreferredSize(width : double; height : double);virtual;
    procedure AllAttached;override;
    procedure AllDetached;override;
{    function FlattenRunArray(inArray :  Ttext_tun_array; outSize : ^integer) : Pointer;
    function UnflattenRunArray(data : Pointer; outSize : ^integer) : text_run_array;
    procedure InsertText(inText : PChar; inLength : integer; inOffset : integer; inRuns :  Ttext_tun_array);
}    
  //  procedure Undo(clipboard : TClipboard);
//    procedure GetDragParameters(drag : BMessage; bitmap : TBitmap; point : BPoint; handler : BHandler);
//    procedure InitObject(atexBRect : BRect; initialFont :  BFont; initialColor :  RGB_color);
  end;

function BTextView_Create(AObject : TBeObject;frame : TCPlusObject; name : pchar; atexBRect: TCPlusObject ; resizeMask, flags : cardinal): TCPlusObject; cdecl; external BePascalLibName name 'BTextView_Create';

function BTextView_Create(AObject : TBeObject; data : TCPlusObject): TCPlusObject; cdecl; external BePascalLibName name 'BTextView_Create_1';
procedure BTextView_Free(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BTextView_FREE';
function BTextView_Instantiate(AObject : TCPlusObject; data : TCPlusObject) : BArchivable; cdecl; external BePascalLibName name 'BTextView_Instantiate';
function BTextView_Archive(AObject : TCPlusObject; data : TCPlusObject; deep : boolean) : Status_t; cdecl; external BePascalLibName name 'BTextView_Archive';
procedure BTextView_AttachedToWindow(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BTextView_AttachedToWindow';
procedure BTextView_DetachedFromWindow(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BTextView_DetachedFromWindow';
procedure BTextView_Draw(AObject : TCPlusObject; inRect : TCPlusObject); cdecl; external BePascalLibName name 'BTextView_Draw';
procedure BTextView_MouseDown(AObject : TCPlusObject; where : TCPlusObject); cdecl; external BePascalLibName name 'BTextView_MouseDown';
procedure BTextView_MouseUp(AObject : TCPlusObject; where : TCPlusObject); cdecl; external BePascalLibName name 'BTextView_MouseUp';
procedure BTextView_MouseMoved(AObject : TCPlusObject; where : TCPlusObject; code : Cardinal; message : TCPlusObject); cdecl; external BePascalLibName name 'BTextView_MouseMoved';
procedure BTextView_WindowActivated(AObject : TCPlusObject; state : boolean); cdecl; external BePascalLibName name 'BTextView_WindowActivated';
procedure BTextView_KeyDown(AObject : TCPlusObject; bytes : PChar; numBytes : integer); cdecl; external BePascalLibName name 'BTextView_KeyDown';
procedure BTextView_Pulse(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BTextView_Pulse';
procedure BTextView_FrameResized(AObject : TCPlusObject; width : double; height : double); cdecl; external BePascalLibName name 'BTextView_FrameResized';
procedure BTextView_MakeFocus(AObject : TCPlusObject; focusState : boolean); cdecl; external BePascalLibName name 'BTextView_MakeFocus';
procedure BTextView_MessageReceived(AObject : TCPlusObject; message : TCPlusObject); cdecl; external BePascalLibName name 'BTextView_MessageReceived';
function BTextView_ResolveSpecifier(AObject : TCPlusObject; message : TCPlusObject; index : integer; specifier : TCPlusObject; form : integer; properti : PChar) : BHandler; cdecl; external BePascalLibName name 'BTextView_ResolveSpecifier';
function BTextView_GetSupportedSuites(AObject : TCPlusObject; data : TCPlusObject) : Status_t; cdecl; external BePascalLibName name 'BTextView_GetSupportedSuites';
function BTextView_Perform(AObject : TCPlusObject; d : Perform_code; arg : Pointer) : Status_t; cdecl; external BePascalLibName name 'BTextView_Perform';
procedure BTextView_SetText(AObject : TCPlusObject; inText : PChar;var inRuns :  text_run_array); cdecl; external BePascalLibName name 'BTextView_SetText';
procedure BTextView_SetText(AObject : TCPlusObject; inText : PChar; inLength : integer;var inRuns :  text_run_array); cdecl; external BePascalLibName name 'BTextView_SetText_1';
//procedure BTextView_SetText(AObject : TCPlusObject; inFile : TFile; startOffset : integer; inLength : integer; inRuns :  Ttext_tun_array); cdecl; external BePascalLibName name 'BTextView_SetText';
procedure BTextView_Insert(AObject : TCPlusObject; inText : PChar;var inRuns :  text_run_array); cdecl; external BePascalLibName name 'BTextView_Insert';
procedure BTextView_Insert(AObject : TCPlusObject; inText : PChar; inLength : integer;var inRuns :  text_run_array); cdecl; external BePascalLibName name 'BTextView_Insert_1';
procedure BTextView_Insert(AObject : TCPlusObject; startOffset : integer; inText : PChar; inLength : integer;var inRuns :  text_run_array); cdecl; external BePascalLibName name 'BTextView_Insert_2';
procedure BTextView_Delete(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BTextView_Delete';
procedure BTextView_Delete(AObject : TCPlusObject; startOffset : integer; endOffset : integer); cdecl; external BePascalLibName name 'BTextView_Delete_1';
function BTextView_Text(AObject : TCPlusObject) : PChar; cdecl; external BePascalLibName name 'BTextView_Text';
function BTextView_TextLength(AObject : TCPlusObject) : integer; cdecl; external BePascalLibName name 'BTextView_TextLength';
procedure BTextView_GetText(AObject : TCPlusObject; offset : integer; length : integer; buffer : PChar); cdecl; external BePascalLibName name 'BTextView_GetText';
function BTextView_ByteAt(AObject : TCPlusObject; offset : integer) :  PChar; cdecl; external BePascalLibName name 'BTextView_ByteAt';
function BTextView_CountLines(AObject : TCPlusObject) : integer; cdecl; external BePascalLibName name 'BTextView_CountLines';
function BTextView_CurrentLine(AObject : TCPlusObject) : integer; cdecl; external BePascalLibName name 'BTextView_CurrentLine';
procedure BTextView_GoToLine(AObject : TCPlusObject; lineNum : integer); cdecl; external BePascalLibName name 'BTextView_GoToLine';
procedure BTextView_Cut(AObject : TCPlusObject; clipboard : TCPlusObject); cdecl; external BePascalLibName name 'BTextView_Cut';
procedure BTextView_Copy(AObject : TCPlusObject; clipboard : TCPlusObject); cdecl; external BePascalLibName name 'BTextView_Copy';
procedure BTextView_Paste(AObject : TCPlusObject; clipboard : TCPlusObject); cdecl; external BePascalLibName name 'BTextView_Paste';
procedure BTextView_Clear(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BTextView_Clear';
function BTextView_AcceptsPaste(AObject : TCPlusObject; clipboard : TCPlusObject) : boolean; cdecl; external BePascalLibName name 'BTextView_AcceptsPaste';
function BTextView_AcceptsDrop(AObject : TCPlusObject; inMessage : TCPlusObject) : boolean; cdecl; external BePascalLibName name 'BTextView_AcceptsDrop';
procedure BTextView_Select(AObject : TCPlusObject; startOffset : integer; endOffset : integer); cdecl; external BePascalLibName name 'BTextView_Select';
procedure BTextView_SelectAll(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BTextView_SelectAll';
//procedure BTextView_GetSelection(AObject : TCPlusObject; outStart : ^integer; outEnd : ^integer); cdecl; external BePascalLibName name 'BTextView_GetSelection';
procedure BTextView_SeBFontAndColor(AObject : TCPlusObject; inFont :  TCPlusObject; inMode : Cardinal; var inColor :  RGB_color); cdecl; external BePascalLibName name 'BTextView_SetFontAndColor';
//procedure BTextView_SeBFontAndColor(AObject : TCPlusObject; inFont :  TCPlusObject; inMode : Cardinal); cdecl; external BePascalLibName name 'BTextView_SeBFontAndColor_1';
//procedure BTextView_SeBFontAndColor(AObject : TCPlusObject; inFont :  TCPlusObject); cdecl; external BePascalLibName name 'BTextView_SeBFontAndColor_1';
procedure BTextView_SeBFontAndColor(AObject : TCPlusObject; startOffset : cardinal; endOffset : cardinal; inFont :  TCPlusObject; inMode : Cardinal; var inColor :  RGB_color); cdecl; external BePascalLibName name 'BTextView_SetFontAndColor_1';
procedure BTextView_GeBFontAndColor(AObject : TCPlusObject; inOffset : cardinal; ouBFont :  TCPlusObject; outColor : RGB_color); cdecl; external BePascalLibName name 'BTextView_GetFontAndColor';
procedure BTextView_GeBFontAndColor(AObject : TCPlusObject; ouBFont :  TCPlusObject; outMode :  integer; outColor : RGB_color; outEqColor : boolean); cdecl; external BePascalLibName name 'BTextView_GetFontAndColor_1';
//procedure BTextView_SetRunArray(AObject : TCPlusObject; startOffset : integer; endOffset : integer; inRuns :  Ttext_tun_array); cdecl; external BePascalLibName name 'BTextView_SetRunArray';
//function BTextView_RunArray(AObject : TCPlusObject; startOffset : integer; endOffset : integer; outSize : ^integer) : text_run_array; cdecl; external BePascalLibName name 'BTextView_RunArray';
function BTextView_LineAt(AObject : TCPlusObject; offset : integer) : integer; cdecl; external BePascalLibName name 'BTextView_LineAt';
function BTextView_LineAt(AObject : TCPlusObject; point : TCPlusObject) : integer; cdecl; external BePascalLibName name 'BTextView_LineAt_1';
function BTextView_PointAt(AObject : TCPlusObject; inOffset : integer; outHeight : double) : BPoint; cdecl; external BePascalLibName name 'BTextView_PointAt';
function BTextView_OffsetAt(AObject : TCPlusObject; point : TCPlusObject) : integer; cdecl; external BePascalLibName name 'BTextView_OffsetAt';
function BTextView_OffsetAt(AObject : TCPlusObject; line : integer) : integer; cdecl; external BePascalLibName name 'BTextView_OffsetAt_1';
procedure BTextView_FindWord(AObject : TCPlusObject; inOffset : integer; outFromOffset : integer; outToOffset : integer); cdecl; external BePascalLibName name 'BTextView_FindWord';
function BTextView_CanEndLine(AObject : TCPlusObject; offset : integer) : boolean; cdecl; external BePascalLibName name 'BTextView_CanEndLine';
function BTextView_LineWidth(AObject : TCPlusObject; lineNum : integer) : double; cdecl; external BePascalLibName name 'BTextView_LineWidth';
function BTextView_LineHeight(AObject : TCPlusObject; lineNum : integer) : double; cdecl; external BePascalLibName name 'BTextView_LineHeight';
function BTextView_TextHeight(AObject : TCPlusObject; startLine : integer; endLine : integer) : double; cdecl; external BePascalLibName name 'BTextView_TextHeight';
//procedure BTextView_GetTextRegion(AObject : TCPlusObject; startOffset : integer; endOffset : integer; outRegion :  TRegion); cdecl; external BePascalLibName name 'BTextView_GetTextRegion';
procedure BTextView_ScrollToOffset(AObject : TCPlusObject; inOffset : integer); cdecl; external BePascalLibName name 'BTextView_ScrollToOffset';
procedure BTextView_ScrollToSelection(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BTextView_ScrollToSelection';
procedure BTextView_Highlight(AObject : TCPlusObject; startOffset : integer; endOffset : integer); cdecl; external BePascalLibName name 'BTextView_Highlight';
procedure BTextView_SetTexBRect(AObject : TCPlusObject; rect : TCPlusObject); cdecl; external BePascalLibName name 'BTextView_SetTextRect';
function BTextView_TexBRect(AObject : TCPlusObject) : BRect; cdecl; external BePascalLibName name 'BTextView_TextRect';
procedure BTextView_SetStylable(AObject : TCPlusObject; stylable : boolean); cdecl; external BePascalLibName name 'BTextView_SetStylable';
function BTextView_IsStylable(AObject : TCPlusObject) : boolean; cdecl; external BePascalLibName name 'BTextView_IsStylable';
procedure BTextView_SetTabWidth(AObject : TCPlusObject; width : double); cdecl; external BePascalLibName name 'BTextView_SetTabWidth';
function BTextView_TabWidth(AObject : TCPlusObject) : double; cdecl; external BePascalLibName name 'BTextView_TabWidth';
procedure BTextView_MakeSelectable(AObject : TCPlusObject; selectable : boolean); cdecl; external BePascalLibName name 'BTextView_MakeSelectable';
function BTextView_IsSelectable(AObject : TCPlusObject) : boolean; cdecl; external BePascalLibName name 'BTextView_IsSelectable';
procedure BTextView_MakeEditable(AObject : TCPlusObject; editable : boolean); cdecl; external BePascalLibName name 'BTextView_MakeEditable';
function BTextView_IsEditable(AObject : TCPlusObject) : boolean; cdecl; external BePascalLibName name 'BTextView_IsEditable';
procedure BTextView_SetWordWrap(AObject : TCPlusObject; wrap : boolean); cdecl; external BePascalLibName name 'BTextView_SetWordWrap';
function BTextView_DoesWordWrap(AObject : TCPlusObject) : boolean; cdecl; external BePascalLibName name 'BTextView_DoesWordWrap';
procedure BTextView_SetMaxBytes(AObject : TCPlusObject; max : integer); cdecl; external BePascalLibName name 'BTextView_SetMaxBytes';
function BTextView_MaxBytes(AObject : TCPlusObject) : integer; cdecl; external BePascalLibName name 'BTextView_MaxBytes';
procedure BTextView_DisallowChar(AObject : TCPlusObject; aChar : Cardinal); cdecl; external BePascalLibName name 'BTextView_DisallowChar';
procedure BTextView_AllowChar(AObject : TCPlusObject; aChar : Cardinal); cdecl; external BePascalLibName name 'BTextView_AllowChar';
procedure BTextView_Sealignment(AObject : TCPlusObject; flag : alignment); cdecl; external BePascalLibName name 'BTextView_SetAlignment';
function BTextView_Alignment(AObject : TCPlusObject) : alignment; cdecl; external BePascalLibName name 'BTextView_Alignment';
procedure BTextView_SetAutoindent(AObject : TCPlusObject; state : boolean); cdecl; external BePascalLibName name 'BTextView_SetAutoindent';
function BTextView_DoesAutoindent(AObject : TCPlusObject) : boolean; cdecl; external BePascalLibName name 'BTextView_DoesAutoindent';
//procedure BTextView_SetColorSpace(AObject : TCPlusObject; colors : TColor_Space); cdecl; external BePascalLibName name 'BTextView_SetColorSpace';
//function BTextView_ColorSpace(AObject : TCPlusObject) : TColor_Space; cdecl; external BePascalLibName name 'BTextView_ColorSpace';
procedure BTextView_MakeResizable(AObject : TCPlusObject; resize : boolean; resizeView : TCPlusObject); cdecl; external BePascalLibName name 'BTextView_MakeResizable';
function BTextView_IsResizable(AObject : TCPlusObject) : boolean; cdecl; external BePascalLibName name 'BTextView_IsResizable';
procedure BTextView_SetDoesUndo(AObject : TCPlusObject; undo : boolean); cdecl; external BePascalLibName name 'BTextView_SetDoesUndo';
function BTextView_DoesUndo(AObject : TCPlusObject) : boolean; cdecl; external BePascalLibName name 'BTextView_DoesUndo';
procedure BTextView_HideTyping(AObject : TCPlusObject; enabled : boolean); cdecl; external BePascalLibName name 'BTextView_HideTyping';
function BTextView_IsTypingHidden(AObject : TCPlusObject) : boolean; cdecl; external BePascalLibName name 'BTextView_IsTypingHidden';
procedure BTextView_ResizeToPreferred(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BTextView_ResizeToPreferred';
procedure BTextView_GetPreferredSize(AObject : TCPlusObject; width : double; height : double); cdecl; external BePascalLibName name 'BTextView_GetPreferredSize';
procedure BTextView_AllAttached(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BTextView_AllAttached';
procedure BTextView_AllDetached(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BTextView_AllDetached';
//function BTextView_FlattenRunArray(AObject : TCPlusObject; inArray :  Ttext_tun_array; outSize : ^integer) : Pointer; cdecl; external BePascalLibName name 'BTextView_FlattenRunArray';
//function BTextView_UnflattenRunArray(AObject : TCPlusObject; data : Pointer; outSize : ^integer) : text_run_array; cdecl; external BePascalLibName name 'BTextView_UnflattenRunArray';
//procedure BTextView_InsertText(AObject : TCPlusObject; inText : PChar; inLength : integer; inOffset : integer; inRuns :  Ttext_tun_array); cdecl; external BePascalLibName name 'BTextView_InsertText';
//procedure BTextView_Undo(AObject : TCPlusObject; clipboard : TClipboard); cdecl; external BePascalLibName name 'BTextView_Undo';
//function BTextView_UndoState(AObject : TCPlusObject; isRedo : boolean) :  Tunde_state; cdecl; external BePascalLibName name 'BTextView_UndoState';
//procedure BTextView_GetDragParameters(AObject : TCPlusObject; drag : BMessage; bitmap : TBitmap; point : BPoint; handler : BHandler); cdecl; external BePascalLibName name 'BTextView_GetDragParameters';
procedure BTextView__ReservedTextView3(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BTextView__ReservedTextView3';
procedure BTextView__ReservedTextView4(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BTextView__ReservedTextView4';
procedure BTextView__ReservedTextView5(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BTextView__ReservedTextView5';
procedure BTextView__ReservedTextView6(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BTextView__ReservedTextView6';
procedure BTextView__ReservedTextView7(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BTextView__ReservedTextView7';
procedure BTextView__ReservedTextView8(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BTextView__ReservedTextView8';
procedure BTextView__ReservedTextView9(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BTextView__ReservedTextView9';
procedure BTextView__ReservedTextView10(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BTextView__ReservedTextView10';
procedure BTextView__ReservedTextView11(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BTextView__ReservedTextView11';
procedure BTextView__ReservedTextView12(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BTextView__ReservedTextView12';
//procedure BTextView_InitObject(AObject : TCPlusObject; texBRect : BRect; initialFont :  BFont; initialColor :  RGB_color); cdecl; external BePascalLibName name 'BTextView_InitObject';
procedure BTextView_HandleBackspace(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BTextView_HandleBackspace';
procedure BTextView_HandleArrowKey(AObject : TCPlusObject; inArrowKey : Cardinal); cdecl; external BePascalLibName name 'BTextView_HandleArrowKey';
procedure BTextView_HandleDelete(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BTextView_HandleDelete';
procedure BTextView_HandlePageKey(AObject : TCPlusObject; inPageKey : Cardinal); cdecl; external BePascalLibName name 'BTextView_HandlePageKey';
procedure BTextView_HandleAlphaKey(AObject : TCPlusObject; bytes : PChar; numBytes : integer); cdecl; external BePascalLibName name 'BTextView_HandleAlphaKey';
procedure BTextView_Refresh(AObject : TCPlusObject; fromOffset : integer; toOffset : integer; erase : boolean; scroll : boolean); cdecl; external BePascalLibName name 'BTextView_Refresh';
//procedure BTextView_RecalLineBreaks(AObject : TCPlusObject; startLine : ^integer; endLine : ^integer); cdecl; external BePascalLibName name 'BTextView_RecalLineBreaks';
function BTextView_FindLineBreak(AObject : TCPlusObject; fromOffset : integer; outAscent : double; outDescent : double; ioWidth : double) : integer; cdecl; external BePascalLibName name 'BTextView_FindLineBreak';
function BTextView_StyledWidth(AObject : TCPlusObject; fromOffset : integer; length : integer; outAscent : double; outDescent : double) : double; cdecl; external BePascalLibName name 'BTextView_StyledWidth';
function BTextView_ActualTabWidth(AObject : TCPlusObject; location : double) : double; cdecl; external BePascalLibName name 'BTextView_ActualTabWidth';
//procedure BTextView_DoInsertText(AObject : TCPlusObject; inText : PChar; inLength : integer; inOffset : integer; inRuns :  Ttext_tun_array; outResult : ); cdecl; external BePascalLibName name 'BTextView_DoInsertText';
//procedure BTextView_DoDeleteText(AObject : TCPlusObject; fromOffset : integer; toOffset : integer; outResult : ); cdecl; external BePascalLibName name 'BTextView_DoDeleteText';
procedure BTextView_DrawLines(AObject : TCPlusObject; startLine : integer; endLine : integer; startOffset : integer; erase : boolean); cdecl; external BePascalLibName name 'BTextView_DrawLines';
procedure BTextView_DrawCaret(AObject : TCPlusObject; offset : integer); cdecl; external BePascalLibName name 'BTextView_DrawCaret';
procedure BTextView_InvertCaret(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BTextView_InvertCaret';
procedure BTextView_DragCaret(AObject : TCPlusObject; offset : integer); cdecl; external BePascalLibName name 'BTextView_DragCaret';
procedure BTextView_StopMouseTracking(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BTextView_StopMouseTracking';
function BTextView_PerformMouseUp(AObject : TCPlusObject; where : BPoint) : boolean; cdecl; external BePascalLibName name 'BTextView_PerformMouseUp';
function BTextView_PerformMouseMoved(AObject : TCPlusObject; where : BPoint; code : Cardinal) : boolean; cdecl; external BePascalLibName name 'BTextView_PerformMouseMoved';
procedure BTextView_TrackMouse(AObject : TCPlusObject; where : BPoint; message : BMessage; force : boolean); cdecl; external BePascalLibName name 'BTextView_TrackMouse';
procedure BTextView_TrackDrag(AObject : TCPlusObject; where : BPoint); cdecl; external BePascalLibName name 'BTextView_TrackDrag';
procedure BTextView_InitiateDrag(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BTextView_InitiateDrag';
function BTextView_MessageDropped(AObject : TCPlusObject; inMessage : BMessage; where : BPoint; offset : BPoint) : boolean; cdecl; external BePascalLibName name 'BTextView_MessageDropped';
procedure BTextView_UpdateScrollbars(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BTextView_UpdateScrollbars';
procedure BTextView_AutoResize(AObject : TCPlusObject; doredraw : boolean); cdecl; external BePascalLibName name 'BTextView_AutoResize';
procedure BTextView_NewOffscreen(AObject : TCPlusObject; padding : double); cdecl; external BePascalLibName name 'BTextView_NewOffscreen';
procedure BTextView_DeleteOffscreen(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BTextView_DeleteOffscreen';
procedure BTextView_Activate(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BTextView_Activate';
procedure BTextView_Deactivate(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BTextView_Deactivate';
//procedure BTextView_NormalizeFont(AObject : TCPlusObject; font :  BFont); cdecl; external BePascalLibName name 'BTextView_NormalizeFont';
function BTextView_CharClassification(AObject : TCPlusObject; offset : integer) : Cardinal; cdecl; external BePascalLibName name 'BTextView_CharClassification';
function BTextView_NextInitialByte(AObject : TCPlusObject; offset : integer) : integer; cdecl; external BePascalLibName name 'BTextView_NextInitialByte';
function BTextView_PreviousInitialByte(AObject : TCPlusObject; offset : integer) : integer; cdecl; external BePascalLibName name 'BTextView_PreviousInitialByte';
//function BTextView_GetProperty(AObject : TCPlusObject; specifier : BMessage; form : integer; property : PChar; reply : BMessage) : boolean; cdecl; external BePascalLibName name 'BTextView_GetProperty';
function BTextView_SetProperty(AObject : TCPlusObject; specifier : BMessage; form : integer; properti : PChar; reply : BMessage) : boolean; cdecl; external BePascalLibName name 'BTextView_SetProperty';
function BTextView_CountProperties(AObject : TCPlusObject; specifier : BMessage; form : integer; properti : PChar; reply : BMessage) : boolean; cdecl; external BePascalLibName name 'BTextView_CountProperties';
procedure BTextView_HandleInputMethodChanged(AObject : TCPlusObject; message : BMessage); cdecl; external BePascalLibName name 'BTextView_HandleInputMethodChanged';
procedure BTextView_HandleInputMethodLocationRequest(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BTextView_HandleInputMethodLocationRequest';
procedure BTextView_CancelInputMethod(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BTextView_CancelInputMethod';
procedure BTextView_LockWidthBuffer(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BTextView_LockWidthBuffer';
procedure BTextView_UnlockWidthBuffer(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BTextView_UnlockWidthBuffer';

implementation


constructor  BTextView.Create(aframe : BRect; name : pchar;atexBRect: BRect ; resizeMask, sflags : cardinal); 
begin
  CreatePas;
  CPlusObject := BTextView_Create(Self, 	aframe.CplusObject,name,atexBRect.CPlusObject,resizeMask,sflags);
end;

constructor  BTextView.Create(data : BMessage);
begin
  CreatePas;
  CPlusObject := BTextView_Create(Self, data.CPlusObject);
end;

destructor  BTextView.Destroy;
begin
  BTextView_Free(CPlusObject);
  inherited;
end;

function  BTextView.Instantiate(data : BMessage) : BArchivable;
begin
  Result := BTextView_Instantiate(CPlusObject, data.CPlusObject);
end;

function  BTextView.Archive(data : BMessage; deep : boolean) : Status_t;
begin
  Result := BTextView_Archive(CPlusObject, data.CPlusObject, deep);
end;

procedure  BTextView.AttachedToWindow;
begin
//  BTextView_AttachedToWindow(CPlusObject);
end;

procedure  BTextView.DetachedFromWindow;
begin
//  BTextView_DetachedFromWindow(CPlusObject);
end;

procedure  BTextView.Draw(inRect : BRect);
begin
 // BTextView_Draw(CPlusObject, inRect.CPlusObject);
end;

procedure  BTextView.MouseDown(where : BPoint);
begin
//  BTextView_MouseDown(CPlusObject, where.CPlusObject);
end;

procedure  BTextView.MouseUp(where : BPoint);
begin
  //BTextView_MouseUp(CPlusObject, where.CPlusObject);
end;

procedure  BTextView.MouseMoved(where : BPoint; code : Cardinal; message : BMessage);
begin
  //BTextView_MouseMoved(CPlusObject, where.CPlusObject, code, message);
end;

procedure  BTextView.WindowActivated(state : boolean);
begin
  //BTextView_WindowActivated(CPlusObject, state);
end;

procedure  BTextView.KeyDown(bytes : PChar; numBytes : integer);
begin
  //writeln('keydown textview');
  //BTextView_KeyDown(CPlusObject, bytes, numBytes);
end;

procedure  BTextView.Pulse;
begin
  //BTextView_Pulse(CPlusObject);
end;

procedure  BTextView.FrameResized(width : double; height : double);
begin
 // BTextView_FrameResized(CPlusObject, width, height);
end;

procedure  BTextView.MakeFocus(focusState : boolean);
begin
  BTextView_MakeFocus(CPlusObject, focusState);
end;

procedure  BTextView.MessageReceived(message : BMessage);
begin
  inherited;
//  BTextView_MessageReceived(CPlusObject, message.CPlusObject);
end;

function  BTextView.ResolveSpecifier(message : BMessage; index : integer; specifier : BMessage; form : integer; properti : PChar) : BHandler;
begin
  //Result := BTextView_ResolveSpecifier(CPlusObject, message.CPlusObject, index, specifier.CPlusObject, form, properti);  
end;

function  BTextView.GetSupportedSuites(data : BMessage) : Status_t;
begin
  Result := BTextView_GetSupportedSuites(CPlusObject, data.CPlusObject);
end;

function  BTextView.Perform(d : Perform_code; arg : Pointer) : Status_t;
begin
  Result := BTextView_Perform(CPlusObject, d, arg);
end;

procedure  BTextView.SetText(inText : PChar; var inRuns :  text_run_array);
begin
  BTextView_SetText(CPlusObject, inText, inRuns);
end;

procedure  BTextView.SetText(inText : PChar; inLength : integer; var inRuns :  text_run_array);
begin
  BTextView_SetText(CPlusObject, inText, inLength, inRuns);
end;

{procedure  BTextView.SetText(inFile : TFile; startOffset : integer; inLength : integer; inRuns :  text_run_array);
begin
  BTextView_SetText(CPlusObject, inFile.CPlusObject, startOffset, inLength, inRuns);
end;
}
procedure  BTextView.Insert(inText : PChar;var inRuns :  text_run_array);
begin
  BTextView_Insert(CPlusObject, inText, inRuns);
end;

procedure  BTextView.Insert(inText : PChar; inLength : integer; var inRuns :  text_run_array);
begin
  BTextView_Insert(CPlusObject, inText, inLength, inRuns);
end;

procedure  BTextView.Insert(startOffset : integer; inText : PChar; inLength : integer; var inRuns :  text_run_array);
begin
  BTextView_Insert(CPlusObject, startOffset, inText, inLength, inRuns);
end;

procedure  BTextView.Delete;
begin
  BTextView_Delete(CPlusObject);
end;

procedure  BTextView.Delete(startOffset : integer; endOffset : integer);
begin
  BTextView_Delete(CPlusObject, startOffset, endOffset);
end;

function  BTextView.aText : PChar;
begin
  Result := BTextView_Text(CPlusObject);
end;

function  BTextView.TextLength : integer;
begin
  Result := BTextView_TextLength(CPlusObject);
end;

procedure  BTextView.GetText(offset : integer; length : integer; buffer : PChar);
begin
  BTextView_GetText(CPlusObject, offset, length, buffer);
end;

function  BTextView.ByteAt(offset : integer) :  PChar;
begin
  Result := BTextView_ByteAt(CPlusObject, offset);
end;

function  BTextView.CountLines : integer;
begin
  Result := BTextView_CountLines(CPlusObject);
end;

function  BTextView.CurrentLine : integer;
begin
  Result := BTextView_CurrentLine(CPlusObject);
end;

procedure  BTextView.GoToLine(lineNum : integer);
begin
  BTextView_GoToLine(CPlusObject, lineNum);
end;

procedure  BTextView.Cut(clipboard : BClipboard);
begin
  BTextView_Cut(CPlusObject, clipboard.CPlusObject);
end;

procedure  BTextView.Copy(clipboard : BClipboard);
begin
	
  BTextView_Copy(CPlusObject, clipboard.CPlusObject);
end;

procedure  BTextView.Paste(clipboard : BClipboard);
begin
  BTextView_Paste(CPlusObject, clipboard.CPlusObject);
end;

procedure  BTextView.Clear;
begin
  BTextView_Clear(CPlusObject);
end;

function  BTextView.AcceptsPaste(clipboard : BClipboard) : boolean;
begin
  Result := BTextView_AcceptsPaste(CPlusObject, clipboard.CPlusObject);
end;

{function  BTextView.AcceptsDrop(inMessage : BMessage) : boolean;
begin
  Result := BTextView_AcceptsDrop(CPlusObject, inMessage);
end;
}
procedure  BTextView.Select(startOffset : integer; endOffset : integer);
begin
  BTextView_Select(CPlusObject, startOffset, endOffset);
end;

procedure  BTextView.SelectAll;
begin
  BTextView_SelectAll(CPlusObject);
end;

{procedure  BTextView.GetSelection(outStart : integer; outEnd : integer);
begin
  BTextView_GetSelection(CPlusObject, outStart, outEnd);
end;
}
procedure  BTextView.SeTFontAndColor(inFont :  BFont; inMode : Cardinal; var inColor :  RGB_color);
begin
  BTextView_SeBFontAndColor(CPlusObject, inFont.CPlusObject, inMode, inColor);
end;

//procedure  BTextView.SeBFontAndColor(inFont :  BFont; inMode : Cardinal);
//begin
//  BTextView_SeBFontAndColor(CPlusObject, inFont.CPlusObject, inMode);
//end;

//procedure  BTextView.SeBFontAndColor(inFont :  BFont);
//begin
//  BTextView_SeBFontAndColor(CPlusObject, inFont.CPlusObject);
//end;

procedure  BTextView.SetFontAndColor(startOffset : cardinal; endOffset : cardinal; inFont :  BFont; inMode : Cardinal; var inColor :  RGB_color);
begin
  BTextView_SeBFontAndColor(CPlusObject, startOffset, endOffset, inFont.CPlusObject, inMode, inColor);
end;

procedure  BTextView.GetFontAndColor(inOffset : integer; ouBFont :  BFont; outColor : RGB_color);
begin
  BTextView_GeBFontAndColor(CPlusObject, inOffset, ouBFont.CPlusObject, outColor);
end;

procedure  BTextView.GetFontAndColor(ouBFont :  BFont; outMode :  integer; outColor : RGB_color; outEqColor : boolean);
begin
  BTextView_GeBFontAndColor(CPlusObject, ouBFont.CPlusObject, outMode, outColor, outEqColor);
end;
{
procedure  BTextView.SetRunArray(startOffset : integer; endOffset : integer; inRuns :  Ttext_tun_array);
begin
  BTextView_SetRunArray(CPlusObject, startOffset, endOffset, inRuns);
end;

function  BTextView.RunArray(startOffset : integer; endOffset : integer; outSize : ^integer) : text_run_array;
begin
  Result := BTextView_RunArray(CPlusObject, startOffset, endOffset, outSize);
end;
}
function  BTextView.LineAt(offset : integer) : integer;
begin
  Result := BTextView_LineAt(CPlusObject, offset);
end;

function  BTextView.LineAt(point : BPoint) : integer;
begin
  Result := BTextView_LineAt(CPlusObject, point.CPlusObject);
end;

function  BTextView.PointAt(inOffset : integer; outHeight : double) : BPoint;
begin
  Result := BTextView_PointAt(CPlusObject, inOffset, outHeight);
end;

function  BTextView.OffsetAt(point : BPoint) : integer;
begin
  Result := BTextView_OffsetAt(CPlusObject, point.CPlusObject);
end;

function  BTextView.OffsetAt(line : integer) : integer;
begin
  Result := BTextView_OffsetAt(CPlusObject, line);
end;

procedure  BTextView.FindWord(inOffset : integer; outFromOffset : integer; outToOffset : integer);
begin
  BTextView_FindWord(CPlusObject, inOffset, outFromOffset, outToOffset);
end;

function  BTextView.CanEndLine(offset : integer) : boolean;
begin
  Result := BTextView_CanEndLine(CPlusObject, offset);
end;

function  BTextView.LineWidth(lineNum : integer) : double;
begin
  Result := BTextView_LineWidth(CPlusObject, lineNum);
end;

function  BTextView.LineHeight(lineNum : integer) : double;
begin
  Result := BTextView_LineHeight(CPlusObject, lineNum);
end;

function  BTextView.TextHeight(startLine : integer; endLine : integer) : double;
begin
  Result := BTextView_TextHeight(CPlusObject, startLine, endLine);
end;

{procedure  BTextView.GetTextRegion(startOffset : integer; endOffset : integer; outRegion :  TRegion);
begin
  BTextView_GetTextRegion(CPlusObject, startOffset, endOffset, outRegion.CPlusObject);
end;
}
procedure  BTextView.ScrollToOffset(inOffset : integer);
begin
  BTextView_ScrollToOffset(CPlusObject, inOffset);
end;

procedure  BTextView.ScrollToSelection;
begin
  BTextView_ScrollToSelection(CPlusObject);
end;

procedure  BTextView.Highlight(startOffset : integer; endOffset : integer);
begin
  BTextView_Highlight(CPlusObject, startOffset, endOffset);
end;

procedure  BTextView.SetTexBRect(rect : BRect);
begin
  BTextView_SetTexBRect(CPlusObject, rect.CPlusObject);
end;

function  BTextView.TexBRect : BRect;
begin
  Result := BTextView_TexBRect(CPlusObject);
end;

procedure  BTextView.SetStylable(stylable : boolean);
begin
  BTextView_SetStylable(CPlusObject, stylable);
end;

function  BTextView.IsStylable : boolean;
begin
  Result := BTextView_IsStylable(CPlusObject);
end;

procedure  BTextView.SetTabWidth(width : double);
begin
  BTextView_SetTabWidth(CPlusObject, width);
end;

function  BTextView.TabWidth : double;
begin
  Result := BTextView_TabWidth(CPlusObject);
end;

procedure  BTextView.MakeSelectable(selectable : boolean);
begin
  BTextView_MakeSelectable(CPlusObject, selectable);
end;

function  BTextView.IsSelectable : boolean;
begin
  Result := BTextView_IsSelectable(CPlusObject);
end;

procedure  BTextView.MakeEditable(editable : boolean);
begin
  BTextView_MakeEditable(CPlusObject, editable);
end;

function  BTextView.IsEditable : boolean;
begin
  Result := BTextView_IsEditable(CPlusObject);
end;

procedure  BTextView.SetWordWrap(awrap : boolean);
begin
  BTextView_SetWordWrap(CPlusObject, awrap);
end;

function  BTextView.DoesWordWrap : boolean;
begin
  Result := BTextView_DoesWordWrap(CPlusObject);
end;

procedure  BTextView.SetMaxBytes(max : integer);
begin
  BTextView_SetMaxBytes(CPlusObject, max);
end;

function  BTextView.MaxBytes : integer;
begin
  Result := BTextView_MaxBytes(CPlusObject);
end;

procedure  BTextView.DisallowChar(aChar : Cardinal);
begin
  BTextView_DisallowChar(CPlusObject, aChar);
end;

procedure  BTextView.AllowChar(aChar : Cardinal);
begin
  BTextView_AllowChar(CPlusObject, aChar);
end;

procedure  BTextView.Sealignment(flag : alignment);
begin
  BTextView_Sealignment(CPlusObject, flag);
end;

function  BTextView.getAlignment : alignment;
begin
  Result := BTextView_Alignment(CPlusObject);
end;

procedure  BTextView.SetAutoindent(state : boolean);
begin
  BTextView_SetAutoindent(CPlusObject, state);
end;

function  BTextView.DoesAutoindent : boolean;
begin
  Result := BTextView_DoesAutoindent(CPlusObject);
end;

{procedure  BTextView.SetColorSpace(colors : TColor_Space);
begin
  BTextView_SetColorSpace(CPlusObject, colors);
end;

function  BTextView.ColorSpace : TColor_Space;
begin
  Result := BTextView_ColorSpace(CPlusObject);
end;
}
procedure  BTextView.MakeResizable(resize : boolean; resizeView : BView);
begin
  BTextView_MakeResizable(CPlusObject, resize, resizeView.CPlusObject);
end;

function  BTextView.IsResizable : boolean;
begin
  Result := BTextView_IsResizable(CPlusObject);
end;

procedure  BTextView.SetDoesUndo(undo : boolean);
begin
  BTextView_SetDoesUndo(CPlusObject, undo);
end;

function  BTextView.DoesUndo : boolean;
begin
  Result := BTextView_DoesUndo(CPlusObject);
end;

procedure  BTextView.HideTyping(enabled : boolean);
begin
  BTextView_HideTyping(CPlusObject, enabled);
end;

function  BTextView.IsTypingHidden : boolean;
begin
  Result := BTextView_IsTypingHidden(CPlusObject);
end;

procedure  BTextView.ResizeToPreferred;
begin
  BTextView_ResizeToPreferred(CPlusObject);
end;

procedure  BTextView.GetPreferredSize(width : double; height : double);
begin
  BTextView_GetPreferredSize(CPlusObject, width, height);
end;

procedure  BTextView.AllAttached;
begin
  BTextView_AllAttached(CPlusObject);
end;

procedure  BTextView.AllDetached;
begin
  BTextView_AllDetached(CPlusObject);
end;

{function  BTextView.FlattenRunArray(inArray :  Ttext_tun_array; outSize : integer) : Pointer;
begin
  Result := BTextView_FlattenRunArray(CPlusObject, inArray, outSize);
end;


function  BTextView.UnflattenRunArray(data : Pointer; outSize : integer) : text_run_array;
begin
  Result := BTextView_UnflattenRunArray(CPlusObject, data, outSize);
end;

procedure  BTextView.InsertText(inText : PChar; inLength : integer; inOffset : integer; inRuns :  Ttext_tun_array);
begin
  BTextView_InsertText(CPlusObject, inText, inLength, inOffset, inRuns);
end;
}

{procedure  BTextView.Undo(clipboard : TClipboard);
begin
  BTextView_Undo(CPlusObject, clipboard.CPlusObject);
end;

function  BTextView.UndoState(isRedo : boolean) :  undo_state;
begin
  Result := BTextView_UndoState(CPlusObject, isRedo);
end;

procedure  BTextView.GetDragParameters(drag : BMessage; bitmap : TBitmap; point : BPoint; handler : BHandler);
begin
  BTextView_GetDragParameters(CPlusObject, drag.CPlusObject, bitmap.CPlusObject, point.CPlusObject, handler.CPlusObject);
end;
}


end.
