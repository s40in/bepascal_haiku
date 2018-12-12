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
unit menu;

interface

uses
  beobj, view, message, archivable, SupportDefs, rect, list,
  handler, messenger;

type
  Menu_Info = record
    font_size : Double;
{    float font_size;
    font_family f_family;
    font_style f_style;
    rgb_color background_color;
    int32 separator;
    bool click_to_open;
    bool triggers_always_shown;}
  end;
  PMenu_Info = ^Menu_Info;
type
  Menu_Layout = (B_ITEMS_IN_ROW, B_ITEMS_IN_COLUMN, B_ITEMS_IN_MATRIX);
  Add_State = (B_INITIAL_ADD, B_PROCESSING, B_ABORT);
type
  Menu_Tracking_Hook = function() : Status_t; cdecl;
type
  bMenuItem = class;
  BMenu = class(BView)
  private
  public
//    constructor Create; override;
    constructor Create(title : PChar; width : double; height : double);
    constructor Create(title : PChar; layout : Menu_Layout);    
    destructor Destroy; override;
//    constructor Create(data : BMessage);
    function Instantiate(data : BMessage) : BArchivable; 
    function Archive(data : BMessage; deep : boolean) : Status_t;
    procedure AttachedToWindow; override;
    procedure DetachedFromWindow; override;

    function AddItem(item : bMenuItem) : boolean;
    function AddItem(item : bMenuItem; index : integer) : boolean;
    function AddItem(item : bMenuItem; aframe : BRect) : boolean;
    function AddItem(menu : BMenu; index : integer) : boolean;
    function AddItem(menu : BMenu; aframe : BRect) : boolean;
    function AddItem(menu : BMenu) : boolean;

    function AddList(list : BList; index : integer) : boolean; 
    function AddSeparatorItem : boolean;
    function RemoveItem(item : bMenuItem) : boolean;
    function RemoveItem(index : integer) : bMenuItem;
    function RemoveItems(index : integer; count : integer; del : boolean) : boolean;
    function RemoveItem(menu : BMenu) : boolean;
    function ItemAt(index : integer) : bMenuItem;
    function SubmenuAt(index : integer) : BMenu;
    function CountItems : integer;
    function IndexOf(item : bMenuItem) : integer;
    function IndexOf(menu : BMenu) : integer;
    function FindItem(command : Cardinal) : bMenuItem;
    function FindItem(name : PChar) : bMenuItem;
    function SetTargetForItems(target : BHandler) : Status_t;
    function SetTargetForItems(messenger : BMessenger) : Status_t;
    procedure SetEnabled(state : boolean);
    procedure SetRadioMode(state : boolean);
    procedure SetTriggersEnabled(state : boolean);
    procedure SetMaxContentWidth(max : double);
    procedure SetLabelFromMarked(aOn : boolean);
    function IsLabelFromMarked : boolean;
    function IsEnabled : boolean;
    function IsRadioMode : boolean;
    function AreTriggersEnabled : boolean;
    function IsRedrawAfterSticky : boolean;
    function MaxContentWidth : double;
    function FindMarked : bMenuItem;
    function Supermenu : BMenu;
    function Superitem : bMenuItem;
    procedure MessageReceived(msg : BMessage); override;
    procedure KeyDown(bytes : PChar; numBytes : integer); override;
    procedure Draw(updateRect : BRect); override;
    procedure GetPreferredSize(width : double; height : double);
    procedure ResizeToPreferred; override;
    procedure FrameMoved(new_position : BPoint); override;
    procedure FrameResized(new_width : double; new_height : double); override;
    procedure InvalidateLayout;
    function ResolveSpecifier(msg : BMessage; index : integer; specifier : BMessage; form : integer; aProperty : PChar) : BHandler;
    function GetSupportedSuites(data : BMessage) : Status_t;
    function Perform(d : Perform_code; arg : Pointer) : Status_t;
    procedure MakeFocus(state : boolean);
    procedure AllAttached; override;
    procedure AllDetached; override;
{    constructor Create(frame : BRect; viewName : PChar; resizeMask : Cardinal; flags : Cardinal; layout : BMenu_Layout; resizeToFit : boolean);
    function ScreenLocation : BPoint;
    procedure SetItemMargins(left : double; top : double; right : double; bottom : double);
    procedure GetItemMargins(left : double; top : double; right : double; bottom : double);
    function Layout : TMenu_Layout;
    procedure Show;
    procedure Show(selectFirstItem : boolean);
    procedure Hide;
    function Track(start_opened : boolean; special_rect : BRect) : bMenuItem;
}
//    procedure enum add_state { B_INITIAL_ADD, B_PROCESSING, B_ABORT };
{    function AddDynamicItem(s : TAdd_State) : boolean;
    procedure DrawBackground(update : BRect);
    procedure SetTrackingHook(func : TMenu_Tracking_Hook; state : Pointer);
}
{    procedure _ReservedMenu3;
    procedure _ReservedMenu4;
    procedure _ReservedMenu5;
    procedure _ReservedMenu6;
    function operator=( : TMenu) : TMenu;
    procedure InitData(data : BMessage);
    function _show(selectFirstItem : boolean) : boolean;
    procedure _hide;
    function _track(action : integer; start : integer) : bMenuItem;
    function _AddItem(item : bMenuItem; index : integer) : boolean;
    function RemoveItems(index : integer; count : integer; item : bMenuItem; del : boolean) : boolean;
    procedure LayoutItems(index : integer);
    procedure ComputeLayout(index : integer; bestFit : boolean; moveItems : boolean; width : double; height : double);
    function Bump(current : BRect; extent : BPoint; index : integer) : BRect;
    function ItemLocInRect(frame : BRect) : BPoint;
    function CalcFrame(where : BPoint; scrollOn : boolean) : BRect;
    function ScrollMenu(bounds : BRect; loc : BPoint; fast : boolean) : boolean;
    procedure ScrollIntoView(item : bMenuItem);
    procedure DrawItems(updateRect : BRect);
    function State(item : bMenuItem) : integer;
    procedure InvokeItem(item : bMenuItem; now : boolean);
    function OverSuper(loc : BPoint) : boolean;
    function OverSubmenu(item : bMenuItem; loc : BPoint) : boolean;
    function MenuWindow : TMenuWindow;
    procedure DeleteMenuWindow;
    function HitTestItems(where : BPoint; slop : BPoint) : bMenuItem;
    function Superbounds : BRect;
    procedure CacheFontInfo;
    procedure ItemMarked(item : bMenuItem);
    procedure Install(target : TWindow);
    procedure Uninstall;
    procedure SelectItem(m : bMenuItem; showSubmenu : Cardinal; selectFirstItem : boolean);
    function CurrentSelection : bMenuItem;
    function SelectNextItem(item : bMenuItem; forward : boolean) : boolean;
    function NextItem(item : bMenuItem; forward : boolean) : bMenuItem;
    function IsItemVisible(item : bMenuItem) : boolean;
    procedure SetIgnoreHidden(on : boolean);
    procedure SetStickyMode(on : boolean);
    function IsStickyMode : boolean;
    procedure CalcTriggers;
    function ChooseTrigger(title : PChar; chars : BList) : PChar;
    procedure UpdateWindowViewSize(upWind : boolean);
    function IsStickyPrefOn : boolean;
    procedure RedrawAfterSticky(bounds : BRect);
    function OkToProceed( : bMenuItem) : boolean;
    function ParseMsg(msg : BMessage; sindex : ^integer; spec : BMessage; form : ^integer; prop : PChar; tmenu : TMenu; titem : bMenuItem; user_data : ^integer; reply : BMessage) : Status_t;
    function DoMenuMsg(next : bMenuItem; tar : TMenu; m : BMessage; r : BMessage; spec : BMessage; f : integer) : Status_t;
    function DoMenuItemMsg(next : bMenuItem; tar : TMenu; m : BMessage; r : BMessage; spec : BMessage; f : integer) : Status_t;
    function DoEnabledMsg(ti : bMenuItem; tm : TMenu; m : BMessage; r : BMessage) : Status_t;
    function DoLabelMsg(ti : bMenuItem; tm : TMenu; m : BMessage; r : BMessage) : Status_t;
    function DoMarkMsg(ti : bMenuItem; tm : TMenu; m : BMessage; r : BMessage) : Status_t;
    function DoDeleteMsg(ti : bMenuItem; tm : TMenu; m : BMessage; r : BMessage) : Status_t;
    function DoCreateMsg(ti : bMenuItem; tm : TMenu; m : BMessage; r : BMessage; menu : boolean) : Status_t;
    procedure menu_info sMenuInfo;
    procedure bool sSwapped;
    procedure BMenuItem *fChosenItem;
    procedure BList fItems;
    procedure BRect fPad;
    procedure BMenuItem *fSelected;
    procedure BMenuWindow *fCachedMenuWindow;
    procedure BMenu *fSuper;
    procedure BMenuItem *fSuperitem;
    procedure BRect fSuperbounds;
    procedure float fAscent;
    procedure float fDescent;
    procedure float fFontHeight;
    procedure uint32 fState;
    procedure menu_layout fLayout;
    procedure BRect *fExtraRect;
    procedure float fMaxContentWidth;
    procedure BPoint *fInitMatrixSize;
    procedure _ExtraMenuData_ *fExtraMenuData;
    procedure uint32 _reserved[2];
    procedure char fTrigger;
    procedure bool fResizeToFit;
    procedure bool fUseCachedMenuLayout;
    procedure bool fEnabled;
    procedure bool fDynamicName;
    procedure bool fRadioMode;
    procedure bool fTrackNewBounds;
    procedure bool fStickyMode;
    procedure bool fIgnoreHidden;
    procedure bool fTriggerEnabled;
    procedure bool fRedrawAfterSticky;
    procedure bool fAttachAborted;}
  end;

  bMenuItem = class(TBeObject)
  private
  public
    constructor Create; override;
    constructor Create(aMenu : BMenu; message : BMessage); virtual;
    constructor Create(data : BMessage); virtual;
    constructor Create(aLabel : PChar; message : BMessage; aShortcut : Char; modifiers : Cardinal); virtual;    
    destructor Destroy; override;
    function Instantiate(data : BMessage) : BArchivable;
    function Archive(data : BMessage; deep : boolean) : Status_t;
    procedure SetLabel(name : PChar);
    procedure SetEnabled(state : boolean);
    procedure SetMarked(state : boolean);
    procedure SetTrigger(ch : Char);
    procedure SetShortcut(ch : Char; modifiers : Cardinal);
//    function aLabel : PChar;
    function IsEnabled : boolean;
    function IsMarked : boolean;
    function Trigger : Char;
//    function Shortcut(modifiers : Cardinal) : Char;
    function Submenu : BMenu;
    function Menu : BMenu;
    function Frame : BRect;
{    procedure GetContentSize(width : double; height : double);
    procedure TruncateLabel(max : double; new_label : PChar);
    procedure DrawContent;
    procedure Draw;
    procedure Highlight(aOn : boolean);
    function IsSelected : boolean;
    function ContentLocation : BPoint;
    procedure _ReservedMenuItem2;
    procedure _ReservedMenuItem3;
    procedure _ReservedMenuItem4;
    constructor Create(MenuItem : bMenuItem);
    function operator=(MenuItem : bMenuItem) : bMenuItem;
    procedure InitData;
    procedure InitMenuData(menu : BMenu);
    procedure Install(window : TWindow);
    function Invoke(msg : BMessage) : Status_t;
    procedure Uninstall;
    procedure SetSuper(super : BMenu);
    procedure Select(on : boolean);
    procedure DrawMarkSymbol;
    procedure DrawShortcutSymbol;
    procedure DrawSubmenuSymbol;
    procedure DrawControlChar(control : PChar);
    procedure SetSysTrigger(ch : Char);
    procedure char *fLabel;
    procedure BMenu *fSubmenu;
    procedure BWindow *fWindow;
    procedure BMenu *fSuper;
    procedure BRect fBounds;
    procedure uint32 fModifiers;
    procedure float fCachedWidth;
    procedure int16 fTriggerIndex;
    procedure char fUserTrigger;
    procedure char fSysTrigger;
    procedure char fShortcutChar;
    procedure bool fMark;
    procedure bool fEnabled;
    procedure bool fSelected;
    procedure uint32 _reserved[4];
}
  end;
type
  BSeparatorItem = class(bMenuItem)
  private
  public
    constructor Create; override;
    constructor Create(data : BMessage); override;
    destructor Destroy; override;
    function Archive(data : BMessage; deep : boolean) : Status_t;
    function Instantiate(data : BMessage) : BArchivable;
    procedure SetEnabled(state : boolean);
{    procedure GetContentSize(width : double; height : double);
    procedure Draw;
    procedure _ReservedSeparatorItem1;
    procedure _ReservedSeparatorItem2;
    function operator=( : BSeparatorItem) : BSeparatorItem;
    procedure uint32 _reserved[1];
}
  end;

//function BMenuItem_Create(AObject : TBeObject) : TCPlusObject; cdecl; external BePascalLibName name 'BMenuItem_Create';
function BMenuItem_Create(AObject : TBeObject; aLabel : PChar; message : TCPlusObject; shortcut : Char; modifiers : Cardinal) : TCPlusObject; cdecl; external BePascalLibName name 'BMenuItem_Create';
function BMenuItem_Create(AObject : TBeObject; menu : TCPlusObject; message : TCPlusObject) : TCPlusObject; cdecl; external BePascalLibName name 'BMenuItem_Create_1';
function BMenuItem_Create(AObject : TBeObject; data : TCPlusObject) : TCPlusObject; cdecl; external BePascalLibName name 'BMenuItem_Create_2';
procedure BMenuItem_Free(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BMenuItem_Free';
function BMenuItem_Instantiate(AObject : TCPlusObject; data : TCPlusObject) : BArchivable; cdecl; external BePascalLibName name 'BMenuItem_Instantiate';
function BMenuItem_Archive(AObject : TCPlusObject; data : TCPlusObject; deep : boolean) : Status_t; cdecl; external BePascalLibName name 'BMenuItem_Archive';
procedure BMenuItem_SetLabel(AObject : TCPlusObject; name : PChar); cdecl; external BePascalLibName name 'BMenuItem_SetLabel';
procedure BMenuItem_SetEnabled(AObject : TCPlusObject; state : boolean); cdecl; external BePascalLibName name 'BMenuItem_SetEnabled';
procedure BMenuItem_SetMarked(AObject : TCPlusObject; state : boolean); cdecl; external BePascalLibName name 'BMenuItem_SetMarked';
procedure BMenuItem_SetTrigger(AObject : TCPlusObject; ch : Char); cdecl; external BePascalLibName name 'BMenuItem_SetTrigger';
procedure BMenuItem_SetShortcut(AObject : TCPlusObject; ch : Char; modifiers : Cardinal); cdecl; external BePascalLibName name 'BMenuItem_SetShortcut';
function BMenuItem_Label(AObject : TCPlusObject) : PChar; cdecl; external BePascalLibName name 'BMenuItem_Label';
function BMenuItem_IsEnabled(AObject : TCPlusObject) : boolean; cdecl; external BePascalLibName name 'BMenuItem_IsEnabled';
function BMenuItem_IsMarked(AObject : TCPlusObject) : boolean; cdecl; external BePascalLibName name 'BMenuItem_IsMarked';
function BMenuItem_Trigger(AObject : TCPlusObject) : Char; cdecl; external BePascalLibName name 'BMenuItem_Trigger';
function BMenuItem_Shortcut(AObject : TCPlusObject; modifiers : Cardinal) : Char; cdecl; external BePascalLibName name 'BMenuItem_Shortcut';
function BMenuItem_Submenu(AObject : TCPlusObject) : BMenu; cdecl; external BePascalLibName name 'BMenuItem_Submenu';
function BMenuItem_Menu(AObject : TCPlusObject) : BMenu; cdecl; external BePascalLibName name 'BMenuItem_Menu';
function BMenuItem_Frame(AObject : TCPlusObject) : BRect; cdecl; external BePascalLibName name 'BMenuItem_Frame';
{procedure BMenuItem_GetContentSize(AObject : TCPlusObject; width : double; height : double); cdecl; external BePascalLibName name 'BMenuItem_GetContentSize';
procedure BMenuItem_TruncateLabel(AObject : TCPlusObject; max : double; new_label : PChar); cdecl; external BePascalLibName name 'BMenuItem_TruncateLabel';
procedure BMenuItem_DrawContent(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BMenuItem_DrawContent';
procedure BMenuItem_Draw(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BMenuItem_Draw';
procedure BMenuItem_Highlight(AObject : TCPlusObject; aOn : boolean); cdecl; external BePascalLibName name 'BMenuItem_Highlight';
function BMenuItem_IsSelected(AObject : TCPlusObject) : boolean; cdecl; external BePascalLibName name 'BMenuItem_IsSelected';
function BMenuItem_ContentLocation(AObject : TCPlusObject) : BPoint; cdecl; external BePascalLibName name 'BMenuItem_ContentLocation';
procedure BMenuItem__ReservedMenuItem2(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BMenuItem__ReservedMenuItem2';
procedure BMenuItem__ReservedMenuItem3(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BMenuItem__ReservedMenuItem3';
procedure BMenuItem__ReservedMenuItem4(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BMenuItem__ReservedMenuItem4';
function BMenuItem_Create(AObject : TBeObject;  : bMenuItem) : TCPlusObject; cdecl; external BePascalLibName name 'BMenuItem_Create';
function BMenuItem_operator=(AObject : TCPlusObject;  : bMenuItem) : bMenuItem; cdecl; external BePascalLibName name 'BMenuItem_operator=';
procedure BMenuItem_InitData(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BMenuItem_InitData';
procedure BMenuItem_InitMenuData(AObject : TCPlusObject; menu : TCPlusObject); cdecl; external BePascalLibName name 'BMenuItem_InitMenuData';
procedure BMenuItem_Install(AObject : TCPlusObject; window : TCPlusObject); cdecl; external BePascalLibName name 'BMenuItem_Install';
function BMenuItem_Invoke(AObject : TCPlusObject; msg : TCPlusObject) : Status_t; cdecl; external BePascalLibName name 'BMenuItem_Invoke';
procedure BMenuItem_Uninstall(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BMenuItem_Uninstall';
procedure BMenuItem_SetSuper(AObject : TCPlusObject; super : TCPlusObject); cdecl; external BePascalLibName name 'BMenuItem_SetSuper';
procedure BMenuItem_Select(AObject : TCPlusObject; on : boolean); cdecl; external BePascalLibName name 'BMenuItem_Select';
procedure BMenuItem_DrawMarkSymbol(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BMenuItem_DrawMarkSymbol';
procedure BMenuItem_DrawShortcutSymbol(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BMenuItem_DrawShortcutSymbol';
procedure BMenuItem_DrawSubmenuSymbol(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BMenuItem_DrawSubmenuSymbol';
procedure BMenuItem_DrawControlChar(AObject : TCPlusObject; control : PChar); cdecl; external BePascalLibName name 'BMenuItem_DrawControlChar';
procedure BMenuItem_SetSysTrigger(AObject : TCPlusObject; ch : Char); cdecl; external BePascalLibName name 'BMenuItem_SetSysTrigger';
procedure BMenuItem_char *fLabel(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BMenuItem_char *fLabel';
procedure BMenuItem_BMenu *fSubmenu(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BMenuItem_BMenu *fSubmenu';
procedure BMenuItem_BWindow *fWindow(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BMenuItem_BWindow *fWindow';
procedure BMenuItem_BMenu *fSuper(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BMenuItem_BMenu *fSuper';
procedure BMenuItem_BRect fBounds(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BMenuItem_BRect fBounds';
procedure BMenuItem_uint32 fModifiers(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BMenuItem_uint32 fModifiers';
procedure BMenuItem_float fCachedWidth(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BMenuItem_float fCachedWidth';
procedure BMenuItem_int16 fTriggerIndex(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BMenuItem_int16 fTriggerIndex';
procedure BMenuItem_char fUserTrigger(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BMenuItem_char fUserTrigger';
procedure BMenuItem_char fSysTrigger(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BMenuItem_char fSysTrigger';
procedure BMenuItem_char fShortcutChar(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BMenuItem_char fShortcutChar';
procedure BMenuItem_bool fMark(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BMenuItem_bool fMark';
procedure BMenuItem_bool fEnabled(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BMenuItem_bool fEnabled';
procedure BMenuItem_bool fSelected(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BMenuItem_bool fSelected';
procedure BMenuItem_uint32 _reserved[4](AObject : TCPlusObject); cdecl; external BePascalLibName name 'BMenuItem_uint32 _reserved[4]';
}
function BSeparatorItem_Create(AObject : TBeObject) : TCPlusObject; cdecl; external BePascalLibName name 'BSeparatorItem_Create';
function BSeparatorItem_Create(AObject : TBeObject; data : TCPlusObject) : TCPlusObject; cdecl; external BePascalLibName name 'BSeparatorItem_Create_1';
procedure BSeparatorItem_Free(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BSeparatorItem_Free';
function BSeparatorItem_Archive(AObject : TCPlusObject; data : TCPlusObject; deep : boolean) : Status_t; cdecl; external BePascalLibName name 'BSeparatorItem_Archive';
function BSeparatorItem_Instantiate(AObject : TCPlusObject; data : TCPlusObject) : BArchivable; cdecl; external BePascalLibName name 'BSeparatorItem_Instantiate';
procedure BSeparatorItem_SetEnabled(AObject : TCPlusObject; state : boolean); cdecl; external BePascalLibName name 'BSeparatorItem_SetEnabled';
procedure BSeparatorItem_GetContentSize(AObject : TCPlusObject; width : double; height : double); cdecl; external BePascalLibName name 'BSeparatorItem_GetContentSize';
//procedure BSeparatorItem_Draw(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BSeparatorItem_Draw';
{procedure BSeparatorItem__ReservedSeparatorItem1(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BSeparatorItem__ReservedSeparatorItem1';
procedure BSeparatorItem__ReservedSeparatorItem2(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BSeparatorItem__ReservedSeparatorItem2';
function BSeparatorItem_operator=(AObject : TCPlusObject;  : BSeparatorItem) : BSeparatorItem; cdecl; external BePascalLibName name 'BSeparatorItem_operator=';
procedure BSeparatorItem_uint32 _reserved[1](AObject : TCPlusObject); cdecl; external BePascalLibName name 'BSeparatorItem_uint32 _reserved[1]';
}

//procedure menu_info_float font_size(AObject : TCPlusObject); cdecl; external BePascalLibName name 'menu_info_float font_size';
//procedure menu_info_font_family f_family(AObject : TCPlusObject); cdecl; external BePascalLibName name 'menu_info_font_family f_family';
//procedure menu_info_font_style f_style(AObject : TCPlusObject); cdecl; external BePascalLibName name 'menu_info_font_style f_style';
//procedure menu_info_rgb_color background_color(AObject : TCPlusObject); cdecl; external BePascalLibName name 'menu_info_rgb_color background_color';
//procedure menu_info_int32 separator(AObject : TCPlusObject); cdecl; external BePascalLibName name 'menu_info_int32 separator';
//procedure menu_info_bool click_to_open(AObject : TCPlusObject); cdecl; external BePascalLibName name 'menu_info_bool click_to_open';
//procedure menu_info_bool triggers_always_shown(AObject : TCPlusObject); cdecl; external BePascalLibName name 'menu_info_bool triggers_always_shown';
//function BMenu_Create(AObject : TBeObject) : TCPlusObject; cdecl; external BePascalLibName name 'BMenu_Create';
function BMenu_Create(AObject : TBeObject; title : PChar; layout : Integer) : TCPlusObject; cdecl; external BePascalLibName name 'BMenu_Create';
function BMenu_Create(AObject : TBeObject; title : PChar; width : double; height : double) : TCPlusObject; cdecl; external BePascalLibName name 'BMenu_Create_1';
procedure BMenu_Free(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BMenu_Free';
function BMenu_Create(AObject : TBeObject; data : TCPlusObject) : TCPlusObject; cdecl; external BePascalLibName name 'BMenu_Create_3';
function BMenu_Instantiate(AObject : TCPlusObject; data : TCPlusObject) : BArchivable; cdecl; external BePascalLibName name 'BMenu_Instantiate';
function BMenu_Archive(AObject : TCPlusObject; data : TCPlusObject; deep : boolean) : Status_t; cdecl; external BePascalLibName name 'BMenu_Archive';
procedure BMenu_AttachedToWindow(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BMenu_AttachedToWindow';
procedure BMenu_DetachedFromWindow(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BMenu_DetachedFromWindow';
function BMenu_AddItem_1(AObject : TCPlusObject; item : TCPlusObject) : boolean; cdecl; external BePascalLibName name 'BMenu_AddItem';
function BMenu_AddItem_2(AObject : TCPlusObject; item : TCPlusObject; index : integer) : boolean; cdecl; external BePascalLibName name 'BMenu_AddItem_1';
function BMenu_AddItem_3(AObject : TCPlusObject; item : TCPlusObject; frame : TCPlusObject) : boolean; cdecl; external BePascalLibName name 'BMenu_AddItem_2';
function BMenu_AddItem_4(AObject : TCPlusObject; menu : TCPlusObject) : boolean; cdecl; external BePascalLibName name 'BMenu_AddItem_3';
function BMenu_AddItem_5(AObject : TCPlusObject; menu : TCPlusObject; index : integer) : boolean; cdecl; external BePascalLibName name 'BMenu_AddItem_4';
function BMenu_AddItem_6(AObject : TCPlusObject; menu : TCPlusObject; frame : TCPlusObject) : boolean; cdecl; external BePascalLibName name 'BMenu_AddItem_5';
function BMenu_AddList(AObject : TCPlusObject; list : TCPlusObject; index : integer) : boolean; cdecl; external BePascalLibName name 'BMenu_AddList';
function BMenu_AddSeparatorItem(AObject : TCPlusObject) : boolean; cdecl; external BePascalLibName name 'BMenu_AddSeparatorItem';
function BMenu_RemoveItem(AObject : TCPlusObject; item : TCPlusObject) : boolean; cdecl; external BePascalLibName name 'BMenu_RemoveItem';
function BMenu_RemoveItem(AObject : TCPlusObject; index : integer) : bMenuItem; cdecl; external BePascalLibName name 'BMenu_RemoveItem_1';
function BMenu_RemoveItems(AObject : TCPlusObject; index : integer; count : integer; del : boolean) : boolean; cdecl; external BePascalLibName name 'BMenu_RemoveItems_2';
//function BMenu_RemoveItem(AObject : TCPlusObject; menu : TCPlusObject) : boolean; cdecl; external BePascalLibName name 'BMenu_RemoveItem';
function BMenu_ItemAt(AObject : TCPlusObject; index : integer) : bMenuItem; cdecl; external BePascalLibName name 'BMenu_ItemAt';
function BMenu_SubmenuAt(AObject : TCPlusObject; index : integer) : BMenu; cdecl; external BePascalLibName name 'BMenu_SubmenuAt';
function BMenu_CountItems(AObject : TCPlusObject) : integer; cdecl; external BePascalLibName name 'BMenu_CountItems';
function BMenu_IndexOf(AObject : TCPlusObject; item : TCPlusObject) : integer; cdecl; external BePascalLibName name 'BMenu_IndexOf';
//function BMenu_IndexOf(AObject : TCPlusObject; menu : TCPlusObject) : integer; cdecl; external BePascalLibName name 'BMenu_IndexOf';
function BMenu_FindItem(AObject : TCPlusObject; command : Cardinal) : bMenuItem; cdecl; external BePascalLibName name 'BMenu_FindItem';
function BMenu_FindItem(AObject : TCPlusObject; name : PChar) : bMenuItem; cdecl; external BePascalLibName name 'BMenu_FindItem';
function BMenu_SetTargetForItems(AObject : TCPlusObject; target : TCPlusObject) : Status_t; cdecl; external BePascalLibName name 'BMenu_SetTargetForItems';
//function BMenu_SetTargetForItems(AObject : TCPlusObject; messenger : TCPlusObject) : Status_t; cdecl; external BePascalLibName name 'BMenu_SetTargetForItems';
procedure BMenu_SetEnabled(AObject : TCPlusObject; state : boolean); cdecl; external BePascalLibName name 'BMenu_SetEnabled';
procedure BMenu_SetRadioMode(AObject : TCPlusObject; state : boolean); cdecl; external BePascalLibName name 'BMenu_SetRadioMode';
procedure BMenu_SetTriggersEnabled(AObject : TCPlusObject; state : boolean); cdecl; external BePascalLibName name 'BMenu_SetTriggersEnabled';
procedure BMenu_SetMaxContentWidth(AObject : TCPlusObject; max : double); cdecl; external BePascalLibName name 'BMenu_SetMaxContentWidth';
procedure BMenu_SetLabelFromMarked(AObject : TCPlusObject; aOn : boolean); cdecl; external BePascalLibName name 'BMenu_SetLabelFromMarked';
function BMenu_IsLabelFromMarked(AObject : TCPlusObject) : boolean; cdecl; external BePascalLibName name 'BMenu_IsLabelFromMarked';
function BMenu_IsEnabled(AObject : TCPlusObject) : boolean; cdecl; external BePascalLibName name 'BMenu_IsEnabled';
function BMenu_IsRadioMode(AObject : TCPlusObject) : boolean; cdecl; external BePascalLibName name 'BMenu_IsRadioMode';
function BMenu_AreTriggersEnabled(AObject : TCPlusObject) : boolean; cdecl; external BePascalLibName name 'BMenu_AreTriggersEnabled';
function BMenu_IsRedrawAfterSticky(AObject : TCPlusObject) : boolean; cdecl; external BePascalLibName name 'BMenu_IsRedrawAfterSticky';
function BMenu_MaxContentWidth(AObject : TCPlusObject) : double; cdecl; external BePascalLibName name 'BMenu_MaxContentWidth';
function BMenu_FindMarked(AObject : TCPlusObject) : bMenuItem; cdecl; external BePascalLibName name 'BMenu_FindMarked';
function BMenu_Supermenu(AObject : TCPlusObject) : BMenu; cdecl; external BePascalLibName name 'BMenu_Supermenu';
function BMenu_Superitem(AObject : TCPlusObject) : bMenuItem; cdecl; external BePascalLibName name 'BMenu_Superitem';
procedure BMenu_MessageReceived(AObject : TCPlusObject; msg : TCPlusObject); cdecl; external BePascalLibName name 'BMenu_MessageReceived';
procedure BMenu_KeyDown(AObject : TCPlusObject; bytes : PChar; numBytes : integer); cdecl; external BePascalLibName name 'BMenu_KeyDown';
procedure BMenu_Draw(AObject : TCPlusObject; updateRect : TCPlusObject); cdecl; external BePascalLibName name 'BMenu_Draw';
procedure BMenu_GetPreferredSize(AObject : TCPlusObject; width : double; height : double); cdecl; external BePascalLibName name 'BMenu_GetPreferredSize';
procedure BMenu_ResizeToPreferred(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BMenu_ResizeToPreferred';
procedure BMenu_FrameMoved(AObject : TCPlusObject; new_position : TCPlusObject); cdecl; external BePascalLibName name 'BMenu_FrameMoved';
procedure BMenu_FrameResized(AObject : TCPlusObject; new_width : double; new_height : double); cdecl; external BePascalLibName name 'BMenu_FrameResized';
procedure BMenu_InvalidateLayout(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BMenu_InvalidateLayout';
function BMenu_ResolveSpecifier(AObject : TCPlusObject; msg : TCPlusObject; index : integer; specifier : TCPlusObject; form : integer; aProperty : PChar) : BHandler; cdecl; external BePascalLibName name 'BMenu_ResolveSpecifier';
function BMenu_GetSupportedSuites(AObject : TCPlusObject; data : TCPlusObject) : Status_t; cdecl; external BePascalLibName name 'BMenu_GetSupportedSuites';
function BMenu_Perform(AObject : TCPlusObject; d : Perform_code; arg : Pointer) : Status_t; cdecl; external BePascalLibName name 'BMenu_Perform';
procedure BMenu_MakeFocus(AObject : TCPlusObject; state : boolean); cdecl; external BePascalLibName name 'BMenu_MakeFocus';
procedure BMenu_AllAttached(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BMenu_AllAttached';
procedure BMenu_AllDetached(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BMenu_AllDetached';
function BMenu_Create(AObject : TBeObject; frame : TCPlusObject; viewName : PChar; resizeMask : Cardinal; flags : Cardinal; layout : Menu_Layout; resizeToFit : boolean) : TCPlusObject; cdecl; external BePascalLibName name 'BMenu_Create';
function BMenu_ScreenLocation(AObject : TCPlusObject) : BPoint; cdecl; external BePascalLibName name 'BMenu_ScreenLocation';
procedure BMenu_SetItemMargins(AObject : TCPlusObject; left : double; top : double; right : double; bottom : double); cdecl; external BePascalLibName name 'BMenu_SetItemMargins';
procedure BMenu_GetItemMargins(AObject : TCPlusObject; left : double; top : double; right : double; bottom : double); cdecl; external BePascalLibName name 'BMenu_GetItemMargins';
function BMenu_Layout(AObject : TCPlusObject) : Menu_Layout; cdecl; external BePascalLibName name 'BMenu_Layout';
procedure BMenu_Show(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BMenu_Show';
procedure BMenu_Show(AObject : TCPlusObject; selectFirstItem : boolean); cdecl; external BePascalLibName name 'BMenu_Show';
procedure BMenu_Hide(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BMenu_Hide';
function BMenu_Track(AObject : TCPlusObject; start_opened : boolean; special_rect : TCPlusObject) : bMenuItem; cdecl; external BePascalLibName name 'BMenu_Track';
//procedure BMenu_enum add_state { B_INITIAL_ADD, B_PROCESSING, B_ABORT }(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BMenu_enum add_state { B_INITIAL_ADD, B_PROCESSING, B_ABORT }';
function BMenu_AddDynamicItem(AObject : TCPlusObject; s : Add_State) : boolean; cdecl; external BePascalLibName name 'BMenu_AddDynamicItem';
procedure BMenu_DrawBackground(AObject : TCPlusObject; update : TCPlusObject); cdecl; external BePascalLibName name 'BMenu_DrawBackground';
procedure BMenu_SetTrackingHook(AObject : TCPlusObject; func : Menu_Tracking_Hook; state : Pointer); cdecl; external BePascalLibName name 'BMenu_SetTrackingHook';
{procedure BMenu__ReservedMenu3(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BMenu__ReservedMenu3';
procedure BMenu__ReservedMenu4(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BMenu__ReservedMenu4';
procedure BMenu__ReservedMenu5(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BMenu__ReservedMenu5';
procedure BMenu__ReservedMenu6(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BMenu__ReservedMenu6';
function BMenu_operator=(AObject : TCPlusObject;  : TMenu) : TMenu; cdecl; external BePascalLibName name 'BMenu_operator=';
procedure BMenu_InitData(AObject : TCPlusObject; data : TCPlusObject); cdecl; external BePascalLibName name 'BMenu_InitData';
function BMenu__show(AObject : TCPlusObject; selectFirstItem : boolean) : boolean; cdecl; external BePascalLibName name 'BMenu__show';
procedure BMenu__hide(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BMenu__hide';
function BMenu__track(AObject : TCPlusObject; action : integer; start : integer) : bMenuItem; cdecl; external BePascalLibName name 'BMenu__track';
function BMenu__AddItem(AObject : TCPlusObject; item : TCPlusObject; index : integer) : boolean; cdecl; external BePascalLibName name 'BMenu__AddItem';
function BMenu_RemoveItems(AObject : TCPlusObject; index : integer; count : integer; item : TCPlusObject; del : boolean) : boolean; cdecl; external BePascalLibName name 'BMenu_RemoveItems';
procedure BMenu_LayoutItems(AObject : TCPlusObject; index : integer); cdecl; external BePascalLibName name 'BMenu_LayoutItems';
procedure BMenu_ComputeLayout(AObject : TCPlusObject; index : integer; bestFit : boolean; moveItems : boolean; width : double; height : double); cdecl; external BePascalLibName name 'BMenu_ComputeLayout';
function BMenu_Bump(AObject : TCPlusObject; current : TCPlusObject; extent : TCPlusObject; index : integer) : BRect; cdecl; external BePascalLibName name 'BMenu_Bump';
function BMenu_ItemLocInRect(AObject : TCPlusObject; frame : TCPlusObject) : BPoint; cdecl; external BePascalLibName name 'BMenu_ItemLocInRect';
function BMenu_CalcFrame(AObject : TCPlusObject; where : TCPlusObject; scrollOn : boolean) : BRect; cdecl; external BePascalLibName name 'BMenu_CalcFrame';
function BMenu_ScrollMenu(AObject : TCPlusObject; bounds : TCPlusObject; loc : TCPlusObject; fast : boolean) : boolean; cdecl; external BePascalLibName name 'BMenu_ScrollMenu';
procedure BMenu_ScrollIntoView(AObject : TCPlusObject; item : TCPlusObject); cdecl; external BePascalLibName name 'BMenu_ScrollIntoView';
procedure BMenu_DrawItems(AObject : TCPlusObject; updateRect : TCPlusObject); cdecl; external BePascalLibName name 'BMenu_DrawItems';
function BMenu_State(AObject : TCPlusObject; item : TCPlusObject) : integer; cdecl; external BePascalLibName name 'BMenu_State';
procedure BMenu_InvokeItem(AObject : TCPlusObject; item : TCPlusObject; now : boolean); cdecl; external BePascalLibName name 'BMenu_InvokeItem';
function BMenu_OverSuper(AObject : TCPlusObject; loc : TCPlusObject) : boolean; cdecl; external BePascalLibName name 'BMenu_OverSuper';
function BMenu_OverSubmenu(AObject : TCPlusObject; item : TCPlusObject; loc : TCPlusObject) : boolean; cdecl; external BePascalLibName name 'BMenu_OverSubmenu';
function BMenu_MenuWindow(AObject : TCPlusObject) : TMenuWindow; cdecl; external BePascalLibName name 'BMenu_MenuWindow';
procedure BMenu_DeleteMenuWindow(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BMenu_DeleteMenuWindow';
function BMenu_HitTestItems(AObject : TCPlusObject; where : TCPlusObject; slop : TCPlusObject) : bMenuItem; cdecl; external BePascalLibName name 'BMenu_HitTestItems';
function BMenu_Superbounds(AObject : TCPlusObject) : BRect; cdecl; external BePascalLibName name 'BMenu_Superbounds';
procedure BMenu_CacheFontInfo(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BMenu_CacheFontInfo';
procedure BMenu_ItemMarked(AObject : TCPlusObject; item : TCPlusObject); cdecl; external BePascalLibName name 'BMenu_ItemMarked';
procedure BMenu_Install(AObject : TCPlusObject; target : TCPlusObject); cdecl; external BePascalLibName name 'BMenu_Install';
procedure BMenu_Uninstall(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BMenu_Uninstall';
procedure BMenu_SelectItem(AObject : TCPlusObject; m : TCPlusObject; showSubmenu : Cardinal; selectFirstItem : boolean); cdecl; external BePascalLibName name 'BMenu_SelectItem';
function BMenu_CurrentSelection(AObject : TCPlusObject) : bMenuItem; cdecl; external BePascalLibName name 'BMenu_CurrentSelection';
function BMenu_SelectNextItem(AObject : TCPlusObject; item : TCPlusObject; forward : boolean) : boolean; cdecl; external BePascalLibName name 'BMenu_SelectNextItem';
function BMenu_NextItem(AObject : TCPlusObject; item : TCPlusObject; forward : boolean) : bMenuItem; cdecl; external BePascalLibName name 'BMenu_NextItem';
function BMenu_IsItemVisible(AObject : TCPlusObject; item : TCPlusObject) : boolean; cdecl; external BePascalLibName name 'BMenu_IsItemVisible';
procedure BMenu_SetIgnoreHidden(AObject : TCPlusObject; on : boolean); cdecl; external BePascalLibName name 'BMenu_SetIgnoreHidden';
procedure BMenu_SetStickyMode(AObject : TCPlusObject; on : boolean); cdecl; external BePascalLibName name 'BMenu_SetStickyMode';
function BMenu_IsStickyMode(AObject : TCPlusObject) : boolean; cdecl; external BePascalLibName name 'BMenu_IsStickyMode';
procedure BMenu_CalcTriggers(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BMenu_CalcTriggers';
function BMenu_ChooseTrigger(AObject : TCPlusObject; title : PChar; chars : TCPlusObject) : PChar; cdecl; external BePascalLibName name 'BMenu_ChooseTrigger';
procedure BMenu_UpdateWindowViewSize(AObject : TCPlusObject; upWind : boolean); cdecl; external BePascalLibName name 'BMenu_UpdateWindowViewSize';
function BMenu_IsStickyPrefOn(AObject : TCPlusObject) : boolean; cdecl; external BePascalLibName name 'BMenu_IsStickyPrefOn';
procedure BMenu_RedrawAfterSticky(AObject : TCPlusObject; bounds : TCPlusObject); cdecl; external BePascalLibName name 'BMenu_RedrawAfterSticky';
function BMenu_OkToProceed(AObject : TCPlusObject;  : TCPlusObject) : boolean; cdecl; external BePascalLibName name 'BMenu_OkToProceed';
function BMenu_ParseMsg(AObject : TCPlusObject; msg : TCPlusObject; sindex : ^integer; spec : TCPlusObject; form : ^integer; prop : PChar; tmenu : TCPlusObject; titem : TCPlusObject; user_data : ^integer; reply : TCPlusObject) : Status_t; cdecl; external BePascalLibName name 'BMenu_ParseMsg';
function BMenu_DoMenuMsg(AObject : TCPlusObject; next : TCPlusObject; tar : TCPlusObject; m : TCPlusObject; r : TCPlusObject; spec : TCPlusObject; f : integer) : Status_t; cdecl; external BePascalLibName name 'BMenu_DoMenuMsg';
function BMenu_DoMenuItemMsg(AObject : TCPlusObject; next : TCPlusObject; tar : TCPlusObject; m : TCPlusObject; r : TCPlusObject; spec : TCPlusObject; f : integer) : Status_t; cdecl; external BePascalLibName name 'BMenu_DoMenuItemMsg';
function BMenu_DoEnabledMsg(AObject : TCPlusObject; ti : TCPlusObject; tm : TCPlusObject; m : TCPlusObject; r : TCPlusObject) : Status_t; cdecl; external BePascalLibName name 'BMenu_DoEnabledMsg';
function BMenu_DoLabelMsg(AObject : TCPlusObject; ti : TCPlusObject; tm : TCPlusObject; m : TCPlusObject; r : TCPlusObject) : Status_t; cdecl; external BePascalLibName name 'BMenu_DoLabelMsg';
function BMenu_DoMarkMsg(AObject : TCPlusObject; ti : TCPlusObject; tm : TCPlusObject; m : TCPlusObject; r : TCPlusObject) : Status_t; cdecl; external BePascalLibName name 'BMenu_DoMarkMsg';
function BMenu_DoDeleteMsg(AObject : TCPlusObject; ti : TCPlusObject; tm : TCPlusObject; m : TCPlusObject; r : TCPlusObject) : Status_t; cdecl; external BePascalLibName name 'BMenu_DoDeleteMsg';
function BMenu_DoCreateMsg(AObject : TCPlusObject; ti : TCPlusObject; tm : TCPlusObject; m : TCPlusObject; r : TCPlusObject; menu : boolean) : Status_t; cdecl; external BePascalLibName name 'BMenu_DoCreateMsg';
procedure BMenu_menu_info sMenuInfo(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BMenu_menu_info sMenuInfo';
procedure BMenu_bool sSwapped(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BMenu_bool sSwapped';
procedure BMenu_BMenuItem *fChosenItem(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BMenu_BMenuItem *fChosenItem';
procedure BMenu_BList fItems(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BMenu_BList fItems';
procedure BMenu_BRect fPad(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BMenu_BRect fPad';
procedure BMenu_BMenuItem *fSelected(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BMenu_BMenuItem *fSelected';
procedure BMenu_BMenuWindow *fCachedMenuWindow(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BMenu_BMenuWindow *fCachedMenuWindow';
procedure BMenu_BMenu *fSuper(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BMenu_BMenu *fSuper';
procedure BMenu_BMenuItem *fSuperitem(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BMenu_BMenuItem *fSuperitem';
procedure BMenu_BRect fSuperbounds(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BMenu_BRect fSuperbounds';
procedure BMenu_float fAscent(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BMenu_float fAscent';
procedure BMenu_float fDescent(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BMenu_float fDescent';
procedure BMenu_float fFontHeight(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BMenu_float fFontHeight';
procedure BMenu_uint32 fState(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BMenu_uint32 fState';
procedure BMenu_menu_layout fLayout(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BMenu_menu_layout fLayout';
procedure BMenu_BRect *fExtraRect(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BMenu_BRect *fExtraRect';
procedure BMenu_float fMaxContentWidth(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BMenu_float fMaxContentWidth';
procedure BMenu_BPoint *fInitMatrixSize(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BMenu_BPoint *fInitMatrixSize';
procedure BMenu__ExtraMenuData_ *fExtraMenuData(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BMenu__ExtraMenuData_ *fExtraMenuData';
procedure BMenu_uint32 _reserved[2](AObject : TCPlusObject); cdecl; external BePascalLibName name 'BMenu_uint32 _reserved[2]';
procedure BMenu_char fTrigger(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BMenu_char fTrigger';
procedure BMenu_bool fResizeToFit(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BMenu_bool fResizeToFit';
procedure BMenu_bool fUseCachedMenuLayout(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BMenu_bool fUseCachedMenuLayout';
procedure BMenu_bool fEnabled(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BMenu_bool fEnabled';
procedure BMenu_bool fDynamicName(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BMenu_bool fDynamicName';
procedure BMenu_bool fRadioMode(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BMenu_bool fRadioMode';
procedure BMenu_bool fTrackNewBounds(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BMenu_bool fTrackNewBounds';
procedure BMenu_bool fStickyMode(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BMenu_bool fStickyMode';
procedure BMenu_bool fIgnoreHidden(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BMenu_bool fIgnoreHidden';
procedure BMenu_bool fTriggerEnabled(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BMenu_bool fTriggerEnabled';
procedure BMenu_bool fRedrawAfterSticky(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BMenu_bool fRedrawAfterSticky';
procedure BMenu_bool fAttachAborted(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BMenu_bool fAttachAborted';
}
//-----------------------------------

//procedure menu_info_float font_size(AObject : TCPlusObject); cdecl; external BePascalLibName name 'menu_info_float font_size';
//procedure menu_info_font_family f_family(AObject : TCPlusObject); cdecl; external BePascalLibName name 'menu_info_font_family f_family';
//procedure menu_info_font_style f_style(AObject : TCPlusObject); cdecl; external BePascalLibName name 'menu_info_font_style f_style';
//procedure menu_info_rgb_color background_color(AObject : TCPlusObject); cdecl; external BePascalLibName name 'menu_info_rgb_color background_color';
//procedure menu_info_int32 separator(AObject : TCPlusObject); cdecl; external BePascalLibName name 'menu_info_int32 separator';
//procedure menu_info_bool click_to_open(AObject : TCPlusObject); cdecl; external BePascalLibName name 'menu_info_bool click_to_open';
//procedure menu_info_bool triggers_always_shown(AObject : TCPlusObject); cdecl; external BePascalLibName name 'menu_info_bool triggers_always_shown';
{function BMenu_Create(AObject : TBeObject) : TCPlusObject; cdecl; external BePascalLibName name 'BMenu_Create';
function BMenu_Create(AObject : TBeObject; title : PChar; width : double; height : double) : TCPlusObject; cdecl; external BePascalLibName name 'BMenu_Create';
procedure BMenu_Free(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BMenu_Free';
function BMenu_Create(AObject : TBeObject; data : TCPlusObject) : TCPlusObject; cdecl; external BePascalLibName name 'BMenu_Create';
function BMenu_Instantiate(AObject : TCPlusObject; data : TCPlusObject) : BArchivable; cdecl; external BePascalLibName name 'BMenu_Instantiate';
function BMenu_Archive(AObject : TCPlusObject; data : TCPlusObject; deep : boolean) : Status_t; cdecl; external BePascalLibName name 'BMenu_Archive';
procedure BMenu_AttachedToWindow(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BMenu_AttachedToWindow';
procedure BMenu_DetachedFromWindow(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BMenu_DetachedFromWindow';
function BMenu_AddItem(AObject : TCPlusObject; item : TCPlusObject) : boolean; cdecl; external BePascalLibName name 'BMenu_AddItem';
function BMenu_AddItem(AObject : TCPlusObject; item : TCPlusObject; index : integer) : boolean; cdecl; external BePascalLibName name 'BMenu_AddItem';
function BMenu_AddItem(AObject : TCPlusObject; item : TCPlusObject; frame : TCPlusObject) : boolean; cdecl; external BePascalLibName name 'BMenu_AddItem';
}
//function BMenu_AddItem(AObject : TCPlusObject; menu : TCPlusObject) : boolean; cdecl; external BePascalLibName name 'BMenu_AddItem';
//function BMenu_AddItem(AObject : TCPlusObject; menu : TCPlusObject; index : integer) : boolean; cdecl; external BePascalLibName name 'BMenu_AddItem';
//function BMenu_AddItem(AObject : TCPlusObject; menu : TCPlusObject; frame : TCPlusObject) : boolean; cdecl; external BePascalLibName name 'BMenu_AddItem';
{function BMenu_AddList(AObject : TCPlusObject; list : BList; index : integer) : boolean; cdecl; external BePascalLibName name 'BMenu_AddList';
function BMenu_AddSeparatorItem(AObject : TCPlusObject) : boolean; cdecl; external BePascalLibName name 'BMenu_AddSeparatorItem';
function BMenu_RemoveItem(AObject : TCPlusObject; item : bMenuItem) : boolean; cdecl; external BePascalLibName name 'BMenu_RemoveItem';
function BMenu_RemoveItem(AObject : TCPlusObject; index : integer) : bMenuItem; cdecl; external BePascalLibName name 'BMenu_RemoveItem';
function BMenu_RemoveItems(AObject : TCPlusObject; index : integer; count : integer; del : boolean) : boolean; cdecl; external BePascalLibName name 'BMenu_RemoveItems';
function BMenu_RemoveItem(AObject : TCPlusObject; menu : BMenu) : boolean; cdecl; external BePascalLibName name 'BMenu_RemoveItem';
function BMenu_ItemAt(AObject : TCPlusObject; index : integer) : bMenuItem; cdecl; external BePascalLibName name 'BMenu_ItemAt';
function BMenu_SubmenuAt(AObject : TCPlusObject; index : integer) : BMenu; cdecl; external BePascalLibName name 'BMenu_SubmenuAt';
function BMenu_CountItems(AObject : TCPlusObject) : integer; cdecl; external BePascalLibName name 'BMenu_CountItems';
function BMenu_IndexOf(AObject : TCPlusObject; item : bMenuItem) : integer; cdecl; external BePascalLibName name 'BMenu_IndexOf';
function BMenu_IndexOf(AObject : TCPlusObject; menu : BMenu) : integer; cdecl; external BePascalLibName name 'BMenu_IndexOf';
function BMenu_FindItem(AObject : TCPlusObject; command : Cardinal) : bMenuItem; cdecl; external BePascalLibName name 'BMenu_FindItem';
function BMenu_FindItem(AObject : TCPlusObject; name : PChar) : bMenuItem; cdecl; external BePascalLibName name 'BMenu_FindItem';
function BMenu_SetTargetForItems(AObject : TCPlusObject; target : BHandler) : Status_t; cdecl; external BePascalLibName name 'BMenu_SetTargetForItems';
function BMenu_SetTargetForItems(AObject : TCPlusObject; messenger : TMessenger) : Status_t; cdecl; external BePascalLibName name 'BMenu_SetTargetForItems';
procedure BMenu_SetEnabled(AObject : TCPlusObject; state : boolean); cdecl; external BePascalLibName name 'BMenu_SetEnabled';
procedure BMenu_SetRadioMode(AObject : TCPlusObject; state : boolean); cdecl; external BePascalLibName name 'BMenu_SetRadioMode';
procedure BMenu_SetTriggersEnabled(AObject : TCPlusObject; state : boolean); cdecl; external BePascalLibName name 'BMenu_SetTriggersEnabled';
procedure BMenu_SetMaxContentWidth(AObject : TCPlusObject; max : double); cdecl; external BePascalLibName name 'BMenu_SetMaxContentWidth';
procedure BMenu_SetLabelFromMarked(AObject : TCPlusObject; aOn : boolean); cdecl; external BePascalLibName name 'BMenu_SetLabelFromMarked';
function BMenu_IsLabelFromMarked(AObject : TCPlusObject) : boolean; cdecl; external BePascalLibName name 'BMenu_IsLabelFromMarked';
function BMenu_IsEnabled(AObject : TCPlusObject) : boolean; cdecl; external BePascalLibName name 'BMenu_IsEnabled';
function BMenu_IsRadioMode(AObject : TCPlusObject) : boolean; cdecl; external BePascalLibName name 'BMenu_IsRadioMode';
function BMenu_AreTriggersEnabled(AObject : TCPlusObject) : boolean; cdecl; external BePascalLibName name 'BMenu_AreTriggersEnabled';
function BMenu_IsRedrawAfterSticky(AObject : TCPlusObject) : boolean; cdecl; external BePascalLibName name 'BMenu_IsRedrawAfterSticky';
function BMenu_MaxContentWidth(AObject : TCPlusObject) : double; cdecl; external BePascalLibName name 'BMenu_MaxContentWidth';
function BMenu_FindMarked(AObject : TCPlusObject) : bMenuItem; cdecl; external BePascalLibName name 'BMenu_FindMarked';
function BMenu_Supermenu(AObject : TCPlusObject) : BMenu; cdecl; external BePascalLibName name 'BMenu_Supermenu';
function BMenu_Superitem(AObject : TCPlusObject) : bMenuItem; cdecl; external BePascalLibName name 'BMenu_Superitem';
procedure BMenu_MessageReceived(AObject : TCPlusObject; msg : BMessage); cdecl; external BePascalLibName name 'BMenu_MessageReceived';
procedure BMenu_KeyDown(AObject : TCPlusObject; bytes : PChar; numBytes : integer); cdecl; external BePascalLibName name 'BMenu_KeyDown';
procedure BMenu_Draw(AObject : TCPlusObject; updateRect : BRect); cdecl; external BePascalLibName name 'BMenu_Draw';
procedure BMenu_GetPreferredSize(AObject : TCPlusObject; width : double; height : double); cdecl; external BePascalLibName name 'BMenu_GetPreferredSize';
procedure BMenu_ResizeToPreferred(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BMenu_ResizeToPreferred';
procedure BMenu_FrameMoved(AObject : TCPlusObject; new_position : BPoint); cdecl; external BePascalLibName name 'BMenu_FrameMoved';
procedure BMenu_FrameResized(AObject : TCPlusObject; new_width : double; new_height : double); cdecl; external BePascalLibName name 'BMenu_FrameResized';
procedure BMenu_InvalidateLayout(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BMenu_InvalidateLayout';
function BMenu_ResolveSpecifier(AObject : TCPlusObject; msg : BMessage; index : integer; specifier : BMessage; form : integer; aProperty : PChar) : BHandler; cdecl; external BePascalLibName name 'BMenu_ResolveSpecifier';
function BMenu_GetSupportedSuites(AObject : TCPlusObject; data : BMessage) : Status_t; cdecl; external BePascalLibName name 'BMenu_GetSupportedSuites';
function BMenu_Perform(AObject : TCPlusObject; d : BPerform_code; arg : Pointer) : Status_t; cdecl; external BePascalLibName name 'BMenu_Perform';
procedure BMenu_MakeFocus(AObject : TCPlusObject; state : boolean); cdecl; external BePascalLibName name 'BMenu_MakeFocus';
procedure BMenu_AllAttached(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BMenu_AllAttached';
procedure BMenu_AllDetached(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BMenu_AllDetached';
function BMenu_Create(AObject : TBeObject; frame : BRect; viewName : PChar; resizeMask : Cardinal; flags : Cardinal; layout : TMenu_Layout; resizeToFit : boolean) : TCPlusObject; cdecl; external BePascalLibName name 'BMenu_Create';
function BMenu_ScreenLocation(AObject : TCPlusObject) : BPoint; cdecl; external BePascalLibName name 'BMenu_ScreenLocation';
procedure BMenu_SetItemMargins(AObject : TCPlusObject; left : double; top : double; right : double; bottom : double); cdecl; external BePascalLibName name 'BMenu_SetItemMargins';
procedure BMenu_GetItemMargins(AObject : TCPlusObject; left : double; top : double; right : double; bottom : double); cdecl; external BePascalLibName name 'BMenu_GetItemMargins';
function BMenu_Layout(AObject : TCPlusObject) : TMenu_Layout; cdecl; external BePascalLibName name 'BMenu_Layout';
procedure BMenu_Show(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BMenu_Show';
procedure BMenu_Show(AObject : TCPlusObject; selectFirstItem : boolean); cdecl; external BePascalLibName name 'BMenu_Show';
procedure BMenu_Hide(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BMenu_Hide';
function BMenu_Track(AObject : TCPlusObject; start_opened : boolean; special_rect : BRect) : bMenuItem; cdecl; external BePascalLibName name 'BMenu_Track';
}
//procedure BMenu_enum add_state { B_INITIAL_ADD, B_PROCESSING, B_ABORT }(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BMenu_enum add_state { B_INITIAL_ADD, B_PROCESSING, B_ABORT }';
{function BMenu_AddDynamicItem(AObject : TCPlusObject; s : TAdd_State) : boolean; cdecl; external BePascalLibName name 'BMenu_AddDynamicItem';
procedure BMenu_DrawBackground(AObject : TCPlusObject; update : BRect); cdecl; external BePascalLibName name 'BMenu_DrawBackground';
procedure BMenu_SetTrackingHook(AObject : TCPlusObject; func : TMenu_Tracking_Hook; state : Pointer); cdecl; external BePascalLibName name 'BMenu_SetTrackingHook';
procedure BMenu__ReservedMenu3(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BMenu__ReservedMenu3';
procedure BMenu__ReservedMenu4(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BMenu__ReservedMenu4';
procedure BMenu__ReservedMenu5(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BMenu__ReservedMenu5';
procedure BMenu__ReservedMenu6(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BMenu__ReservedMenu6';
function BMenu_operator=(AObject : TCPlusObject;  : BMenu) : BMenu; cdecl; external BePascalLibName name 'BMenu_operator=';
procedure BMenu_InitData(AObject : TCPlusObject; data : BMessage); cdecl; external BePascalLibName name 'BMenu_InitData';
function BMenu__show(AObject : TCPlusObject; selectFirstItem : boolean) : boolean; cdecl; external BePascalLibName name 'BMenu__show';
procedure BMenu__hide(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BMenu__hide';
function BMenu__track(AObject : TCPlusObject; action : integer; start : integer) : bMenuItem; cdecl; external BePascalLibName name 'BMenu__track';
function BMenu__AddItem(AObject : TCPlusObject; item : bMenuItem; index : integer) : boolean; cdecl; external BePascalLibName name 'BMenu__AddItem';
function BMenu_RemoveItems(AObject : TCPlusObject; index : integer; count : integer; item : bMenuItem; del : boolean) : boolean; cdecl; external BePascalLibName name 'BMenu_RemoveItems';
procedure BMenu_LayoutItems(AObject : TCPlusObject; index : integer); cdecl; external BePascalLibName name 'BMenu_LayoutItems';
procedure BMenu_ComputeLayout(AObject : TCPlusObject; index : integer; bestFit : boolean; moveItems : boolean; width : double; height : double); cdecl; external BePascalLibName name 'BMenu_ComputeLayout';
function BMenu_Bump(AObject : TCPlusObject; current : BRect; extent : BPoint; index : integer) : BRect; cdecl; external BePascalLibName name 'BMenu_Bump';
function BMenu_ItemLocInRect(AObject : TCPlusObject; frame : BRect) : BPoint; cdecl; external BePascalLibName name 'BMenu_ItemLocInRect';
function BMenu_CalcFrame(AObject : TCPlusObject; where : BPoint; scrollOn : boolean) : BRect; cdecl; external BePascalLibName name 'BMenu_CalcFrame';
function BMenu_ScrollMenu(AObject : TCPlusObject; bounds : BRect; loc : BPoint; fast : boolean) : boolean; cdecl; external BePascalLibName name 'BMenu_ScrollMenu';
procedure BMenu_ScrollIntoView(AObject : TCPlusObject; item : bMenuItem); cdecl; external BePascalLibName name 'BMenu_ScrollIntoView';
procedure BMenu_DrawItems(AObject : TCPlusObject; updateRect : BRect); cdecl; external BePascalLibName name 'BMenu_DrawItems';
function BMenu_State(AObject : TCPlusObject; item : bMenuItem) : integer; cdecl; external BePascalLibName name 'BMenu_State';
procedure BMenu_InvokeItem(AObject : TCPlusObject; item : bMenuItem; now : boolean); cdecl; external BePascalLibName name 'BMenu_InvokeItem';
function BMenu_OverSuper(AObject : TCPlusObject; loc : BPoint) : boolean; cdecl; external BePascalLibName name 'BMenu_OverSuper';
function BMenu_OverSubmenu(AObject : TCPlusObject; item : bMenuItem; loc : BPoint) : boolean; cdecl; external BePascalLibName name 'BMenu_OverSubmenu';
function BMenu_MenuWindow(AObject : TCPlusObject) : TMenuWindow; cdecl; external BePascalLibName name 'BMenu_MenuWindow';
procedure BMenu_DeleteMenuWindow(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BMenu_DeleteMenuWindow';
function BMenu_HitTestItems(AObject : TCPlusObject; where : BPoint; slop : BPoint) : bMenuItem; cdecl; external BePascalLibName name 'BMenu_HitTestItems';
function BMenu_Superbounds(AObject : TCPlusObject) : BRect; cdecl; external BePascalLibName name 'BMenu_Superbounds';
procedure BMenu_CacheFontInfo(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BMenu_CacheFontInfo';
procedure BMenu_ItemMarked(AObject : TCPlusObject; item : bMenuItem); cdecl; external BePascalLibName name 'BMenu_ItemMarked';
procedure BMenu_Install(AObject : TCPlusObject; target : TWindow); cdecl; external BePascalLibName name 'BMenu_Install';
procedure BMenu_Uninstall(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BMenu_Uninstall';
procedure BMenu_SelectItem(AObject : TCPlusObject; m : bMenuItem; showSubmenu : Cardinal; selectFirstItem : boolean); cdecl; external BePascalLibName name 'BMenu_SelectItem';
function BMenu_CurrentSelection(AObject : TCPlusObject) : bMenuItem; cdecl; external BePascalLibName name 'BMenu_CurrentSelection';
function BMenu_SelectNextItem(AObject : TCPlusObject; item : bMenuItem; forward : boolean) : boolean; cdecl; external BePascalLibName name 'BMenu_SelectNextItem';
function BMenu_NextItem(AObject : TCPlusObject; item : bMenuItem; forward : boolean) : bMenuItem; cdecl; external BePascalLibName name 'BMenu_NextItem';
function BMenu_IsItemVisible(AObject : TCPlusObject; item : bMenuItem) : boolean; cdecl; external BePascalLibName name 'BMenu_IsItemVisible';
procedure BMenu_SetIgnoreHidden(AObject : TCPlusObject; aOn : boolean); cdecl; external BePascalLibName name 'BMenu_SetIgnoreHidden';
procedure BMenu_SetStickyMode(AObject : TCPlusObject; aOn : boolean); cdecl; external BePascalLibName name 'BMenu_SetStickyMode';
function BMenu_IsStickyMode(AObject : TCPlusObject) : boolean; cdecl; external BePascalLibName name 'BMenu_IsStickyMode';
procedure BMenu_CalcTriggers(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BMenu_CalcTriggers';
function BMenu_ChooseTrigger(AObject : TCPlusObject; title : PChar; chars : BList) : PChar; cdecl; external BePascalLibName name 'BMenu_ChooseTrigger';
procedure BMenu_UpdateWindowViewSize(AObject : TCPlusObject; upWind : boolean); cdecl; external BePascalLibName name 'BMenu_UpdateWindowViewSize';
function BMenu_IsStickyPrefOn(AObject : TCPlusObject) : boolean; cdecl; external BePascalLibName name 'BMenu_IsStickyPrefOn';
procedure BMenu_RedrawAfterSticky(AObject : TCPlusObject; bounds : BRect); cdecl; external BePascalLibName name 'BMenu_RedrawAfterSticky';
function BMenu_OkToProceed(AObject : TCPlusObject;  : bMenuItem) : boolean; cdecl; external BePascalLibName name 'BMenu_OkToProceed';
function BMenu_ParseMsg(AObject : TCPlusObject; msg : BMessage; sindex : ^integer; spec : BMessage; form : ^integer; prop : PChar; BMenu : TMenu; titem : bMenuItem; user_data : ^integer; reply : BMessage) : Status_t; cdecl; external BePascalLibName name 'BMenu_ParseMsg';
function BMenu_DoMenuMsg(AObject : TCPlusObject; next : bMenuItem; tar : BMenu; m : BMessage; r : BMessage; spec : BMessage; f : integer) : Status_t; cdecl; external BePascalLibName name 'BMenu_DoMenuMsg';
function BMenu_DoMenuItemMsg(AObject : TCPlusObject; next : bMenuItem; tar : BMenu; m : BMessage; r : BMessage; spec : BMessage; f : integer) : Status_t; cdecl; external BePascalLibName name 'BMenu_DoMenuItemMsg';
function BMenu_DoEnabledMsg(AObject : TCPlusObject; ti : bMenuItem; tm : BMenu; m : BMessage; r : BMessage) : Status_t; cdecl; external BePascalLibName name 'BMenu_DoEnabledMsg';
function BMenu_DoLabelMsg(AObject : TCPlusObject; ti : bMenuItem; tm : BMenu; m : BMessage; r : BMessage) : Status_t; cdecl; external BePascalLibName name 'BMenu_DoLabelMsg';
function BMenu_DoMarkMsg(AObject : TCPlusObject; ti : bMenuItem; tm : BMenu; m : BMessage; r : BMessage) : Status_t; cdecl; external BePascalLibName name 'BMenu_DoMarkMsg';
function BMenu_DoDeleteMsg(AObject : TCPlusObject; ti : bMenuItem; tm : BMenu; m : BMessage; r : BMessage) : Status_t; cdecl; external BePascalLibName name 'BMenu_DoDeleteMsg';
function BMenu_DoCreateMsg(AObject : TCPlusObject; ti : bMenuItem; tm : BMenu; m : BMessage; r : BMessage; menu : boolean) : Status_t; cdecl; external BePascalLibName name 'BMenu_DoCreateMsg';
procedure BMenu_menu_info sMenuInfo(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BMenu_menu_info sMenuInfo';
procedure BMenu_bool sSwapped(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BMenu_bool sSwapped';
procedure BMenu_BMenuItem *fChosenItem(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BMenu_BMenuItem *fChosenItem';
procedure BMenu_BList fItems(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BMenu_BList fItems';
procedure BMenu_BRect fPad(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BMenu_BRect fPad';
procedure BMenu_BMenuItem *fSelected(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BMenu_BMenuItem *fSelected';
procedure BMenu_BMenuWindow *fCachedMenuWindow(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BMenu_BMenuWindow *fCachedMenuWindow';
procedure BMenu_BMenu *fSuper(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BMenu_BMenu *fSuper';
procedure BMenu_BMenuItem *fSuperitem(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BMenu_BMenuItem *fSuperitem';
procedure BMenu_BRect fSuperbounds(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BMenu_BRect fSuperbounds';
procedure BMenu_float fAscent(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BMenu_float fAscent';
procedure BMenu_float fDescent(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BMenu_float fDescent';
procedure BMenu_float fFontHeight(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BMenu_float fFontHeight';
procedure BMenu_uint32 fState(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BMenu_uint32 fState';
procedure BMenu_menu_layout fLayout(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BMenu_menu_layout fLayout';
procedure BMenu_BRect *fExtraRect(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BMenu_BRect *fExtraRect';
procedure BMenu_float fMaxContentWidth(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BMenu_float fMaxContentWidth';
procedure BMenu_BPoint *fInitMatrixSize(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BMenu_BPoint *fInitMatrixSize';
procedure BMenu__ExtraMenuData_ *fExtraMenuData(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BMenu__ExtraMenuData_ *fExtraMenuData';
procedure BMenu_uint32 _reserved[2](AObject : TCPlusObject); cdecl; external BePascalLibName name 'BMenu_uint32 _reserved[2]';
procedure BMenu_char fTrigger(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BMenu_char fTrigger';
procedure BMenu_bool fResizeToFit(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BMenu_bool fResizeToFit';
procedure BMenu_bool fUseCachedMenuLayout(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BMenu_bool fUseCachedMenuLayout';
procedure BMenu_bool fEnabled(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BMenu_bool fEnabled';
procedure BMenu_bool fDynamicName(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BMenu_bool fDynamicName';
procedure BMenu_bool fRadioMode(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BMenu_bool fRadioMode';
procedure BMenu_bool fTrackNewBounds(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BMenu_bool fTrackNewBounds';
procedure BMenu_bool fStickyMode(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BMenu_bool fStickyMode';
procedure BMenu_bool fIgnoreHidden(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BMenu_bool fIgnoreHidden';
procedure BMenu_bool fTriggerEnabled(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BMenu_bool fTriggerEnabled';
procedure BMenu_bool fRedrawAfterSticky(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BMenu_bool fRedrawAfterSticky';
procedure BMenu_bool fAttachAborted(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BMenu_bool fAttachAborted';
}

implementation

{procedure PMenu_Info.float font_size;
begin
  menu_info_float font_size(CPlusObject);
end;

procedure PMenu_Info.font_family f_family;
begin
  menu_info_font_family f_family(CPlusObject);
end;

procedure PMenu_Info.font_style f_style;
begin
  menu_info_font_style f_style(CPlusObject);
end;

procedure PMenu_Info.rgb_color background_color;
begin
  menu_info_rgb_color background_color(CPlusObject);
end;

procedure PMenu_Info.int32 separator;
begin
  menu_info_int32 separator(CPlusObject);
end;

procedure PMenu_Info.bool click_to_open;
begin
  menu_info_bool click_to_open(CPlusObject);
end;

procedure PMenu_Info.bool triggers_always_shown;
begin
  menu_info_bool triggers_always_shown(CPlusObject);
end;
}
{constructor BMenu.Create;
begin
  CPlusObject := BMenu_Create_0(Self);
end;
}

constructor BMenu.Create(title : PChar; width : double; height : double);
begin
  CPlusObject := BMenu_Create(Self, title, width, height);
end;

constructor BMenu.Create(title : PChar; layout : Menu_Layout);
begin
//  CPlusObject := BMenu_Create(Self, title, 0);

  case layout of
    B_ITEMS_IN_ROW : CPlusObject := BMenu_Create(Self, title, 0);
    B_ITEMS_IN_COLUMN : CPlusObject := BMenu_Create(Self, title, 1);
    B_ITEMS_IN_MATRIX : CPlusObject := BMenu_Create(Self, title, 2);
  end;
end;


destructor BMenu.Destroy;
begin
  BMenu_Free(CPlusObject);
end;

{constructor BMenu.Create(data : BMessage);
begin
  CPlusObject := BMenu_Create(Self, data.CPlusObject);
end;
}

function BMenu.Instantiate(data : BMessage) : BArchivable;
begin
  Result := BMenu_Instantiate(CPlusObject, data.CPlusObject);
end;

function BMenu.Archive(data : BMessage; deep : boolean) : Status_t;
begin
  Result := BMenu_Archive(CPlusObject, data.CPlusObject, deep);
end;

procedure BMenu.AttachedToWindow;
begin
//  BMenu_AttachedToWindow(CPlusObject);
end;

procedure BMenu.DetachedFromWindow;
begin
//  BMenu_DetachedFromWindow(CPlusObject);
end;


function BMenu.AddItem(item : bMenuItem) : boolean;
begin
  SendText('function BMenu.AddItem(item : bMenuItem) : boolean;');
  Result := BMenu_AddItem_1(CPlusObject, item.CPlusObject);
end;

function BMenu.AddItem(item : bMenuItem; index : integer) : boolean;
begin
  SendText('function BMenu.AddItem(item : bMenuItem; index : integer) : boolean;');
  Result := BMenu_AddItem_2(CPlusObject, item.CPlusObject, index);
end;

function BMenu.AddItem(item : bMenuItem; aframe : BRect) : boolean;
begin
  SendText('ici');
  SendText('function BMenu.AddItem(item : bMenuItem; frame : BRect) : boolean;');
  frame.PrintToStream;
  SendText('toto');
  Result := BMenu_AddItem_3(CPlusObject, item.CPlusObject, aframe.CPlusObject);
end;

function BMenu.AddItem(menu : BMenu) : boolean;
begin
  SendText('function BMenu.AddItem(menu : BMenu) : boolean;');
  SendText('Bonjour');
  Result := BMenu_AddItem_4(CPlusObject, menu.CPlusObject);
end;

function BMenu.AddItem(menu : BMenu; index : integer) : boolean;
begin
  SendText('function BMenu.AddItem(menu : BMenu; index : integer) : boolean;');
  Result := BMenu_AddItem_5(CPlusObject, menu.CPlusObject, index);
end;

function BMenu.AddItem(menu : BMenu; aframe : BRect) : boolean;
begin
  SendText('function BMenu.AddItem(menu : BMenu; frame : BRect) : boolean;');
  Result := BMenu_AddItem_6(CPlusObject, menu.CPlusObject, aframe.CPlusObject);
end;


{function BMenu.AddItem(item : bMenuItem) : boolean;
begin
  SendText('function BMenu.AddItem(item : bMenuItem) : boolean;');
  Result := BMenu_AddItem_1(CPlusObject, item.CPlusObject);
end;

function BMenu.AddItem(item : bMenuItem; index : integer) : boolean;
begin
  SendText('function BMenu.AddItem(item : bMenuItem; index : integer) : boolean;');
  Result := BMenu_AddItem_2(CPlusObject, item.CPlusObject, index);
end;

function BMenu.AddItem(item : bMenuItem; frame : BRect) : boolean;
begin
  SendText('ici');
  SendText('function BMenu.AddItem(item : bMenuItem; frame : BRect) : boolean;');
  frame.PrintToStream;
  SendText('toto');
  Result := BMenu_AddItem_3(CPlusObject, item.CPlusObject, frame.CPlusObject);
end;

function BMenu.AddItem(menu : BMenu) : boolean;
begin
  SendText('function BMenu.AddItem(menu : BMenu) : boolean;');
  SendText('Bonjour');
  Result := BMenu_AddItem_4(CPlusObject, menu.CPlusObject);
end;

function BMenu.AddItem(menu : BMenu; index : integer) : boolean;
begin
  SendText('function BMenu.AddItem(menu : BMenu; index : integer) : boolean;');
  Result := BMenu_AddItem_5(CPlusObject, menu.CPlusObject, index);
end;

function BMenu.AddItem(menu : BMenu; frame : BRect) : boolean;
begin
  SendText('function BMenu.AddItem(menu : BMenu; frame : BRect) : boolean;');
  Result := BMenu_AddItem_6(CPlusObject, menu.CPlusObject, frame.CPlusObject);
end;
}

function BMenu.AddList(list : BList; index : integer) : boolean;
begin
  Result := BMenu_AddList(CPlusObject, list.CPlusObject, index);
end;

function BMenu.AddSeparatorItem : boolean;
begin
  Result := BMenu_AddSeparatorItem(CPlusObject);
end;

function BMenu.RemoveItem(item : bMenuItem) : boolean;
begin
  Result := BMenu_RemoveItem(CPlusObject, item.CPlusObject);
end;

function BMenu.RemoveItem(index : integer) : bMenuItem;
begin
  Result := BMenu_RemoveItem(CPlusObject, index);
end;

function BMenu.RemoveItems(index : integer; count : integer; del : boolean) : boolean;
begin
  Result := BMenu_RemoveItems(CPlusObject, index, count, del);
end;

function BMenu.RemoveItem(menu : BMenu) : boolean;
begin
  Result := BMenu_RemoveItem(CPlusObject, menu.CPlusObject);
end;

function BMenu.ItemAt(index : integer) : bMenuItem;
begin
  Result := BMenu_ItemAt(CPlusObject, index);
end;

function BMenu.SubmenuAt(index : integer) : BMenu;
begin
  Result := BMenu_SubmenuAt(CPlusObject, index);
end;

function BMenu.CountItems : integer;
begin
  Result := BMenu_CountItems(CPlusObject);
end;

function BMenu.IndexOf(item : bMenuItem) : integer;
begin
  Result := BMenu_IndexOf(CPlusObject, item.CPlusObject);
end;

function BMenu.IndexOf(menu : BMenu) : integer;
begin
  Result := BMenu_IndexOf(CPlusObject, menu.CPlusObject);
end;

function BMenu.FindItem(command : Cardinal) : bMenuItem;
begin
  Result := BMenu_FindItem(CPlusObject, command);
end;

function BMenu.FindItem(name : PChar) : bMenuItem;
begin
  Result := BMenu_FindItem(CPlusObject, name);
end;

function BMenu.SetTargetForItems(target : BHandler) : Status_t;
begin
  Result := BMenu_SetTargetForItems(CPlusObject, target.CPlusObject);
end;

function BMenu.SetTargetForItems(messenger : BMessenger) : Status_t;
begin
  Result := BMenu_SetTargetForItems(CPlusObject, messenger.CPlusObject);
end;

procedure BMenu.SetEnabled(state : boolean);
begin
//  BMenu_SetEnabled(CPlusObject, state);
end;

procedure BMenu.SetRadioMode(state : boolean);
begin
  BMenu_SetRadioMode(CPlusObject, state);
end;

procedure BMenu.SetTriggersEnabled(state : boolean);
begin
  BMenu_SetTriggersEnabled(CPlusObject, state);
end;

procedure BMenu.SetMaxContentWidth(max : double);
begin
  BMenu_SetMaxContentWidth(CPlusObject, max);
end;

procedure BMenu.SetLabelFromMarked(aOn : boolean);
begin
  BMenu_SetLabelFromMarked(CPlusObject, aOn);
end;

function BMenu.IsLabelFromMarked : boolean;
begin
  Result := BMenu_IsLabelFromMarked(CPlusObject);
end;

function BMenu.IsEnabled : boolean;
begin
  Result := BMenu_IsEnabled(CPlusObject);
end;

function BMenu.IsRadioMode : boolean;
begin
  Result := BMenu_IsRadioMode(CPlusObject);
end;

function BMenu.AreTriggersEnabled : boolean;
begin
  Result := BMenu_AreTriggersEnabled(CPlusObject);
end;

function BMenu.IsRedrawAfterSticky : boolean;
begin
  Result := BMenu_IsRedrawAfterSticky(CPlusObject);
end;

function BMenu.MaxContentWidth : double;
begin
  Result := BMenu_MaxContentWidth(CPlusObject);
end;

function BMenu.FindMarked : bMenuItem;
begin
  Result := BMenu_FindMarked(CPlusObject);
end;

function BMenu.Supermenu : BMenu;
begin
  Result := BMenu_Supermenu(CPlusObject);
end;

function BMenu.Superitem : bMenuItem;
begin
  Result := BMenu_Superitem(CPlusObject);
end;

procedure BMenu.MessageReceived(msg : BMessage);
begin
//  BMenu_MessageReceived(CPlusObject, msg.CPlusObject);
end;

procedure BMenu.KeyDown(bytes : PChar; numBytes : integer);
begin
//  BMenu_KeyDown(CPlusObject, bytes, numBytes);
end;

procedure BMenu.Draw(updateRect : BRect);
begin
//  BMenu_Draw(CPlusObject, updateRect.CPlusObject);
end;

procedure BMenu.GetPreferredSize(width : double; height : double);
begin
//  BMenu_GetPreferredSize(CPlusObject, width, height);
end;

procedure BMenu.ResizeToPreferred;
begin
//  BMenu_ResizeToPreferred(CPlusObject);
end;

procedure BMenu.FrameMoved(new_position : BPoint);
begin
//  BMenu_FrameMoved(CPlusObject, new_position.CPlusObject);
end;

procedure BMenu.FrameResized(new_width : double; new_height : double);
begin
//  BMenu_FrameResized(CPlusObject, new_width, new_height);
end;

procedure BMenu.InvalidateLayout;
begin
  BMenu_InvalidateLayout(CPlusObject);
end;

function BMenu.ResolveSpecifier(msg : BMessage; index : integer; specifier : BMessage; form : integer; aProperty : PChar) : BHandler;
begin
  Result := BMenu_ResolveSpecifier(CPlusObject, msg.CPlusObject, index, specifier.CPlusObject, form, aProperty);
end;

function BMenu.GetSupportedSuites(data : BMessage) : Status_t;
begin
  Result := BMenu_GetSupportedSuites(CPlusObject, data.CPlusObject);
end;

function BMenu.Perform(d : Perform_code; arg : Pointer) : Status_t;
begin
  Result := BMenu_Perform(CPlusObject, d, arg);
end;

procedure BMenu.MakeFocus(state : boolean);
begin
//  BMenu_MakeFocus(CPlusObject, state);
end;

procedure BMenu.AllAttached;
begin
//  BMenu_AllAttached(CPlusObject);
end;

procedure BMenu.AllDetached;
begin
//  BMenu_AllDetached(CPlusObject);
end;

{
constructor BMenu.Create(frame : BRect; viewName : PChar; resizeMask : Cardinal; flags : Cardinal; layout : TMenu_Layout; resizeToFit : boolean);
begin
  CPlusObject := BMenu_Create(Self, frame.CPlusObject, viewName, resizeMask, flags, layout, resizeToFit);
end;

function BMenu.ScreenLocation : BPoint;
begin
  Result := BMenu_ScreenLocation(CPlusObject);
end;

procedure BMenu.SetItemMargins(left : double; top : double; right : double; bottom : double);
begin
  BMenu_SetItemMargins(CPlusObject, left, top, right, bottom);
end;

procedure BMenu.GetItemMargins(left : double; top : double; right : double; bottom : double);
begin
  BMenu_GetItemMargins(CPlusObject, left, top, right, bottom);
end;

function BMenu.Layout : TMenu_Layout;
begin
  Result := BMenu_Layout(CPlusObject);
end;

procedure BMenu.Show;
begin
  BMenu_Show(CPlusObject);
end;

procedure BMenu.Show(selectFirstItem : boolean);
begin
  BMenu_Show(CPlusObject, selectFirstItem);
end;

procedure BMenu.Hide;
begin
  BMenu_Hide(CPlusObject);
end;

function BMenu.Track(start_opened : boolean; special_rect : BRect) : bMenuItem;
begin
  Result := BMenu_Track(CPlusObject, start_opened, special_rect.CPlusObject);
end;
}

//procedure BMenu.enum add_state { B_INITIAL_ADD, B_PROCESSING, B_ABORT };
//begin
//  BMenu_enum add_state { B_INITIAL_ADD, B_PROCESSING, B_ABORT }(CPlusObject);
//end;

{
function BMenu.AddDynamicItem(s : TAdd_State) : boolean;
begin
  Result := BMenu_AddDynamicItem(CPlusObject, s);
end;

procedure BMenu.DrawBackground(update : BRect);
begin
  BMenu_DrawBackground(CPlusObject, update.CPlusObject);
end;

procedure BMenu.SetTrackingHook(func : TMenu_Tracking_Hook; state : Pointer);
begin
  BMenu_SetTrackingHook(CPlusObject, func, state);
end;

procedure BMenu._ReservedMenu3;
begin
  BMenu__ReservedMenu3(CPlusObject);
end;

procedure BMenu._ReservedMenu4;
begin
  BMenu__ReservedMenu4(CPlusObject);
end;

procedure BMenu._ReservedMenu5;
begin
  BMenu__ReservedMenu5(CPlusObject);
end;

procedure BMenu._ReservedMenu6;
begin
  BMenu__ReservedMenu6(CPlusObject);
end;

function BMenu.operator=( : BMenu) : BMenu;
begin
  Result := BMenu_operator=(CPlusObject, );
end;

procedure BMenu.InitData(data : BMessage);
begin
  BMenu_InitData(CPlusObject, data.CPlusObject);
end;

function BMenu._show(selectFirstItem : boolean) : boolean;
begin
  Result := BMenu__show(CPlusObject, selectFirstItem);
end;

procedure BMenu._hide;
begin
  BMenu__hide(CPlusObject);
end;

function BMenu._track(action : integer; start : integer) : bMenuItem;
begin
  Result := BMenu__track(CPlusObject, action, start);
end;

function BMenu._AddItem(item : bMenuItem; index : integer) : boolean;
begin
  Result := BMenu__AddItem(CPlusObject, item.CPlusObject, index);
end;

function BMenu.RemoveItems(index : integer; count : integer; item : bMenuItem; del : boolean) : boolean;
begin
  Result := BMenu_RemoveItems(CPlusObject, index, count, item.CPlusObject, del);
end;

procedure BMenu.LayoutItems(index : integer);
begin
  BMenu_LayoutItems(CPlusObject, index);
end;

procedure BMenu.ComputeLayout(index : integer; bestFit : boolean; moveItems : boolean; width : double; height : double);
begin
  BMenu_ComputeLayout(CPlusObject, index, bestFit, moveItems, width, height);
end;

function BMenu.Bump(current : BRect; extent : BPoint; index : integer) : BRect;
begin
  Result := BMenu_Bump(CPlusObject, current.CPlusObject, extent.CPlusObject, index);
end;

function BMenu.ItemLocInRect(frame : BRect) : BPoint;
begin
  Result := BMenu_ItemLocInRect(CPlusObject, frame.CPlusObject);
end;

function BMenu.CalcFrame(where : BPoint; scrollOn : boolean) : BRect;
begin
  Result := BMenu_CalcFrame(CPlusObject, where.CPlusObject, scrollOn);
end;

function BMenu.ScrollMenu(bounds : BRect; loc : BPoint; fast : boolean) : boolean;
begin
  Result := BMenu_ScrollMenu(CPlusObject, bounds.CPlusObject, loc.CPlusObject, fast);
end;

procedure BMenu.ScrollIntoView(item : bMenuItem);
begin
  BMenu_ScrollIntoView(CPlusObject, item.CPlusObject);
end;

procedure BMenu.DrawItems(updateRect : BRect);
begin
  BMenu_DrawItems(CPlusObject, updateRect.CPlusObject);
end;

function BMenu.State(item : bMenuItem) : integer;
begin
  Result := BMenu_State(CPlusObject, item.CPlusObject);
end;

procedure BMenu.InvokeItem(item : bMenuItem; now : boolean);
begin
  BMenu_InvokeItem(CPlusObject, item.CPlusObject, now);
end;

function BMenu.OverSuper(loc : BPoint) : boolean;
begin
  Result := BMenu_OverSuper(CPlusObject, loc.CPlusObject);
end;

function BMenu.OverSubmenu(item : bMenuItem; loc : BPoint) : boolean;
begin
  Result := BMenu_OverSubmenu(CPlusObject, item.CPlusObject, loc.CPlusObject);
end;

function BMenu.MenuWindow : TMenuWindow;
begin
  Result := BMenu_MenuWindow(CPlusObject);
end;

procedure BMenu.DeleteMenuWindow;
begin
  BMenu_DeleteMenuWindow(CPlusObject);
end;

function BMenu.HitTestItems(where : BPoint; slop : BPoint) : bMenuItem;
begin
  Result := BMenu_HitTestItems(CPlusObject, where.CPlusObject, slop.CPlusObject);
end;

function BMenu.Superbounds : BRect;
begin
  Result := BMenu_Superbounds(CPlusObject);
end;

procedure BMenu.CacheFontInfo;
begin
  BMenu_CacheFontInfo(CPlusObject);
end;

procedure BMenu.ItemMarked(item : bMenuItem);
begin
  BMenu_ItemMarked(CPlusObject, item.CPlusObject);
end;

procedure BMenu.Install(target : TWindow);
begin
  BMenu_Install(CPlusObject, target.CPlusObject);
end;

procedure BMenu.Uninstall;
begin
  BMenu_Uninstall(CPlusObject);
end;

procedure BMenu.SelectItem(m : bMenuItem; showSubmenu : Cardinal; selectFirstItem : boolean);
begin
  BMenu_SelectItem(CPlusObject, m.CPlusObject, showSubmenu, selectFirstItem);
end;

function BMenu.CurrentSelection : bMenuItem;
begin
  Result := BMenu_CurrentSelection(CPlusObject);
end;

function BMenu.SelectNextItem(item : bMenuItem; forward : boolean) : boolean;
begin
  Result := BMenu_SelectNextItem(CPlusObject, item.CPlusObject, forward);
end;

function BMenu.NextItem(item : bMenuItem; forward : boolean) : bMenuItem;
begin
  Result := BMenu_NextItem(CPlusObject, item.CPlusObject, forward);
end;

function BMenu.IsItemVisible(item : bMenuItem) : boolean;
begin
  Result := BMenu_IsItemVisible(CPlusObject, item.CPlusObject);
end;

procedure BMenu.SetIgnoreHidden(aOn : boolean);
begin
  BMenu_SetIgnoreHidden(CPlusObject, aOn);
end;

procedure BMenu.SetStickyMode(aOn : boolean);
begin
  BMenu_SetStickyMode(CPlusObject, aOn);
end;

function BMenu.IsStickyMode : boolean;
begin
  Result := BMenu_IsStickyMode(CPlusObject);
end;

procedure BMenu.CalcTriggers;
begin
  BMenu_CalcTriggers(CPlusObject);
end;

function BMenu.ChooseTrigger(title : PChar; chars : BList) : PChar;
begin
  Result := BMenu_ChooseTrigger(CPlusObject, title, chars.CPlusObject);
end;

procedure BMenu.UpdateWindowViewSize(upWind : boolean);
begin
  BMenu_UpdateWindowViewSize(CPlusObject, upWind);
end;

function BMenu.IsStickyPrefOn : boolean;
begin
  Result := BMenu_IsStickyPrefOn(CPlusObject);
end;

procedure BMenu.RedrawAfterSticky(bounds : BRect);
begin
  BMenu_RedrawAfterSticky(CPlusObject, bounds.CPlusObject);
end;

function BMenu.OkToProceed( : bMenuItem) : boolean;
begin
  Result := BMenu_OkToProceed(CPlusObject, .CPlusObject);
end;

function BMenu.ParseMsg(msg : BMessage; sindex : ^integer; spec : BMessage; form : ^integer; prop : PChar; BMenu : BMenu; titem : bMenuItem; user_data : ^integer; reply : BMessage) : Status_t;
begin
  Result := BMenu_ParseMsg(CPlusObject, msg.CPlusObject, sindex, spec.CPlusObject, form, prop, BMenu.CPlusObject, titem.CPlusObject, user_data, reply.CPlusObject);
end;

function BMenu.DoMenuMsg(next : bMenuItem; tar : BMenu; m : BMessage; r : BMessage; spec : BMessage; f : integer) : Status_t;
begin
  Result := BMenu_DoMenuMsg(CPlusObject, next.CPlusObject, tar.CPlusObject, m.CPlusObject, r.CPlusObject, spec.CPlusObject, f);
end;

function BMenu.DoMenuItemMsg(next : bMenuItem; tar : BMenu; m : BMessage; r : BMessage; spec : BMessage; f : integer) : Status_t;
begin
  Result := BMenu_DoMenuItemMsg(CPlusObject, next.CPlusObject, tar.CPlusObject, m.CPlusObject, r.CPlusObject, spec.CPlusObject, f);
end;

function BMenu.DoEnabledMsg(ti : bMenuItem; tm : BMenu; m : BMessage; r : BMessage) : Status_t;
begin
  Result := BMenu_DoEnabledMsg(CPlusObject, ti.CPlusObject, tm.CPlusObject, m.CPlusObject, r.CPlusObject);
end;

function BMenu.DoLabelMsg(ti : bMenuItem; tm : BMenu; m : BMessage; r : BMessage) : Status_t;
begin
  Result := BMenu_DoLabelMsg(CPlusObject, ti.CPlusObject, tm.CPlusObject, m.CPlusObject, r.CPlusObject);
end;

function BMenu.DoMarkMsg(ti : bMenuItem; tm : BMenu; m : BMessage; r : BMessage) : Status_t;
begin
  Result := BMenu_DoMarkMsg(CPlusObject, ti.CPlusObject, tm.CPlusObject, m.CPlusObject, r.CPlusObject);
end;

function BMenu.DoDeleteMsg(ti : bMenuItem; tm : BMenu; m : BMessage; r : BMessage) : Status_t;
begin
  Result := BMenu_DoDeleteMsg(CPlusObject, ti.CPlusObject, tm.CPlusObject, m.CPlusObject, r.CPlusObject);
end;

function BMenu.DoCreateMsg(ti : bMenuItem; tm : BMenu; m : BMessage; r : BMessage; menu : boolean) : Status_t;
begin
  Result := BMenu_DoCreateMsg(CPlusObject, ti.CPlusObject, tm.CPlusObject, m.CPlusObject, r.CPlusObject, menu);
end;

procedure BMenu.menu_info sMenuInfo;
begin
  BMenu_menu_info sMenuInfo(CPlusObject);
end;

procedure BMenu.bool sSwapped;
begin
  BMenu_bool sSwapped(CPlusObject);
end;

procedure BMenu.BMenuItem *fChosenItem;
begin
  BMenu_BMenuItem *fChosenItem(CPlusObject);
end;

procedure BMenu.BList fItems;
begin
  BMenu_BList fItems(CPlusObject);
end;

procedure BMenu.BRect fPad;
begin
  BMenu_BRect fPad(CPlusObject);
end;

procedure BMenu.BMenuItem *fSelected;
begin
  BMenu_BMenuItem *fSelected(CPlusObject);
end;

procedure BMenu.BMenuWindow *fCachedMenuWindow;
begin
  BMenu_BMenuWindow *fCachedMenuWindow(CPlusObject);
end;

procedure BMenu.BMenu *fSuper;
begin
  BMenu_BMenu *fSuper(CPlusObject);
end;

procedure BMenu.BMenuItem *fSuperitem;
begin
  BMenu_BMenuItem *fSuperitem(CPlusObject);
end;

procedure BMenu.BRect fSuperbounds;
begin
  BMenu_BRect fSuperbounds(CPlusObject);
end;

procedure BMenu.float fAscent;
begin
  BMenu_float fAscent(CPlusObject);
end;

procedure BMenu.float fDescent;
begin
  BMenu_float fDescent(CPlusObject);
end;

procedure BMenu.float fFontHeight;
begin
  BMenu_float fFontHeight(CPlusObject);
end;

procedure BMenu.uint32 fState;
begin
  BMenu_uint32 fState(CPlusObject);
end;

procedure BMenu.menu_layout fLayout;
begin
  BMenu_menu_layout fLayout(CPlusObject);
end;

procedure BMenu.BRect *fExtraRect;
begin
  BMenu_BRect *fExtraRect(CPlusObject);
end;

procedure BMenu.float fMaxContentWidth;
begin
  BMenu_float fMaxContentWidth(CPlusObject);
end;

procedure BMenu.BPoint *fInitMatrixSize;
begin
  BMenu_BPoint *fInitMatrixSize(CPlusObject);
end;

procedure BMenu._ExtraMenuData_ *fExtraMenuData;
begin
  BMenu__ExtraMenuData_ *fExtraMenuData(CPlusObject);
end;

procedure BMenu.uint32 _reserved[2];
begin
  BMenu_uint32 _reserved[2](CPlusObject);
end;

procedure BMenu.char fTrigger;
begin
  BMenu_char fTrigger(CPlusObject);
end;

procedure BMenu.bool fResizeToFit;
begin
  BMenu_bool fResizeToFit(CPlusObject);
end;

procedure BMenu.bool fUseCachedMenuLayout;
begin
  BMenu_bool fUseCachedMenuLayout(CPlusObject);
end;

procedure BMenu.bool fEnabled;
begin
  BMenu_bool fEnabled(CPlusObject);
end;

procedure BMenu.bool fDynamicName;
begin
  BMenu_bool fDynamicName(CPlusObject);
end;

procedure BMenu.bool fRadioMode;
begin
  BMenu_bool fRadioMode(CPlusObject);
end;

procedure BMenu.bool fTrackNewBounds;
begin
  BMenu_bool fTrackNewBounds(CPlusObject);
end;

procedure BMenu.bool fStickyMode;
begin
  BMenu_bool fStickyMode(CPlusObject);
end;

procedure BMenu.bool fIgnoreHidden;
begin
  BMenu_bool fIgnoreHidden(CPlusObject);
end;

procedure BMenu.bool fTriggerEnabled;
begin
  BMenu_bool fTriggerEnabled(CPlusObject);
end;

procedure BMenu.bool fRedrawAfterSticky;
begin
  BMenu_bool fRedrawAfterSticky(CPlusObject);
end;

procedure BMenu.bool fAttachAborted;
begin
  BMenu_bool fAttachAborted(CPlusObject);
end;
}

constructor bMenuItem.Create;
begin
//  CPlusObject := BMenuItem_Create(Self);
end;

constructor bMenuItem.Create(aMenu : BMenu; message : BMessage);
begin
  CPlusObject := BMenuItem_Create(Self, menu.CPlusObject, message.CPlusObject);
end;

constructor bMenuItem.Create(data : BMessage);
begin
  CPlusObject := BMenuItem_Create(Self, data.CPlusObject);
end;

constructor bMenuItem.Create(aLabel : PChar; message : BMessage; aShortcut : Char; modifiers : Cardinal);
begin
  CPlusObject := BMenuItem_Create(Self, aLabel, message.CPlusObject, aShortcut, modifiers);  
end;

destructor bMenuItem.Destroy;
begin
  BMenuItem_Free(CPlusObject);
  inherited;
end;

function bMenuItem.Instantiate(data : BMessage) : BArchivable;
begin
  Result := BMenuItem_Instantiate(CPlusObject, data.CPlusObject);
end;

function bMenuItem.Archive(data : BMessage; deep : boolean) : Status_t;
begin
  Result := BMenuItem_Archive(CPlusObject, data.CPlusObject, deep);
end;

procedure bMenuItem.SetLabel(name : PChar);
begin
  BMenuItem_SetLabel(CPlusObject, name);
end;

procedure bMenuItem.SetEnabled(state : boolean);
begin
//  BMenuItem_SetEnabled(CPlusObject, state);
end;

procedure bMenuItem.SetMarked(state : boolean);
begin
  BMenuItem_SetMarked(CPlusObject, state);
end;

procedure bMenuItem.SetTrigger(ch : Char);
begin
  BMenuItem_SetTrigger(CPlusObject, ch);
end;

procedure bMenuItem.SetShortcut(ch : Char; modifiers : Cardinal);
begin
  BMenuItem_SetShortcut(CPlusObject, ch, modifiers);
end;

{function bMenuItem.aLabel : PChar;
begin
  Result := BMenuItem_Label(CPlusObject);
end;
}

function bMenuItem.IsEnabled : boolean;
begin
  Result := BMenuItem_IsEnabled(CPlusObject);
end;

function bMenuItem.IsMarked : boolean;
begin
  Result := BMenuItem_IsMarked(CPlusObject);
end;

function bMenuItem.Trigger : Char;
begin
  Result := BMenuItem_Trigger(CPlusObject);
end;

{function bMenuItem.Shortcut(modifiers : Cardinal) : Char;
begin
  Result := BMenuItem_Shortcut(CPlusObject, modifiers);
end;}

function bMenuItem.Submenu : BMenu;
begin
  Result := BMenuItem_Submenu(CPlusObject);
end;

function bMenuItem.Menu : BMenu;
begin
  Result := BMenuItem_Menu(CPlusObject);
end;

function bMenuItem.Frame : BRect;
begin
  Result := BMenuItem_Frame(CPlusObject);
end;

{
procedure bMenuItem.GetContentSize(width : double; height : double);
begin
  BMenuItem_GetContentSize(CPlusObject, width, height);
end;

procedure bMenuItem.TruncateLabel(max : double; new_label : PChar);
begin
  BMenuItem_TruncateLabel(CPlusObject, max, new_label);
end;

procedure bMenuItem.DrawContent;
begin
//  BMenuItem_DrawContent(CPlusObject);
end;

procedure bMenuItem.Draw;
begin
//  BMenuItem_Draw(CPlusObject);
end;

procedure bMenuItem.Highlight(aOn : boolean);
begin
  BMenuItem_Highlight(CPlusObject, aOn);
end;

function bMenuItem.IsSelected : boolean;
begin
  Result := BMenuItem_IsSelected(CPlusObject);
end;

function bMenuItem.ContentLocation : BPoint;
begin
  Result := BMenuItem_ContentLocation(CPlusObject);
end;

procedure bMenuItem._ReservedMenuItem2;
begin
  BMenuItem__ReservedMenuItem2(CPlusObject);
end;

procedure bMenuItem._ReservedMenuItem3;
begin
  BMenuItem__ReservedMenuItem3(CPlusObject);
end;

procedure bMenuItem._ReservedMenuItem4;
begin
  BMenuItem__ReservedMenuItem4(CPlusObject);
end;

constructor bMenuItem.Create( : bMenuItem) : TCPlusObject;
begin
  CPlusObject := BMenuItem_Create(Self, );
end;

function bMenuItem.operator=( : bMenuItem) : bMenuItem;
begin
  Result := BMenuItem_operator=(CPlusObject, );
end;

procedure bMenuItem.InitData;
begin
  BMenuItem_InitData(CPlusObject);
end;

procedure bMenuItem.IniBMenuData(menu : BMenu);
begin
  BMenuItem_InitMenuData(CPlusObject, menu.CPlusObject);
end;

procedure bMenuItem.Install(window : TWindow);
begin
  BMenuItem_Install(CPlusObject, window.CPlusObject);
end;

function bMenuItem.Invoke(msg : BMessage) : Status_t;
begin
  Result := BMenuItem_Invoke(CPlusObject, msg.CPlusObject);
end;

procedure bMenuItem.Uninstall;
begin
  BMenuItem_Uninstall(CPlusObject);
end;

procedure bMenuItem.SetSuper(super : BMenu);
begin
  BMenuItem_SetSuper(CPlusObject, super.CPlusObject);
end;

procedure bMenuItem.Select(on : boolean);
begin
  BMenuItem_Select(CPlusObject, on);
end;

procedure bMenuItem.DrawMarkSymbol;
begin
  BMenuItem_DrawMarkSymbol(CPlusObject);
end;

procedure bMenuItem.DrawShortcutSymbol;
begin
  BMenuItem_DrawShortcutSymbol(CPlusObject);
end;

procedure bMenuItem.DrawSubmenuSymbol;
begin
  BMenuItem_DrawSubmenuSymbol(CPlusObject);
end;

procedure bMenuItem.DrawControlChar(control : PChar);
begin
  BMenuItem_DrawControlChar(CPlusObject, control);
end;

procedure bMenuItem.SetSysTrigger(ch : Char);
begin
  BMenuItem_SetSysTrigger(CPlusObject, ch);
end;

procedure bMenuItem.char *fLabel;
begin
  BMenuItem_char *fLabel(CPlusObject);
end;

procedure bMenuItem.BMenu *fSubmenu;
begin
  BMenuItem_BMenu *fSubmenu(CPlusObject);
end;

procedure bMenuItem.BWindow *fWindow;
begin
  BMenuItem_BWindow *fWindow(CPlusObject);
end;

procedure bMenuItem.BMenu *fSuper;
begin
  BMenuItem_BMenu *fSuper(CPlusObject);
end;

procedure bMenuItem.BRect fBounds;
begin
  BMenuItem_BRect fBounds(CPlusObject);
end;

procedure bMenuItem.uint32 fModifiers;
begin
  BMenuItem_uint32 fModifiers(CPlusObject);
end;

procedure bMenuItem.float fCachedWidth;
begin
  BMenuItem_float fCachedWidth(CPlusObject);
end;

procedure bMenuItem.int16 fTriggerIndex;
begin
  BMenuItem_int16 fTriggerIndex(CPlusObject);
end;

procedure bMenuItem.char fUserTrigger;
begin
  BMenuItem_char fUserTrigger(CPlusObject);
end;

procedure bMenuItem.char fSysTrigger;
begin
  BMenuItem_char fSysTrigger(CPlusObject);
end;

procedure bMenuItem.char fShortcutChar;
begin
  BMenuItem_char fShortcutChar(CPlusObject);
end;

procedure bMenuItem.bool fMark;
begin
  BMenuItem_bool fMark(CPlusObject);
end;

procedure bMenuItem.bool fEnabled;
begin
  BMenuItem_bool fEnabled(CPlusObject);
end;

procedure bMenuItem.bool fSelected;
begin
  BMenuItem_bool fSelected(CPlusObject);
end;

procedure bMenuItem.uint32 _reserved[4];
begin
  BMenuItem_uint32 _reserved[4](CPlusObject);
end;
}

constructor BSeparatorItem.Create;
begin
  CPlusObject := BSeparatorItem_Create(Self);
end;

constructor BSeparatorItem.Create(data : BMessage);
begin
  CPlusObject := BSeparatorItem_Create(Self, data.CPlusObject);
end;

destructor BSeparatorItem.Destroy;
begin
  BSeparatorItem_Free(CPlusObject);
  inherited;
end;

function BSeparatorItem.Archive(data : BMessage; deep : boolean) : Status_t;
begin
  Result := BSeparatorItem_Archive(CPlusObject, data.CPlusObject, deep);
end;

function BSeparatorItem.Instantiate(data : BMessage) : BArchivable;
begin
  Result := BSeparatorItem_Instantiate(CPlusObject, data.CPlusObject);
end;

procedure BSeparatorItem.SetEnabled(state : boolean);
begin
//  BSeparatorItem_SetEnabled(CPlusObject, state);
end;

{
procedure BSeparatorItem.GetContentSize(width : double; height : double);
begin
  BSeparatorItem_GetContentSize(CPlusObject, width, height);
end;

procedure BSeparatorItem.Draw;
begin
//  BSeparatorItem_Draw(CPlusObject);
end;

procedure BSeparatorItem._ReservedSeparatorItem1;
begin
  BSeparatorItem__ReservedSeparatorItem1(CPlusObject);
end;

procedure BSeparatorItem._ReservedSeparatorItem2;
begin
  BSeparatorItem__ReservedSeparatorItem2(CPlusObject);
end;

function BSeparatorItem.operator=( : BSeparatorItem) : BSeparatorItem;
begin
  Result := BSeparatorItem_operator=(CPlusObject, );
end;

procedure BSeparatorItem.uint32 _reserved[1];
begin
  BSeparatorItem_uint32 _reserved[1](CPlusObject);
end;
}

end.
