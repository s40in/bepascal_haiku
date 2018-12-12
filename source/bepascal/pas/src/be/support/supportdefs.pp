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
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
    Library General Public License for more details.

    You should have received a copy of the GNU Library General Public
    License along with this library; if not, write to the Free
    Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
}
unit SupportDefs;

interface

type
  // For Storage kit
  // TODO : move these declarations in a different unit (but which one ?).
  // C++ declarations are in /boot/develop/headers/posix/sys/types.h,
  // not in SupportDefs.h
  dev_t = Longint;
  off_t = Int64;

  // import from stddef.h
  size_t = Longword;
  ssize_t = Longint;

// ------------------

  // Descriptive formats
  status_t = Longint;
  bigtime_t = int64;
  type_code = Longword;
  perform_code = Longword;

  // pointer types for FreePascal : to make life easier
  Pstatus_t = ^status_t;

const
  B_EMPTY_STRING = '';

//----- Atomic functions; old value is returned -----------------
function atomic_add(var value : Longint; addvalue : Longint) : Longint;
         cdecl; external 'root' name 'atomic_add';
function atomic_and(var value : Longint; andvalue : Longint) : Longint;
         cdecl; external 'root' name 'atomic_and';
function atomic_or(var value : Longint; orvalue : Longint) : Longint;
         cdecl; external 'root' name 'atomic_or';

//----- Other stuff ---------------------------------------------
function get_stack_frame : Pointer; cdecl; external 'root' name 'get_stack_frame';

implementation

end.
