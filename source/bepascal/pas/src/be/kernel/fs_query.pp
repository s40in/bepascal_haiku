unit fs_query;

// Description: C interface to the BeOS file system query mechanism.

interface

uses
  OS, SupportDefs;

{$I beostypes.inc}

// flags for fs_open_query()
const
  B_LIVE_QUERY = $00000001;


function fs_open_query(device : dev_t; const query : PChar; flags : Longword)
         : DIR; cdecl; external 'root' name 'fs_open_query';
function fs_open_live_query(device : dev_t; const query : PChar; flags : Longword;
                            port : port_id; token : Longint)
         : DIR; cdecl; external 'root' name 'fs_open_live_query';

function fs_close_query(d : DIR) : Smallint; cdecl; external 'root' name 'fs_close_query';
function fs_read_query(d : DIR) : dirent; cdecl; external 'root' name 'fs_read_query';

function get_path_for_dirent(dent : dirent; buf : PChar; len : size_t)
         : status_t; cdecl; external 'root' name 'get_path_for_dirent';

implementation

end.