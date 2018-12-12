{   BePascal - A pascal wrapper around the BeOS API
    Copyright (C) 2002-2003 Olivier Coursiere

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
unit SerialPort;

interface

uses
  BeObj, OS, SupportDefs;
  
type
  // Pascal enum start at 0 (like in C++). We are lucky because we can't
  // initialize enum values yet (?) in FreePascal ;-)
  DataRate = (B_0_BPS, B_50_BPS, B_75_BPS, B_110_BPS, B_134_BPS,
               B_150_BPS, B_200_BPS, B_300_BPS, B_600_BPS, B_1200_BPS,
               B_1800_BPS, B_2400_BPS, B_4800_BPS, B_9600_BPS, B_19200_BPS,
               B_38400_BPS, B_57600_BPS, B_115200_BPS, 
               B_230400_BPS, B_31250_BPS);
               
  DataBits = (B_DATA_BITS_7, B_DATA_BITS_8);
  
  StopBits = (B_STOP_BITS_1, B_STOP_BITS_2);
  
  ParityMode = (B_NO_PARITY, B_ODD_PARITY, B_EVEN_PARITY);

const
  B_NOFLOW_CONTROL = 0;
  B_HARDWARE_CONTROL = 1; 
  B_SOFTWARE_CONTROL = 2;
               
type
  BSerialPort = class(TBeObject)
  private
  public
    constructor Create; override;
    destructor Destroy; override;
    function Open(portName : PChar) : status_t;
    procedure Close;

    function Read(buf : PChar; count : size_t) : ssize_t;
    function Write(const buf : PChar; count : size_t) : ssize_t;

    procedure SetBlocking(Blocking : Boolean);
    function SetTimeout(microSeconds : bigtime_t) : status_t;
    function SeDataRate(bitsPerSecond : DataRate) : status_t;
    function GeDataRate : DataRate;
    procedure SeDataBits(numBits : DataBits);
    function GeDataBits : DataBits;
    procedure SeStopBits(numBits : StopBits);
    function GeStopBits : StopBits;
    procedure SeParityMode(numBits : ParityMode);
    function GeParityMode : ParityMode;
    procedure ClearInput;
    procedure ClearOutput;

    procedure SetFlowControl(method : Cardinal);
    function GetFlowControl : Cardinal;
    function SetDTR(asserted : Boolean) : status_t;
    function SetRTS(asserted : Boolean) : status_t;    
    function NumCharsAvailable(var wait_until_this_many : Integer) : status_t;

    function IsCTS : Boolean;
    function IsDSR : Boolean;
    function IsRI : Boolean;
    function IsDCD : Boolean;
    function WaitForInput : ssize_t;
    
    function CountDevices : Integer;
    function GetDeviceName(n : Integer; name : PChar; bufSize : size_t) : status_t;
    
    property DataRate : DataRate read GeDataRate write SeDataRate;
    property DataBits : DataBits read GeDataBits write SeDataBits;
    property StopBits : StopBits read GeStopBits write SeStopBits;    
    property ParityMode : ParityMode read GeParityMode write SeParityMode;
  end;

function BSerialPort_Create(AObject : TBeObject) : TCPlusObject; cdecl; external BePascalLibName name 'BSerialPort_Create';
procedure BSerialPort_Free(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BSerialPort_Free';
function BSerialPort_Open(AObject : TCPlusObject; portName : PChar) : status_t; cdecl; external BePascalLibName name 'BSerialPort_Open';
procedure BSerialPort_Close(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BSerialPort_Close';
function BSerialPort_Read(AObject : TCPlusObject; buf : PChar; count : size_t) : ssize_t; cdecl; external BePascalLibName name 'BSerialPort_Read';
function BSerialPort_Write(AObject : TCPlusObject; const buf : PChar; count : Size_t) : ssize_t; cdecl; external BePascalLibName name 'BSerialPort_Write';
procedure BSerialPort_SetBlocking(AObject : TCPlusObject; Blocking : Boolean); cdecl; external BePascalLibName name 'BSerialPort_SetBlocking';
function BSerialPort_SetTimeout(AObject : TCPlusObject; microSeconds : bigtime_t) : status_t; cdecl; external BePascalLibName name 'BSerialPort_SetTimeout';
function BSerialPort_SeDataRate(AObject : TCPlusObject; bitsPerSecond : DataRate) : status_t; cdecl; external BePascalLibName name 'BSerialPort_SeDataRate';
function BSerialPort_DataRate(AObject : TCPlusObject) : DataRate; cdecl; external BePascalLibName name 'BSerialPort_DataRate';
procedure BSerialPort_SeDataBits(AObject : TCPlusObject; numBits : DataBits); cdecl; external BePascalLibName name 'BSerialPort_SeDataBits';
function BSerialPort_DataBits(AObject : TCPlusObject) : DataBits; cdecl; external BePascalLibName name 'BSerialPort_DataBits';
procedure BSerialPort_SeStopBits(AObject : TCPlusObject; numBits : StopBits); cdecl; external BePascalLibName name 'BSerialPort_SeStopBits';
function BSerialPort_StopBits(AObject : TCPlusObject) : StopBits; cdecl; external BePascalLibName name 'BSerialPort_StopBits';
procedure BSerialPort_SeParityMode(AObject : TCPlusObject; numBits : ParityMode); cdecl; external BePascalLibName name 'BSerialPort_SeParityMode';
function BSerialPort_ParityMode(AObject : TCPlusObject) : ParityMode; cdecl; external BePascalLibName name 'BSerialPort_ParityMode';
procedure BSerialPort_ClearInput(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BSerialPort_ClearInput';
procedure BSerialPort_ClearOutput(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BSerialPort_ClearOutput';
procedure BSerialPort_SetFlowControl(AObject : TCPlusObject; method : Cardinal); cdecl; external BePascalLibName name 'BSerialPort_SetFlowControl';
function BSerialPort_FlowControl(AObject : TCPlusObject) : Cardinal; cdecl; external BePascalLibName name 'BSerialPort_FlowControl';
function BSerialPort_SetDTR(AObject : TCPlusObject; asserted : Boolean) : status_t; cdecl; external BePascalLibName name 'BSerialPort_SetDTR';
function BSerialPort_SetRTS(AObject : TCPlusObject; asserted : Boolean) : status_t; cdecl; external BePascalLibName name 'BSerialPort_SetRTS';
function BSerialPort_NumCharsAvailable(AObject : TCPlusObject; var wait_until_this_many : Integer) : Status_t; cdecl; external BePascalLibName name 'BSerialPort_NumCharsAvailable';
function BSerialPort_IsCTS(AObject : TCPlusObject) : Boolean; cdecl; external BePascalLibName name 'BSerialPort_IsCTS';
function BSerialPort_IsDSR(AObject : TCPlusObject) : Boolean; cdecl; external BePascalLibName name 'BSerialPort_IsDSR';
function BSerialPort_IsRI(AObject : TCPlusObject) : Boolean; cdecl; external BePascalLibName name 'BSerialPort_IsRI';
function BSerialPort_IsDCD(AObject : TCPlusObject) : Boolean; cdecl; external BePascalLibName name 'BSerialPort_IsDCD';
function BSerialPort_WaitForInput(AObject : TCPlusObject) : ssize_t; cdecl; external BePascalLibName name 'BSerialPort_WaitForInput';
function BSerialPort_CountDevices(AObject : TCPlusObject) : Integer; cdecl; external BePascalLibName name 'BSerialPort_CountDevices';
function BSerialPort_GetDeviceName(AObject : TCPlusObject; n : Integer; name : PChar; bufSize : Size_t): Status_t; cdecl; external BePascalLibName name 'BSerialPort_GetDeviceName';

implementation

constructor BSerialPort.Create;
begin
  inherited;
  CPlusObject := BSerialPort_Create(Self);
end;

destructor BSerialPort.Destroy;
begin
  if CPlusObject <> nil then
    BSerialPort_Free(CPlusObject);
  inherited;
end;

function BSerialPort.Open(portName : PChar) : status_t;
begin
  result := BSerialPort_Open(CPlusObject, portName); 
end;

procedure BSerialPort.Close;
begin
  BSerialPort_Close(CPlusObject);
end;

function BSerialPort.Read(buf : PChar; count : size_t) : ssize_t;
begin
  Result := BSerialPort_Read(CPlusObject, buf, count);
end;

function BSerialPort.Write(const buf : PChar; count : size_t) : ssize_t;
begin
  Result := BSerialPort_Write(CPlusObject, buf, count);
end;

procedure BSerialPort.SetBlocking(Blocking : Boolean);
begin
  BSerialPort_SetBlocking(CPlusObject, Blocking);
end;

function BSerialPort.SetTimeout(microSeconds : bigtime_t) : status_t;
begin
  Result := BSerialPort_SetTimeout(CPlusObject, microSeconds);
end;

function BSerialPort.SeDataRate(bitsPerSecond : DataRate) : status_t;
begin
  Result := BSerialPort_SeDataRate(CPlusObject, bitsPerSecond);
end;

function BSerialPort.GeDataRate : DataRate;
begin
  Result := BSerialPort_DataRate(CPlusObject);
end;

procedure BSerialPort.SeDataBits(numBits : DataBits);
begin
  BSerialPort_SeDataBits(CPlusObject, numBits);
end;

function BSerialPort.GeDataBits : DataBits;
begin
  Result := BSerialPort_DataBits(CPlusObject);
end;

procedure BSerialPort.SeStopBits(numBits : StopBits);
begin
  BSerialPort_SeStopBits(CPlusObject, numBits);
end;

function BSerialPort.GeStopBits : StopBits;
begin
  Result := BSerialPort_StopBits(CPlusObject);
end;

procedure BSerialPort.SeParityMode(numBits : ParityMode);
begin
  BSerialPort_SeParityMode(CPlusObject, numBits);
end;

function BSerialPort.GeParityMode : ParityMode;
begin
  Result := BSerialPort_ParityMode(CPlusObject);
end;

procedure BSerialPort.ClearInput;
begin
  BSerialPort_ClearInput(CPlusObject);
end;

procedure BSerialPort.ClearOutput;
begin
  BSerialPort_ClearOutput(CPlusObject);
end;

procedure BSerialPort.SetFlowControl(method : Cardinal);
begin
  BSerialPort_SetFlowControl(CPlusobject, method);
end;

function BSerialPort.GetFlowControl : Cardinal;
begin
  Result := BSerialPort_FlowControl(CPlusObject);
end;

function BSerialPort.SetDTR(asserted : Boolean) : status_t;
begin
  Result := BSerialPort_SetDTR(CPlusObject, asserted);
end;

function BSerialPort.SetRTS(asserted : Boolean) : status_t;
begin
  Result := BSerialPort_SetRTS(CPlusObject, asserted);
end;

function BSerialPort.NumCharsAvailable(var wait_until_this_many : Integer) : status_t;
begin
  Result := BSerialPort_NumCharsAvailable(CPlusObject, wait_until_this_many);
end;

function BSerialPort.IsCTS : Boolean;
begin
  Result := BSerialPort_IsCTS(CPlusObject);
end;

function BSerialPort.IsDSR : Boolean;
begin
  Result := BSerialPort_IsDSR(CPlusObject);
end;

function BSerialPort.IsRI : Boolean;
begin
  Result := BSerialPort_IsRI(CPlusObject);
end;

function BSerialPort.IsDCD : Boolean;
begin
  Result := BSerialPort_IsDCD(CPlusObject);
end;

function BSerialPort.WaitForInput : ssize_t;    
begin
  Result := BSerialPort_WaitForInput(CPlusObject);
end;

function BSerialPort.CountDevices : Integer;
begin
  Result := BSerialPort_CountDevices(CPlusObject);
end;

function BSerialPort.GetDeviceName(n : Integer; name : PChar; bufSize : size_t) : status_t;
begin
  Result := BSerialPort_GetDeviceName(CPlusObject, n, name, bufSize);
end;

end.