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
#ifndef _VOLUME_CPP_
#define _VOLUME_CPP_

#include "Volume.h"
#include <beobj.h>


#if defined(__cplusplus)
extern "C" {
#endif

/*
 *  Method: BVolume::BVolume()
 *   Descr: 
 */
TCPlusObject BVolume_Create(TPasObject PasObject)
{
	return new BVolume();
}


/*
 *  Method: BVolume::BVolume()
 *   Descr: 
 */
TCPlusObject BVolume_Create_1
(TPasObject PasObject, dev_t dev)
{
	return new BVolume( dev);
}


/*
 *  Method: BVolume::BVolume()
 *   Descr: 
 */
TCPlusObject BVolume_Create_2
(TPasObject PasObject, const BVolume &vol)
{
	return new BVolume( vol);
}


/*
 *  Method: BVolume::~BVolume()
 *   Descr: 
 */
void BVolume_BVolume(BVolume *Volume)
{
   delete Volume;
}


/*
 *  Method: BVolume::InitCheck()
 *   Descr: 
 */
status_t
BVolume_InitCheck(BVolume *Volume) 
{
   return Volume->InitCheck();
}


/*
 *  Method: BVolume::SetTo()
 *   Descr: 
 */
status_t
BVolume_SetTo(BVolume *Volume, dev_t dev)
{
   return Volume->SetTo(dev);
}


/*
 *  Method: BVolume::Unset()
 *   Descr: 
 */
void
BVolume_Unset(BVolume *Volume)
{
   Volume->Unset();
}


/*
 *  Method: BVolume::Device()
 *   Descr: 
 */
dev_t
BVolume_Device(BVolume *Volume) 
{
   return Volume->Device();
}


/*
 *  Method: BVolume::GetRootDirectory()
 *   Descr: 
 */
status_t
BVolume_GetRootDirectory(BVolume *Volume, BDirectory *dir) 
{
   return Volume->GetRootDirectory(dir);
}


/*
 *  Method: BVolume::Capacity()
 *   Descr: 
 */
off_t
BVolume_Capacity(BVolume *Volume) 
{
   return Volume->Capacity();
}


/*
 *  Method: BVolume::FreeBytes()
 *   Descr: 
 */
off_t
BVolume_FreeBytes(BVolume *Volume) 
{
   return Volume->FreeBytes();
}


/*
 *  Method: BVolume::GetName()
 *   Descr: 
 */
status_t
BVolume_GetName(BVolume *Volume, char *name) 
{
   return Volume->GetName(name);
}


/*
 *  Method: BVolume::SetName()
 *   Descr: 
 */
status_t
BVolume_SetName(BVolume *Volume, const char *name)
{
   return Volume->SetName(name);
}


/*
 *  Method: BVolume::GetIcon()
 *   Descr: 
 */
status_t
BVolume_GetIcon(BVolume *Volume, BBitmap *icon,
                 icon_size which) 
{
   return Volume->GetIcon(icon,
                 which);
}


/*
 *  Method: BVolume::IsRemovable()
 *   Descr: 
 */
bool
BVolume_IsRemovable(BVolume *Volume) 
{
   return Volume->IsRemovable();
}


/*
 *  Method: BVolume::IsReadOnly()
 *   Descr: 
 */
bool
BVolume_IsReadOnly(BVolume *Volume) 
{
   return Volume->IsReadOnly();
}


/*
 *  Method: BVolume::IsPersistent()
 *   Descr: 
 */
bool
BVolume_IsPersistent(BVolume *Volume) 
{
   return Volume->IsPersistent();
}


/*
 *  Method: BVolume::IsShared()
 *   Descr: 
 */
bool
BVolume_IsShared(BVolume *Volume) 
{
   return Volume->IsShared();
}


/*
 *  Method: BVolume::KnowsMime()
 *   Descr: 
 */
bool
BVolume_KnowsMime(BVolume *Volume) 
{
   return Volume->KnowsMime();
}


/*
 *  Method: BVolume::KnowsAttr()
 *   Descr: 
 */
bool
BVolume_KnowsAttr(BVolume *Volume) 
{
   return Volume->KnowsAttr();
}


/*
 *  Method: BVolume::KnowsQuery()
 *   Descr: 
 */
bool
BVolume_KnowsQuery(BVolume *Volume) 
{
   return Volume->KnowsQuery();
}


/*
 *  Method: BVolume::operator==()
 *   Descr: 
 */
/*bool
BVolume_operator==(BVolume *Volume, const BVolume &vol) 
{
   return Volume->operator==(vol);
}
*/

/*
 *  Method: BVolume::operator!=()
 *   Descr: 
 */
 /*
bool
BVolume_operator!=(BVolume *Volume, const BVolume &vol) 
{
   return Volume->operator!=(vol);
}
*/

/*
 *  Method: BVolume::operator=()
 *   Descr: 
 */
 /*
BVolume &
BVolume_operator=(BVolume *Volume, const BVolume &vol)
{
   return Volume->operator=(vol);
}
*/


/*
 *  Method: BVolume::_TurnUpTheVolume1()
 *   Descr: 
 */
/* 
void
BVolume__TurnUpTheVolume1(BVolume *Volume)
{
   Volume->_TurnUpTheVolume1();
}
*/

/*
 *  Method: BVolume::_TurnUpTheVolume2()
 *   Descr: 
 */
 /*
void
BVolume__TurnUpTheVolume2(BVolume *Volume)
{
   Volume->_TurnUpTheVolume2();
}
*/

/*
 *  Method: BVolume::_TurnUpTheVolume3()
 *   Descr: 
 */
 /*
void
BVolume__TurnUpTheVolume3(BVolume *Volume)
{
   Volume->_TurnUpTheVolume3();
}
*/

/*
 *  Method: BVolume::_TurnUpTheVolume4()
 *   Descr: 
 */
 /*
void
BVolume__TurnUpTheVolume4(BVolume *Volume)
{
   Volume->_TurnUpTheVolume4();
}
*/

/*
 *  Method: BVolume::_TurnUpTheVolume5()
 *   Descr: 
 */
 /*
void
BVolume__TurnUpTheVolume5(BVolume *Volume)
{
   Volume->_TurnUpTheVolume5();
}
*/

/*
 *  Method: BVolume::_TurnUpTheVolume6()
 *   Descr: 
 */
 /*
void
BVolume__TurnUpTheVolume6(BVolume *Volume)
{
   Volume->_TurnUpTheVolume6();
}
*/

/*
 *  Method: BVolume::_TurnUpTheVolume7()
 *   Descr: 
 */
 /*
void
BVolume__TurnUpTheVolume7(BVolume *Volume)
{
   Volume->_TurnUpTheVolume7();
}

*/
/*
 *  Method: BVolume::_TurnUpTheVolume8()
 *   Descr: 
 */
 /*
void
BVolume__TurnUpTheVolume8(BVolume *Volume)
{
   Volume->_TurnUpTheVolume8();
}
*/
#if defined(__cplusplus)
}
#endif

#endif /* _VOLUME_CPP_ */



