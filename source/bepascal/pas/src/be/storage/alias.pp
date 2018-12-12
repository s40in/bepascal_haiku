// Description: path->alias->path functions
unit Alias;

interface

uses
  DataIO, Path, SupportDefs;

function resolve_link(const path : PChar; result : BPath; block : Boolean {$ifndef VER1_0}= False{$endif})
         : status_t; cdecl; external 'be' name 'resolve_link__FPCcP5BPathb';

function write_alias(const path : PChar; s : BDataIO; len : size_t {$ifndef VER1_0}= nil{$endif})
         : status_t; cdecl; external 'be' name 'write_alias__FPCcP7BDataIOPUl';
function write_alias(const path : PChar; buf : Pointer; len : size_t)
         : status_t; cdecl; external 'be' name 'write_alias__FPCcPvPUl';

function read_alias(s : BDataIO; result : BPath; len : size_t {$ifndef VER1_0}= nil{$endif}; block : Boolean {$ifndef VER1_0}= False{$endif})
         : status_t; cdecl; external 'be' name 'read_alias__FP7BDataIOP5BPathPUlb';
function read_alias(const buf : Pointer; result : BPath; len : size_t;  block : Boolean {$ifndef VER1_0}= False{$endif})
         : status_t; cdecl; external 'be' name 'read_alias__FPCvP5BPathPUlb';

implementation

end.
