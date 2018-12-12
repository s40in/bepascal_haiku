/*  BePascal - A pascal wrapper around the BeOS API
    Copyright (C) 2002  Olivier Coursière
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
#ifndef _FLATTENABLE_CPP_
#define _FLATTENABLE_CPP_

#include "Flattenable.h"
#include <beobj.h>


#if defined(__cplusplus)
extern "C" {
#endif
/***********************************************************************
 * AUTHOR:  <baron>
 *   FILE: Flattenable.cpp
 *   DATE: Thu Jan 23 21:06:42 2003
 *  DESCR: 
 ***********************************************************************/

/***********************************************************************
 *  Method: BFlattenable::AllowsTypeCode
 *  Params: type_code code
 * Returns: bool
 * Effects: 
 ***********************************************************************/
bool
BFlattenable_AllowsTypeCode(BFlattenable *Flattenable, type_code code) 
{
   return Flattenable->AllowsTypeCode(code);
}


/***********************************************************************
 *  Method: BFlattenable::~BFlattenable
 *  Params: 
 * Effects: 
 ***********************************************************************/
void BFlattenable_Free(BFlattenable *Flattenable)
{
   delete Flattenable;
}

bool BFlattenable_IsFixedSize(BFlattenable *Flattenable)
{
   return Flattenable->IsFixedSize();
}

type_code BFlattenable_TypeCode(BFlattenable *Flattenable)
{
   return Flattenable->TypeCode();
}

ssize_t BFlattenable_FlattenedSize(BFlattenable *Flattenable)
{
   return Flattenable->FlattenedSize();
}

status_t BFlattenable_Flatten(BFlattenable *Flattenable,void *buffer, ssize_t size)
{
   return Flattenable->Flatten(buffer,size);
}

status_t BFlattenable_Unflatten(BFlattenable *Flattenable,type_code c, const void *buf, ssize_t size)
{
   return Flattenable->Unflatten(c,buf,size);
}


#if defined(__cplusplus)
}
#endif

#endif /* _FLATTENABLE_CPP_ */
