{   BePascal - A pascal wrapper around the BeOS API
    Copyright (C) 2002-2003 Olivier Coursiere
                            Eric Jourde
                            Oscar Lesta

    This library is free software; you can redistribute it and/or
    modify it under the terms of the GNU Library General Public
    License as published by the Free Software Foundation; either
    version 2 of the License, or (at your option) any later version.

    This library is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNSS FOR A PARTICULAR PURPOSE.  See the GNU
    Library General Public License for more details.

    You should have received a copy of the GNU Library General Public
    License along with this library; if not, write to the Free
    Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
}                                                                               
unit InterfaceDefs;

interface

uses
  BeObj, GraphicDefs, Rect, SupportDefs;

//----------------------------------------------------------------

type

  key_info = record
	modifiers : Longword;
	key_states : array[0..15] of Byte;
  end;

const
  B_UTF8_ELLIPSIS     : WideString = #$E2 + #$80 + #$A6;
  B_UTF8_OPEN_QUOTE   : WideString = #$E2 + #$80 + #$9C;
  B_UTF8_CLOSE_QUOTE  : WideString = #$E2 + #$80 + #$9D;
  B_UTF8_COPYRIGHT    : WideString = #$C2 + #$A9;
  B_UTF8_REGISTERED   : WideString = #$C2 + #$AE;
  B_UTF8_TRADEMARK    : WideString = #$E2 + #$84 + #$A2;
  B_UTF8_SMILING_FACE : WideString = #$E2 + #$98 + #$BB;
  B_UTF8_HIROSHI      : WideString = #$E5 + #$BC + #$98;

//----------------------------------------------------------------

const
  B_BACKSPACE    = $08;
  B_RETURN       = $0a;
  B_ENTER        = $0a;
  B_SPACE        = $20;
  B_TAB          = $09;
  B_ESCAPE       = $1b;
  B_SUBSTITUTE   = $1a;

  B_LEFT_ARROW   = $1c;
  B_RIGHT_ARROW  = $1d;
  B_UP_ARROW     = $1e;
  B_DOWN_ARROW   = $1f;

  B_INSERT       = $05;
  B_DELETE       = $7f;
  B_HOME         = $01;
  B_END          = $04;
  B_PAGE_UP      = $0b;
  B_PAGE_DOWN    = $0c;

  B_FUNCTION_KEY = $10;

  B_F1_KEY     = $02;
  B_F2_KEY     = $03;
  B_F3_KEY     = $04;
  B_F4_KEY     = $05;
  B_F5_KEY     = $06;
  B_F6_KEY     = $07;
  B_F7_KEY     = $08;
  B_F8_KEY     = $09;
  B_F9_KEY     = $0a;
  B_F10_KEY    = $0b;
  B_F11_KEY    = $0c;
  B_F12_KEY    = $0d;
  B_PRINT_KEY  = $0e;
  B_SCROLL_KEY = $0f;
  B_PAUSE_KEY  = $10;

type
  key_map = record
    version,
    caps_key,
    scroll_key,
    num_key,
    left_shift_key,
    right_shift_key,
    left_command_key,
    right_command_key,
    left_control_key,
    right_control_key,
    left_option_key,
    right_option_key,
    menu_key,
    lock_settings : Longword;

    control_map,
    option_caps_shift_map,
    option_caps_map,
    option_shift_map,
    option_map,
    caps_shift_map,
    caps_map,
    shift_map,
    normal_map : array[0..127] of Longint;

    acute_dead_key,
    grave_dead_key,
    circumflex_dead_key,
    dieresis_dead_key,
    tilde_dead_key : array[0..31] of Longint;

	acute_tables,
	grave_tables,
	circumflex_tables,
	dieresis_tables,
    tilde_tables : Longword;
  end;
  Pkey_map = ^key_map;

  mouse_map = record
    left,
    right,
    middle : Longword;
  end;

//----------------------------------------------------------------

type

  border_style = (B_PLAIN_BORDER, B_FANCY_BORDER, B_NO_BORDER);

  orientation = (B_HORIZONTAL, B_VERTICAL);

  button_width = (B_WIDTH_AS_USUAL, B_WIDTH_FROM_WIDSET, B_WIDTH_FROM_LABEL);

//----------------------------------------------------------------

  join_mode = (B_ROUND_JOIN, B_MITER_JOIN, B_BEVEL_JOIN, B_BUTT_JOIN, B_SQUARE_JOIN);

  cap_mode = join_mode;

var
  B_ROUND_CAP,
  B_BUTT_CAP,
  B_SQUARE_CAP : join_mode;

const
  B_DEFAULT_MITER_LIMIT = 10.0;

//----------------------------------------------------------------

type
  scroll_bar_info = record
    proportional,
    double_arrows : Boolean;
    knob,
    min_knob_size : Longint;
  end;

//----------------------------------------------------------------

  alignment = (B_ALIGN_LEFT, B_ALIGN_RIGHT, B_ALIGN_CENTER);

// vertical_alignment was an enum
type
  vertical_alignment = Longint;
const
  B_ALIGN_TOP         : Longint = $10;
  B_ALIGN_MIDDLE      : Longint = $20;
  B_ALIGN_BOTTOM      : Longint = $30;
  B_ALIGN_NO_VERTICAL : Longint =  -1;

//----------------------------------------------------------------

const
  B_CONTROL_TABLE           = $00000001;
  B_OPTION_CAPS_SHIFT_TABLE = $00000002;
  B_OPTION_CAPS_TABLE       = $00000004;
  B_OPTION_SHIFT_TABLE      = $00000008;
  B_OPTION_TABLE            = $00000010;
  B_CAPS_SHIFT_TABLE        = $00000020;
  B_CAPS_TABLE              = $00000040;
  B_SHIFT_TABLE             = $00000080;
  B_NORMAL_TABLE            = $00000100;

//----------------------------------------------------------------

  B_SHIFT_KEY         = $00000001;
  B_COMMAND_KEY       = $00000002;
  B_CONTROL_KEY       = $00000004;
  B_CAPS_LOCK         = $00000008;
  B_SCROLL_LOCK       = $00000010;
  B_NUM_LOCK          = $00000020;
  B_OPTION_KEY        = $00000040;
  B_MENU_KEY          = $00000080;
  B_LEFT_SHIFT_KEY    = $00000100;
  B_RIGHT_SHIFT_KEY   = $00000200;
  B_LEFT_COMMAND_KEY  = $00000400;
  B_RIGHT_COMMAND_KEY = $00000800;
  B_LEFT_CONTROL_KEY  = $00001000;
  B_RIGHT_CONTROL_KEY = $00002000;
  B_LEFT_OPTION_KEY   = $00004000;
  B_RIGHT_OPTION_KEY  = $00008000;

//----------------------------------------------------------------

type
  bitmap_tiling = (B_TILE_BITMAP_X, B_TILE_BITMAP_Y, B_TILE_BITMAP);

// overlay_options was an enum
type
  overlay_options = Longword;
const
  B_OVERLAY_FILTER_HORIZONTAL = $00010000;
  B_OVERLAY_FILTER_VERTICAL   = $00020000;
  B_OVERLAY_MIRROR            = $00040000;
  B_OVERLAY_TRANSFER_CHANNEL  = $00080000;

//----------------------------------------------------------------

  function get_deskbar_frame(frame : BRect) : status_t;
           cdecl; external 'be' name 'get_deskbar_frame__FP5BRect';

  function system_colors : color_map; cdecl; external 'be' name 'system_colors__Fv';

  function set_screen_space(index : Longint; res : Longword;
                            stick : Boolean {$ifndef VER1_0}= true{$endif})
           : status_t; cdecl; external 'be' name 'set_screen_space__FlUlb';

  function get_scroll_bar_info(info : scroll_bar_info) : status_t;
           cdecl; external 'be' name 'get_scroll_bar_info__FP15scroll_bar_info';
  function set_scroll_bar_info(info : scroll_bar_info) : status_t;
           cdecl; external 'be' name 'set_scroll_bar_info__FP15scroll_bar_info';

  function get_mouse_type(mtype : Longint) : status_t;
           cdecl; external 'be' name 'get_mouse_type__FPl';
  function set_mouse_type(mtype : Longint) : status_t;
           cdecl; external 'be' name 'set_mouse_type__Fl';
  function get_mouse_map(map : mouse_map) : status_t;
           cdecl; external 'be' name 'get_mouse_map__FP9mouse_map';
  function set_mouse_map(map : mouse_map) : status_t;
           cdecl; external 'be' name 'set_mouse_map__FP9mouse_map';
  function get_click_speed(speed : bigtime_t) : status_t;
           cdecl; external 'be' name 'get_click_speed__FPx';
  function set_click_speed(speed : bigtime_t) : status_t;
           cdecl; external 'be' name 'set_click_speed__Fx';
  function get_mouse_speed(speed : Longint) : status_t;
           cdecl; external 'be' name 'get_mouse_speed__FPl';
  function set_mouse_speed(speed : Longint) : status_t;
           cdecl; external 'be' name 'set_mouse_speed__Fl';
  function get_mouse_acceleration(speed : Longint) : status_t;
           cdecl; external 'be' name 'get_mouse_acceleration__FPl';
  function set_mouse_acceleration(speed : Longint) : status_t;
           cdecl; external 'be' name 'set_mouse_acceleration__Fl';

  function get_key_repeat_rate(rate : Longint) : status_t;
           cdecl; external 'be' name 'get_key_repeat_rate__FPl';
  function set_key_repeat_rate(rate : Longint) : status_t;
           cdecl; external 'be' name 'set_key_repeat_rate__Fl';
  function get_key_repeat_delay(delay : bigtime_t) : status_t;
           cdecl; external 'be' name 'get_key_repeat_delay__FPx';
  function set_key_repeat_delay(delay : bigtime_t) : status_t;
           cdecl; external 'be' name 'set_key_repeat_delay__Fx';

  function modifiers : Longword; cdecl; external 'be' name 'modifiers__Fv';
  function get_key_info(var info : key_info) : status_t;
           cdecl; external 'be' name 'get_key_info__FP8key_info';
  procedure get_key_map(var map : Pkey_map; var key_buffer : PChar);
            cdecl; external 'be' name 'get_key_map__FPP7key_mapPPc';
  function get_keyboard_id(id : Word) : status_t;
           cdecl; external 'be' name 'get_keyboard_id__FPUs';
  procedure set_modifier_key(modifier, key : Longword);
            cdecl; external 'be' name 'set_modifier_key__FUlUl';
  procedure set_keyboard_locks(modifiers : Longword);
            cdecl; external 'be' name 'set_keyboard_locks__FUl';

  function keyboard_navigation_color : rgb_color;
           cdecl; external 'be' name 'keyboard_navigation_color__Fv';

  function count_workspaces : Longint;
           cdecl; external 'be' name 'count_workspaces__Fv';
  procedure set_workspace_count(count : Longint);
            cdecl; external 'be' name 'set_workspace_count__Fl';
  function current_workspace : Longint;
           cdecl; external 'be' name 'current_workspace__Fv';
  procedure activate_workspace(workspace : Longint);
            cdecl; external 'be' name 'activate_workspace__Fl';

  function idle_time : bigtime_t; cdecl; external 'be' name 'idle_time__Fv';

  procedure run_select_printer_panel;
            cdecl; external 'be' name 'run_select_printer_panel__Fv';
  procedure run_add_printer_panel;
            cdecl; external 'be' name 'run_add_printer_panel__Fv';
  procedure run_be_about; cdecl; external 'be' name 'run_be_about__Fv';

  procedure set_focus_follows_mouse(follow : Boolean);
            cdecl; external 'be' name 'set_focus_follows_mouse__Fb';
  function focus_follows_mouse : Boolean;
           cdecl; external 'be' name 'focus_follows_mouse__Fv';

//----------------------------------------------------------------

type
  mode_mouse = (
    B_NORMAL_MOUSE,        // = 0
    B_FOCUS_FOLLOWS_MOUSE, // = 1
    bla,
    B_WARP_MOUSE,          // = 3
    blabla,
    blablabla,
    more_blablabla,
    B_INSTANT_WARP_MOUSE   // = 7
  );

  procedure set_mouse_mode(mode : mode_mouse);
            cdecl; external 'be' name 'set_mouse_mode__F10mode_mouse';
  function mouse_mode : mode_mouse;
           cdecl; external 'be' name 'mouse_mode__Fv';

type
// I re-ordered these to match BeAPI's values (BiPolar)
  color_which = (dont_use_me,          // just here to fill '0'.
    B_PANEL_BACKGROUND_COLOR,          // 1
    B_MENU_BACKGROUND_COLOR,           // 2
    B_WINDOW_TAB_COLOR,                // 3
    B_KEYBOARD_NAVIGATION_COLOR,       // 4
    B_DESKTOP_COLOR,                   // 5
    B_MENU_SELECTION_BACKGROUND_COLOR, // 6
    B_MENU_ITEM_TEXT_COLOR,            // 7
    B_MENU_SELECTED_ITEM_TEXT_COLOR    // 8
  );

function ui_color(which : color_which) : rgb_color; cdecl; external 'be' name 'ui_color__F11color_which';
function tint_color(color : rgb_color; which : color_which) : rgb_color; cdecl; external 'be' name 'tint_color__FG9rgb_colorf';

const
  // effects on standard gray level // float
  B_LIGHTEN_MAX_TINT = 0.0;   // 216 --> 255.0 (255)
  B_LIGHTEN_2_TINT   = 0.385; // 216 --> 240.0 (240)
  B_LIGHTEN_1_TINT   = 0.590; // 216 --> 232.0 (232)

  B_NO_TINT          = 1.0;   // 216 --> 216.0 (216)

  B_DARKEN_1_TINT    = 1.147; // 216 --> 184.2 (184)
  B_DARKEN_2_TINT    = 1.295; // 216 --> 152.3 (152)
  B_DARKEN_3_TINT    = 1.407; // 216 --> 128.1 (128)
  B_DARKEN_4_TINT    = 1.555; // 216 -->  96.1  (96)
  B_DARKEN_MAX_TINT  = 2.0;   // 216 -->   0.0   (0)

  B_DISABLED_LABEL_TINT       = B_DARKEN_3_TINT;
  B_HIGHLIGHT_BACKGROUND_TINT = B_DARKEN_2_TINT;
  B_DISABLED_MARK_TINT        = B_LIGHTEN_2_TINT;

implementation

initialization
  B_ROUND_CAP  := B_ROUND_JOIN;
  B_BUTT_CAP   := B_BUTT_JOIN;
  B_SQUARE_CAP := B_SQUARE_JOIN;
end.