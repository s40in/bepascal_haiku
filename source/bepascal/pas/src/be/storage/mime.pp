unit Mime;
// Description: MIME string functions

interface

uses
  BeObj, Bitmap, Entry, Message, Messenger, SupportDefs, StorageDefs, _String;

function update_mime_info(const path : PChar; recursive : Integer;
                          synchronous : Integer; force : Integer) : Integer;
         cdecl; external 'be' name 'update_mime_info';
function create_app_meta_mime(const path: PChar; recursive : Integer;
                              synchronous : Integer; force : Integer) : status_t;
         cdecl; external 'be' name 'create_app_meta_mime';
function get_device_icon(const dev : PChar; var icon : Pointer; size : Longint) : status_t;
         cdecl; external 'be' name 'get_device_icon';

const
  _B_MIME_STRING_TYPE = 'MIMS';
var
  B_MIME_STRING_TYPE : Longword;

// these replace: enum icon_size {B_LARGE_ICON = 32, B_MINI_ICON = 16}
type
  icon_size = Integer;

const
  B_LARGE_ICON = 32;
  B_MINI_ICON  = 16;

type
  app_verb = (B_OPEN);

var
  B_APP_MIME_TYPE      : PChar; cvar; external; // platform dependent
  B_PEF_APP_MIME_TYPE  : PChar; cvar; external; // "application/x-be-executable"
  B_PE_APP_MIME_TYPE   : PChar; cvar; external; // "application/x-vnd.be-peexecutable"
  B_ELF_APP_MIME_TYPE  : PChar; cvar; external; // "application/x-vnd.be-elfexecutable"
  B_RESOURCE_MIME_TYPE : PChar; cvar; external; // "application/x-be-resource"
  B_FILE_MIME_TYPE     : PChar; cvar; external; // "application/octet-stream"

// -------------------------------------------------------------
const
  _B_META_MIME_CHANGED = 'MMCH';
var
  B_META_MIME_CHANGED : Longword;

const
  B_ICON_CHANGED              = $00000001;
  B_PREFERRED_APP_CHANGED     = $00000002;
  B_ATTR_INFO_CHANGED         = $00000004;
  B_FILE_EXTENSIONS_CHANGED   = $00000008;
  B_SHORT_DESCRIPTION_CHANGED = $00000010;
  B_LONG_DESCRIPTION_CHANGED  = $00000020;
  B_ICON_FOR_TYPE_CHANGED     = $00000040;
  B_APP_HINT_CHANGED          = $00000080;
  B_MIME_TYPE_CREATED         = $00000100;
  B_MIME_TYPE_DELETED         = $00000200;
  B_SNIFFER_RULE_CHANGED      = $00000400;

  B_EVERYTHING_CHANGED        : Integer = $FFFFFFFF;

// -------------------------------------------------------------
(*
type
  BMimeType = class(TBeObject)
  public
    constructor Create;
    constructor Create(const MIME_type : PChar);
    destructor Destroy; override;

    function SetTo(const MIME_type : PChar) : status_t;
    procedure Unset;
    function InitCheck : status_t;

    // these functions simply perform string manipulations
    _Type : PChar;
    function IsValid : Boolean;
    function IsSupertypeOnly : Boolean;
    function IsInstalled : Boolean;
    function GetSupertype(var super_type : BMimeType) : status_t;

// Sadly, we don't have Class operators :-(
//    bool operator==(const BMimeType &type) : Boolean;
//    bool operator==(const char *type) : Boolean;

    function Contains(const type_ : BMimeType) : Boolean;

    // These functions are for managing data in the meta mime file
    function Install : status_t;
    function Delete : status_t;
    function GetIcon(var icon : BBitmap; wich : icon_size) : status_t;
    function GetPreferredApp(var signature : PChar; verb : app_verb {$ifndef VER1_0}= B_OPEN{$endif}) : status_t;
    function GetAttrInfo(var info : BMessage) : status_t;
    function GetFileExtensions(var extensions : BMessage) : status_t;
    function GetShortDescription(var description : PChar) : status_t;
    function GetLongDescription(var description : PChar) : status_t;
    function GetSupportingApps(var signatures : BMessage) : status_t;

    function SetIcon(const icon : BBitmap; wich : icon_size) : status_t;
    function SetPreferredApp(const signature : PChar;
                             verb : app_verb {$ifndef VER1_0}= B_OPEN{$endif}) : status_t;
    function SetAttrInfo(const info : BMessage) : status_t;
    function SetFileExtensions(const extensions : BMessage) : status_t;
    function SetShortDescription(const description : PChar) : status_t;
    function SetLongDescription(const description : PChar) : status_t;

    function GetInstalledSupertypes(var super_types : BMessage) : status_t;
    function GetInstalledTypes(var types : BMessage) : status_t;
    function GetInstalledTypes(const super_type : PChar; var subtypes : BMessage) : status_t;
    function GetWildcardApps(wild_ones : BMessage) : status_t;
    function IsValid(const _string : PChar) : Boolean;

    function GetAppHint(var ref : entry_ref) : status_t;
    function SetAppHint(const ref : entry_ref) : status_t;

    // for application signatures only.
    function GetIconForType(const type_ : PChar; var icon : BBitmap; which : icon_size) : status_t;
    function SetIconForType(const type_ : PChar; const icon : BBitmap; which : icon_size) : status_t;

    // sniffer rule manipulation
    function GetSnifferRule(var result : BString) : status_t;
    function SetSnifferRule(const rule : PChar) : status_t;
    function CheckSnifferRule(const rule : PChar; var parseError : BString) : status_t;

    // calls to ask the sniffer to identify the MIME type of a file or data in memory
    function GuessMimeType(const _file : entry_ref; var result : BMimeType) : status_t;
    function GuessMimeType(const buffer : Pointer; length : Longint; var result : BMimeType) : status_t;
    function GuessMimeType(const filename : PChar; var result : BMimeType) : status_t;

    function StartWatching(target : BMessenger) : status_t;
    function StopWatching(target : BMessenger) : status_t;

    // Deprecated  Use SetTo instead.
    function SetType(const MIME_type : PChar) : status_t;
  end;
*)
implementation

initialization
  B_MIME_STRING_TYPE  := _B_MIME_STRING_TYPE;
  B_META_MIME_CHANGED := _B_META_MIME_CHANGED;
end.