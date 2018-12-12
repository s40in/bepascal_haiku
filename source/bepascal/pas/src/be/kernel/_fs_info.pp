unit _fs_info;
// Description: File system information.

interface

uses
  {BeBuild, types,} SupportDefs, OS;

{$I beostypes.inc}

const
  B_FS_IS_READONLY   = $00000001;
  B_FS_IS_REMOVABLE  = $00000002;
  B_FS_IS_PERSISTENT = $00000004;
  B_FS_IS_SHARED     = $00000008;
  B_FS_HAS_MIME      = $00010000;
  B_FS_HAS_ATTR      = $00020000;
  B_FS_HAS_QUERY     = $00040000;

type
  fs_info = packed record
    dev           : dev_t;                     // fs dev_t
    root          : ino_t;                     // root ino_t
    flags         : Longword;                  // file system flags
    block_size,                                // fundamental block size
    io_size,                                   // optimal io size
    total_blocks,                              // total number of blocks
    free_blocks,                               // number of free blocks
    total_nodes,                               // total number of nodes
    free_nodes   : off_t;                      // number of free nodes
    device_name  : string[128];                // device holding fs
    volume_name  : string[B_FILE_NAME_LENGTH]; // volume name
    fsh_name     : string[B_OS_NAME_LENGTH];   // name of fs handler
  end;

function dev_for_path(const path : PChar) : dev_t;
         cdecl; external 'root' name 'dev_for_path';

function next_dev(var pos : Longint) : dev_t;
         cdecl; external 'root' name 'next_dev';

function fs_stat_dev(dev : dev_t; var info : fs_info) : Integer;
         cdecl; external 'root' name 'fs_stat_dev';

implementation

end.
