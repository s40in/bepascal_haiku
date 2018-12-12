// Description: Kernel interface for managing executable images.
unit image;

interface

uses
  OS, SupportDefs;

{$I beostypes.inc}

//----- Image types, info, and functions ------------------
const
  B_INIT_BEFORE_FUNCTION_NAME = 'initialize_before';
  B_INIT_AFTER_FUNCTION_NAME  = 'initialize_after';
  B_TERM_BEFORE_FUNCTION_NAME = 'terminate_before';
  B_TERM_AFTER_FUNCTION_NAME  = 'terminate_after';

type
  image_id = Longint;

  image_type = (filler_blabla,
    B_APP_IMAGE,
    B_LIBRARY_IMAGE,
    B_ADD_ON_IMAGE,
    B_SYSTEM_IMAGE
  );

  image_info = record
    id : image_id;
    iitype : image_type;        // Renamed type <-> iitype
    sequence : Longint;
    init_order : Longint;
    init_routine : procedure; // ( * init_routine)();
    term_routine : procedure;
    device : dev_t;
    node : ino_t;
	name : array[0..MAXPATHLEN-1] of Char;
    text : Pointer;
    data : Pointer;
    text_size : Longint;
    data_size : Longint;
  end;

function load_image(argc : Longint; const argv : PPChar; const envp : PPChar)
         : thread_id; cdecl; external 'root' name 'load_image';
function load_add_on(const path : PChar) : image_id;
           cdecl; external 'root' name 'load_add_on';
function unload_add_on(imid : image_id) : status_t;
           cdecl; external 'root' name 'unload_add_on';

// private; use the macros, below
function _get_image_info(image : image_id; info : image_info; size : size_t)
         : status_t; cdecl; external 'root' name '_get_image_info';

function _get_next_image_info(team : team_id; cookie : Longint; info : image_info; size : size_t)
         : status_t; cdecl; external 'root' name '_get_next_image_info';

// use these
function get_image_info(image : image_id; info : image_info) : status_t;
function get_next_image_info(team : team_id; cookie : Longint;
                             info : image_info) : status_t;

//----- symbol types and functions ------------------------
const
  B_SYMBOL_TYPE_DATA = $1;
  B_SYMBOL_TYPE_TEXT = $2;
  B_SYMBOL_TYPE_ANY  = $5;

function get_image_symbol(imid : image_id; const name : PChar; sclass : Longint;
                          var ptr : Pointer)
         : status_t; cdecl; external 'root' name 'get_image_symbol';

function get_nth_image_symbol(imid : image_id; index : Longint; buf : PChar;
                              bufsize : Longint; sclass : Longint;
                              var ptr : Pointer)
         : status_t; cdecl; external 'root' name 'get_nth_image_symbol';

//----- cache manipulation --------------------------------
const
  B_FLUSH_DCACHE      = $0001; // dcache = data cache
  B_FLUSH_ICACHE      = $0004; // icache = instruction cache
  B_INVALIDATE_DCACHE = $0002;
  B_INVALIDATE_ICACHE = $0008;

procedure clear_caches(addr : Pointer; len : size_t; flags : Longword);
            cdecl; external 'root' name 'clear_caches';

//---------------------------------------------------------

implementation

// these were macros

function get_image_info(image : image_id; info : image_info) : status_t;
begin
  Result := _get_image_info(image, info, SizeOf(info));
end;

function get_next_image_info(team : team_id; cookie : Longint; info : image_info) : status_t;
begin
  Result := _get_next_image_info(team, cookie, info, SizeOf(info));
end;

end.