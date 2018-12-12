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

#ifndef _PICTURE_CPP_
#define _PICTURE_CPP_
/***********************************************************************
 * AUTHOR: nobody <baron>
 *   FILE: StringView.cpp
 *   DATE: Mon Jan 13 21:52:29 2003
 *  DESCR: 
 ***********************************************************************/
#include <beobj.h>
#include "Picture.h"

class BPPicture : public BPicture, virtual public BPasObject
{
	public:
		BPPicture(TPasObject PasObject);
		//BPPicture(TPasObject PasObject,const BPPicture &original);
		BPPicture(TPasObject PasObject,BMessage *data);

	private:
};

BPPicture::BPPicture(TPasObject PasObject)
					:BPicture(),
					BPasObject(PasObject)
					
{
}
/*BPPicture::BPPicture(TPasObject PasObject,const BPPicture &original)
					:BPicture(original),
					BPasObject(PasObject)
					
{
}
*/

BPPicture::BPPicture(TPasObject PasObject,BMessage *data)
					:BPicture(data),
					BPasObject(PasObject)
					
{
}


#if defined(__cplusplus)
extern "C" {
#endif

/***********************************************************************
 *  Method: BPicture::BPicture
 *  Params: 
 * Effects: 
 ***********************************************************************/
TCPlusObject BPicture_Create(TPasObject PasObject)
{
	return new BPPicture(PasObject);
}


/***********************************************************************
 *  Method: BPicture::BPicture
 *  Params: const BPicture &original
 * Effects: 
 ***********************************************************************/
/*TCPlusObject BPicture_Create_1
(TPasObject PasObject, const BPicture &original)
{
	return new BPPicture(PasObject, original);
}
*/

/***********************************************************************
 *  Method: BPicture::BPicture
 *  Params: BMessage *data
 * Effects: 
 ***********************************************************************/
TCPlusObject BPicture_Create_2
(TPasObject PasObject, BMessage *data)
{
	return new BPPicture(PasObject, data);
}


/***********************************************************************
 *  Method: BPicture::~BPicture
 *  Params: 
 * Effects: 
 ***********************************************************************/
void BPicture_Free(BPicture *Picture)
{
   delete Picture;
}


/***********************************************************************
 *  Method: BPicture::Instantiate
 *  Params: BMessage *data
 * Returns: BArchivable *
 * Effects: 
 ***********************************************************************/
BArchivable *
BPicture_Instantiate(BPicture *Picture, BMessage *data)
{
   return Picture->Instantiate(data);
}


/***********************************************************************
 *  Method: BPicture::Archive
 *  Params: BMessage *data, bool deep
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BPicture_Archive(BPicture *Picture, BMessage *data, bool deep) 
{
   return Picture->Archive(data, deep);
}


/***********************************************************************
 *  Method: BPicture::Perform
 *  Params: perform_code d, void *arg
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BPicture_Perform(BPicture *Picture, perform_code d, void *arg)
{
   return Picture->Perform(d, arg);
}


/***********************************************************************
 *  Method: BPicture::Play
 *  Params: void **callBackTable, int32 tableEntries, void *userData
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BPicture_Play(BPicture *Picture, void **callBackTable, int32 tableEntries, void *userData)
{
   return Picture->Play(callBackTable, tableEntries, userData);
}


/***********************************************************************
 *  Method: BPicture::Flatten
 *  Params: BDataIO *stream
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BPicture_Flatten(BPicture *Picture, BDataIO *stream)
{
   return Picture->Flatten(stream);
}


/***********************************************************************
 *  Method: BPicture::Unflatten
 *  Params: BDataIO *stream
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BPicture_Unflatten(BPicture *Picture, BDataIO *stream)
{
   return Picture->Unflatten(stream);
}



#if defined(__cplusplus)
}
#endif

#endif /* _PICTURE_CPP_ */

