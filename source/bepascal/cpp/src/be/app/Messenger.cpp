#ifndef _MESSENGER_CPP_
#define _MESSENGER_CPP_

/***********************************************************************
 * AUTHOR: nobody <baron>
 *   FILE: Messenger.cpp
 *   DATE: Sat Nov 30 02:32:17 2002
 *  DESCR: 
 ***********************************************************************/

#include "Messenger.h"
#include "Application.h"
#include <beobj.h>

#if defined(__cplusplus)
extern "C" {
#endif

/***********************************************************************
 *  Method: BMessenger::BMessenger
 *  Params: 
 * Effects: 
 ***********************************************************************/
TCPlusObject BMessenger_Create(TPasObject PasObject)
{
	return new BMessenger();
}


/***********************************************************************
 *  Method: BMessenger::BMessenger
 *  Params: const char *mime_sig, team_id team, status_t *perr
 * Effects: 
 ***********************************************************************/
TCPlusObject BMessenger_Create_1
(TPasObject PasObject, const char *mime_sig, team_id team, status_t *perr)
{
	return new BMessenger(mime_sig, team, perr);
}


/***********************************************************************
 *  Method: BMessenger::BMessenger
 *  Params: const BHandler *handler, const BLooper *looper, status_t *perr
 * Effects: 
 ***********************************************************************/
TCPlusObject BMessenger_Create_2
(TPasObject PasObject, const BHandler *handler, const BLooper *looper, status_t *perr)
{
	return new BMessenger(handler, looper, perr);
}


/***********************************************************************
 *  Method: BMessenger::BMessenger
 *  Params: const BMessenger &from
 * Effects: 
 ***********************************************************************/
TCPlusObject BMessenger_Create_3
(TPasObject PasObject, const BMessenger &from)
{
	return new BMessenger(from);
}


/***********************************************************************
 *  Method: BMessenger::~BMessenger
 *  Params: 
 * Effects: 
 ***********************************************************************/
void BMessenger_Free(BMessenger *Messenger)
{
   delete Messenger;
}


/***********************************************************************
 *  Method: BMessenger::IsTargetLocal
 *  Params: 
 * Returns: bool
 * Effects: 
 ***********************************************************************/
bool
BMessenger_IsTargetLocal(BMessenger *Messenger)
{
   return Messenger->IsTargetLocal();
}


/***********************************************************************
 *  Method: BMessenger::Target
 *  Params: BLooper **looper
 * Returns: BHandler *
 * Effects: 
 ***********************************************************************/
BHandler *
BMessenger_Target(BMessenger *Messenger, BLooper **looper)
{
   return Messenger->Target(looper);
}


/***********************************************************************
 *  Method: BMessenger::LockTarget
 *  Params: 
 * Returns: bool
 * Effects: 
 ***********************************************************************/
bool
BMessenger_LockTarget(BMessenger *Messenger)
{
   return Messenger->LockTarget();
}


/***********************************************************************
 *  Method: BMessenger::LockTargetWithTimeout
 *  Params: bigtime_t timeout
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BMessenger_LockTargetWithTimeout_1
(BMessenger *Messenger, bigtime_t timeout)
{
   return Messenger->LockTargetWithTimeout(timeout);
}


/***********************************************************************
 *  Method: BMessenger::SendMessage
 *  Params: uint32 command, BHandler *reply_to
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BMessenger_SendMessage(BMessenger *Messenger, uint32 command, BHandler *reply_to)
{
   return Messenger->SendMessage(command, reply_to);
}


/***********************************************************************
 *  Method: BMessenger::SendMessage
 *  Params: BMessage *a_message, BHandler *reply_to, bigtime_t timeout
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BMessenger_SendMessage_1
(BMessenger *Messenger, BMessage *a_message, BHandler *reply_to, bigtime_t timeout)
{
   return Messenger->SendMessage(a_message, reply_to, timeout);
}


/***********************************************************************
 *  Method: BMessenger::SendMessage
 *  Params: BMessage *a_message, BMessenger reply_to, bigtime_t timeout
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BMessenger_SendMessage_2
(BMessenger *Messenger, BMessage *a_message, BMessenger reply_to, bigtime_t timeout)
{
   return Messenger->SendMessage(a_message, reply_to, timeout);
}


/***********************************************************************
 *  Method: BMessenger::SendMessage
 *  Params: uint32 command, BMessage *reply
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BMessenger_SendMessage_3
(BMessenger *Messenger, uint32 command, BMessage *reply)
{
   return Messenger->SendMessage(command, reply);
}


/***********************************************************************
 *  Method: BMessenger::SendMessage
 *  Params: BMessage *a_message, BMessage *reply, bigtime_t send_timeout, bigtime_t reply_timeout
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BMessenger_SendMessage_4
(BMessenger *Messenger, BMessage *a_message, BMessage *reply, bigtime_t send_timeout, bigtime_t reply_timeout)
{
   return Messenger->SendMessage(a_message, reply, send_timeout, reply_timeout);
}


///***********************************************************************
// *  Method: BMessenger::operator=
// *  Params: const BMessenger &from
// * Returns: BMessenger &
// * Effects: 
// ***********************************************************************/
//BMessenger &
//BMessenger_operator=(BMessenger *Messenger, const BMessenger &from)
//{
//   return Messenger->operator=(from);
//}
//
//
///***********************************************************************
// *  Method: BMessenger::operator==
// *  Params: const BMessenger &other
// * Returns: bool
// * Effects: 
// ***********************************************************************/
//bool
//BMessenger_operator==_1
//(BMessenger *Messenger, const BMessenger &other) const
//{
//   return Messenger->operator==(other);
//}


/***********************************************************************
 *  Method: BMessenger::IsValid
 *  Params: 
 * Returns: bool
 * Effects: 
 ***********************************************************************/
bool
BMessenger_IsValid(BMessenger *Messenger)
{
   return Messenger->IsValid();
}


/***********************************************************************
 *  Method: BMessenger::Team
 *  Params: 
 * Returns: team_id
 * Effects: 
 ***********************************************************************/
team_id
BMessenger_Team(BMessenger *Messenger)
{
   return Messenger->Team();
}


///***********************************************************************
// *  Method: BMessenger::BMessenger
// *  Params: team_id team, port_id port, int32 token, bool preferred
// * Effects: 
// ***********************************************************************/
//TCPlusObject BMessenger_Create_4(TPasObject PasObject, team_id team, port_id port, int32 token, bool preferred)
//{
//	return new BMessenger(team, port, token, preferred);
//}


///***********************************************************************
// *  Method: BMessenger::InitData
// *  Params: const char *mime_sig, team_id team, status_t *perr
// * Returns: void
// * Effects: 
// ***********************************************************************/
//void
//BMessenger_InitData(BMessenger *Messenger, const char *mime_sig, team_id team, status_t *perr)
//{
//   Messenger->InitData(mime_sig, team, perr);
//}
#if defined(__cplusplus)
}
#endif

#endif /* _MESSENGER_CPP_ */
