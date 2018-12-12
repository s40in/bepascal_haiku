/*  BePascal - A pascal wrapper around the BeOS API
    Copyright (C) 2002 Olivier Coursiere

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
*/

#ifndef _SERIALPORT_CPP_
#define _SERIALPORT_CPP_

#include "SerialPort.h"

#include <beobj.h>

#if defined(__cplusplus)
extern "C" {
#endif

/*
 *  Method: BSerialPort::BSerialPort()
 *   Descr: 
 */
TCPlusObject BSerialPort_Create()
{
      return new BSerialPort();
}


/*
 *  Method: BSerialPort::~BSerialPort()
 *   Descr: 
 */
void BSerialPort_Free(BSerialPort *SerialPort)
{
   delete SerialPort;
}


/*
 *  Method: BSerialPort::Open()
 *   Descr: 
 */
status_t
BSerialPort_Open(BSerialPort *SerialPort, const char *portName)
{
   return SerialPort->Open(portName);
}


/*
 *  Method: BSerialPort::Close()
 *   Descr: 
 */
void
BSerialPort_Close(BSerialPort *SerialPort)
{
   SerialPort->Close();
}


/*
 *  Method: BSerialPort::Read()
 *   Descr: 
 */
ssize_t
BSerialPort_Read(BSerialPort *SerialPort, void *buf,
                  size_t count)
{
   return SerialPort->Read(buf,
                  count);
}


/*
 *  Method: BSerialPort::Write()
 *   Descr: 
 */
ssize_t
BSerialPort_Write(BSerialPort *SerialPort, const void *buf,
                   size_t count)
{
   return SerialPort->Write(buf,
                   count);
}


/*
 *  Method: BSerialPort::SetBlocking()
 *   Descr: 
 */
void
BSerialPort_SetBlocking(BSerialPort *SerialPort, bool Blocking)
{
   SerialPort->SetBlocking(Blocking);
}


/*
 *  Method: BSerialPort::SetTimeout()
 *   Descr: 
 */
status_t
BSerialPort_SetTimeout(BSerialPort *SerialPort, bigtime_t microSeconds)
{
   return SerialPort->SetTimeout(microSeconds);
}


/*
 *  Method: BSerialPort::SetDataRate()
 *   Descr: 
 */
status_t
BSerialPort_SetDataRate(BSerialPort *SerialPort, data_rate bitsPerSecond)
{
   return SerialPort->SetDataRate(bitsPerSecond);
}


/*
 *  Method: BSerialPort::DataRate()
 *   Descr: 
 */
data_rate
BSerialPort_DataRate(BSerialPort *SerialPort)
{
   return SerialPort->DataRate();
}


/*
 *  Method: BSerialPort::SetDataBits()
 *   Descr: 
 */
void
BSerialPort_SetDataBits(BSerialPort *SerialPort, data_bits numBits)
{
   SerialPort->SetDataBits(numBits);
}


/*
 *  Method: BSerialPort::DataBits()
 *   Descr: 
 */
data_bits
BSerialPort_DataBits(BSerialPort *SerialPort)
{
   return SerialPort->DataBits();
}


/*
 *  Method: BSerialPort::SetStopBits()
 *   Descr: 
 */
void
BSerialPort_SetStopBits(BSerialPort *SerialPort, stop_bits numBits)
{
   SerialPort->SetStopBits(numBits);
}


/*
 *  Method: BSerialPort::StopBits()
 *   Descr: 
 */
stop_bits
BSerialPort_StopBits(BSerialPort *SerialPort)
{
   return SerialPort->StopBits();
}


/*
 *  Method: BSerialPort::SetParityMode()
 *   Descr: 
 */
void
BSerialPort_SetParityMode(BSerialPort *SerialPort, parity_mode which)
{
   SerialPort->SetParityMode(which);
}


/*
 *  Method: BSerialPort::ParityMode()
 *   Descr: 
 */
parity_mode
BSerialPort_ParityMode(BSerialPort *SerialPort)
{
   return SerialPort->ParityMode();
}


/*
 *  Method: BSerialPort::ClearInput()
 *   Descr: 
 */
void
BSerialPort_ClearInput(BSerialPort *SerialPort)
{
   SerialPort->ClearInput();
}


/*
 *  Method: BSerialPort::ClearOutput()
 *   Descr: 
 */
void
BSerialPort_ClearOutput(BSerialPort *SerialPort)
{
   SerialPort->ClearOutput();
}


/*
 *  Method: BSerialPort::SetFlowControl()
 *   Descr: 
 */
void
BSerialPort_SetFlowControl(BSerialPort *SerialPort, uint32 method)
{
   SerialPort->SetFlowControl(method);
}


/*
 *  Method: BSerialPort::FlowControl()
 *   Descr: 
 */
uint32
BSerialPort_FlowControl(BSerialPort *SerialPort)
{
   return SerialPort->FlowControl();
}


/*
 *  Method: BSerialPort::SetDTR()
 *   Descr: 
 */
status_t
BSerialPort_SetDTR(BSerialPort *SerialPort, bool asserted)
{
   return SerialPort->SetDTR(asserted);
}


/*
 *  Method: BSerialPort::SetRTS()
 *   Descr: 
 */
status_t
BSerialPort_SetRTS(BSerialPort *SerialPort, bool asserted)
{
   return SerialPort->SetRTS(asserted);
}


/*
 *  Method: BSerialPort::NumCharsAvailable()
 *   Descr: 
 */
status_t
BSerialPort_NumCharsAvailable(BSerialPort *SerialPort, int32 *wait_until_this_many)
{
   return SerialPort->NumCharsAvailable(wait_until_this_many);
}


/*
 *  Method: BSerialPort::IsCTS()
 *   Descr: 
 */
bool
BSerialPort_IsCTS(BSerialPort *SerialPort)
{
   return SerialPort->IsCTS();
}


/*
 *  Method: BSerialPort::IsDSR()
 *   Descr: 
 */
bool
BSerialPort_IsDSR(BSerialPort *SerialPort)
{
   return SerialPort->IsDSR();
}


/*
 *  Method: BSerialPort::IsRI()
 *   Descr: 
 */
bool
BSerialPort_IsRI(BSerialPort *SerialPort)
{
   return SerialPort->IsRI();
}


/*
 *  Method: BSerialPort::IsDCD()
 *   Descr: 
 */
bool
BSerialPort_IsDCD(BSerialPort *SerialPort)
{
   return SerialPort->IsDCD();
}


/*
 *  Method: BSerialPort::WaitForInput()
 *   Descr: 
 */
ssize_t
BSerialPort_WaitForInput(BSerialPort *SerialPort)
{
   return SerialPort->WaitForInput();
}


/*
 *  Method: BSerialPort::CountDevices()
 *   Descr: 
 */
int32
BSerialPort_CountDevices(BSerialPort *SerialPort)
{
   return SerialPort->CountDevices();
}


/*
 *  Method: BSerialPort::GetDeviceName()
 *   Descr: 
 */
status_t
BSerialPort_GetDeviceName(BSerialPort *SerialPort, int32 n,
                           char *name,
                           size_t bufSize)
{
   return SerialPort->GetDeviceName(n,
                           name,
                           bufSize);
}

#if defined(__cplusplus)
}
#endif


/*
 *  Method: BSerialPort::ScanDevices()
 *   Descr: 
 */
/* private function !
void
BSerialPort_ScanDevices(BSerialPort *SerialPort)
{
   SerialPort->ScanDevices();
}*/


/*
 *  Method: BSerialPort::_ReservedSerialPort1()
 *   Descr: 
 */
/* private function !
void
BSerialPort__ReservedSerialPort1(BSerialPort *SerialPort)
{
   SerialPort->_ReservedSerialPort1();
}*/


/*
 *  Method: BSerialPort::_ReservedSerialPort2()
 *   Descr: 
 */
/* private function !
void
BSerialPort__ReservedSerialPort2(BSerialPort *SerialPort)
{
   SerialPort->_ReservedSerialPort2();
}*/


/*
 *  Method: BSerialPort::_ReservedSerialPort3()
 *   Descr: 
 */
/* private function !
void
BSerialPort__ReservedSerialPort3(BSerialPort *SerialPort)
{
   SerialPort->_ReservedSerialPort3();
}*/


/*
 *  Method: BSerialPort::_ReservedSerialPort4()
 *   Descr: 
 */
/* private function !
void
BSerialPort__ReservedSerialPort4(BSerialPort *SerialPort)
{
   SerialPort->_ReservedSerialPort4();
}*/


/*
 *  Method: BSerialPort::DriverControl()
 *   Descr: 
 */
/* private function !
int
BSerialPort_DriverControl(BSerialPort *SerialPort)
{
   return SerialPort->DriverControl();
}*/

#endif /* _SERIALPORT_CPP_ */
