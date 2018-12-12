/*  BePascal - A pascal wrapper around the BeOS API
    Copyright (C) 2002 Eric Jourde

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

#ifndef _JOYSTICK_CPP_
#define _JOYSTICK_CPP_


#include "Joystick.h"

#include <beobj.h>

#if defined(__cplusplus)
extern "C" {
#endif

/*
 *  Method: BJoystick::BJoystick()
 *   Descr: 
 */
TCPlusObject BJoystick_Create()
{
	return new BJoystick();
}


/*
 *  Method: BJoystick::~BJoystick()
 *   Descr: 
 */
void BJoystick_Free(BJoystick *Joystick)
{
   delete Joystick;
}


/*
 *  Method: BJoystick::Open()
 *   Descr: 
 */
status_t
BJoystick_Open(BJoystick *Joystick, const char *portName)
{
   return Joystick->Open(portName);
}


/*
 *  Method: BJoystick::Open()
 *   Descr: 
 */
status_t
BJoystick_Open_1
(BJoystick *Joystick, const char *portName,
                bool enter_enhanced)
{
   return Joystick->Open(portName,
                enter_enhanced);
}


/*
 *  Method: BJoystick::Close()
 *   Descr: 
 */
void
BJoystick_Close(BJoystick *Joystick)
{
   Joystick->Close();
}


/*
 *  Method: BJoystick::Update()
 *   Descr: 
 */
status_t
BJoystick_Update(BJoystick *Joystick)
{
   return Joystick->Update();
}


/*
 *  Method: BJoystick::SetMaxLatency()
 *   Descr: 
 */
status_t
BJoystick_SetMaxLatency(BJoystick *Joystick, bigtime_t max_latency)
{
   return Joystick->SetMaxLatency(max_latency);
}


/*
 *  Method: BJoystick::CountDevices()
 *   Descr: 
 */
int32
BJoystick_CountDevices(BJoystick *Joystick)
{
   return Joystick->CountDevices();
}


/*
 *  Method: BJoystick::GetDeviceName()
 *   Descr: 
 */
status_t
BJoystick_GetDeviceName(BJoystick *Joystick, int32 n,
                         char *name,
                         size_t bufSize)
{
   return Joystick->GetDeviceName(n,
                         name,
                         bufSize);
}


/*
 *  Method: BJoystick::EnterEnhancedMode()
 *   Descr: 
 */
bool
BJoystick_EnterEnhancedMode(BJoystick *Joystick, const entry_ref *ref)
{
   return Joystick->EnterEnhancedMode(ref);
}


/*
 *  Method: BJoystick::CountSticks()
 *   Descr: 
 */
int32
BJoystick_CountSticks(BJoystick *Joystick)
{
   return Joystick->CountSticks();
}


/*
 *  Method: BJoystick::CountAxes()
 *   Descr: 
 */
int32
BJoystick_CountAxes(BJoystick *Joystick)
{
   return Joystick->CountAxes();
}


/*
 *  Method: BJoystick::CountHats()
 *   Descr: 
 */
int32
BJoystick_CountHats(BJoystick *Joystick)
{
   return Joystick->CountHats();
}


/*
 *  Method: BJoystick::CountButtons()
 *   Descr: 
 */
int32
BJoystick_CountButtons(BJoystick *Joystick)
{
   return Joystick->CountButtons();
}


/*
 *  Method: BJoystick::GetAxisValues()
 *   Descr: 
 */
status_t
BJoystick_GetAxisValues(BJoystick *Joystick, int16 *out_values,
                         int32 for_stick)
{
   return Joystick->GetAxisValues(out_values,
                         for_stick);
}


/*
 *  Method: BJoystick::GetHatValues()
 *   Descr: 
 */
status_t
BJoystick_GetHatValues(BJoystick *Joystick, uint8 *out_hats,
                        int32 for_stick)
{
   return Joystick->GetHatValues(out_hats,
                        for_stick);
}


/*
 *  Method: BJoystick::ButtonValues()
 *   Descr: 
 */
uint32
BJoystick_ButtonValues(BJoystick *Joystick, int32 for_stick)
{
   return Joystick->ButtonValues(for_stick);
}


/*
 *  Method: BJoystick::GetAxisNameAt()
 *   Descr: 
 */
status_t
BJoystick_GetAxisNameAt(BJoystick *Joystick, int32 index,
                         BString *out_name)
{
   return Joystick->GetAxisNameAt(index,
                         out_name);
}


/*
 *  Method: BJoystick::GetHatNameAt()
 *   Descr: 
 */
status_t
BJoystick_GetHatNameAt(BJoystick *Joystick, int32 index,
                        BString *out_name)
{
   return Joystick->GetHatNameAt(index,
                        out_name);
}


/*
 *  Method: BJoystick::GetButtonNameAt()
 *   Descr: 
 */
status_t
BJoystick_GetButtonNameAt(BJoystick *Joystick, int32 index,
                           BString *out_name)
{
   return Joystick->GetButtonNameAt(index,
                           out_name);
}


/*
 *  Method: BJoystick::GetControllerModule()
 *   Descr: 
 */
status_t
BJoystick_GetControllerModule(BJoystick *Joystick, BString *out_name)
{
   return Joystick->GetControllerModule(out_name);
}


/*
 *  Method: BJoystick::GetControllerName()
 *   Descr: 
 */
status_t
BJoystick_GetControllerName(BJoystick *Joystick, BString *out_name)
{
   return Joystick->GetControllerName(out_name);
}


/*
 *  Method: BJoystick::IsCalibrationEnabled()
 *   Descr: 
 */
bool
BJoystick_IsCalibrationEnabled(BJoystick *Joystick)
{
   return Joystick->IsCalibrationEnabled();
}


/*
 *  Method: BJoystick::EnableCalibration()
 *   Descr: 
 */
status_t
BJoystick_EnableCalibration(BJoystick *Joystick, bool calibrates)
{
   return Joystick->EnableCalibration(calibrates);
}


/*
 *  Method: BJoystick::Calibrate()
 *   Descr: 
 */
/* 
void
BJoystick_Calibrate(BJoystick *Joystick, struct _extended_joystick *reading)
{
   Joystick->Calibrate(reading);
}

*/
/*
 *  Method: BJoystick::gather_enhanced_info()
 *   Descr: 
 */
/*status_t
BJoystick_gather_enhanced_info(BJoystick *Joystick, const entry_ref *ref)
{
   return Joystick->gather_enhanced_info(ref);
}
*/

/*
 *  Method: BJoystick::save_config()
 *   Descr: 
 */
/*status_t
BJoystick_save_config(BJoystick *Joystick, const entry_ref *ref)
{
   return Joystick->save_config(ref);
}
*/

/*
 *  Method: BJoystick::_ReservedJoystick1()
 *   Descr: 
 */
/*void
BJoystick__ReservedJoystick1(BJoystick *Joystick)
{
   Joystick->_ReservedJoystick1();
}
*/

/*
 *  Method: BJoystick::_ReservedJoystick2()
 *   Descr: 
 */
/*void
BJoystick__ReservedJoystick2(BJoystick *Joystick)
{
   Joystick->_ReservedJoystick2();
}
*/

/*
 *  Method: BJoystick::_ReservedJoystick3()
 *   Descr: 
 */
/*void
BJoystick__ReservedJoystick3(BJoystick *Joystick)
{
   Joystick->_ReservedJoystick3();
}
*/

/*
 *  Method: BJoystick::_Reserved_Joystick_4()
 *   Descr: 
 */
/*status_t
BJoystick__Reserved_Joystick_4(BJoystick *Joystick, void *,
                                ...)
{
   return Joystick->_Reserved_Joystick_4(,
                                );
}
*/

/*
 *  Method: BJoystick::_Reserved_Joystick_5()
 *   Descr: 
 */
/*status_t
BJoystick__Reserved_Joystick_5(BJoystick *Joystick, void *,
                                ...)
{
   return Joystick->_Reserved_Joystick_5(,
                                );
}
*/

/*
 *  Method: BJoystick::_Reserved_Joystick_6()
 *   Descr: 
 */
/*status_t
BJoystick__Reserved_Joystick_6(BJoystick *Joystick, void *,
                                ...)
{
   return Joystick->_Reserved_Joystick_6(,
                                );
}
*/
#if defined(__cplusplus)
}
#endif

#endif /* _JOYSTICK_CPP_ */
