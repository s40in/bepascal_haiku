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
unit stopwatch;

interface

uses
  beobj, supportdefs;

type
  BStopWatch = class(TBeObject)
  private
  public
    constructor Create(aName : PChar; silent : boolean);
    destructor Destroy; override;
    procedure Suspend;
    procedure Resume;
    function Lap : Bigtime_t;
    function ElapsedTime : Bigtime_t;
    procedure Reset;
    function Name : PChar;
//    procedure _ReservedStopWatch1;
//    procedure _ReservedStopWatch2;
//    constructor Create( : BStopWatch);
//    function operator=( : BStopWatch) : BStopWatch;
//    procedure bigtime_t fStart;
//    procedure bigtime_t fSuspendTime;
//    procedure bigtime_t fLaps[10];
//    procedure int32 fLap;
//    procedure const char *fName;
//    procedure uint32 _reserved[2];
//    procedure bool fSilent;
  end;

function BStopWatch_Create(aName : PChar; silent : boolean) : BStopWatch; cdecl; external BePascalLibName name 'BStopWatch_Create';
procedure BStopWatch_Free(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BStopWatch_Free';
procedure BStopWatch_Suspend(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BStopWatch_Suspend';
procedure BStopWatch_Resume(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BStopWatch_Resume';
function BStopWatch_Lap(AObject : TCPlusObject) : Bigtime_t; cdecl; external BePascalLibName name 'BStopWatch_Lap';
function BStopWatch_ElapsedTime(AObject : TCPlusObject) : Bigtime_t; cdecl; external BePascalLibName name 'BStopWatch_ElapsedTime';
procedure BStopWatch_Reset(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BStopWatch_Reset';
function BStopWatch_Name(AObject : TCPlusObject) : PChar; cdecl; external BePascalLibName name 'BStopWatch_Name';
procedure BStopWatch__ReservedStopWatch1(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BStopWatch__ReservedStopWatch1';
procedure BStopWatch__ReservedStopWatch2(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BStopWatch__ReservedStopWatch2';
//function BStopWatch_Create(AObject : TBeObject;  : BStopWatch); cdecl; external BePascalLibName name 'BStopWatch_Create';
//function BStopWatch_operator=(AObject : TCPlusObject;  : BStopWatch) : BStopWatch; cdecl; external BePascalLibName name 'BStopWatch_operator=';
//procedure BStopWatch_bigtime_t fStart(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BStopWatch_bigtime_t fStart';
//procedure BStopWatch_bigtime_t fSuspendTime(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BStopWatch_bigtime_t fSuspendTime';
//procedure BStopWatch_bigtime_t fLaps[10](AObject : TCPlusObject); cdecl; external BePascalLibName name 'BStopWatch_bigtime_t fLaps[10]';
//procedure BStopWatch_int32 fLap(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BStopWatch_int32 fLap';
//procedure BStopWatch_const char *fName(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BStopWatch_const char *fName';
//procedure BStopWatch_uint32 _reserved[2](AObject : TCPlusObject); cdecl; external BePascalLibName name 'BStopWatch_uint32 _reserved[2]';
//procedure BStopWatch_bool fSilent(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BStopWatch_bool fSilent';

implementation

constructor BStopWatch.Create(aName : PChar; silent : boolean);
begin
  CPlusObject := BStopWatch_Create(aName, silent);
end;

destructor BStopWatch.Destroy;
begin
  BStopWatch_Free(CPlusObject);
  inherited;
end;

procedure BStopWatch.Suspend;
begin
  BStopWatch_Suspend(CPlusObject);
end;

procedure BStopWatch.Resume;
begin
  BStopWatch_Resume(CPlusObject);
end;

function BStopWatch.Lap : Bigtime_t;
begin
  Result := BStopWatch_Lap(CPlusObject);
end;

function BStopWatch.ElapsedTime : Bigtime_t;
begin
  Result := BStopWatch_ElapsedTime(CPlusObject);
end;

procedure BStopWatch.Reset;
begin
  BStopWatch_Reset(CPlusObject);
end;

function BStopWatch.Name : PChar;
begin
  Result := BStopWatch_Name(CPlusObject);
end;

{procedure BStopWatch._ReservedStopWatch1;
begin
  BStopWatch__ReservedStopWatch1(CPlusObject);
end;

procedure BStopWatch._ReservedStopWatch2;
begin
  BStopWatch__ReservedStopWatch2(CPlusObject);
end;

constructor BStopWatch.Create( : BStopWatch);
begin
  CPlusObject := BStopWatch_Create(Self, );
end;

function BStopWatch.operator=( : BStopWatch) : BStopWatch;
begin
  Result := BStopWatch_operator=(CPlusObject, );
end;

procedure BStopWatch.bigtime_t fStart;
begin
  BStopWatch_bigtime_t fStart(CPlusObject);
end;

procedure BStopWatch.bigtime_t fSuspendTime;
begin
  BStopWatch_bigtime_t fSuspendTime(CPlusObject);
end;

procedure BStopWatch.bigtime_t fLaps[10];
begin
  BStopWatch_bigtime_t fLaps[10](CPlusObject);
end;

procedure BStopWatch.int32 fLap;
begin
  BStopWatch_int32 fLap(CPlusObject);
end;

procedure BStopWatch.const char *fName;
begin
  BStopWatch_const char *fName(CPlusObject);
end;

procedure BStopWatch.uint32 _reserved[2];
begin
  BStopWatch_uint32 _reserved[2](CPlusObject);
end;

procedure BStopWatch.bool fSilent;
begin
  BStopWatch_bool fSilent(CPlusObject);
end;
}

end.
