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

#ifndef _REGION_CPP_
#define _REGION_CPP_

/***********************************************************************
 * AUTHOR: nobody <baron>
 *   FILE: Screen.cpp
 *   DATE: Wed Sep 24 20:58:44 2003
 *  DESCR: 
 ***********************************************************************/
#include "Region.h"
#include <beobj.h>



class BPRegion : public BRegion, virtual public BPasObject
{
	public:
		BPRegion(TPasObject PasObject);
		BPRegion(TPasObject PasObject,const BRegion &region);
		BPRegion(TPasObject PasObject,const BRect rect);
	private:
};



BPRegion::BPRegion(TPasObject PasObject)
					:BRegion(),
					BPasObject(PasObject)
					
{
};
BPRegion::BPRegion(TPasObject PasObject,const BRegion &region)
					:BRegion(region),
					BPasObject(PasObject)
					
{
};
BPRegion::BPRegion(TPasObject PasObject,const BRect rect)
					:BRegion(rect),
					BPasObject(PasObject)
					
{
};

#if defined(__cplusplus)
extern "C" {
#endif
/***********************************************************************
 * AUTHOR: nobody <baron>
 *   FILE: Region.cpp
 *   DATE: Thu Sep 25 21:30:01 2003
 *  DESCR: 
 ***********************************************************************/

/***********************************************************************
 *  Method: BRegion::BRegion
 *  Params: 
 * Effects: 
 ***********************************************************************/
TCPlusObject BRegion_Create(TPasObject PasObject)
{
	return new BPRegion(PasObject);
}


/***********************************************************************
 *  Method: BRegion::BRegion
 *  Params: const BRegion &region
 * Effects: 
 ***********************************************************************/
TCPlusObject BRegion_Create_1
(TPasObject PasObject, const BRegion &region)
{
	return new BPRegion(PasObject, region);
}


/***********************************************************************
 *  Method: BRegion::BRegion
 *  Params: const BRect rect
 * Effects: 
 ***********************************************************************/
TCPlusObject BRegion_Create_2
(TPasObject PasObject, const BRect rect)
{
	return new BPRegion(PasObject, rect);
}


/***********************************************************************
 *  Method: BRegion::~BRegion
 *  Params: 
 * Effects: 
 ***********************************************************************/
void BRegion_Free(BRegion *Region)
{
   delete Region;
}





/***********************************************************************
 *  Method: BRegion::Frame
 *  Params: 
 * Returns: BRect
 * Effects: 
 ***********************************************************************/
BRect
BRegion_Frame(BRegion *Region) 
{
   return Region->Frame();
}


/***********************************************************************
 *  Method: BRegion::FrameInt
 *  Params: 
 * Returns: clipping_rect
 * Effects: 
 ***********************************************************************/
clipping_rect
BRegion_FrameInt_1
(BRegion *Region) 
{
   return Region->FrameInt();
}


/***********************************************************************
 *  Method: BRegion::RectAt
 *  Params: int32 index
 * Returns: BRect
 * Effects: 
 ***********************************************************************/
BRect
BRegion_RectAt(BRegion *Region, int32 index)
{
   return Region->RectAt(index);
}


/***********************************************************************
 *  Method: BRegion::RectAtInt
 *  Params: int32 index
 * Returns: clipping_rect
 * Effects: 
 ***********************************************************************/
clipping_rect
BRegion_RectAtInt_1
(BRegion *Region, int32 index)
{
   return Region->RectAtInt(index);
}


/***********************************************************************
 *  Method: BRegion::CountRects
 *  Params: 
 * Returns: int32
 * Effects: 
 ***********************************************************************/
int32
BRegion_CountRects(BRegion *Region)
{
   return Region->CountRects();
}


/***********************************************************************
 *  Method: BRegion::Set
 *  Params: BRect newBounds
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BRegion_Set(BRegion *Region, BRect newBounds)
{
   Region->Set(newBounds);
}


/***********************************************************************
 *  Method: BRegion::Set
 *  Params: clipping_rect newBounds
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BRegion_Set_1
(BRegion *Region, clipping_rect newBounds)
{
   Region->Set(newBounds);
}


/***********************************************************************
 *  Method: BRegion::Intersects
 *  Params: BRect r
 * Returns: bool
 * Effects: 
 ***********************************************************************/
bool
BRegion_Intersects(BRegion *Region, BRect r) 
{
   return Region->Intersects(r);
}


/***********************************************************************
 *  Method: BRegion::Intersects
 *  Params: clipping_rect r
 * Returns: bool
 * Effects: 
 ***********************************************************************/
bool
BRegion_Intersects_1
(BRegion *Region, clipping_rect r) 
{
   return Region->Intersects(r);
}


/***********************************************************************
 *  Method: BRegion::Contains
 *  Params: BPoint pt
 * Returns: bool
 * Effects: 
 ***********************************************************************/
bool
BRegion_Contains(BRegion *Region, BPoint pt) 
{
   return Region->Contains(pt);
}


/***********************************************************************
 *  Method: BRegion::Contains
 *  Params: int32 x, int32 y
 * Returns: bool
 * Effects: 
 ***********************************************************************/
bool
BRegion_Contains_1
(BRegion *Region, int32 x, int32 y)
{
   return Region->Contains(x, y);
}


/***********************************************************************
 *  Method: BRegion::PrintToStream
 *  Params: 
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BRegion_PrintToStream(BRegion *Region) 
{
   Region->PrintToStream();
}


/***********************************************************************
 *  Method: BRegion::OffsetBy
 *  Params: int32 dh, int32 dv
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BRegion_OffsetBy(BRegion *Region, int32 dh, int32 dv)
{
   Region->OffsetBy(dh, dv);
}


/***********************************************************************
 *  Method: BRegion::MakeEmpty
 *  Params: 
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BRegion_MakeEmpty(BRegion *Region)
{
   Region->MakeEmpty();
}


/***********************************************************************
 *  Method: BRegion::Include
 *  Params: BRect r
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BRegion_Include(BRegion *Region, BRect r)
{
   Region->Include(r);
}


/***********************************************************************
 *  Method: BRegion::Include
 *  Params: clipping_rect r
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BRegion_Include_1
(BRegion *Region, clipping_rect r)
{
   Region->Include(r);
}


/***********************************************************************
 *  Method: BRegion::Include
 *  Params: const BRegion *
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BRegion_Include_2
(BRegion *Region, const BRegion *r)
{
   Region->Include(r);
}


/***********************************************************************
 *  Method: BRegion::Exclude
 *  Params: BRect r
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BRegion_Exclude(BRegion *Region, BRect r)
{
   Region->Exclude(r);
}


/***********************************************************************
 *  Method: BRegion::Exclude
 *  Params: clipping_rect r
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BRegion_Exclude_1
(BRegion *Region, clipping_rect r)
{
   Region->Exclude(r);
}


/***********************************************************************
 *  Method: BRegion::Exclude
 *  Params: const BRegion *
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BRegion_Exclude_2
(BRegion *Region, const BRegion *r)
{
   Region->Exclude(r);
}


/***********************************************************************
 *  Method: BRegion::IntersectWith
 *  Params: const BRegion *
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BRegion_IntersectWith(BRegion *Region, const BRegion *r)
{
   Region->IntersectWith(r);
}




#if defined(__cplusplus)
}
#endif

#endif /* _REGION_CPP_ */
