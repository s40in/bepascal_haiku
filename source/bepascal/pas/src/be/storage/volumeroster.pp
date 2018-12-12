{   BePascal - A pascal wrapper around the BeOS API
    Copyright (C) 2002 - 2003 Eric Jourde
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
unit VolumeRoster;

interface

uses
  BeObj, Messenger, SupportDefs, Volume;

type
  BVolumeRoster = class(TBeObject)
  public
    constructor Create; override;
    destructor Destroy; override;

    function GetNextVolume(var vol : BVolume): status_t;
    procedure Rewind;

    function GetBootVolume(var vol : BVolume) : status_t;
    function StartWatching(msngr : BMessenger {$ifndef VER1_0}= be_app_messenger{$endif}): status_t;
    procedure StopWatching;
    function Messenger : BMessenger;
  end;


function BVolumeRoster_Create(AObject : TBeObject) : TCPlusObject;
         cdecl; external BePascalLibName name 'BVolumeRoster_Create';

procedure BVolumeRoster_Free(AObject : TCPlusObject);
          cdecl; external BePascalLibName name 'BVolumeRoster_Free';

function BVolumeRoster_GetNextVolume(AObject : TCPlusObject; vol : TCPlusObject)
         : Status_t; cdecl; external BePascalLibName name 'BVolumeRoster_GetNextVolume';

procedure BVolumeRoster_Rewind(AObject : TCPlusObject);
          cdecl; external BePascalLibName name 'BVolumeRoster_Rewind';

function BVolumeRoster_GetBootVolume(AObject : TCPlusObject; vol : TCPlusObject)
         : Status_t; cdecl; external BePascalLibName name 'BVolumeRoster_GetBootVolume';

function BVolumeRoster_StartWatching(AObject : TCPlusObject; msngr : BMessenger)
         : Status_t; cdecl; external BePascalLibName name 'BVolumeRoster_StartWatching';

procedure BVolumeRoster_StopWatching(AObject : TCPlusObject);
          cdecl; external BePascalLibName name 'BVolumeRoster_StopWatching';

function BVolumeRoster_Messenger(AObject : TCPlusObject)
         : BMessenger; cdecl; external BePascalLibName name 'BVolumeRoster_Messenger';

implementation

constructor BVolumeRoster.Create;
begin
  inherited;
  CPlusObject := BVolumeRoster_Create(Self);
end;

destructor BVolumeRoster.Destroy;
begin
  if CPlusObject <> nil then
    BVolumeRoster_Free(CPlusObject);
  inherited;
end;

function BVolumeRoster.GetNextVolume(var vol : BVolume) : status_t;
begin
  Result := BVolumeRoster_GetNextVolume(CPlusObject, vol.CPlusObject);
end;

procedure BVolumeRoster.Rewind;
begin
  BVolumeRoster_Rewind(CPlusObject);
end;

function BVolumeRoster.GetBootVolume(var vol : BVolume) : status_t;
begin
  Result := BVolumeRoster_GetBootVolume(CPlusObject, vol.CPlusObject);
end;

function BVolumeRoster.StartWatching(msngr : BMessenger) : status_t;
begin
  Result := BVolumeRoster_StartWatching(CPlusObject, msngr);
end;

procedure BVolumeRoster.StopWatching;
begin
  BVolumeRoster_StopWatching(CPlusObject);
end;

function BVolumeRoster.Messenger : BMessenger;
begin
  Result := BVolumeRoster_Messenger(CPlusObject);
end;

end.