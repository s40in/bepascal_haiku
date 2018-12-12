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
unit _beep;

interface

uses
  SupportDefs;

// As the following are simple function, we can link directly to libbe.so.
// beep__Fv is the mangled name of the C function in libbe.so.

function beep : status_t; cdecl; external 'be' name 'beep__Fv';
function system_beep(const event_name : PChar) : status_t; cdecl; external 'be' name 'system_beep__FPCc';
function add_system_beep_event(const event_name : PChar; flags : Longword) : status_t; cdecl; external 'be' name 'add_system_beep_event__FPCcUl';

implementation

end.