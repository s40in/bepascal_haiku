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

#ifndef _HANDLER_CPP_
#define _HANDLER_CPP_

#include <Handler.h>

#include <handler.h>
#include <beobj.h>

#if defined(__cplusplus)
extern "C" {
#endif

BHandler_MessageReceived_hook Handler_MessageReceived_hook;

#if defined(__cplusplus)
}
#endif

BPHandler::BPHandler(TPasObject PasObject, const char *name)
	: BHandler(name), BPasObject(PasObject)
{

}

BPHandler::BPHandler(TPasObject PasObject, BMessage *archive)
			: BHandler(archive), BPasObject(PasObject)
{

}

BPHandler::~BPHandler()
{
}

void BPHandler::MessageReceived(BMessage *message)
{
	MessageReceived_hookCall(message);
	BHandler::MessageReceived(message); 
}

void BPHandler::MessageReceived_hookCall(BMessage *message)
{
	Handler_MessageReceived_hook(GetPasObject(), message);
}


#if defined(__cplusplus)
extern "C" {
#endif

TCPlusObject BHandler_Create(TPasObject PasObject, const char *name)
{
	return new BPHandler(PasObject, name);
}

#if defined(__cplusplus)
}
#endif

#endif /* _HANDLER_CPP_ */
