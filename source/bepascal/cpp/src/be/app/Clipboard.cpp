#ifndef _CLIPBOARD_CPP_
#define _CLIPBOARD_CPP_

/***********************************************************************
 * AUTHOR: nobody <baron>
 *   FILE: Clipboard.cpp
 *   DATE: Fri Sep 27 23:26:07 2002
 *  DESCR: 
 ***********************************************************************/
#include "Clipboard.h"

#include <beobj.h>

#if defined(__cplusplus)
extern "C" {
#endif


const TCPlusObject Get_be_clipboard(void)
{
		// Pas très propre ! Si quelqu'un a mieux...
	return TCPlusObject(be_clipboard);
}
/*
 *  Method: BClipboard::BClipboard()
 *   Descr: 
 */
TCPlusObject BClipboard_Create(const char *name,
                       bool transient)
{
	return new BClipboard(name,
                       transient);
}


/*
 *  Method: BClipboard::~BClipboard()
 *   Descr: 
 */
void BClipboard_Free(BClipboard *Clipboard)
{
   delete Clipboard;
}


/*
 *  Method: BClipboard::Name()
 *   Descr: 
 */
const char *
BClipboard_Name(BClipboard *Clipboard) 
{
   return Clipboard->Name();
}


/*
 *  Method: BClipboard::LocalCount()
 *   Descr: 
 */
uint32
BClipboard_LocalCount(BClipboard *Clipboard) 
{
   return Clipboard->LocalCount();
}


/*
 *  Method: BClipboard::SystemCount()
 *   Descr: 
 */
uint32
BClipboard_SystemCount(BClipboard *Clipboard)
{
   return Clipboard->SystemCount();
}


/*
 *  Method: BClipboard::StartWatching()
 *   Descr: 
 */
status_t
BClipboard_StartWatching(BClipboard *Clipboard, BMessenger target)
{
   return Clipboard->StartWatching(target);
}


/*
 *  Method: BClipboard::StopWatching()
 *   Descr: 
 */
status_t
BClipboard_StopWatching(BClipboard *Clipboard, BMessenger target)
{
   return Clipboard->StopWatching(target);
}


/*
 *  Method: BClipboard::Lock()
 *   Descr: 
 */
bool
BClipboard_Lock(BClipboard *Clipboard)
{
   return Clipboard->Lock();
}


/*
 *  Method: BClipboard::Unlock()
 *   Descr: 
 */
void
BClipboard_Unlock(BClipboard *Clipboard)
{
   Clipboard->Unlock();
}


/*
 *  Method: BClipboard::IsLocked()
 *   Descr: 
 */
bool
BClipboard_IsLocked(BClipboard *Clipboard)
{
   return Clipboard->IsLocked();
}


/*
 *  Method: BClipboard::Clear()
 *   Descr: 
 */
status_t
BClipboard_Clear(BClipboard *Clipboard)
{
   return Clipboard->Clear();
}


/*
 *  Method: BClipboard::Commit()
 *   Descr: 
 */
status_t
BClipboard_Commit(BClipboard *Clipboard)
{
   return Clipboard->Commit();
}


/*
 *  Method: BClipboard::Revert()
 *   Descr: 
 */
status_t
BClipboard_Revert(BClipboard *Clipboard)
{
   return Clipboard->Revert();
}


/*
 *  Method: BClipboard::DataSource()
 *   Descr: 
 */
BMessenger
BClipboard_DataSource(BClipboard *Clipboard)
{
   return Clipboard->DataSource();
}


/*
 *  Method: BClipboard::Data()
 *   Descr: 
 */
BMessage *
BClipboard_Data(BClipboard *Clipboard) 
{
   return Clipboard->Data();
}


/*
 *  Method: BClipboard::BClipboard()
 *   Descr: 
 */
/*TCPlusObject BClipboard_Create(TPasObject PasObject, const BClipboard &)
{
	return new BPClipboard(PasObject, );
}*/


/*
 *  Method: BClipboard::operator=()
 *   Descr: 
 */
/*BClipboard &
BClipboard_operator=(BClipboard *Clipboard, const BClipboard &)
{
   return Clipboard->operator=();
}*/


/*
 *  Method: BClipboard::_ReservedClipboard1()
 *   Descr: 
 */
/*void
BClipboard__ReservedClipboard1(BClipboard *Clipboard)
{
   Clipboard->_ReservedClipboard1();
}*/


/*
 *  Method: BClipboard::_ReservedClipboard2()
 *   Descr: 
 */
/*void
BClipboard__ReservedClipboard2(BClipboard *Clipboard)
{
   Clipboard->_ReservedClipboard2();
}*/


/*
 *  Method: BClipboard::_ReservedClipboard3()
 *   Descr: 
 */
/*void
BClipboard__ReservedClipboard3(BClipboard *Clipboard)
{
   Clipboard->_ReservedClipboard3();
}*/


/*
 *  Method: BClipboard::AssertLocked()
 *   Descr: 
 */
/*bool
BClipboard_AssertLocked(BClipboard *Clipboard) 
{
   return Clipboard->AssertLocked();
}*/


/*
 *  Method: BClipboard::DownloadFromSystem()
 *   Descr: 
 */
/*status_t
BClipboard_DownloadFromSystem(BClipboard *Clipboard, bool force)
{
   return Clipboard->DownloadFromSystem(force);
}*/


/*
 *  Method: BClipboard::UploadToSystem()
 *   Descr: 
 */
/*status_t
BClipboard_UploadToSystem(BClipboard *Clipboard)
{
   return Clipboard->UploadToSystem();
}*/

#if defined(__cplusplus)
}
#endif

#endif /* _CLIPBOARD_CPP_ */
