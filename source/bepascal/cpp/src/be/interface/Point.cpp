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

#ifndef _POINT_CPP_
#define _POINT_CPP_

#include <Point.h>
#include <Rect.h>

#include <point.h>
#include <beobj.h>

BPPoint::BPPoint(TPasObject PasObject, float x, float y) : BPoint(x, y), BPasObject(PasObject)
{
}

BPPoint::BPPoint(TPasObject PasObject, const BPoint& point) : BPoint(point), BPasObject(PasObject)
{
}

BPPoint::BPPoint(TPasObject PasObject) : BPoint(), BPasObject(PasObject)
{
}

#if defined(__cplusplus)
extern "C" {
#endif

TCPlusObject BPoint_Create_1(TPasObject PasObject, float x, float y)
{
	return new BPPoint(PasObject, x, y);
}

TCPlusObject BPoint_Create_2(TPasObject PasObject, const BPoint& point)
{
	return new BPPoint(PasObject, point);
}

TCPlusObject BPoint_Create_3(TPasObject PasObject)
{
	return new BPPoint(PasObject);
}

void BPoint_Free(TCPlusObject Point)
{
	delete reinterpret_cast<BPoint*>(Point);
}

void BPoint_ConstrainTo(TCPlusObject Point, BRect rect)
{
	reinterpret_cast<BPoint*>(Point)->ConstrainTo(rect);
}

void BPoint_PrintToStream(TCPlusObject Point)
{
	reinterpret_cast<BPoint*>(Point)->PrintToStream();
}

void BPoint_Set(TCPlusObject Point, float x, float y)
{
	reinterpret_cast<BPoint*>(Point)->Set(x, y);
}

float BPoint_Get_X(TCPlusObject Point)
{
	return reinterpret_cast<BPoint*>(Point)->x;
}

float BPoint_Get_Y(TCPlusObject Point)
{
	return reinterpret_cast<BPoint*>(Point)->y;
}

#if defined(__cplusplus)
}
#endif


#endif /* _POINT_CPP_ */
