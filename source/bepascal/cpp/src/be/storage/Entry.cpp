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

#ifndef _ENTRY_CPP_
#define _ENTRY_CPP_

/***********************************************************************
 * AUTHOR:  <baron>
 *   FILE: Entry.cpp
 *   DATE: Wed Jul  2 22:28:34 2003
 *  DESCR: 
 ***********************************************************************/
#include "Entry.h"
#include <beobj.h>



class BPEntry : public BEntry, public virtual BPasObject {
public:
						BPEntry(TPasObject PasObject);

						/* BEntry(dir, NULL) gets the entry for dir. */
//						BEntry(const BDirectory *dir, const char *path, bool traverse = false);

						BPEntry(TPasObject PasObject,const entry_ref *ref, bool traverse = false);
						BPEntry(TPasObject PasObject,const char *path, bool traverse = false);
						BPEntry(TPasObject PasObject,const BEntry &entry);

	virtual				~BPEntry();
};
	
BPEntry::BPEntry(TPasObject PasObject)
		:BEntry(),
		BPasObject(PasObject)
{
}			

BPEntry::BPEntry(TPasObject PasObject,const entry_ref *ref, bool traverse)
		:BEntry(ref,  traverse),
		BPasObject(PasObject)
{
}			

BPEntry::BPEntry(TPasObject PasObject,const char *path, bool traverse)
		:BEntry(path, traverse),
		BPasObject(PasObject)
{
}			

BPEntry::BPEntry(TPasObject PasObject,const BEntry &entry)
		:BEntry(entry),
		BPasObject(PasObject)
{
}			

BPEntry::~BPEntry()
{
}

#if defined(__cplusplus)
extern "C" {
#endif




/***********************************************************************
 *  Method: BEntry::BEntry
 *  Params: 
 * Effects: 
 ***********************************************************************/
TCPlusObject BEntry_Create(TPasObject PasObject)
{
	return new BPEntry(PasObject);
}


/***********************************************************************
 *  Method: BEntry::BEntry
 *  Params: const BDirectory *dir, const char *path, bool traverse
 * Effects: 
 ***********************************************************************/
/* BDirectoty not yet implemented
TCPlusObject BEntry_Create_1
(TPasObject PasObject, const BDirectory *dir, const char *path, bool traverse)
{
	return new BPEntry(PasObject, dir, path, traverse);
}
*/

/***********************************************************************
 *  Method: BEntry::BEntry
 *  Params: const entry_ref *ref, bool traverse
 * Effects: 
 ***********************************************************************/
TCPlusObject BEntry_Create_2
(TPasObject PasObject, const entry_ref *ref, bool traverse)
{
	return new BPEntry(PasObject, ref, traverse);
}


/***********************************************************************
 *  Method: BEntry::BEntry
 *  Params: const char *path, bool traverse
 * Effects: 
 ***********************************************************************/
TCPlusObject BEntry_Create_3
(TPasObject PasObject, const char *path, bool traverse)
{
	return new BPEntry(PasObject, path, traverse);
}


/***********************************************************************
 *  Method: BEntry::BEntry
 *  Params: const BEntry &entry
 * Effects: 
 ***********************************************************************/
TCPlusObject BEntry_Create_4
(TPasObject PasObject, const BEntry &entry)
{
	return new BPEntry(PasObject, entry);
}


/***********************************************************************
 *  Method: BEntry::~BEntry
 *  Params: 
 * Effects: 
 ***********************************************************************/
void BEntry_Free(BEntry *Entry)
{
   delete Entry;
}


/***********************************************************************
 *  Method: BEntry::InitCheck
 *  Params: 
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BEntry_InitCheck(BEntry *Entry) 
{
   return Entry->InitCheck();
}


/***********************************************************************
 *  Method: BEntry::Exists
 *  Params: 
 * Returns: bool
 * Effects: 
 ***********************************************************************/
bool
BEntry_Exists(BEntry *Entry) 
{
   return Entry->Exists();
}


/***********************************************************************
 *  Method: BEntry::GetStat
 *  Params: struct stat *st
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BEntry_GetStat(BEntry *Entry, struct stat *st) 
{
   return Entry->GetStat(st);
}


/***********************************************************************
 *  Method: BEntry::SetTo
 *  Params: const BDirectory *dir, const char *path, bool traverse
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BEntry_SetTo(BEntry *Entry, const BDirectory *dir, const char *path, bool traverse)
{
   return Entry->SetTo(dir, path, traverse);
}


/***********************************************************************
 *  Method: BEntry::SetTo
 *  Params: const entry_ref *ref, bool traverse
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BEntry_SetTo_1
(BEntry *Entry, const entry_ref *ref, bool traverse)
{
   return Entry->SetTo(ref, traverse);
}


/***********************************************************************
 *  Method: BEntry::SetTo
 *  Params: const char *path, bool traverse
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BEntry_SetTo_2
(BEntry *Entry, const char *path, bool traverse)
{
   return Entry->SetTo(path, traverse);
}


/***********************************************************************
 *  Method: BEntry::Unset
 *  Params: 
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BEntry_Unset(BEntry *Entry)
{
   Entry->Unset();
}


/***********************************************************************
 *  Method: BEntry::GetRef
 *  Params: entry_ref *ref
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BEntry_GetRef(BEntry *Entry, entry_ref *ref) 
{
   return Entry->GetRef(ref);
}


/***********************************************************************
 *  Method: BEntry::GetPath
 *  Params: BPath *path
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BEntry_GetPath(BEntry *Entry, BPath *path) 
{
   return Entry->GetPath(path);
}


/***********************************************************************
 *  Method: BEntry::GetParent
 *  Params: BEntry *entry
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BEntry_GetParent(BEntry *Entry, BEntry *entry) 
{
   return Entry->GetParent(entry);
}


/***********************************************************************
 *  Method: BEntry::GetParent
 *  Params: BDirectory *dir
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BEntry_GetParent_1
(BEntry *Entry, BDirectory *dir) 
{
   return Entry->GetParent(dir);
}


/***********************************************************************
 *  Method: BEntry::GetName
 *  Params: char *buffer
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BEntry_GetName(BEntry *Entry, char *buffer) 
{
   return Entry->GetName(buffer);
}


/***********************************************************************
 *  Method: BEntry::Rename
 *  Params: const char *path, bool clobber
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BEntry_Rename(BEntry *Entry, const char *path, bool clobber)
{
   return Entry->Rename(path, clobber);
}


/***********************************************************************
 *  Method: BEntry::MoveTo
 *  Params: BDirectory *dir, const char *path, bool clobber
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BEntry_MoveTo(BEntry *Entry, BDirectory *dir, const char *path, bool clobber)
{
   return Entry->MoveTo(dir, path, clobber);
}


/***********************************************************************
 *  Method: BEntry::Remove
 *  Params: 
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BEntry_Remove(BEntry *Entry)
{
   return Entry->Remove();
}


#if defined(__cplusplus)
}
#endif

#endif /* _ENTRY_CPP_ */



