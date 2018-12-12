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

#ifndef _MESSAGE_CPP_
#define _MESSAGE_CPP_

#include <Application.h>
#include <Message.h>

#include <SupportDefs.h>

#include <message.h>
#include <beobj.h>

#if defined(__cplusplus)
extern "C" {
#endif
// No hook in BMessage
#if defined(__cplusplus)
}
#endif

BPMessage::BPMessage(TPasObject PasObject)
	: BMessage(), BPasObject(PasObject)
{

}

BPMessage::BPMessage(TPasObject PasObject, uint32 what)
	: BMessage(what), BPasObject(PasObject)
{

}

 BPMessage::BPMessage(TPasObject PasObject, TCPlusObject message)
	: BMessage(reinterpret_cast<BMessage&>(message)), BPasObject(PasObject)
{
// Attention, problème potentiel avec le reinterpret_cast de la référence
// A tester !
// Je ne suis pas sur de la correspondance entre le C++ et le pascal
}


#if defined(__cplusplus)
extern "C" {
#endif

TCPlusObject BMessage_Create_1(TPasObject PasObject)
{
	return new BPMessage(PasObject);
}

TCPlusObject BMessage_Create_2(TPasObject PasObject, uint32 what)
{
	return new BPMessage(PasObject, what);
}

 TCPlusObject BMessage_Create_3(TPasObject PasObject, TCPlusObject message)
{
	return new BPMessage(PasObject, message);
}

void BMessage_Free(TCPlusObject message)
{
	delete reinterpret_cast<BPMessage*>(message);
}

uint32 BMessage_Getwhat(TCPlusObject message)
{
	return reinterpret_cast<BMessage*>(message)->what;
}

void BMessage_Setwhat(TCPlusObject message, uint32 what)
{
	reinterpret_cast<BMessage*>(message)->what = what;
}

status_t BMessage_AddData(TCPlusObject message, const char *name,
	type_code type,
	const void *data,
	ssize_t fixedSize = true,
	int32 numItems = 1)
{
	return reinterpret_cast<BMessage*>(message)->AddData(name, type, data, 
		fixedSize, numItems);
}

status_t BMessage_AddBool(TCPlusObject message, const char *name, bool aBool)
{
	return reinterpret_cast<BMessage*>(message)->AddBool(name, aBool);
}

status_t BMessage_AddInt8(TCPlusObject message, const char *name, int8 anInt8)
{
	return reinterpret_cast<BMessage*>(message)->AddInt8(name, anInt8);
}

status_t BMessage_FindInt8(TCPlusObject message,const char *name, int8 *value) 
{
	return reinterpret_cast<BMessage*>(message)->FindInt8(name, value);
}


status_t BMessage_AddInt16(TCPlusObject message, const char *name, int16 anInt16)
{
	return reinterpret_cast<BMessage*>(message)->AddInt16(name, anInt16);
}

status_t BMessage_AddInt32(TCPlusObject message, const char *name, int32 anInt32)
{
	return reinterpret_cast<BMessage*>(message)->AddInt32(name, anInt32);
}

status_t BMessage_AddInt64(TCPlusObject message, const char *name, int64 anInt64)
{
	return reinterpret_cast<BMessage*>(message)->AddInt64(name, anInt64);
}

status_t BMessage_AddFloat(TCPlusObject message, const char *name, float aFloat)
{
	return reinterpret_cast<BMessage*>(message)->AddFloat(name, aFloat);
}

status_t BMessage_AddDouble(TCPlusObject message, const char *name, double aDouble)
{
	return reinterpret_cast<BMessage*>(message)->AddDouble(name, aDouble);
}

status_t BMessage_AddString(TCPlusObject message, const char *name, const char *string)
{
	return reinterpret_cast<BMessage*>(message)->AddString(name, string);
}

status_t BMessage_FindString(TCPlusObject message,const char *name, const char **str) 
{
	return reinterpret_cast<BMessage*>(message)->FindString(name, str);
}


status_t BMessage_FindRef(TCPlusObject message,const char *name, entry_ref *ref) 
{
	return reinterpret_cast<BMessage*>(message)->FindRef(name, ref);
}

status_t BMessage_FindRef_1(TCPlusObject message,const char *name, int32 index, entry_ref *ref)
{
	return reinterpret_cast<BMessage*>(message)->FindRef(name,index, ref);
}


status_t BMessage_AddMessage(TCPlusObject message, const char *name, const TCPlusObject amessage)
{
	return reinterpret_cast<BMessage*>(message)->AddMessage(name, reinterpret_cast<BMessage*>(amessage));
}

int32 BMessage_CountNames(TCPlusObject message, type_code type)
{
	return reinterpret_cast<BMessage*>(message)->CountNames(type);
}

bool BMessage_HasSpecifiers(TCPlusObject message)
{
	return reinterpret_cast<BMessage*>(message)->HasSpecifiers();
}

bool BMessage_IsSystem(TCPlusObject message)
{
	return reinterpret_cast<BMessage*>(message)->IsSystem();
}

status_t BMessage_MakeEmpty(TCPlusObject message)
{
	return reinterpret_cast<BMessage*>(message)->MakeEmpty();
}

bool BMessage_IsEmpty(TCPlusObject message)
{
	return reinterpret_cast<BMessage*>(message)->IsEmpty();
}

status_t BMessage_RemoveName(TCPlusObject message, const char *name)
{
	return reinterpret_cast<BMessage*>(message)->RemoveName(name);
}

void BMessage_PrintToStream(TCPlusObject message)
{
	reinterpret_cast<BMessage*>(message)->PrintToStream();
}

status_t BMessage_RemoveData(TCPlusObject message, const char *name, int32 index = 0)
{
	return reinterpret_cast<BMessage*>(message)->RemoveData(name, index);
}

bool BMessage_WasDelivered(TCPlusObject message)
{
	return reinterpret_cast<BMessage*>(message)->WasDelivered();
}

bool BMessage_IsSourceRemote(TCPlusObject message)
{
	return reinterpret_cast<BMessage*>(message)->IsSourceRemote();
}

bool BMessage_IsSourceWaiting(TCPlusObject message)
{
	return reinterpret_cast<BMessage*>(message)->IsSourceWaiting();
}

bool BMessage_IsReply(TCPlusObject message)
{
	return reinterpret_cast<BMessage*>(message)->IsReply();
}

const BMessage *BMessage_Previous(TCPlusObject message)
{
	return reinterpret_cast<BMessage*>(message)->Previous();
}

bool BMessage_WasDropped(TCPlusObject message)
{
	return reinterpret_cast<BMessage*>(message)->WasDropped();
}

status_t BMessage_Unflatten(TCPlusObject message,BDataIO *stream)
{
	return reinterpret_cast<BMessage*>(message)->Unflatten(stream);
}

/***********************************************************************
 *  Method: BMessage::operator=
 *  Params: const BMessage &msg
 * Returns: BMessage &
 * Effects: 
 ***********************************************************************/
BMessage &
BMessage_operator_equal(BMessage *Message, const BMessage &msg)
{
   return Message->operator=(msg);
}

#if defined(__cplusplus)
}
#endif


#endif /* _MESSAGE_CPP_ */
