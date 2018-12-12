unit fs_index;
// Description: Interface to extended file system indexing.

interface

uses
  SupportDefs;

{$I beostypes.inc}

type
  index_info = packed record
    type               : Longword;
    size               : off_t;
    modification_time,
    creation_time      : time_t;
    uid                : uid_t;
    gid                : gid_t;
  end;


function fs_open_index_dir(device : dev_t) : DIR; cdecl; external 'root' name 'fs_open_index_dir';
function fs_close_index_dir(var d : DIR) : Integer; cdecl; external 'root' name 'fs_close_index_dir';
function fs_read_index_dir(var d : DIR) : dirent; cdecl; external 'root' name 'fs_read_index_dir';

procedure fs_rewind_index_dir(var d : DIR); cdecl; external 'root' name 'fs_rewind_index_dir';

function fs_create_index(device : dev_t; const name : PChar; type : Integer;
                         flags : Cardinal) : Integer;
         cdecl; external 'root' name 'fs_create_index';

function fs_remove_index(device : dev_t; const name : PChar) : Integer;
         cdecl; external 'root' name 'fs_remove_index';

function fs_stat_index(device : dev_t; const name : PChar; var buf : index_info)
         : Integer; cdecl; external 'root' name 'fs_stat_index';

implementation

end.