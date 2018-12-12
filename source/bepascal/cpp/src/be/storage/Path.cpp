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

#ifndef _PATH_CPP_
#define _PATH_CPP_

/***********************************************************************
 * AUTHOR:  <baron>
 *   FILE: Entry.cpp
 *   DATE: Wed Jul  2 22:28:34 2003
 *  DESCR: 
 ***********************************************************************/
#include <beobj.h>
#include <storage/Path.h>
#include <Directory.h>

class BPPath:public BPath , public virtual BPasObject {
public:
						BPPath(TPasObject PasObject);
						BPPath(TPasObject PasObject,const char *dir, const char *leaf = NULL,bool normalize = false);
//						BPPath(const BDirectory *dir, const char *leaf,	bool normalize = false);
						BPPath(TPasObject PasObject,const BPath &path);
						BPPath(TPasObject PasObject,const BEntry *entry);
						BPPath(TPasObject PasObject,const entry_ref *ref);

virtual					~BPPath();
};

BPPath::BPPath(TPasObject PasObject)
		:BPath(),
		BPasObject(PasObject)
{
}		

BPPath::BPPath(TPasObject PasObject,const char *dir, const char *leaf,
							bool normalize)
		:BPath(dir, leaf ,normalize),
		BPasObject(PasObject)
{
}	

BPPath::BPPath(TPasObject PasObject, const BPath &path)
		:BPath(path),
		BPasObject(PasObject)
{
}		

BPPath::BPPath(TPasObject PasObject,const BEntry *entry)
		:BPath(entry),
		BPasObject(PasObject)
{
}	

BPPath::BPPath(TPasObject PasObject,const entry_ref *ref)
		:BPath(ref),
		BPasObject(PasObject)
{
}	


BPPath::~BPPath()
{
}

#if defined(__cplusplus)
extern "C" {
#endif


/***********************************************************************
 *  Method: BPath::BPath
 *  Params: 
 * Effects: 
 ***********************************************************************/
TCPlusObject BPath_Create(TPasObject PasObject)
{
	return new BPPath(PasObject);
}


/***********************************************************************
 *  Method: BPath::BPath
 *  Params: const char *dir, const char *leaf, bool normalize
 * Effects: 
 ***********************************************************************/
TCPlusObject BPath_Create_1
(TPasObject PasObject, const char *dir, const char *leaf, bool normalize)
{
	return new BPPath(PasObject, dir, leaf, normalize);
}


/***********************************************************************
 *  Method: BPath::BPath
 *  Params: const BDirectory *dir, const char *leaf, bool normalize
 * Effects: 
 ***********************************************************************/
/*TCPlusObject BPath_Create_2
(TPasObject PasObject, const BDirectory *dir, const char *leaf, bool normalize)
{
	return new BPPath(PasObject, dir, leaf, normalize);
}
*/

/***********************************************************************
 *  Method: BPath::BPath
 *  Params: const BPath &path
 * Effects: 
 ***********************************************************************/
TCPlusObject BPath_Create_3
(TPasObject PasObject, const BPath &path)
{
	return new BPPath(PasObject, path);
}


/***********************************************************************
 *  Method: BPath::BPath
 *  Params: const BEntry *entry
 * Effects: 
 ***********************************************************************/
TCPlusObject BPath_Create_4
(TPasObject PasObject, const BEntry *entry)
{
	return new BPPath(PasObject, entry);
}


/***********************************************************************
 *  Method: BPath::BPath
 *  Params: const entry_ref *ref
 * Effects: 
 ***********************************************************************/
TCPlusObject BPath_Create_5
(TPasObject PasObject, const entry_ref *ref)
{
	return new BPPath(PasObject, ref);
}


/***********************************************************************
 *  Method: BPath::~BPath
 *  Params: 
 * Effects: 
 ***********************************************************************/
void BPath_Free(BPath *Path)
{
   delete Path;
}


/***********************************************************************
 *  Method: BPath::InitCheck
 *  Params: 
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BPath_InitCheck(BPath *Path) 
{
   return Path->InitCheck();
}


/***********************************************************************
 *  Method: BPath::SetTo
 *  Params: const char *path, const char *leaf, bool normalize
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BPath_SetTo(BPath *Path, const char *path, const char *leaf, bool normalize)
{
   return Path->SetTo(path, leaf, normalize);
}


/***********************************************************************
 *  Method: BPath::SetTo
 *  Params: const BDirectory *dir, const char *path, bool normalize
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BPath_SetTo_1
(BPath *Path, const BDirectory *dir, const char *path, bool normalize)
{
   return Path->SetTo(dir, path, normalize);
}


/***********************************************************************
 *  Method: BPath::SetTo
 *  Params: const BEntry *entry
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BPath_SetTo_2
(BPath *Path, const BEntry *entry)
{
   return Path->SetTo(entry);
}


/***********************************************************************
 *  Method: BPath::SetTo
 *  Params: const entry_ref *ref
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BPath_SetTo_3
(BPath *Path, const entry_ref *ref)
{
   return Path->SetTo(ref);
}


/***********************************************************************
 *  Method: BPath::Append
 *  Params: const char *path, bool normalize
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BPath_Append(BPath *Path, const char *path, bool normalize)
{
   return Path->Append(path, normalize);
}


/***********************************************************************
 *  Method: BPath::Unset
 *  Params: 
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BPath_Unset(BPath *Path)
{
   Path->Unset();
}


/***********************************************************************
 *  Method: BPath::Path
 *  Params: 
 * Returns: const char *
 * Effects: 
 ***********************************************************************/
const char *
BPath_Path(BPath *Path) 
{
	const char * test;
	test=Path->Path();
   return Path->Path();
}


/***********************************************************************
 *  Method: BPath::Leaf
 *  Params: 
 * Returns: const char *
 * Effects: 
 ***********************************************************************/
const char *
BPath_Leaf(BPath *Path) 
{
   return Path->Leaf();
}


/***********************************************************************
 *  Method: BPath::GetParent
 *  Params: BPath *
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BPath_GetParent(BPath *Path) 
{
   return Path->GetParent(Path);
}





/***********************************************************************
 *  Method: BPath::IsFixedSize
 *  Params: 
 * Returns: bool
 * Effects: 
 ***********************************************************************/
bool
BPath_IsFixedSize(BPath *Path) 
{
   return Path->IsFixedSize();
}


/***********************************************************************
 *  Method: BPath::TypeCode
 *  Params: 
 * Returns: type_code
 * Effects: 
 ***********************************************************************/
type_code
BPath_TypeCode(BPath *Path) 
{
   return Path->TypeCode();
}


/***********************************************************************
 *  Method: BPath::FlattenedSize
 *  Params: 
 * Returns: ssize_t
 * Effects: 
 ***********************************************************************/
ssize_t
BPath_FlattenedSize(BPath *Path) 
{
   return Path->FlattenedSize();
}


/***********************************************************************
 *  Method: BPath::Flatten
 *  Params: void *buffer, ssize_t size
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BPath_Flatten(BPath *Path, void *buffer, ssize_t size) 
{
   return Path->Flatten(buffer, size);
}


/***********************************************************************
 *  Method: BPath::AllowsTypeCode
 *  Params: type_code code
 * Returns: bool
 * Effects: 
 ***********************************************************************/
bool
BPath_AllowsTypeCode(BPath *Path, type_code code) 
{
   return Path->AllowsTypeCode(code);
}


/***********************************************************************
 *  Method: BPath::Unflatten
 *  Params: type_code c, const void *buf, ssize_t size
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BPath_Unflatten(BPath *Path, type_code c, const void *buf, ssize_t size)
{
   return Path->Unflatten(c, buf, size);
}




#if defined(__cplusplus)
}
#endif

#endif /* _PATH_CPP_ */


