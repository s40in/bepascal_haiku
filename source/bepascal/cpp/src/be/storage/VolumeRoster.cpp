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
#ifndef _VOLUMEROSTER_CPP_
#define _VOLUMEROSTER_CPP_

#include "VolumeRoster.h"
#include <beobj.h>


#if defined(__cplusplus)
extern "C" {
#endif

/*
 *  Method: BVolumeRoster::BVolumeRoster()
 *   Descr: 
 */
TCPlusObject BVolumeRoster_Create(TPasObject PasObject)
{
	return new BVolumeRoster();
}


/*
 *  Method: BVolumeRoster::~BVolumeRoster()
 *   Descr: 
 */
void BVolumeRoster_Free(BVolumeRoster *VolumeRoster)
{
   delete VolumeRoster;
}


/*
 *  Method: BVolumeRoster::GetNextVolume()
 *   Descr: 
 */
status_t
BVolumeRoster_GetNextVolume(BVolumeRoster *VolumeRoster, BVolume *vol)
{
   return VolumeRoster->GetNextVolume(vol);
}


/*
 *  Method: BVolumeRoster::Rewind()
 *   Descr: 
 */
void
BVolumeRoster_Rewind(BVolumeRoster *VolumeRoster)
{
   VolumeRoster->Rewind();
}


/*
 *  Method: BVolumeRoster::GetBootVolume()
 *   Descr: 
 */
status_t
BVolumeRoster_GetBootVolume(BVolumeRoster *VolumeRoster, BVolume *vol)
{
   return VolumeRoster->GetBootVolume(vol);
}


/*
 *  Method: BVolumeRoster::StartWatching()
 *   Descr: 
 */
status_t
BVolumeRoster_StartWatching(BVolumeRoster *VolumeRoster, BMessenger msngr)
{
   return VolumeRoster->StartWatching(msngr);
}


/*
 *  Method: BVolumeRoster::StopWatching()
 *   Descr: 
 */
void
BVolumeRoster_StopWatching(BVolumeRoster *VolumeRoster)
{
   VolumeRoster->StopWatching();
}


/*
 *  Method: BVolumeRoster::Messenger()
 *   Descr: 
 */
BMessenger
BVolumeRoster_Messenger(BVolumeRoster *VolumeRoster) 
{
   return VolumeRoster->Messenger();
}



#if defined(__cplusplus)
}
#endif

#endif /* _VOLUMEROSTER_CPP_ */

