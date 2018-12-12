{   BePascal - A pascal wrapper around the BeOS API
    Copyright (C) 2003 Olivier Coursiere
                       Eric Jourde
                       Oscar Lesta

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
unit Bitmap;

interface

uses
  BeObj, Archivable, GraphicDefs, Message, OS, Rect, SupportDefs;

const
  B_BITMAP_CLEAR_TO_WHITE          = $00000001;
  B_BITMAP_ACCEPTS_VIEWS           = $00000002;
  B_BITMAP_IS_AREA                 = $00000004;
  B_BITMAP_IS_LOCKED               = $00000008 or B_BITMAP_IS_AREA;
  B_BITMAP_IS_CONTIGUOUS           = $00000010 or B_BITMAP_IS_LOCKED;
  B_BITMAP_IS_OFFSCREEN            = $00000020;
  B_BITMAP_WILL_OVERLAY            = $00000040 or B_BITMAP_IS_OFFSCREEN;
  B_BITMAP_RESERVE_OVERLAY_CHANNEL = $00000080;

  B_ANY_BYTES_PER_ROW = -1;

type
  // OCO To avoid circular reference beetween bitmap.pp and view.pp
  // We have to look at a better solution in the future
  // (This one may not work when using functions that use this definition)
  BView = TBeObject;

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

end.
