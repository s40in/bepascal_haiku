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

#ifndef _POLYGON_CPP_
#define _POLYGON_CPP_
/***********************************************************************
 * AUTHOR: nobody <baron>
 *   FILE: StringView.cpp
 *   DATE: Mon Jan 13 21:52:29 2003
 *  DESCR: 
 ***********************************************************************/
#include <beobj.h>
#include "Polygon.h"

class BPPolygon : public BPolygon, virtual public BPasObject
{
	public:
	    BPPolygon(TPasObject PasObject,const BPoint *ptArray, int32 numPoints);
		BPPolygon(TPasObject PasObject);
		BPPolygon(TPasObject PasObject, const BPolygon *poly);

	private:
};

BPPolygon::BPPolygon(TPasObject PasObject,const BPoint *ptArray, int32 numPoints)
					:BPolygon(ptArray,numPoints),
					BPasObject(PasObject)
					
{
}
BPPolygon::BPPolygon(TPasObject PasObject)
					:BPolygon(),
					BPasObject(PasObject)
					
{
}
BPPolygon::BPPolygon(TPasObject PasObject, const BPolygon *poly)
					:BPolygon(poly),
					BPasObject(PasObject)
					
{
}


#if defined(__cplusplus)
extern "C" {
#endif

/***********************************************************************
 * AUTHOR: nobody <baron>
 *   FILE: Polygon.cpp
 *   DATE: Sun Sep 28 12:57:19 2003
 *  DESCR: 
 ***********************************************************************/


/***********************************************************************
 *  Method: BPolygon::BPolygon
 *  Params: const BPoint *ptArray, int32 numPoints
 * Effects: 
 ***********************************************************************/
TCPlusObject BPolygon_Create(TPasObject PasObject, const BPoint *ptArray, int32 numPoints)
{
	return new BPPolygon(PasObject, ptArray, numPoints);
}


/***********************************************************************
 *  Method: BPolygon::BPolygon
 *  Params: 
 * Effects: 
 ***********************************************************************/
TCPlusObject BPolygon_Create_1
(TPasObject PasObject)
{
	return new BPPolygon(PasObject);
}


/***********************************************************************
 *  Method: BPolygon::BPolygon
 *  Params: const BPolygon *poly
 * Effects: 
 ***********************************************************************/
TCPlusObject BPolygon_Create_2
(TPasObject PasObject, const BPolygon *poly)
{
	return new BPPolygon(PasObject, poly);
}


/***********************************************************************
 *  Method: BPolygon::~BPolygon
 *  Params: 
 * Effects: 
 ***********************************************************************/
void BPolygon_Free(BPolygon *Polygon)
{
   delete  Polygon;
}




/***********************************************************************
 *  Method: BPolygon::Frame
 *  Params: 
 * Returns: BRect
 * Effects: 
 ***********************************************************************/
BRect
BPolygon_Frame(BPolygon *Polygon) 
{
   return Polygon->Frame();
}


/***********************************************************************
 *  Method: BPolygon::AddPoints
 *  Params: const BPoint *ptArray, int32 numPoints
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BPolygon_AddPoints(BPolygon *Polygon, const BPoint *ptArray, int32 numPoints)
{
   Polygon->AddPoints(ptArray, numPoints);
}


/***********************************************************************
 *  Method: BPolygon::CountPoints
 *  Params: 
 * Returns: int32
 * Effects: 
 ***********************************************************************/
int32
BPolygon_CountPoints(BPolygon *Polygon) 
{
   return Polygon->CountPoints();
}


/***********************************************************************
 *  Method: BPolygon::MapTo
 *  Params: BRect srcRect, BRect dstRect
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BPolygon_MapTo(BPolygon *Polygon, BRect srcRect, BRect dstRect)
{
   Polygon->MapTo(srcRect, dstRect);
}


/***********************************************************************
 *  Method: BPolygon::PrintToStream
 *  Params: 
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BPolygon_PrintToStream(BPolygon *Polygon) 
{
   Polygon->PrintToStream();
}




#if defined(__cplusplus)
}
#endif

#endif /* _POLYGON_CPP_ */


