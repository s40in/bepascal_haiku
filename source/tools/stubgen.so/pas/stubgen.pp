unit stubgen;

interface

uses
  Classes, SysUtils;

{$PACKRECORDS C}

const
  IGNORE_KIND     =  0;    // a variable or forward declaration */
  FUNC_KIND       =  1;    // a method declaration */
  CLASS_KIND      =  2;    // a class declaration */
  INLINED_KIND    =  3;    // a method w/body in a class decl. */
  SKEL_KIND       =  4;    // a method found in a code file */
  STRUCT_KIND     =  5;    // a struct declaration that's a class */
  DONE_FUNC_KIND  = 11;    // a fn that we've finished expanded */
  DONE_CLASS_KIND = 12;    // a class that we've finished expanded */

type
  PArgument = ^TArgument;
  TArgument = record 
    aType : PChar;
    aName : PChar;
    aArray : PChar;
    Next : PArgument;
  end;

  PSyntaxelem = ^TSyntaxelem;  
  TSyntaxelem = record
    aName : PChar;
    ret_type : PChar;
    args : PArgument;
    templ : PChar;
    parent : PSyntaxelem;
    next : PSyntaxelem;
    children : PSyntaxelem;
    throw_decl : PChar;
    const_flag : Longint;
    kind : Longint;
  end;
  
procedure init_tables; cdecl; external 'stubgen' name 'init_tables';
procedure free_tables; cdecl; external 'stubgen' name 'free_tables';
function scan(FileName : PChar) : PSyntaxelem; cdecl; external 'stubgen' name 'scan';

implementation

end.