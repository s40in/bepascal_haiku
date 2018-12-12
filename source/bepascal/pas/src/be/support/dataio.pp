{   BePascal - A pascal wrapper around the BeOS API
    Copyright (C) 2002 - 2003 Olivier Coursiere
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
unit DataIO;

interface

uses
  BeObj, SupportDefs;

type
  BDataIO = class(TBeObject)
  public
    constructor Create; override;
    destructor Destroy; override;
    function Read(buffer : Pointer; size : size_t) : ssize_t; virtual; abstract;
    function Write(buffer : Pointer; size : size_t) : ssize_t; virtual; abstract;
{    procedure _ReservedDataIO1;
    procedure _ReservedDataIO2;
    procedure _ReservedDataIO3;
    procedure _ReservedDataIO4;
    procedure _ReservedDataIO5;
    procedure _ReservedDataIO6;
    procedure _ReservedDataIO7;
    procedure _ReservedDataIO8;
    procedure _ReservedDataIO9;
    procedure _ReservedDataIO10;
    procedure _ReservedDataIO11;
    procedure _ReservedDataIO12;
}
    constructor Create(DataIO : BDataIO);
//    function operator=( : BDataIO) : BDataIO;
//    procedure int32 _reserved[2];
  end;

  BPositionIO = class(BDataIO)
  public
    constructor Create; override;
    destructor Destroy; override;
//    function Read(buffer : Pointer; size : size_t) : ssize_t; override;
//    function Write(buffer : Pointer; size : size_t) : ssize_t; override;
    function ReadAt(pos : off_t; buffer : Pointer; size : size_t) : ssize_t; virtual; abstract;
    function WriteAt(pos : off_t; buffer : Pointer; size : size_t) : ssize_t; virtual; abstract;
    function Seek(aposition : off_t; seek_mode : Cardinal) : off_t; virtual; abstract;
//    function Position : off_t; virtual;
    function SetSize(size : off_t) : status_t; virtual;
{    procedure _ReservedPositionIO1;
    procedure _ReservedPositionIO2;
    procedure _ReservedPositionIO3;
    procedure _ReservedPositionIO4;
    procedure _ReservedPositionIO5;
    procedure _ReservedPositionIO6;
    procedure _ReservedPositionIO7;
    procedure _ReservedPositionIO8;
    procedure _ReservedPositionIO9;
    procedure _ReservedPositionIO10;
    procedure _ReservedPositionIO11;
    procedure _ReservedPositionIO12;
}
//    procedure int32 _reserved[2];
  end;

  BMallocIO = class(BPositionIO)
  public
    constructor Create; override;
    destructor Destroy; override;
    function ReadAt(pos : off_t; abuffer : Pointer; size : size_t) : ssize_t; override;
    function WriteAt(pos : off_t; abuffer : Pointer; size : size_t) : ssize_t; override;
    function Seek(pos : off_t; seek_mode : Cardinal) : off_t; override;
//    function Position : off_t; override;
    function SetSize(size : off_t) : status_t; override;
    procedure SetBlockSize(blocksize : size_t); virtual;
    function Buffer : Pointer;
//    function BufferLength : size_t;
{    procedure _ReservedMallocIO1;
    procedure _ReservedMallocIO2;
}
//    constructor Create(MallocIO : TMallocIO);
//    function operator=( : TMallocIO) : TMallocIO;
{    function fBlockSize : size_t;
    function fMallocSize : size_t;
    function fLength : size_t;
    function fData : PChar;
    function fPosition : off_t;
}
//    procedure _reserved[1] : integer;
  end;

  BMemoryIO = class(BPositionIO)
  public
    constructor Create; override;
    constructor Create(p : Pointer; len : size_t); virtual;
    destructor Destroy; override;
    function ReadAt(pos : off_t; buffer : Pointer; size : size_t) : ssize_t; override;
    function WriteAt(pos : off_t; buffer : Pointer; size : size_t) : ssize_t; override;
    function Seek(pos : off_t; seek_mode : Cardinal) : off_t; override;
//    function Position : off_t; override;
    function SetSize(size : off_t) : status_t; override;
{    procedure _ReservedMemoryIO1;
    procedure _ReservedMemoryIO2;
}
    constructor Create(MemoryIO : BMemoryIO);
//    function operator=(MemoryIO : BMemoryIO) : BMemoryIO;
{    function fReadOnly : boolean;
    function fBuf : PChar;
    function fLen : size_t;
    function fPhys : size_t;
    function fPos : size_t;
}
//    function _reserved[1] : int32;
  end;

function BDataIO_Create(AObject : TBeObject) : TCPlusObject; cdecl; external BePascalLibName name 'BDataIO_Create_1';
procedure BDataIO_Free(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BDataIO_Free';
//function BDataIO_Read(AObject : TCPlusObject; buffer : Pointer; size : size_t) : ssize_t; cdecl; external BePascalLibName name 'BDataIO_Read';
//function BDataIO_Write(AObject : TCPlusObject; buffer : Pointer; size : size_t) : ssize_t; cdecl; external BePascalLibName name 'BDataIO_Write';
{procedure BDataIO__ReservedDataIO1(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BDataIO__ReservedDataIO1';
procedure BDataIO__ReservedDataIO2(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BDataIO__ReservedDataIO2';
procedure BDataIO__ReservedDataIO3(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BDataIO__ReservedDataIO3';
procedure BDataIO__ReservedDataIO4(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BDataIO__ReservedDataIO4';
procedure BDataIO__ReservedDataIO5(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BDataIO__ReservedDataIO5';
procedure BDataIO__ReservedDataIO6(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BDataIO__ReservedDataIO6';
procedure BDataIO__ReservedDataIO7(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BDataIO__ReservedDataIO7';
procedure BDataIO__ReservedDataIO8(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BDataIO__ReservedDataIO8';
procedure BDataIO__ReservedDataIO9(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BDataIO__ReservedDataIO9';
procedure BDataIO__ReservedDataIO10(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BDataIO__ReservedDataIO10';
procedure BDataIO__ReservedDataIO11(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BDataIO__ReservedDataIO11';
procedure BDataIO__ReservedDataIO12(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BDataIO__ReservedDataIO12';
}
function BDataIO_Create(AObject : TBeObject; DataIO : BDataIO) : TCPlusObject; cdecl; external BePascalLibName name 'BDataIO_Create_2';
//function BDataIO_operator=(AObject : TCPlusObject;  : BDataIO) : BDataIO; cdecl; external BePascalLibName name 'BDataIO_operator=';
//procedure BDataIO_int32 _reserved[2](AObject : TCPlusObject); cdecl; external BePascalLibName name 'BDataIO_int32 _reserved[2]';
function BPositionIO_Create(AObject : TBeObject) : TCPlusObject; cdecl; external BePascalLibName name 'BPositionIO_Create';
procedure BPositionIO_Free(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BPositionIO_Free';
function BPositionIO_Read(AObject : TCPlusObject; buffer : Pointer; size : size_t) : ssize_t; cdecl; external BePascalLibName name 'BPositionIO_Read';
function BPositionIO_Write(AObject : TCPlusObject; buffer : Pointer; size : size_t) : ssize_t; cdecl; external BePascalLibName name 'BPositionIO_Write';
function BPositionIO_ReadAt(AObject : TCPlusObject; pos : off_t; buffer : Pointer; size : size_t) : ssize_t; cdecl; external BePascalLibName name 'BPositionIO_ReadAt';
function BPositionIO_WriteAt(AObject : TCPlusObject; pos : off_t; buffer : Pointer; size : size_t) : ssize_t; cdecl; external BePascalLibName name 'BPositionIO_WriteAt';
function BPositionIO_Seek(AObject : TCPlusObject; position : off_t; seek_mode : Cardinal) : off_t; cdecl; external BePascalLibName name 'BPositionIO_Seek';
//function BPositionIO_Position(AObject : TCPlusObject) : off_t; cdecl; external BePascalLibName name 'BPositionIO_Position';
function BPositionIO_SetSize(AObject : TCPlusObject; size : off_t) : status_t; cdecl; external BePascalLibName name 'BPositionIO_SetSize';
{procedure BPositionIO__ReservedPositionIO1(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BPositionIO__ReservedPositionIO1';
procedure BPositionIO__ReservedPositionIO2(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BPositionIO__ReservedPositionIO2';
procedure BPositionIO__ReservedPositionIO3(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BPositionIO__ReservedPositionIO3';
procedure BPositionIO__ReservedPositionIO4(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BPositionIO__ReservedPositionIO4';
procedure BPositionIO__ReservedPositionIO5(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BPositionIO__ReservedPositionIO5';
procedure BPositionIO__ReservedPositionIO6(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BPositionIO__ReservedPositionIO6';
procedure BPositionIO__ReservedPositionIO7(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BPositionIO__ReservedPositionIO7';
procedure BPositionIO__ReservedPositionIO8(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BPositionIO__ReservedPositionIO8';
procedure BPositionIO__ReservedPositionIO9(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BPositionIO__ReservedPositionIO9';
procedure BPositionIO__ReservedPositionIO10(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BPositionIO__ReservedPositionIO10';
procedure BPositionIO__ReservedPositionIO11(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BPositionIO__ReservedPositionIO11';
procedure BPositionIO__ReservedPositionIO12(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BPositionIO__ReservedPositionIO12';
}
//procedure BPositionIO_int32 _reserved[2](AObject : TCPlusObject); cdecl; external BePascalLibName name 'BPositionIO_int32 _reserved[2]';
function BMallocIO_Create(AObject : TBeObject) : TCPlusObject; cdecl; external BePascalLibName name 'BMallocIO_Create';
procedure BMallocIO_Free(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BMallocIO_Free';
function BMallocIO_ReadAt(AObject : TCPlusObject; pos : off_t; buffer : Pointer; size : size_t) : ssize_t; cdecl; external BePascalLibName name 'BMallocIO_ReadAt';
function BMallocIO_WriteAt(AObject : TCPlusObject; pos : off_t; buffer : Pointer; size : size_t) : ssize_t; cdecl; external BePascalLibName name 'BMallocIO_WriteAt';
function BMallocIO_Seek(AObject : TCPlusObject; pos : off_t; seek_mode : Cardinal) : off_t; cdecl; external BePascalLibName name 'BMallocIO_Seek';
//function BMallocIO_Position(AObject : TCPlusObject) : off_t; cdecl; external BePascalLibName name 'BMallocIO_Position';
function BMallocIO_SetSize(AObject : TCPlusObject; size : off_t) : status_t; cdecl; external BePascalLibName name 'BMallocIO_SetSize';
procedure BMallocIO_SetBlockSize(AObject : TCPlusObject; blocksize : size_t); cdecl; external BePascalLibName name 'BMallocIO_SetBlockSize';
function BMallocIO_Buffer(AObject : TCPlusObject) : Pointer; cdecl; external BePascalLibName name 'BMallocIO_Buffer';
//function BMallocIO_BufferLength(AObject : TCPlusObject) : size_t; cdecl; external BePascalLibName name 'BMallocIO_BufferLength';
{procedure BMallocIO__ReservedMallocIO1(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BMallocIO__ReservedMallocIO1';
procedure BMallocIO__ReservedMallocIO2(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BMallocIO__ReservedMallocIO2';
}
//function BMallocIO_Create(AObject : TBeObject; MallocIO : TMallocIO) : TCPlusObject; cdecl; external BePascalLibName name 'BMallocIO_Create';
//function BMallocIO_operator=(AObject : TCPlusObject; MallocIO : TMallocIO) : TMallocIO; cdecl; external BePascalLibName name 'BMallocIO_operator=';
{procedure BMallocIO_size_t fBlockSize(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BMallocIO_size_t fBlockSize';
procedure BMallocIO_size_t fMallocSize(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BMallocIO_size_t fMallocSize';
procedure BMallocIO_size_t fLength(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BMallocIO_size_t fLength';
procedure BMallocIO_char *fData(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BMallocIO_char *fData';
procedure BMallocIO_off_t fPosition(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BMallocIO_off_t fPosition';
procedure BMallocIO_int32 _reserved[1](AObject : TCPlusObject); cdecl; external BePascalLibName name 'BMallocIO_int32 _reserved[1]';
}
function BMemoryIO_Create(AObject : TBeObject) : TCPlusObject; cdecl; external BePascalLibName name 'BMemoryIO_Create';
function BMemoryIO_Create(AObject : TBeObject; p : Pointer; len : size_t) : TCPlusObject; cdecl; external BePascalLibName name 'BMemoryIO_Create_1';
procedure BMemoryIO_Free(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BMemoryIO_Free';
function BMemoryIO_ReadAt(AObject : TCPlusObject; pos : off_t; buffer : Pointer; size : size_t) : ssize_t; cdecl; external BePascalLibName name 'BMemoryIO_ReadAt';
function BMemoryIO_WriteAt(AObject : TCPlusObject; pos : off_t; buffer : Pointer; size : size_t) : ssize_t; cdecl; external BePascalLibName name 'BMemoryIO_WriteAt';
function BMemoryIO_Seek(AObject : TCPlusObject; pos : off_t; seek_mode : Cardinal) : off_t; cdecl; external BePascalLibName name 'BMemoryIO_Seek';
function BMemoryIO_Position(AObject : TCPlusObject) : off_t; cdecl; external BePascalLibName name 'BMemoryIO_Position';
function BMemoryIO_SetSize(AObject : TCPlusObject; size : off_t) : status_t; cdecl; external BePascalLibName name 'BMemoryIO_SetSize';
{procedure BMemoryIO__ReservedMemoryIO1(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BMemoryIO__ReservedMemoryIO1';
procedure BMemoryIO__ReservedMemoryIO2(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BMemoryIO__ReservedMemoryIO2';
}
function BMemoryIO_Create(AObject : TBeObject; MemoryIO : TCPlusObject) : TCPlusObject; cdecl; external BePascalLibName name 'BMemoryIO_Create';
//function BMemoryIO_operator=(AObject : TCPlusObject;  : BMemoryIO) : BMemoryIO; cdecl; external BePascalLibName name 'BMemoryIO_operator=';
{procedure BMemoryIO_bool fReadOnly(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BMemoryIO_bool fReadOnly';
procedure BMemoryIO_char *fBuf(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BMemoryIO_char *fBuf';
procedure BMemoryIO_size_t fLen(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BMemoryIO_size_t fLen';
procedure BMemoryIO_size_t fPhys(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BMemoryIO_size_t fPhys';
procedure BMemoryIO_size_t fPos(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BMemoryIO_size_t fPos';
procedure BMemoryIO_int32 _reserved[1](AObject : TCPlusObject); cdecl; external BePascalLibName name 'BMemoryIO_int32 _reserved[1]';
}

implementation

constructor BDataIO.Create;
begin
  inherited;
  CPlusObject := BDataIO_Create(Self);
end;

destructor BDataIO.Destroy;
begin
  if CPlusObject <> nil then
    BDataIO_Free(CPlusObject);
  inherited;
end;

{procedure BDataIO._ReservedDataIO1;
begin
  BDataIO__ReservedDataIO1(CPlusObject);
end;

procedure BDataIO._ReservedDataIO2;
begin
  BDataIO__ReservedDataIO2(CPlusObject);
end;

procedure BDataIO._ReservedDataIO3;
begin
  BDataIO__ReservedDataIO3(CPlusObject);
end;

procedure BDataIO._ReservedDataIO4;
begin
  BDataIO__ReservedDataIO4(CPlusObject);
end;

procedure BDataIO._ReservedDataIO5;
begin
  BDataIO__ReservedDataIO5(CPlusObject);
end;

procedure BDataIO._ReservedDataIO6;
begin
  BDataIO__ReservedDataIO6(CPlusObject);
end;

procedure BDataIO._ReservedDataIO7;
begin
  BDataIO__ReservedDataIO7(CPlusObject);
end;

procedure BDataIO._ReservedDataIO8;
begin
  BDataIO__ReservedDataIO8(CPlusObject);
end;

procedure BDataIO._ReservedDataIO9;
begin
  BDataIO__ReservedDataIO9(CPlusObject);
end;

procedure BDataIO._ReservedDataIO10;
begin
  BDataIO__ReservedDataIO10(CPlusObject);
end;

procedure BDataIO._ReservedDataIO11;
begin
  BDataIO__ReservedDataIO11(CPlusObject);
end;

procedure BDataIO._ReservedDataIO12;
begin
  BDataIO__ReservedDataIO12(CPlusObject);
end;
}

constructor BDataIO.Create(DataIO : BDataIO);
begin
  inherited Create;
  CPlusObject := BDataIO_Create(Self, DataIO);
end;

{function BDataIO.operator=( : BDataIO) : BDataIO;
begin
  BDataIO_operator=(CPlusObject, );
end;
}

{procedure BDataIO.int32 _reserved[2];
begin
  BDataIO_int32 _reserved[2](CPlusObject);
end;
}

constructor BPositionIO.Create;
begin
  CPlusObject := BPositionIO_Create(Self);
end;

destructor BPositionIO.Destroy;
begin
  BPositionIO_Free(CPlusObject);
end;

{function BPositionIO.Read(buffer : Pointer; size : size_t) : ssize_t;
begin
  Result := BPositionIO_Read(CPlusObject, buffer, size);
end;

function BPositionIO.Write(buffer : Pointer; size : size_t) : ssize_t;
begin
  Result := BPositionIO_Write(CPlusObject, buffer, size);
end;
}

{function BPositionIO.ReadAt(pos : off_t; buffer : Pointer; size : size_t) : ssize_t;
begin
  Result := BPositionIO_ReadAt(CPlusObject, pos, buffer, size);
end;

function BPositionIO.WriteAt(pos : off_t; buffer : Pointer; size : size_t) : ssize_t;
begin
  Result := BPositionIO_WriteAt(CPlusObject, pos, buffer, size);
end;

function BPositionIO.Seek(aposition : off_t; seek_mode : Cardinal) : off_t;
begin
  Result := BPositionIO_Seek(CPlusObject, aposition, seek_mode);
end;
}

{function BPositionIO.Position : off_t;
begin
  Result := BPositionIO_Position(CPlusObject);
end;
}

function BPositionIO.SetSize(size : off_t) : status_t;
begin
  Result := BPositionIO_SetSize(CPlusObject, size);
end;

{procedure BPositionIO._ReservedPositionIO1;
begin
  BPositionIO__ReservedPositionIO1(CPlusObject);
end;

procedure BPositionIO._ReservedPositionIO2;
begin
  BPositionIO__ReservedPositionIO2(CPlusObject);
end;

procedure BPositionIO._ReservedPositionIO3;
begin
  BPositionIO__ReservedPositionIO3(CPlusObject);
end;

procedure BPositionIO._ReservedPositionIO4;
begin
  BPositionIO__ReservedPositionIO4(CPlusObject);
end;

procedure BPositionIO._ReservedPositionIO5;
begin
  BPositionIO__ReservedPositionIO5(CPlusObject);
end;

procedure BPositionIO._ReservedPositionIO6;
begin
  BPositionIO__ReservedPositionIO6(CPlusObject);
end;

procedure BPositionIO._ReservedPositionIO7;
begin
  BPositionIO__ReservedPositionIO7(CPlusObject);
end;

procedure BPositionIO._ReservedPositionIO8;
begin
  BPositionIO__ReservedPositionIO8(CPlusObject);
end;

procedure BPositionIO._ReservedPositionIO9;
begin
  BPositionIO__ReservedPositionIO9(CPlusObject);
end;

procedure BPositionIO._ReservedPositionIO10;
begin
  BPositionIO__ReservedPositionIO10(CPlusObject);
end;

procedure BPositionIO._ReservedPositionIO11;
begin
  BPositionIO__ReservedPositionIO11(CPlusObject);
end;

procedure BPositionIO._ReservedPositionIO12;
begin
  BPositionIO__ReservedPositionIO12(CPlusObject);
end;
}

{procedure BPositionIO.int32 _reserved[2];
begin
  BPositionIO_int32 _reserved[2](CPlusObject);
end;
}

constructor BMallocIO.Create;
begin
  CPlusObject := BMallocIO_Create(Self);
end;

destructor BMallocIO.Destroy;
begin
  BMallocIO_Free(CPlusObject);
end;

function BMallocIO.ReadAt(pos : off_t; abuffer : Pointer; size : size_t) : ssize_t;
begin
  Result := BMallocIO_ReadAt(CPlusObject, pos, abuffer, size);
end;

function BMallocIO.WriteAt(pos : off_t; abuffer : Pointer; size : size_t) : ssize_t;
begin
  Result := BMallocIO_WriteAt(CPlusObject, pos, abuffer, size);
end;

function BMallocIO.Seek(pos : off_t; seek_mode : Cardinal) : off_t;
begin
  Result := BMallocIO_Seek(CPlusObject, pos, seek_mode);
end;

{function BMallocIO.Position : off_t;
begin
  Result := BMallocIO_Position(CPlusObject);
end;
}

function BMallocIO.SetSize(size : off_t) : status_t;
begin
  Result := BMallocIO_SetSize(CPlusObject, size);
end;

procedure BMallocIO.SetBlockSize(blocksize : size_t);
begin
  BMallocIO_SetBlockSize(CPlusObject, blocksize);
end;

function BMallocIO.Buffer : Pointer;
begin
  Result := BMallocIO_Buffer(CPlusObject);
end;

{function BMallocIO.BufferLength : size_t;
begin
  Result := BMallocIO_BufferLength(CPlusObject);
end;
}

{procedure BMallocIO._ReservedMallocIO1;
begin
  BMallocIO__ReservedMallocIO1(CPlusObject);
end;

procedure BMallocIO._ReservedMallocIO2;
begin
  BMallocIO__ReservedMallocIO2(CPlusObject);
end;
}

//constructor BMallocIO.Create(MallocIO : BMallocIO);
//begin
//  CPlusObject := BMallocIO_Create(Self, MallocIO);
//end;

{function BMallocIO.operator=( : BMallocIO) : BMallocIO;
begin
  BMallocIO_operator=(CPlusObject, );
end;
}

{function BMallocIO.fBlockSize : size_t;
begin
  Result := BMallocIO_fBlockSize(CPlusObject);
end;

function BMallocIO.fMallocSize : size_t;
begin
  Result := BMallocIO_size_t fMallocSize(CPlusObject);
end;

function BMallocIO.fLength : size_t;
begin
  BMallocIO_size_t fLength(CPlusObject);
end;

function BMallocIO.fData : PChar;
begin
  Result := BMallocIO_char *fData(CPlusObject);
end;

function BMallocIO.fPosition : off_t;
begin
  Result := BMallocIO_fPosition(CPlusObject);
end;
}

{procedure BMallocIO.int32 _reserved[1];
begin
  BMallocIO_int32 _reserved[1](CPlusObject);
end;
}

constructor BMemoryIO.Create;
begin
  CPlusObject := BMemoryIO_Create(Self);
end;


constructor BMemoryIO.Create(p : Pointer; len : size_t);
begin
  CPlusObject := BMemoryIO_Create(Self, p, len);
end;

destructor BMemoryIO.Destroy;
begin
  BMemoryIO_Free(CPlusObject);
end;

function BMemoryIO.ReadAt(pos : off_t; buffer : Pointer; size : size_t) : ssize_t;
begin
  Result := BMemoryIO_ReadAt(CPlusObject, pos, buffer, size);
end;

function BMemoryIO.WriteAt(pos : off_t; buffer : Pointer; size :size_t) :ssize_t;
begin
  Result := BMemoryIO_WriteAt(CPlusObject, pos, buffer, size);
end;

function BMemoryIO.Seek(pos : off_t; seek_mode : Cardinal) : off_t;
begin
  Result := BMemoryIO_Seek(CPlusObject, pos, seek_mode);
end;

{function BMemoryIO.Position : off_t;
begin
  Result := BMemoryIO_Position(CPlusObject);
end;
}

function BMemoryIO.SetSize(size : off_t) : status_t;
begin
  Result := BMemoryIO_SetSize(CPlusObject, size);
end;

{procedure BMemoryIO._ReservedMemoryIO1;
begin
  BMemoryIO__ReservedMemoryIO1(CPlusObject);
end;

procedure BMemoryIO._ReservedMemoryIO2;
begin
  BMemoryIO__ReservedMemoryIO2(CPlusObject);
end;
}

constructor BMemoryIO.Create(MemoryIO : BMemoryIO);
begin
  CPlusObject := BMemoryIO_Create(Self, MemoryIO.CPlusObject);
end;

{function BMemoryIO.operator=( : BMemoryIO) : BMemoryIO;
begin
  BMemoryIO_operator=(CPlusObject, );
end;
}

{procedure BMemoryIO.bool fReadOnly;
begin
  BMemoryIO_bool fReadOnly(CPlusObject);
end;

procedure BMemoryIO.char *fBuf;
begin
  BMemoryIO_char *fBuf(CPlusObject);
end;

procedure BMemoryIO.size_t fLen;
begin
  BMemoryIO_size_t fLen(CPlusObject);
end;

procedure BMemoryIO.size_t fPhys;
begin
  BMemoryIO_size_t fPhys(CPlusObject);
end;

procedure BMemoryIO.size_t fPos;
begin
  BMemoryIO_size_t fPos(CPlusObject);
end;

procedure BMemoryIO.int32 _reserved[1];
begin
  BMemoryIO_int32 _reserved[1](CPlusObject);
end;
}

end.