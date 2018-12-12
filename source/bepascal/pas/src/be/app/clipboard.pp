{   BePascal - A pascal wrapper around the BeOS API                             
    Copyright (C) 2002 Olivier Coursiere                                        
                       Eric Jourde                                              
                                                                                
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
unit clipboard;

interface

uses
  beobj,messenger,SupportDefs,message;

type
  BClipboard = class(TBeObject)
  private
  public
    constructor Create(aname : pchar; transient :boolean);
    destructor Destroy;override;
    function Name : PChar;
    function LocalCount : Cardinal;
    function SystemCount : Cardinal;
    function StartWatching(target : BMessenger) : status_t;
    function StopWatching(target : BMessenger) : status_t;
    function Lock : boolean;
    procedure Unlock;
    function IsLocked : boolean;
    function Clear : status_t;
    function Commit : status_t;
    function Revert : status_t;
    function DataSource : BMessenger;
    function Data : BMessage;
    //constructor Create( : BClipboard);
  {  function operator=( : BClipboard) : BClipboard;
    procedure _ReservedClipboard1;
    procedure _ReservedClipboard2;
    procedure _ReservedClipboard3;
    function AssertLocked : boolean;
    function DownloadFromSystem(force : boolean) : TStatus_t;
    function UploadToSystem : TStatus_t;
    procedure uint32 fCount;
    procedure BMessage *fData;
    procedure BLocker fLock;
    procedure BMessenger fClipHandler;
    procedure BMessenger fDataSource;
    procedure uint32 fSystemCount;
    procedure char *fName;
    procedure uint32 _reserved[4];
  }
  end;

function Get_be_clipboard : TCPlusObject; cdecl; external BePascalLibName;


function BClipboard_Create(AObject : TBeObject;name : pchar; transient :boolean): TCPlusObject; cdecl; external BePascalLibName name 'BClipboard_Create';
procedure BClipboard_Free(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BClipboard_Free';
function BClipboard_Name(AObject : TCPlusObject) : PChar; cdecl; external BePascalLibName name 'BClipboard_Name';
function BClipboard_LocalCount(AObject : TCPlusObject) : Cardinal; cdecl; external BePascalLibName name 'BClipboard_LocalCount';
function BClipboard_SystemCount(AObject : TCPlusObject) : Cardinal; cdecl; external BePascalLibName name 'BClipboard_SystemCount';
function BClipboard_StartWatching(AObject : TCPlusObject; target : TCPlusObject) : status_t; cdecl; external BePascalLibName name 'BClipboard_StartWatching';
function BClipboard_StopWatching(AObject : TCPlusObject; target : TCPlusObject) : status_t; cdecl; external BePascalLibName name 'BClipboard_StopWatching';
function BClipboard_Lock(AObject : TCPlusObject) : boolean; cdecl; external BePascalLibName name 'BClipboard_Lock';
procedure BClipboard_Unlock(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BClipboard_Unlock';
function BClipboard_IsLocked(AObject : TCPlusObject) : boolean; cdecl; external BePascalLibName name 'BClipboard_IsLocked';
function BClipboard_Clear(AObject : TCPlusObject) : status_t; cdecl; external BePascalLibName name 'BClipboard_Clear';
function BClipboard_Commit(AObject : TCPlusObject) : status_t; cdecl; external BePascalLibName name 'BClipboard_Commit';
function BClipboard_Revert(AObject : TCPlusObject) : status_t; cdecl; external BePascalLibName name 'BClipboard_Revert';
function BClipboard_DataSource(AObject : TCPlusObject) : BMessenger; cdecl; external BePascalLibName name 'BClipboard_DataSource';
function BClipboard_Data(AObject : TCPlusObject) : BMessage; cdecl; external BePascalLibName name 'BClipboard_Data';
{function BClipboard_Create(AObject : TBeObject;  : BClipboard); cdecl; external BePascalLibName name 'BClipboard_Create';
function BClipboard_operator=(AObject : TCPlusObject;  : BClipboard) : BClipboard; cdecl; external BePascalLibName name 'BClipboard_operator=';
procedure BClipboard__ReservedClipboard1(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BClipboard__ReservedClipboard1';
procedure BClipboard__ReservedClipboard2(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BClipboard__ReservedClipboard2';
procedure BClipboard__ReservedClipboard3(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BClipboard__ReservedClipboard3';
function BClipboard_AssertLocked(AObject : TCPlusObject) : boolean; cdecl; external BePascalLibName name 'BClipboard_AssertLocked';
function BClipboard_DownloadFromSystem(AObject : TCPlusObject; force : boolean) : TStatus_t; cdecl; external BePascalLibName name 'BClipboard_DownloadFromSystem';
function BClipboard_UploadToSystem(AObject : TCPlusObject) : TStatus_t; cdecl; external BePascalLibName name 'BClipboard_UploadToSystem';
procedure BClipboard_uint32 fCount(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BClipboard_uint32 fCount';
procedure BClipboard_BMessage *fData(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BClipboard_BMessage *fData';
procedure BClipboard_BLocker fLock(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BClipboard_BLocker fLock';
procedure BClipboard_BMessenger fClipHandler(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BClipboard_BMessenger fClipHandler';
procedure BClipboard_BMessenger fDataSource(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BClipboard_BMessenger fDataSource';
procedure BClipboard_uint32 fSystemCount(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BClipboard_uint32 fSystemCount';
procedure BClipboard_char *fName(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BClipboard_char *fName';
procedure BClipboard_uint32 _reserved[4](AObject : TCPlusObject); cdecl; external BePascalLibName name 'BClipboard_uint32 _reserved[4]';
}

var be_clipboard : BClipboard;

implementation

constructor BClipboard.Create(aname : pchar; transient :boolean);
begin
  inherited create;
  CPlusObject := BClipboard_Create(Self,aname, transient);
  be_clipboard:=Self;
  
end;

destructor BClipboard.Destroy;
begin
  BClipboard_Free(CPlusObject);
    inherited;
end;

function BClipboard.Name : PChar;
begin
  Result := BClipboard_Name(CPlusObject);
end;

function BClipboard.LocalCount : Cardinal;
begin
  Result := BClipboard_LocalCount(CPlusObject);
end;

function BClipboard.SystemCount : Cardinal;
begin
  Result := BClipboard_SystemCount(CPlusObject);
end;

function BClipboard.StartWatching(target : BMessenger) : status_t;
begin
  Result := BClipboard_StartWatching(CPlusObject, target.CPlusObject);
end;

function BClipboard.StopWatching(target : BMessenger) : status_t;
begin
  Result := BClipboard_StopWatching(CPlusObject, target.CPlusObject);
end;

function BClipboard.Lock : boolean;
begin
  Result := BClipboard_Lock(CPlusObject);
end;

procedure BClipboard.Unlock;
begin
  BClipboard_Unlock(CPlusObject);
end;

function BClipboard.IsLocked : boolean;
begin
  Result := BClipboard_IsLocked(CPlusObject);
end;

function BClipboard.Clear : status_t;
begin
  Result := BClipboard_Clear(CPlusObject);
end;

function BClipboard.Commit : status_t;
begin
  Result := BClipboard_Commit(CPlusObject);
end;

function BClipboard.Revert : status_t;
begin
  Result := BClipboard_Revert(CPlusObject);
end;

function BClipboard.DataSource : BMessenger;
begin
  Result := BClipboard_DataSource(CPlusObject);
end;

function BClipboard.Data : BMessage;
begin
  Result := BClipboard_Data(CPlusObject);
end;

{constructor BClipboard.Create( : BClipboard);
begin
  CPlusObject := BClipboard_Create(Self, );
end;

function BClipboard.operator=( : BClipboard) : BClipboard;
begin
  Result := BClipboard_operator=(CPlusObject, );
end;

procedure BClipboard._ReservedClipboard1;
begin
  BClipboard__ReservedClipboard1(CPlusObject);
end;

procedure BClipboard._ReservedClipboard2;
begin
  BClipboard__ReservedClipboard2(CPlusObject);
end;

procedure BClipboard._ReservedClipboard3;
begin
  BClipboard__ReservedClipboard3(CPlusObject);
end;

function BClipboard.AssertLocked : boolean;
begin
  Result := BClipboard_AssertLocked(CPlusObject);
end;

function BClipboard.DownloadFromSystem(force : boolean) : TStatus_t;
begin
  Result := BClipboard_DownloadFromSystem(CPlusObject, force);
end;

function BClipboard.UploadToSystem : TStatus_t;
begin
  Result := BClipboard_UploadToSystem(CPlusObject);
end;

procedure BClipboard.uint32 fCount;
begin
  BClipboard_uint32 fCount(CPlusObject);
end;

procedure BClipboard.BMessage *fData;
begin
  BClipboard_BMessage *fData(CPlusObject);
end;

procedure BClipboard.BLocker fLock;
begin
  BClipboard_BLocker fLock(CPlusObject);
end;

procedure BClipboard.BMessenger fClipHandler;
begin
  BClipboard_BMessenger fClipHandler(CPlusObject);
end;

procedure BClipboard.BMessenger fDataSource;
begin
  BClipboard_BMessenger fDataSource(CPlusObject);
end;

procedure BClipboard.uint32 fSystemCount;
begin
  BClipboard_uint32 fSystemCount(CPlusObject);
end;

procedure BClipboard.char *fName;
begin
  BClipboard_char *fName(CPlusObject);
end;

procedure BClipboard.uint32 _reserved[4];
begin
  BClipboard_uint32 _reserved[4](CPlusObject);
end;

}

initialization
  be_clipboard := BClipboard.Wrap(Get_be_clipboard);
  
finalization
  be_clipboard.UnWrap;
  be_clipboard := nil;
end.
