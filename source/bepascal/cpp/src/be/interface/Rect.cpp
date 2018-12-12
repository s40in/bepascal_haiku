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

#ifndef _RECT_CPP_
#define _RECT_CPP_

#include <Point.h>
#include <Rect.h>

#include <rect.h>
#include <beobj.h>

BPRect::BPRect(TPasObject PasObject) : BRect(), BPasObject(PasObject)
{
}

BPRect::BPRect(TPasObject PasObject, const BRect & rect) : BRect(rect), BPasObject(PasObject)
{
}

BPRect::BPRect(TPasObject PasObject, float l, float t, float r, float b) : BRect(l, t, r, b), BPasObject(PasObject)
{
}

BPRect::BPRect(TPasObject PasObject, BPoint leftTop, BPoint rightBottom) : BRect(leftTop, rightBottom), BPasObject(PasObject)
{
}

#if defined(__cplusplus)
extern "C" {
#endif

TCPlusObject BRect_Create_1(TPasObject PasObject)
{
  return new BPRect(PasObject);
}

TCPlusObject BRect_Create_2(TPasObject PasObject, const BRect& rect)
{
  return new BPRect(PasObject, rect);
}

TCPlusObject BRect_Create_3(TPasObject PasObject, float l, float t, float r, float b)
{
  return new BPRect(PasObject, l, t, r, b);
}

TCPlusObject BRect_Create_4(TPasObject PasObject, BPoint leftTop, BPoint rightBottom)
{
  return new BPRect(PasObject, leftTop, rightBottom);
}

void BRect_Free(TCPlusObject rect)
{
  delete reinterpret_cast<BRect*>(rect);
}

void BRect_PrintToStream(TCPlusObject rect)
{
	reinterpret_cast<BRect*>(rect)->PrintToStream();
}

float BRect_left(TCPlusObject rect)
{
	return reinterpret_cast<BRect*>(rect)->left;
}

float BRect_top(TCPlusObject rect)
{
	return reinterpret_cast<BRect*>(rect)->top;
}
float BRect_right(TCPlusObject rect)
{
	return reinterpret_cast<BRect*>(rect)->right;
}
float BRect_bottom(TCPlusObject rect)
{
	return reinterpret_cast<BRect*>(rect)->bottom;
}

/***********************************************************************
 *  Method: BRect::SetLeftTop
 *  Params: const BPoint
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BRect_SetLeftTop(BRect *Rect, const BPoint p)
{
   Rect->SetLeftTop(p);
}


/***********************************************************************
 *  Method: BRect::SetRightBottom
 *  Params: const BPoint
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BRect_SetRightBottom(BRect *Rect, const BPoint p)
{
   Rect->SetRightBottom(p);
}


/***********************************************************************
 *  Method: BRect::SetLeftBottom
 *  Params: const BPoint
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BRect_SetLeftBottom(BRect *Rect, const BPoint p)
{
   Rect->SetLeftBottom(p);
}


/***********************************************************************
 *  Method: BRect::SetRightTop
 *  Params: const BPoint
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BRect_SetRightTop(BRect *Rect, const BPoint p)
{
   Rect->SetRightTop(p);
}


/***********************************************************************
 *  Method: BRect::InsetBy
 *  Params: BPoint
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BRect_InsetBy(BRect *Rect, BPoint p)
{
   Rect->InsetBy(p);
}


/***********************************************************************
 *  Method: BRect::InsetBy
 *  Params: float dx, float dy
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BRect_InsetBy_1
(BRect *Rect, float dx, float dy)
{
   Rect->InsetBy(dx, dy);
}


/***********************************************************************
 *  Method: BRect::OffsetBy
 *  Params: BPoint
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BRect_OffsetBy(BRect *Rect, BPoint p)
{
   Rect->OffsetBy(p);
}


/***********************************************************************
 *  Method: BRect::OffsetBy
 *  Params: float dx, float dy
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BRect_OffsetBy_1
(BRect *Rect, float dx, float dy)
{
   Rect->OffsetBy(dx, dy);
}


/***********************************************************************
 *  Method: BRect::OffsetTo
 *  Params: BPoint
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BRect_OffsetTo(BRect *Rect, BPoint p)
{
   Rect->OffsetTo(p);
}


/***********************************************************************
 *  Method: BRect::OffsetTo
 *  Params: float x, float y
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BRect_OffsetTo_1
(BRect *Rect, float x, float y)
{
   Rect->OffsetTo(x, y);
}


/***********************************************************************
 *  Method: BRect::InsetBySelf
 *  Params: BPoint
 * Returns: BRect &
 * Effects: 
 ***********************************************************************/
BRect &
BRect_InsetBySelf(BRect *Rect, BPoint p)
{
   return Rect->InsetBySelf(p);
}


/***********************************************************************
 *  Method: BRect::InsetBySelf
 *  Params: float dx, float dy
 * Returns: BRect &
 * Effects: 
 ***********************************************************************/
BRect &
BRect_InsetBySelf_1
(BRect *Rect, float dx, float dy)
{
   return Rect->InsetBySelf(dx, dy);
}


/***********************************************************************
 *  Method: BRect::InsetByCopy
 *  Params: BPoint
 * Returns: BRect
 * Effects: 
 ***********************************************************************/
BRect
BRect_InsetByCopy(BRect *Rect, BPoint p)
{
   return Rect->InsetByCopy(p);
}


/***********************************************************************
 *  Method: BRect::InsetByCopy
 *  Params: float dx, float dy
 * Returns: BRect
 * Effects: 
 ***********************************************************************/
BRect
BRect_InsetByCopy_1
(BRect *Rect, float dx, float dy)
{
   return Rect->InsetByCopy(dx, dy);
}


/***********************************************************************
 *  Method: BRect::OffsetBySelf
 *  Params: BPoint
 * Returns: BRect &
 * Effects: 
 ***********************************************************************/
BRect &
BRect_OffsetBySelf(BRect *Rect, BPoint p)
{
   return Rect->OffsetBySelf(p);
}


/***********************************************************************
 *  Method: BRect::OffsetBySelf
 *  Params: float dx, float dy
 * Returns: BRect &
 * Effects: 
 ***********************************************************************/
BRect &
BRect_OffsetBySelf_1
(BRect *Rect, float dx, float dy)
{
   return Rect->OffsetBySelf(dx, dy);
}


/***********************************************************************
 *  Method: BRect::OffsetByCopy
 *  Params: BPoint
 * Returns: BRect
 * Effects: 
 ***********************************************************************/
BRect
BRect_OffsetByCopy(BRect *Rect, BPoint p)
{
   return Rect->OffsetByCopy(p);
}


/***********************************************************************
 *  Method: BRect::OffsetByCopy
 *  Params: float dx, float dy
 * Returns: BRect
 * Effects: 
 ***********************************************************************/
BRect
BRect_OffsetByCopy_1
(BRect *Rect, float dx, float dy)
{
   return Rect->OffsetByCopy(dx, dy);
}


/***********************************************************************
 *  Method: BRect::OffsetToSelf
 *  Params: BPoint
 * Returns: BRect &
 * Effects: 
 ***********************************************************************/
BRect &
BRect_OffsetToSelf(BRect *Rect, BPoint p)
{
   return Rect->OffsetToSelf(p);
}


/***********************************************************************
 *  Method: BRect::OffsetToSelf
 *  Params: float dx, float dy
 * Returns: BRect &
 * Effects: 
 ***********************************************************************/
BRect &
BRect_OffsetToSelf_1
(BRect *Rect, float dx, float dy)
{
   return Rect->OffsetToSelf(dx, dy);
}


/***********************************************************************
 *  Method: BRect::OffsetToCopy
 *  Params: BPoint
 * Returns: BRect
 * Effects: 
 ***********************************************************************/
BRect
BRect_OffsetToCopy(BRect *Rect, BPoint p)
{
   return Rect->OffsetToCopy(p);
}


/***********************************************************************
 *  Method: BRect::OffsetToCopy
 *  Params: float dx, float dy
 * Returns: BRect
 * Effects: 
 ***********************************************************************/
BRect
BRect_OffsetToCopy_1
(BRect *Rect, float dx, float dy)
{
   return Rect->OffsetToCopy(dx, dy);
}




/***********************************************************************
 *  Method: BRect::Intersects
 *  Params: BRect r
 * Returns: bool
 * Effects: 
 ***********************************************************************/
bool
BRect_Intersects(BRect *Rect, BRect r) 
{
   return Rect->Intersects(r);
}


/***********************************************************************
 *  Method: BRect::Contains
 *  Params: BPoint
 * Returns: bool
 * Effects: 
 ***********************************************************************/
bool
BRect_Contains(BRect *Rect, BPoint p) 
{
   return Rect->Contains(p);
}


/***********************************************************************
 *  Method: BRect::Contains
 *  Params: BRect
 * Returns: bool
 * Effects: 
 ***********************************************************************/
bool
BRect_Contains_1
(BRect *Rect, BRect p) 
{
   return Rect->Contains(p);
}

#if defined(__cplusplus)
}
#endif


#endif /* _RECT_CPP_ */
