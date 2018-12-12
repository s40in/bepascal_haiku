#ifndef _INVOKER_CPP_
#define _INVOKER_CPP_
/***********************************************************************
 * AUTHOR: nobody <baron>
 *   FILE: Invoker.cpp
 *   DATE: Sat Nov 30 01:48:14 2002
 *  DESCR: 
 ***********************************************************************/
#include "Invoker.h"

#include <beobj.h>

#if defined(__cplusplus)
extern "C" {
#endif

/***********************************************************************
 *  Method: BInvoker::BInvoker
 *  Params: 
 * Effects: 
 ***********************************************************************/
TCPlusObject BInvoker_Create(TPasObject PasObject)
{
	return new BInvoker();
}


/***********************************************************************
 *  Method: BInvoker::BInvoker
 *  Params: BMessage *message, const BHandler *handler, const BLooper *looper
 * Effects: 
 ***********************************************************************/
TCPlusObject BInvoker_Create_1
(TPasObject PasObject, BMessage *message, const BHandler *handler, const BLooper *looper)
{
	return new BInvoker(message, handler, looper);
}


/***********************************************************************
 *  Method: BInvoker::BInvoker
 *  Params: BMessage *message, BMessenger target
 * Effects: 
 ***********************************************************************/
TCPlusObject BInvoker_Create_2
(TPasObject PasObject, BMessage *message, BMessenger target)
{
	return new BInvoker(message, target);
}


/***********************************************************************
 *  Method: BInvoker::~BInvoker
 *  Params: 
 * Effects: 
 ***********************************************************************/
void BInvoker_Free(BInvoker *Invoker)
{
   delete Invoker;
}


/***********************************************************************
 *  Method: BInvoker::SetMessage
 *  Params: BMessage *message
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BInvoker_SetMessage(BInvoker *Invoker, BMessage *message)
{
   return Invoker->SetMessage(message);
}


/***********************************************************************
 *  Method: BInvoker::Message
 *  Params: 
 * Returns: BMessage *
 * Effects: 
 ***********************************************************************/
BMessage *
BInvoker_Message(BInvoker *Invoker)
{
   return Invoker->Message();
}


/***********************************************************************
 *  Method: BInvoker::Command
 *  Params: 
 * Returns: uint32
 * Effects: 
 ***********************************************************************/
uint32
BInvoker_Command(BInvoker *Invoker)
{
   return Invoker->Command();
}


/***********************************************************************
 *  Method: BInvoker::SetTarget
 *  Params: const BHandler *h, const BLooper *loop
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BInvoker_SetTarget(BInvoker *Invoker, const BHandler *h, const BLooper *loop)
{
   return Invoker->SetTarget(h, loop);
}


/***********************************************************************
 *  Method: BInvoker::SetTarget
 *  Params: BMessenger messenger
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BInvoker_SetTarget_1
(BInvoker *Invoker, BMessenger messenger)
{
   return Invoker->SetTarget(messenger);
}


/***********************************************************************
 *  Method: BInvoker::IsTargetLocal
 *  Params: 
 * Returns: bool
 * Effects: 
 ***********************************************************************/
bool
BInvoker_IsTargetLocal(BInvoker *Invoker)
{
   return Invoker->IsTargetLocal();
}


/***********************************************************************
 *  Method: BInvoker::Target
 *  Params: BLooper **looper
 * Returns: BHandler *
 * Effects: 
 ***********************************************************************/
BHandler *
BInvoker_Target(BInvoker *Invoker, BLooper **looper)
{
   return Invoker->Target(looper);
}


/***********************************************************************
 *  Method: BInvoker::Messenger
 *  Params: 
 * Returns: BMessenger
 * Effects: 
 ***********************************************************************/
BMessenger
BInvoker_Messenger(BInvoker *Invoker)
{
   return Invoker->Messenger();
}


/***********************************************************************
 *  Method: BInvoker::SetHandlerForReply
 *  Params: BHandler *handler
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BInvoker_SetHandlerForReply(BInvoker *Invoker, BHandler *handler)
{
   return Invoker->SetHandlerForReply(handler);
}


/***********************************************************************
 *  Method: BInvoker::HandlerForReply
 *  Params: 
 * Returns: BHandler *
 * Effects: 
 ***********************************************************************/
BHandler *
BInvoker_HandlerForReply(BInvoker *Invoker)
{
   return Invoker->HandlerForReply();
}


/***********************************************************************
 *  Method: BInvoker::Invoke
 *  Params: BMessage *msg
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BInvoker_Invoke(BInvoker *Invoker, BMessage *msg)
{
   return Invoker->Invoke(msg);
}


/***********************************************************************
 *  Method: BInvoker::InvokeNotify
 *  Params: BMessage *msg, uint32 kind
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BInvoker_InvokeNotify_1
(BInvoker *Invoker, BMessage *msg, uint32 kind)
{
   return Invoker->InvokeNotify(msg, kind);
}


/***********************************************************************
 *  Method: BInvoker::SetTimeout
 *  Params: bigtime_t timeout
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BInvoker_SetTimeout(BInvoker *Invoker, bigtime_t timeout)
{
   return Invoker->SetTimeout(timeout);
}


/***********************************************************************
 *  Method: BInvoker::Timeout
 *  Params: 
 * Returns: bigtime_t
 * Effects: 
 ***********************************************************************/
bigtime_t
BInvoker_Timeout(BInvoker *Invoker)
{
   return Invoker->Timeout();
}

// protected
/***********************************************************************
 *  Method: BInvoker::InvokeKind
 *  Params: bool *notify
 * Returns: uint32
 * Effects: 
 ***********************************************************************/
/* uint32
BInvoker_InvokeKind(BInvoker *Invoker, bool *notify)
{
   return Invoker->InvokeKind(notify);
}
*/

/***********************************************************************
 *  Method: BInvoker::BeginInvokeNotify
 *  Params: uint32 kind
 * Returns: void
 * Effects: 
 ***********************************************************************/
/*void
BInvoker_BeginInvokeNotify(BInvoker *Invoker, uint32 kind)
{
   Invoker->BeginInvokeNotify(kind);
}
*/

/***********************************************************************
 *  Method: BInvoker::EndInvokeNotify
 *  Params: 
 * Returns: void
 * Effects: 
 ***********************************************************************/
/*void
BInvoker_EndInvokeNotify(BInvoker *Invoker)
{
   Invoker->EndInvokeNotify();
}
*/

///***********************************************************************
// *  Method: BInvoker::_ReservedInvoker1
// *  Params: 
// * Returns: void
// * Effects: 
// ***********************************************************************/
//void
//BInvoker__ReservedInvoker1(BInvoker *Invoker)
//{
//   Invoker->_ReservedInvoker1();
//}
//
//
///***********************************************************************
// *  Method: BInvoker::_ReservedInvoker2
// *  Params: 
// * Returns: void
// * Effects: 
// ***********************************************************************/
//void
//BInvoker__ReservedInvoker2(BInvoker *Invoker)
//{
//   Invoker->_ReservedInvoker2();
//}
//
//
///***********************************************************************
// *  Method: BInvoker::_ReservedInvoker3
// *  Params: 
// * Returns: void
// * Effects: 
// ***********************************************************************/
//void
//BInvoker__ReservedInvoker3(BInvoker *Invoker)
//{
//   Invoker->_ReservedInvoker3();
//}
//
//
///***********************************************************************
// *  Method: BInvoker::BInvoker
// *  Params: const BInvoker &
// * Effects: 
// ***********************************************************************/
//TCPlusObject BInvoker_Create(TPasObject PasObject, const BInvoker &)
//{
//	return new BPInvoker(PasObject, );
//}
//
//
///***********************************************************************
// *  Method: BInvoker::operator=
// *  Params: const BInvoker &
// * Returns: BInvoker &
// * Effects: 
// ***********************************************************************/
//BInvoker &
//BInvoker_operator=(BInvoker *Invoker, const BInvoker &)
//{
//   return Invoker->operator=();
//}

#if defined(__cplusplus)
}
#endif

#endif /* _INVOKER_CPP_ */
