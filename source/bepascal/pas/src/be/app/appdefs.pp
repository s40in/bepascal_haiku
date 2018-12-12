{   BePascal - A pascal wrapper around the BeOS API
    Copyright (C) 2002-2003 Olivier Coursiere
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
unit AppDefs;

interface

const
  // System Messages Codes
  _B_ABOUT_REQUESTED      = '_ABR';
  _B_WINDOW_ACTIVATED     = '_ACT';
  _B_APP_ACTIVATED        = '_ACT'; // Same as B_WINDOW_ACTIVATED
  _B_ARGV_RECEIVED        = '_ARG';
  _B_QUIT_REQUESTED       = '_QRQ';
  _B_CLOSE_REQUESTED      = '_QRQ'; // Obsolete; use B_QUIT_REQUESTED
  _B_CANCEL               = '_CNC';
  _B_KEY_DOWN             = '_KYD';
  _B_KEY_UP               = '_KYU';
  _B_UNMAPPED_KEY_DOWN    = '_UKD';
  _B_UNMAPPED_KEY_UP      = '_UKU';
  _B_MODIFIERS_CHANGED    = '_MCH';
  _B_MINIMIZE             = '_WMN';
  _B_MOUSE_DOWN           = '_MDN';
  _B_MOUSE_MOVED          = '_MMV';
  _B_MOUSE_ENTER_EXIT     = '_MEX';
  _B_MOUSE_UP             = '_MUP';
  _B_MOUSE_WHEEL_CHANGED  = '_MWC';
  _B_OPEN_IN_WORKSPACE    = '_OWS';
  _B_PRINTER_CHANGED      = '_PCH';
  _B_PULSE                = '_PUL';
  _B_READY_TO_RUN         = '_RTR';
  _B_REFS_RECEIVED        = '_RRC';
  _B_RELEASE_OVERLAY_LOCK = '_ROV';
  _B_ACQUIRE_OVERLAY_LOCK = '_AOV';
  _B_SCREEN_CHANGED       = '_SCH';
  _B_VALUE_CHANGED        = '_VCH';
  _B_VIEW_MOVED           = '_VMV';
  _B_VIEW_RESIZED         = '_VRS';
  _B_WINDOW_MOVED         = '_WMV';
  _B_WINDOW_RESIZED       = '_WRS';
  _B_WORKSPACES_CHANGED   = '_WCG';
  _B_WORKSPACE_ACTIVATED  = '_WAC';
  _B_ZOOM                 = '_WZM';
  __APP_MENU_             = '_AMN';
  __BROWSER_MENUS_        = '_BRM';
  __MENU_EVENT_           = '_MEV';
  __PING_                 = '_PBL';
  __QUIT_                 = '_QIT';
  __VOLUME_MOUNTED_       = '_NVL';
  __VOLUME_UNMOUNTED_     = '_VRM';
  __MESSAGE_DROPPED_      = '_MDP';
  __DISPOSE_DRAG_         = '_DPD';
  __MENUS_DONE_           = '_MND';
  __SHOW_DRAG_HANDLES_    = '_SDH';
  __EVENTS_PENDING_       = '_EVP';
  __UPDATE_               = '_UPD';
  __UPDATE_IF_NEEDED_     = '_UPN';
  __PRINTER_INFO_         = '_PIN';
  __SETUP_PRINTER_        = '_SUP';
  __SELECT_PRINTER_       = '_PSL';

  // Other Commands
  _B_SET_PROPERTY           = 'PSET';
  _B_GET_PROPERTY           = 'PGET';
  _B_CREATE_PROPERTY        = 'PCRT';
  _B_DELETE_PROPERTY        = 'PDEL';
  _B_COUNT_PROPERTIES       = 'PCNT';
  _B_EXECUTE_PROPERTY       = 'PEXE';
  _B_GET_SUPPORTED_SUITES   = 'SUIT';
  _B_UNDO                   = 'UNDO';
  _B_CUT                    = 'CCUT';
  _B_COPY                   = 'COPY';
  _B_PASTE                  = 'PSTE';
  _B_SELECT_ALL             = 'SALL';
  _B_SAVE_REQUESTED         = 'SAVE';
  _B_MESSAGE_NOT_UNDERSTOOD = 'MNOT';
  _B_NO_REPLY               = 'NONE';
  _B_REPLY                  = 'RPLY';
  _B_SIMPLE_DATA            = 'DATA';
  _B_MIME_DATA              = 'MIME';
  _B_ARCHIVED_OBJECT        = 'ARCV';
  _B_UPDATE_STATUS_BAR      = 'SBUP';
  _B_RESET_STATUS_BAR       = 'SBRS';
  _B_NODE_MONITOR           = 'NDMN';
  _B_QUERY_UPDATE           = 'QUPD';
  _B_ENDORSABLE             = 'ENDO';
  _B_COPY_TARGET            = 'DDCP';
  _B_MOVE_TARGET            = 'DDMV';
  _B_TRASH_TARGET           = 'DDRM';
  _B_LINK_TARGET            = 'DDLN';
  _B_INPUT_DEVICES_CHANGED  = 'IDCH';
  _B_INPUT_METHOD_EVENT     = 'IMEV';
  _B_WINDOW_MOVE_TO         = 'WDMT';
  _B_WINDOW_MOVE_BY         = 'WDMB';
  _B_SILENT_RELAUNCH        = 'AREL';
  _B_OBSERVER_NOTICE_CHANGE = 'NTCH';
  _B_CONTROL_INVOKED        = 'CIVK';
  _B_CONTROL_MODIFIED       = 'CMOD';

  // Media Kit reserves all reserved codes starting in 'TRI'

var
  B_ABOUT_REQUESTED,
  B_WINDOW_ACTIVATED,
  B_APP_ACTIVATED,
  B_ARGV_RECEIVED,
  B_QUIT_REQUESTED,
  B_CLOSE_REQUESTED,
  B_CANCEL,
  B_KEY_DOWN,
  B_KEY_UP,
  B_UNMAPPED_KEY_DOWN,
  B_UNMAPPED_KEY_UP,
  B_MODIFIERS_CHANGED,
  B_MINIMIZE,
  B_MOUSE_DOWN,
  B_MOUSE_MOVED,
  B_MOUSE_ENTER_EXIT,
  B_MOUSE_UP,
  B_MOUSE_WHEEL_CHANGED,
  B_OPEN_IN_WORKSPACE,
  B_PRINTER_CHANGED,
  B_PULSE,
  B_READY_TO_RUN,
  B_REFS_RECEIVED,
  B_RELEASE_OVERLAY_LOCK,
  B_ACQUIRE_OVERLAY_LOCK,
  B_SCREEN_CHANGED,
  B_VALUE_CHANGED,
  B_VIEW_MOVED,
  B_VIEW_RESIZED,
  B_WINDOW_MOVED,
  B_WINDOW_RESIZED,
  B_WORKSPACES_CHANGED,
  B_WORKSPACE_ACTIVATED,
  B_ZOOM,
  _APP_MENU_,
  _BROWSER_MENUS_,
  _MENU_EVENT_,
  _PING_,
  _QUIT_,
  _VOLUME_MOUNTED_,
  _VOLUME_UNMOUNTED_,
  _MESSAGE_DROPPED_,
  _DISPOSE_DRAG_,
  _MENUS_DONE_,
  _SHOW_DRAG_HANDLES_,
  _EVENTS_PENDING_,
  _UPDATE_,
  _UPDATE_IF_NEEDED_,
  _PRINTER_INFO_,
  _SETUP_PRINTER_,
  _SELECT_PRINTER_,

  // Other Commands
  B_SET_PROPERTY,
  B_GET_PROPERTY,
  B_CREATE_PROPERTY,
  B_DELETE_PROPERTY,
  B_COUNT_PROPERTIES,
  B_EXECUTE_PROPERTY,
  B_GET_SUPPORTED_SUITES,
  B_UNDO,
  B_CUT,
  B_COPY,
  B_PASTE,
  B_SELECT_ALL,
  B_SAVE_REQUESTED,
  B_MESSAGE_NOT_UNDERSTOOD,
  B_NO_REPLY,
  B_REPLY,
  B_SIMPLE_DATA,
  B_MIME_DATA,
  B_ARCHIVED_OBJECT,
  B_UPDATE_STATUS_BAR,
  B_RESET_STATUS_BAR,
  B_NODE_MONITOR,
  B_QUERY_UPDATE,
  B_ENDORSABLE,
  B_COPY_TARGET,
  B_MOVE_TARGET,
  B_TRASH_TARGET,
  B_LINK_TARGET,
  B_INPUT_DEVICES_CHANGED,
  B_INPUT_METHOD_EVENT,
  B_WINDOW_MOVE_TO,
  B_WINDOW_MOVE_BY,
  B_SILENT_RELAUNCH,
  B_OBSERVER_NOTICE_CHANGE,
  B_CONTROL_INVOKED,
  B_CONTROL_MODIFIED        : Longword;

implementation

uses
  BeObj;

initialization
  // System Messages Codes
  B_ABOUT_REQUESTED      := _B_ABOUT_REQUESTED;
  B_WINDOW_ACTIVATED     := _B_WINDOW_ACTIVATED;
  B_APP_ACTIVATED        := _B_APP_ACTIVATED;
  B_ARGV_RECEIVED        := _B_ARGV_RECEIVED;
  B_QUIT_REQUESTED       := _B_QUIT_REQUESTED;
  B_CLOSE_REQUESTED      := _B_CLOSE_REQUESTED;
  B_CANCEL               := _B_CANCEL;
  B_KEY_DOWN             := _B_KEY_DOWN;
  B_KEY_UP               := _B_KEY_UP;
  B_UNMAPPED_KEY_DOWN    := _B_UNMAPPED_KEY_DOWN;
  B_UNMAPPED_KEY_UP      := _B_UNMAPPED_KEY_UP;
  B_MODIFIERS_CHANGED    := _B_MODIFIERS_CHANGED;
  B_MINIMIZE             := _B_MINIMIZE;
  B_MOUSE_DOWN           := _B_MOUSE_DOWN;
  B_MOUSE_MOVED          := _B_MOUSE_MOVED;
  B_MOUSE_ENTER_EXIT     := _B_MOUSE_ENTER_EXIT;
  B_MOUSE_UP             := _B_MOUSE_UP;
  B_MOUSE_WHEEL_CHANGED  := _B_MOUSE_WHEEL_CHANGED;
  B_OPEN_IN_WORKSPACE    := _B_OPEN_IN_WORKSPACE;
  B_PRINTER_CHANGED      := _B_PRINTER_CHANGED;
  B_PULSE                := _B_PULSE;
  B_READY_TO_RUN         := _B_READY_TO_RUN;
  B_REFS_RECEIVED        := _B_REFS_RECEIVED;
  B_RELEASE_OVERLAY_LOCK := _B_RELEASE_OVERLAY_LOCK;
  B_ACQUIRE_OVERLAY_LOCK := _B_ACQUIRE_OVERLAY_LOCK;
  B_SCREEN_CHANGED       := _B_SCREEN_CHANGED;
  B_VALUE_CHANGED        := _B_VALUE_CHANGED;
  B_VIEW_MOVED           := _B_VIEW_MOVED;
  B_VIEW_RESIZED         := _B_VIEW_RESIZED;
  B_WINDOW_MOVED         := _B_WINDOW_MOVED;
  B_WINDOW_RESIZED       := _B_WINDOW_RESIZED;
  B_WORKSPACES_CHANGED   := _B_WORKSPACES_CHANGED;
  B_WORKSPACE_ACTIVATED  := _B_WORKSPACE_ACTIVATED;
  B_ZOOM                 := _B_ZOOM;
  _APP_MENU_             := __APP_MENU_;
  _BROWSER_MENUS_        := __BROWSER_MENUS_;
  _MENU_EVENT_           := __MENU_EVENT_;
  _PING_                 := __PING_;
  _QUIT_                 := __QUIT_;
  _VOLUME_MOUNTED_       := __VOLUME_MOUNTED_;
  _VOLUME_UNMOUNTED_     := __VOLUME_UNMOUNTED_;
  _MESSAGE_DROPPED_      := __MESSAGE_DROPPED_;
  _DISPOSE_DRAG_         := __DISPOSE_DRAG_;
  _MENUS_DONE_           := __MENUS_DONE_;
  _SHOW_DRAG_HANDLES_    := __SHOW_DRAG_HANDLES_;
  _EVENTS_PENDING_       := __EVENTS_PENDING_;
  _UPDATE_               := __UPDATE_;
  _UPDATE_IF_NEEDED_     := __UPDATE_IF_NEEDED_;
  _PRINTER_INFO_         := __PRINTER_INFO_;
  _SETUP_PRINTER_        := __SETUP_PRINTER_;
  _SELECT_PRINTER_       := __SELECT_PRINTER_;

  // Other Commands	
  B_SET_PROPERTY           := _B_SET_PROPERTY;
  B_GET_PROPERTY           := _B_GET_PROPERTY;
  B_CREATE_PROPERTY        := _B_CREATE_PROPERTY;
  B_DELETE_PROPERTY        := _B_DELETE_PROPERTY;
  B_COUNT_PROPERTIES       := _B_COUNT_PROPERTIES;
  B_EXECUTE_PROPERTY       := _B_EXECUTE_PROPERTY;
  B_GET_SUPPORTED_SUITES   := _B_GET_SUPPORTED_SUITES;
  B_UNDO                   := _B_UNDO;
  B_CUT                    := _B_CUT;
  B_COPY                   := _B_COPY;
  B_PASTE                  := _B_PASTE;
  B_SELECT_ALL             := _B_SELECT_ALL;
  B_SAVE_REQUESTED         := _B_SAVE_REQUESTED;
  B_MESSAGE_NOT_UNDERSTOOD := _B_MESSAGE_NOT_UNDERSTOOD;
  B_NO_REPLY               := _B_NO_REPLY;
  B_REPLY                  := _B_REPLY;
  B_SIMPLE_DATA            := _B_SIMPLE_DATA;
  B_MIME_DATA              := _B_MIME_DATA;
  B_ARCHIVED_OBJECT        := _B_ARCHIVED_OBJECT;
  B_UPDATE_STATUS_BAR      := _B_UPDATE_STATUS_BAR;
  B_RESET_STATUS_BAR       := _B_RESET_STATUS_BAR;
  B_NODE_MONITOR           := _B_NODE_MONITOR;
  B_QUERY_UPDATE           := _B_QUERY_UPDATE;
  B_ENDORSABLE             := _B_ENDORSABLE;
  B_COPY_TARGET            := _B_COPY_TARGET;
  B_MOVE_TARGET            := _B_MOVE_TARGET;
  B_TRASH_TARGET           := _B_TRASH_TARGET;
  B_LINK_TARGET            := _B_LINK_TARGET;
  B_INPUT_DEVICES_CHANGED  := _B_INPUT_DEVICES_CHANGED;
  B_INPUT_METHOD_EVENT     := _B_INPUT_METHOD_EVENT;
  B_WINDOW_MOVE_TO         := _B_WINDOW_MOVE_TO;
  B_WINDOW_MOVE_BY         := _B_WINDOW_MOVE_BY;
  B_SILENT_RELAUNCH        := _B_SILENT_RELAUNCH;
  B_OBSERVER_NOTICE_CHANGE := _B_OBSERVER_NOTICE_CHANGE;
  B_CONTROL_INVOKED        := _B_CONTROL_INVOKED;
  B_CONTROL_MODIFIED       := _B_CONTROL_MODIFIED;
end.