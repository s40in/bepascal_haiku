/*  BePascal - A pascal wrapper around the BeOS API
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
*/

#ifndef _SCREEN_CPP_
#define _SCREEN_CPP_

/***********************************************************************
 * AUTHOR: nobody <baron>
 *   FILE: Screen.cpp
 *   DATE: Wed Sep 24 20:58:44 2003
 *  DESCR: 
 ***********************************************************************/
#include "Screen.h"
#include <beobj.h>



class BPScreen : public BScreen, virtual public BPasObject
{
	public:
		BPScreen(TPasObject PasObject, screen_id id=B_MAIN_SCREEN_ID );

	private:
};



BPScreen::BPScreen(TPasObject PasObject,screen_id id)
					:BScreen(id),
					BPasObject(PasObject)
					
{
}

#if defined(__cplusplus)
extern "C" {
#endif


/***********************************************************************
 *  Method: BScreen::BScreen
 *  Params: screen_id id
 * Effects: 
 ***********************************************************************/
TCPlusObject BScreen_Create(TPasObject PasObject, screen_id id)
{
	return new BPScreen(PasObject, id);
}


/***********************************************************************
 *  Method: BScreen::BScreen
 *  Params: BWindow *win
 * Effects: 
 ***********************************************************************/
TCPlusObject BScreen_Create_1
(TPasObject PasObject, BWindow *win)
{
	//return new BPScreen(PasObject, win);
}


/***********************************************************************
 *  Method: BScreen::~BScreen
 *  Params: 
 * Effects: 
 ***********************************************************************/
void BScreen_Free(BScreen *Screen)
{
   delete Screen;
}


/***********************************************************************
 *  Method: BScreen::IsValid
 *  Params: 
 * Returns: bool
 * Effects: 
 ***********************************************************************/
bool
BScreen_IsValid(BScreen *Screen)
{
   return Screen->IsValid();
}


/***********************************************************************
 *  Method: BScreen::SetToNext
 *  Params: 
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BScreen_SetToNext(BScreen *Screen)
{
   return Screen->SetToNext();
}


/***********************************************************************
 *  Method: BScreen::ColorSpace
 *  Params: 
 * Returns: color_space
 * Effects: 
 ***********************************************************************/
color_space
BScreen_ColorSpace(BScreen *Screen)
{
   return Screen->ColorSpace();
}


/***********************************************************************
 *  Method: BScreen::Frame
 *  Params: 
 * Returns: BRect
 * Effects: 
 ***********************************************************************/
BRect
BScreen_Frame(BScreen *Screen)
{
   return Screen->Frame();
}


/***********************************************************************
 *  Method: BScreen::ID
 *  Params: 
 * Returns: screen_id
 * Effects: 
 ***********************************************************************/
screen_id
BScreen_ID(BScreen *Screen)
{
   return Screen->ID();
}


/***********************************************************************
 *  Method: BScreen::WaitForRetrace
 *  Params: 
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BScreen_WaitForRetrace(BScreen *Screen)
{
   return Screen->WaitForRetrace();
}


/***********************************************************************
 *  Method: BScreen::WaitForRetrace
 *  Params: bigtime_t timeout
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BScreen_WaitForRetrace_1
(BScreen *Screen, bigtime_t timeout)
{
   return Screen->WaitForRetrace(timeout);
}


/***********************************************************************
 *  Method: BScreen::IndexForColor
 *  Params: uint8 r, uint8 g, uint8 b, uint8 a
 * Returns: uint8
 * Effects: 
 ***********************************************************************/
uint8
BScreen_IndexForColor(BScreen *Screen, uint8 r, uint8 g, uint8 b, uint8 a)
{
   return Screen->IndexForColor(r, g, b, a);
}


/***********************************************************************
 *  Method: BScreen::ColorForIndex
 *  Params: const uint8 index
 * Returns: rgb_color
 * Effects: 
 ***********************************************************************/
rgb_color
BScreen_ColorForIndex(BScreen *Screen, const uint8 index)
{
   return Screen->ColorForIndex(index);
}


/***********************************************************************
 *  Method: BScreen::InvertIndex
 *  Params: uint8 index
 * Returns: uint8
 * Effects: 
 ***********************************************************************/
uint8
BScreen_InvertIndex(BScreen *Screen, uint8 index)
{
   return Screen->InvertIndex(index);
}


/***********************************************************************
 *  Method: BScreen::ColorMap
 *  Params: 
 * Returns: const color_map *
 * Effects: 
 ***********************************************************************/
const color_map *
BScreen_ColorMap(BScreen *Screen)
{
   return Screen->ColorMap();
}


/***********************************************************************
 *  Method: BScreen::GetBitmap
 *  Params: BBitmap **screen_shot, bool draw_cursor, BRect *bound
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BScreen_GetBitmap(BScreen *Screen, BBitmap **screen_shot, bool draw_cursor, BRect *bound)
{
   return Screen->GetBitmap(screen_shot, draw_cursor, bound);
}


/***********************************************************************
 *  Method: BScreen::ReadBitmap
 *  Params: BBitmap *buffer, bool draw_cursor, BRect *bound
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BScreen_ReadBitmap(BScreen *Screen, BBitmap *buffer, bool draw_cursor, BRect *bound)
{
   return Screen->ReadBitmap(buffer, draw_cursor, bound);
}


/***********************************************************************
 *  Method: BScreen::DesktopColor
 *  Params: 
 * Returns: rgb_color
 * Effects: 
 ***********************************************************************/
rgb_color
BScreen_DesktopColor(BScreen *Screen)
{
   return Screen->DesktopColor();
}


/***********************************************************************
 *  Method: BScreen::DesktopColor
 *  Params: uint32 index
 * Returns: rgb_color
 * Effects: 
 ***********************************************************************/
rgb_color
BScreen_DesktopColor_1
(BScreen *Screen, uint32 index)
{
   return Screen->DesktopColor(index);
}


/***********************************************************************
 *  Method: BScreen::SetDesktopColor
 *  Params: rgb_color rgb, bool stick
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BScreen_SetDesktopColor(BScreen *Screen, rgb_color rgb, bool stick)
{
   Screen->SetDesktopColor(rgb, stick);
}


/***********************************************************************
 *  Method: BScreen::SetDesktopColor
 *  Params: rgb_color rgb, uint32 index, bool stick
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BScreen_SetDesktopColor_1
(BScreen *Screen, rgb_color rgb, uint32 index, bool stick)
{
   Screen->SetDesktopColor(rgb, index, stick);
}


/***********************************************************************
 *  Method: BScreen::ProposeMode
 *  Params: display_mode *target, const display_mode *low, const display_mode *high
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BScreen_ProposeMode(BScreen *Screen, display_mode *target, const display_mode *low, const display_mode *high)
{
   return Screen->ProposeMode(target, low, high);
}


/***********************************************************************
 *  Method: BScreen::GetModeList
 *  Params: display_mode **mode_list, uint32 *count
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BScreen_GetModeList(BScreen *Screen, display_mode **mode_list, uint32 *count)
{
   return Screen->GetModeList(mode_list, count);
}


/***********************************************************************
 *  Method: BScreen::GetMode
 *  Params: display_mode *mode
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BScreen_GetMode(BScreen *Screen, display_mode *mode)
{
   return Screen->GetMode(mode);
}


/***********************************************************************
 *  Method: BScreen::GetMode
 *  Params: uint32 workspace, display_mode *mode
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BScreen_GetMode_1
(BScreen *Screen, uint32 workspace, display_mode *mode)
{
   return Screen->GetMode(workspace, mode);
}


/***********************************************************************
 *  Method: BScreen::SetMode
 *  Params: display_mode *mode, bool makeDefault
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BScreen_SetMode(BScreen *Screen, display_mode *mode, bool makeDefault)
{
   return Screen->SetMode(mode, makeDefault);
}


/***********************************************************************
 *  Method: BScreen::SetMode
 *  Params: uint32 workspace, display_mode *mode, bool makeDefault
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BScreen_SetMode_1
(BScreen *Screen, uint32 workspace, display_mode *mode, bool makeDefault)
{
   return Screen->SetMode(workspace, mode, makeDefault);
}


/***********************************************************************
 *  Method: BScreen::GetDeviceInfo
 *  Params: accelerant_device_info *adi
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BScreen_GetDeviceInfo(BScreen *Screen, accelerant_device_info *adi)
{
   return Screen->GetDeviceInfo(adi);
}


/***********************************************************************
 *  Method: BScreen::GetPixelClockLimits
 *  Params: display_mode *mode, uint32 *low, uint32 *high
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BScreen_GetPixelClockLimits(BScreen *Screen, display_mode *mode, uint32 *low, uint32 *high)
{
   return Screen->GetPixelClockLimits(mode, low, high);
}


/***********************************************************************
 *  Method: BScreen::GetTimingConstraints
 *  Params: display_timing_constraints *dtc
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BScreen_GetTimingConstraints(BScreen *Screen, display_timing_constraints *dtc)
{
   return Screen->GetTimingConstraints(dtc);
}


/***********************************************************************
 *  Method: BScreen::SetDPMS
 *  Params: uint32 dpms_state
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BScreen_SetDPMS(BScreen *Screen, uint32 dpms_state)
{
   return Screen->SetDPMS(dpms_state);
}


/***********************************************************************
 *  Method: BScreen::DPMSState
 *  Params: void
 * Returns: uint32
 * Effects: 
 ***********************************************************************/
uint32
BScreen_DPMSState(BScreen *Screen)
{
   return Screen->DPMSState();
}


/***********************************************************************
 *  Method: BScreen::DPMSCapabilites
 *  Params: void
 * Returns: uint32
 * Effects: 
 ***********************************************************************/
uint32
BScreen_DPMSCapabilites(BScreen *Screen)
{
   return Screen->DPMSCapabilites();
}


/***********************************************************************
 *  Method: BScreen::private_screen
 *  Params: 
 * Returns: BPrivateScreen *
 * Effects: 
 ***********************************************************************/
#ifndef __HAIKU__
// This class is really private under Haiku
BPrivateScreen *
BScreen_private_screen(BScreen *Screen)
{
   return Screen->private_screen();
}
#endif

#if defined(__cplusplus)
}
#endif

#endif /* _SCREEN_CPP_ */
