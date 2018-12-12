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

#ifndef _LOOPER_CPP_
#define _LOOPER_CPP_

#include <Looper.h>
#include <Message.h>

#include <OS.h>

#include <beobj.h>

#include <looper.h>
#include <handler.h>

// definition of callback function in BLooper

typedef void (*BLooper_DispatchMessage_hook) (TPasObject PasObject, 
											  TCPlusObject message, 
											  TCPlusObject target);
typedef bool(*BLooper_QuitRequested_hook) (TPasObject PasObject);

#if defined(__cplusplus)
extern "C" {
#endif

BLooper_DispatchMessage_hook Looper_DispatchMessage_hook;
BLooper_QuitRequested_hook Looper_QuitRequested_hook;

#if defined(__cplusplus)
}
#endif

BPLooper::BPLooper(TPasObject PasObject, const char *name,
                   int32 priority,
                   int32 portCapacity)
                   : BLooper(name, priority, portCapacity),
                   BPHandler(PasObject, name)
//                BPasObject(PasObject)
{
}

BPLooper::~BPLooper()
{
}

void BPLooper::DispatchMessage(BMessage *message, BHandler *target)
{
	DispatchMessage_hookCall(message, target);
	BLooper::DispatchMessage(message, target);
}

void BPLooper::DispatchMessage_hookCall(BMessage *message, BHandler *target)
{
	Looper_DispatchMessage_hook(GetPasObject(), message, target);
}

bool BPLooper::QuitRequested(void)
{
	QuitRequested_hookCall();
	return Looper_QuitRequested_hook(GetPasObject());
}

bool BPLooper::QuitRequested_hookCall(void)
{
	return Looper_QuitRequested_hook(GetPasObject());
}

void BPLooper::MessageReceived(BMessage *message)
{
	MessageReceived_hookCall(message);
	BLooper::MessageReceived(message);
}

#if defined(__cplusplus)
extern "C" {
#endif

TCPlusObject BLooper_Create(TPasObject PasObject, const char *name,
                            int32 priority,
                            int32 portCapacity)
{
	return new BPLooper(PasObject, name, priority, portCapacity);
}

status_t BLooper_GetSupportedSuites(TCPlusObject Looper, BMessage *message)
{
	return reinterpret_cast<BLooper*>(Looper)->GetSupportedSuites(message);
}

bool BLooper_LockLooper(TCPlusObject Looper)
{
	return reinterpret_cast<BLooper*>(Looper)->LockLooper();
}

status_t BLooper_LockLooperWithTimeout(TCPlusObject Looper, bigtime_t timeout)
{
	return reinterpret_cast<BLooper*>(Looper)->LockLooperWithTimeout(timeout);
}

void BLooper_UnlockLooper(TCPlusObject Looper)
{
	reinterpret_cast<BLooper*>(Looper)->UnlockLooper();
}

status_t BLooper_PostMessage_2(TCPlusObject Looper, uint32 command)
{
	return reinterpret_cast<BLooper*>(Looper)->PostMessage(command);
}

#if defined(__cplusplus)
}
#endif

#endif /* _LOOPER_CPP_ */
