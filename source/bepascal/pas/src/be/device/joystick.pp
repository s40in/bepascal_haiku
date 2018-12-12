{   BePascal - A pascal wrapper around the BeOS API
    Copyright (C) 2002-2003 Eric Jourde

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
unit Joystick;

interface

uses
  BeObj, OS, SupportDefs;
  
type

  BJoystick = class(TBeObject)
  private

  public
    constructor Create; override;
    destructor Destroy; override;

    function Open(portName : PChar) : status_t;
    function Open_1(portName : PChar; enter_enhanced : boolean) : status_t;

    procedure Close;

    function Update : status_t;
    function SetMaxLatency(max_latency : bigtime_t) : status_t;
    function CountDevices  : Cardinal;
    function GetDeviceName(n : Integer; name : PChar; bufSize : size_t) : status_t;

    function CountSticks : Cardinal;
    function CountAxes : Cardinal;
    function CountHats : Cardinal;
    function CountButtons : Cardinal;
    function GetAxisValues(out_values : Integer; for_stick : Cardinal): status_t;
    function ButtonValues(for_stick : Cardinal) : Cardinal; 
    function IsCalibrationEnabled : boolean;
    function EnableCalibration(calibrates : boolean) : status_t;

//  function BJoystick_EnterEnhancedMode(BAObject : TCPlusObject; const entry_ref *ref): Boolean;
//  function GetAxisNameAt(index: cardinal; BString *out_name): Status_t;
//  function GetHatNameAt( index: cardinal,BString *out_name): Status_t;
//  function GetButtonNameAt( index: cardinal,BString *out_name): Status_t; c
//  function GetControllerModule( BString *out_name): Status_t;
//  function GetControllerName( BString *out_name): Status_t;
//  function GetHatValues( uint8 *out_hats;for_stick: cardinal): Status_t;
  end;

function BJoystick_Create(AObject : TBeObject) : TCPlusObject; cdecl; external BePascalLibName name 'BJoystick_Create';
procedure BJoystick_Free(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BJoystick_Free';

function BJoystick_Open(AObject : TCPlusObject; portName : PChar) : status_t ; cdecl; external BePascalLibName name 'BJoystick_Open';
function BJoystick_Open_1(AObject : TCPlusObject; portName : PChar; enter_enhanced : boolean) : status_t; cdecl; external BePascalLibName name 'BJoystick_Open_1';

procedure BJoystick_Close(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BJoystick_Close';
function BJoystick_Update(AObject : TCPlusObject) : status_t; cdecl; external BePascalLibName name 'BJoystick_Update';
function BJoystick_SetMaxLatency(AObject : TCPlusObject; max_latency : bigtime_t) : status_t; cdecl; external BePascalLibName name 'BJoystick_SetMaxLatency';
function BJoystick_CountDevices(AObject : TCPlusObject) : Cardinal; cdecl; external BePascalLibName name 'BJoystick_CountDevices';
function BJoystick_GetDeviceName(AObject : TCPlusObject; n : Integer; name : PChar; bufSize : size_t) : status_t; cdecl; external BePascalLibName name 'BJoystick_GetDeviceName';

function BJoystick_CountSticks(BAObject : TCPlusObject): Cardinal; cdecl; external BePascalLibName name 'BJoystick_CountSticks';
function BJoystick_CountAxes(BAObject : TCPlusObject) : Cardinal; cdecl; external BePascalLibName name 'BJoystick_CountAxes';
function BJoystick_CountHats(BAObject : TCPlusObject) : Cardinal; cdecl; external BePascalLibName name 'BJoystick_CountHats';
function BJoystick_CountButtons(BAObject : TCPlusObject) : Cardinal; cdecl; external BePascalLibName name 'BJoystick_CountButtons';
function BJoystick_GetAxisValues(BAObject : TCPlusObject; out_values : Integer; for_stick : Cardinal): Status_t; cdecl; external BePascalLibName name 'BJoystick_GetAxisValues';
function BJoystick_ButtonValues(BAObject : TCPlusObject;for_stick : Cardinal) : Cardinal; cdecl; external BePascalLibName name 'BJoystick_ButtonValues';
function BJoystick_IsCalibrationEnabled(BAObject : TCPlusObject) : Boolean; cdecl; external BePascalLibName name 'BJoystick_IsCalibrationEnabled';
function BJoystick_EnableCalibration(BAObject : TCPlusObject; calibrates : Boolean): Status_t; cdecl; external BePascalLibName name 'BJoystick_EnableCalibration';
  
//function BJoystick_EnterEnhancedMode(BAObject : TCPlusObject; const entry_ref *ref) : Boolean; cdecl; external BePascalLibName name 'BJoystick_EnterEnhancedMode';
//function BJoystick_GetHatValues(BAObject : TCPlusObject, uint8 *out_hats;for_stick: cardinal) : status_t; cdecl; external BePascalLibName name 'BJoystick_GetHatValues';
//function BJoystick_GetAxisNameAt(BAObject : TCPlusObject;index: cardinal; BString *out_name) : status_t; cdecl; external BePascalLibName name 'BJoystick_GetAxisNameAt';
//function BJoystick_GetHatNameAt(BAObject : TCPlusObject; index: cardinal, BString *out_name) : status_t; cdecl; external BePascalLibName name 'BJoystick_GetHatNameAt';
//function BJoystick_GetButtonNameAt(BAObject : TCPlusObject; index: cardinal,BString *out_name) : status_t; cdecl; external BePascalLibName name 'BJoystick_GetButtonNameAt';
//function BJoystick_GetControllerModule(BAObject : TCPlusObject, BString *out_name) : status_t; cdecl; external BePascalLibName name 'BJoystick_GetControllerModule';
//function BJoystick_GetControllerName(BAObject : TCPlusObject, BString *out_name) : status_t; cdecl; external BePascalLibName name 'BJoystick_GetControllerName';

implementation

constructor BJoystick.Create;
begin
  inherited;
  CPlusObject := BJoystick_Create(Self);
end;

destructor BJoystick.Destroy;
begin
  if CPlusObject <> nil then
    BJoystick_Free(CPlusObject);
  inherited;
end;

function BJoystick.Open(portName : PChar) : status_t;
begin
  Result := BJoystick_Open(CPlusObject, portName);
end;

function BJoystick.Open_1(portName : PChar; enter_enhanced : boolean) : status_t;
begin
   Result := BJoystick_Open_1(CPlusObject, portName, enter_enhanced);
end;

procedure BJoystick.Close;
begin
  BJoystick_Close(CPlusObject);
end;

function BJoystick.Update : status_t;
begin
  Result := BJoystick_Update(CPlusObject);
end;

function BJoystick.SetMaxLatency(max_latency : bigtime_t) : status_t;
begin
  Result := BJoystick_SetMaxLatency(CPlusObject, max_latency);
end;

function BJoystick.CountDevices :Cardinal;
begin
  Result := BJoystick_CountDevices(CPlusObject);
end;

function BJoystick.GetDeviceName(n : Integer; name : PChar; bufSize : size_t) : status_t;
begin
  Result := BJoystick_GetDeviceName(CPlusObject, n, name, bufSize);
end;

//function BJoystick_EnterEnhancedMode(BAObject : TCPlusObject; const entry_ref *ref): Boolean;

function BJoystick.CountSticks : Cardinal;
begin
  Result := BJoystick_CountSticks(CPlusObject);
end;

function BJoystick.CountAxes : Cardinal;
begin
  Result := BJoystick_CountAxes(CPlusObject);
end;

function BJoystick.CountHats : Cardinal;
begin
  Result := BJoystick_CountHats(CPlusObject);
end;

function BJoystick.CountButtons : Cardinal;
begin
  Result := BJoystick_CountButtons(CPlusObject);
end;

function BJoystick.GetAxisValues(out_values : Integer; for_stick : Cardinal) : status_t;
begin
  Result := BJoystick_GetAxisValues(CPlusObject, out_values, for_stick);
end;

//function BJoystick.GetHatValues(uint8 *out_hats ; for_stick : cardinal) : status_t;
//begin
//  Result := BJoystick_GetHatValues(out_hats, for_stick);
//end;

function BJoystick.ButtonValues(for_stick : cardinal) : Cardinal;
begin
  Result := BJoystick_ButtonValues(CPlusObject, for_stick);
end;

//function BJoystick.GetAxisNameAt(index : cardinal; BString *out_name) : status_t;
//begin
//  Result := BJoystick_GetAxisNameAt(CPlusObject, index, out_name);
//end;

//function BJoystick.GetHatNameAt(index : cardinal,BString *out_name) : status_t;
//begin
//  Result := BJoystick_GetHatNameAt(CPlusObject, index,out_name);
//end;

//function BJoystick.GetButtonNameAt(index : cardinal, BString *out_name) : status_t;
//begin
//  Result := BJoystick_GetButtonNameAt(CPlusObject, index, out_name);
//end;

//function BJoystick.GetControllerModule(BString *out_name) : status_t;
//begin
//  Result := BJoystick_GetControllerModule(CPlusObject, out_name);
//end;

//function BJoystick.GetControllerName(BString : *out_name) : status_t;
//begin
//  Result := BJoystick_GetControllerName(CPlusObject, out_name);
//end;

function BJoystick.IsCalibrationEnabled : Boolean;
begin
  Result := BJoystick_IsCalibrationEnabled(CPlusObject);
end;

function BJoystick.EnableCalibration(calibrates : boolean) : status_t;
begin
  Result := BJoystick_EnableCalibration(CPlusObject, calibrates);
end;

end.