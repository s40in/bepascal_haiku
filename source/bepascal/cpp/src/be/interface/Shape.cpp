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

#ifndef _SHAPE_CPP_
#define _SHAPE_CPP_

/***********************************************************************
 * AUTHOR: nobody <baron>
 *   FILE: Shape.cpp
 *   DATE: Sat Oct 11 20:54:15 2003
 *  DESCR: 
 ***********************************************************************/
#include <beobj.h>
#include <rect.h>
#include "Shape.h"


class BPShapeIterator : public BShapeIterator, virtual public BPasObject
{
	public:
		BPShapeIterator(TPasObject PasObject);

	private:
};

BPShapeIterator::BPShapeIterator(TPasObject PasObject)
					:BShapeIterator(),
					BPasObject(PasObject)
					
{
}


class BPShape : public BShape, virtual public BPasObject
{
	public:
		BPShape(TPasObject PasObject);
	    BPShape(TPasObject PasObject,const BShape &copyFrom);
		BPShape(TPasObject PasObject, BMessage *data);

	private:
};

BPShape::BPShape(TPasObject PasObject)
					:BShape(),
					BPasObject(PasObject)
					
{
}
BPShape::BPShape(TPasObject PasObject, const BShape &copyFrom)
					:BShape(copyFrom),
					BPasObject(PasObject)
					
{
}
BPShape::BPShape(TPasObject PasObject, BMessage *data)
					:BShape(data),
					BPasObject(PasObject)
					
{
}


#if defined(__cplusplus)
extern "C" {
#endif
/***********************************************************************
 *  Method: BShapeIterator::BShapeIterator
 *  Params: 
 * Effects: 
 ***********************************************************************/
TCPlusObject BShapeIterator_Create(TPasObject PasObject)
{
	return new BPShapeIterator(PasObject);
}


/***********************************************************************
 *  Method: BShapeIterator::~BShapeIterator
 *  Params: 
 * Effects: 
 ***********************************************************************/
void BShapeIterator_Free(BShapeIterator *ShapeIterator)
{
   delete ShapeIterator;
}


/***********************************************************************
 *  Method: BShapeIterator::IterateMoveTo
 *  Params: BPoint *point
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BShapeIterator_IterateMoveTo(BShapeIterator *ShapeIterator, BPoint *point)
{
   return ShapeIterator->IterateMoveTo(point);
}


/***********************************************************************
 *  Method: BShapeIterator::IterateLineTo
 *  Params: int32 lineCount, BPoint *linePts
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BShapeIterator_IterateLineTo(BShapeIterator *ShapeIterator, int32 lineCount, BPoint *linePts)
{
   return ShapeIterator->IterateLineTo(lineCount, linePts);
}


/***********************************************************************
 *  Method: BShapeIterator::IterateBezierTo
 *  Params: int32 bezierCount, BPoint *bezierPts
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BShapeIterator_IterateBezierTo(BShapeIterator *ShapeIterator, int32 bezierCount, BPoint *bezierPts)
{
   return ShapeIterator->IterateBezierTo(bezierCount, bezierPts);
}


/***********************************************************************
 *  Method: BShapeIterator::IterateClose
 *  Params: 
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BShapeIterator_IterateClose(BShapeIterator *ShapeIterator)
{
   return ShapeIterator->IterateClose();
}


/***********************************************************************
 *  Method: BShapeIterator::Iterate
 *  Params: BShape *shape
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BShapeIterator_Iterate(BShapeIterator *ShapeIterator, BShape *shape)
{
   return ShapeIterator->Iterate(shape);
}




/***********************************************************************
 *  Method: BShape::BShape
 *  Params: 
 * Effects: 
 ***********************************************************************/
TCPlusObject BShape_Create(TPasObject PasObject)
{
	return new BPShape(PasObject);
}


/***********************************************************************
 *  Method: BShape::BShape
 *  Params: const BShape &copyFrom
 * Effects: 
 ***********************************************************************/
TCPlusObject BShape_Create_1
(TPasObject PasObject, const BShape &copyFrom)
{
	return new BPShape(PasObject, copyFrom);
}


/***********************************************************************
 *  Method: BShape::BShape
 *  Params: BMessage *data
 * Effects: 
 ***********************************************************************/
TCPlusObject BShape_Create_2
(TPasObject PasObject, BMessage *data)
{
	return new BPShape(PasObject, data);
}


/***********************************************************************
 *  Method: BShape::~BShape
 *  Params: 
 * Effects: 
 ***********************************************************************/
void BShape_Free(BShape *Shape)
{
   delete Shape;
}


/***********************************************************************
 *  Method: BShape::Archive
 *  Params: BMessage *into, bool deep
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BShape_Archive(BShape *Shape, BMessage *into, bool deep) 
{
   return Shape->Archive(into, deep);
}


/***********************************************************************
 *  Method: BShape::Instantiate
 *  Params: BMessage *data
 * Returns: BArchivable *
 * Effects: 
 ***********************************************************************/
BArchivable *
BShape_Instantiate(BShape *Shape, BMessage *data)
{
   return Shape->Instantiate(data);
}


/***********************************************************************
 *  Method: BShape::Clear
 *  Params: 
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BShape_Clear(BShape *Shape)
{
   Shape->Clear();
}


/***********************************************************************
 *  Method: BShape::Bounds
 *  Params: 
 * Returns: BRect
 * Effects: 
 ***********************************************************************/
BRect
BShape_Bounds(BShape *Shape) 
{
   return Shape->Bounds();
}


/***********************************************************************
 *  Method: BShape::AddShape
 *  Params: const BShape *other
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BShape_AddShape(BShape *Shape, const BShape *other)
{
   return Shape->AddShape(other);
}


/***********************************************************************
 *  Method: BShape::MoveTo
 *  Params: BPoint point
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BShape_MoveTo(BShape *Shape, BPoint point)
{
   return Shape->MoveTo(point);
}


/***********************************************************************
 *  Method: BShape::LineTo
 *  Params: BPoint linePoint
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BShape_LineTo(BShape *Shape, BPoint linePoint)
{
   return Shape->LineTo(linePoint);
}


/***********************************************************************
 *  Method: BShape::BezierTo
 *  Params: BPoint controlPoints[3]
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BShape_BezierTo(BShape *Shape, BPoint controlPoints[3])
{
   return Shape->BezierTo(controlPoints);
}


/***********************************************************************
 *  Method: BShape::Close
 *  Params: 
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BShape_Close(BShape *Shape)
{
   return Shape->Close();
}




#if defined(__cplusplus)
}
#endif


#endif /* _SHAPE_CPP_ */
