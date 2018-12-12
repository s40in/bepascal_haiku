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

#ifndef _RESSOURCE_CPP_
#define _RESSOURCE_CPP_

/***********************************************************************
 * AUTHOR:  <baron>
 *   FILE: Entry.cpp
 *   DATE: Wed Jul  2 22:28:34 2003
 *  DESCR: 
 ***********************************************************************/
#include "Resources.h"
#include <beobj.h>



class BPResources : public BResources, public virtual BPasObject {
public:
						BPResources(TPasObject PasObject);
						BPResources(TPasObject PasObject, const BFile *file, bool truncate = false);

	virtual				~BPResources();
};
	
BPResources::BPResources(TPasObject PasObject)
		:BResources(),
		BPasObject(PasObject)
{
}			
BPResources::BPResources(TPasObject PasObject, const BFile *file, bool truncate)
		:BResources(file,truncate),
		BPasObject(PasObject)
{
}			

BPResources::~BPResources()
{
}

#if defined(__cplusplus)
extern "C" {
#endif

/***********************************************************************
 * AUTHOR: nobody <baron>
 *   FILE: Resources.cpp
 *   DATE: Sun Oct 12 19:52:51 2003
 *  DESCR: 
 ***********************************************************************/

/***********************************************************************
 *  Method: BResources::BResources
 *  Params: 
 * Effects: 
 ***********************************************************************/
TCPlusObject BResources_Create(TPasObject PasObject)
{
	return new BPResources(PasObject);
}


/***********************************************************************
 *  Method: BResources::BResources
 *  Params: const BFile *file, bool truncate
 * Effects: 
 ***********************************************************************/
TCPlusObject BResources_Create_1
(TPasObject PasObject, const BFile *file, bool truncate)
{
	return new BPResources(PasObject, file, truncate);
}


/***********************************************************************
 *  Method: BResources::~BResources
 *  Params: 
 * Effects: 
 ***********************************************************************/
void BResources_Free(BResources *Resources)
{
   delete  Resources;
}


/***********************************************************************
 *  Method: BResources::SetTo
 *  Params: const BFile *file, bool truncate
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BResources_SetTo(BResources *Resources, const BFile *file, bool truncate)
{
   return Resources->SetTo(file, truncate);
}


/***********************************************************************
 *  Method: BResources::File
 *  Params: 
 * Returns: const BFile &
 * Effects: 
 ***********************************************************************/
const BFile &
BResources_File(BResources *Resources) 
{
   return Resources->File();
}


/***********************************************************************
 *  Method: BResources::LoadResource
 *  Params: type_code type, int32 id, size_t *out_size
 * Returns: const void *
 * Effects: 
 ***********************************************************************/
const void *
BResources_LoadResource(BResources *Resources, type_code type, int32 id, size_t *out_size)
{
   return Resources->LoadResource(type, id, out_size);
}


/***********************************************************************
 *  Method: BResources::LoadResource
 *  Params: type_code type, const char *name, size_t *out_size
 * Returns: const void *
 * Effects: 
 ***********************************************************************/
const void *
BResources_LoadResource_1
(BResources *Resources, type_code type, const char *name, size_t *out_size)
{
   return Resources->LoadResource(type, name, out_size);
}


/***********************************************************************
 *  Method: BResources::PreloadResourceType
 *  Params: type_code type
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BResources_PreloadResourceType(BResources *Resources, type_code type)
{
   return Resources->PreloadResourceType(type);
}


/***********************************************************************
 *  Method: BResources::Sync
 *  Params: 
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BResources_Sync(BResources *Resources)
{
   return Resources->Sync();
}


/***********************************************************************
 *  Method: BResources::MergeFrom
 *  Params: BFile *from_file
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BResources_MergeFrom(BResources *Resources, BFile *from_file)
{
   return Resources->MergeFrom(from_file);
}


/***********************************************************************
 *  Method: BResources::WriteTo
 *  Params: BFile *new_file
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BResources_WriteTo(BResources *Resources, BFile *new_file)
{
   return Resources->WriteTo(new_file);
}


/***********************************************************************
 *  Method: BResources::AddResource
 *  Params: type_code type, int32 id, const void *data, size_t data_size, const char *name
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BResources_AddResource(BResources *Resources, type_code type, int32 id, const void *data, size_t data_size, const char *name)
{
   return Resources->AddResource(type, id, data, data_size, name);
}


/***********************************************************************
 *  Method: BResources::HasResource
 *  Params: type_code type, int32 id
 * Returns: bool
 * Effects: 
 ***********************************************************************/
bool
BResources_HasResource(BResources *Resources, type_code type, int32 id)
{
   return Resources->HasResource(type, id);
}


/***********************************************************************
 *  Method: BResources::HasResource
 *  Params: type_code type, const char *name
 * Returns: bool
 * Effects: 
 ***********************************************************************/
bool
BResources_HasResource_1
(BResources *Resources, type_code type, const char *name)
{
   return Resources->HasResource(type, name);
}


/***********************************************************************
 *  Method: BResources::GetResourceInfo
 *  Params: int32 resIndex, type_code *typeFound, int32 *idFound, const char **nameFound, size_t *size
 * Returns: bool
 * Effects: 
 ***********************************************************************/
bool
BResources_GetResourceInfo(BResources *Resources, int32 resIndex, type_code *typeFound, int32 *idFound, const char **nameFound, size_t *size)
{
   return Resources->GetResourceInfo(resIndex, typeFound, idFound, nameFound, size);
}


/***********************************************************************
 *  Method: BResources::GetResourceInfo
 *  Params: type_code type, int32 resIndex, int32 *idFound, const char **nameFound, size_t *size
 * Returns: bool
 * Effects: 
 ***********************************************************************/
bool
BResources_GetResourceInfo_1
(BResources *Resources, type_code type, int32 resIndex, int32 *idFound, const char **nameFound, size_t *size)
{
   return Resources->GetResourceInfo(type, resIndex, idFound, nameFound, size);
}


/***********************************************************************
 *  Method: BResources::GetResourceInfo
 *  Params: type_code type, int32 id, const char **nameFound, size_t *size
 * Returns: bool
 * Effects: 
 ***********************************************************************/
bool
BResources_GetResourceInfo_2
(BResources *Resources, type_code type, int32 id, const char **nameFound, size_t *size)
{
   return Resources->GetResourceInfo(type, id, nameFound, size);
}


/***********************************************************************
 *  Method: BResources::GetResourceInfo
 *  Params: type_code type, const char *name, int32 *idFound, size_t *size
 * Returns: bool
 * Effects: 
 ***********************************************************************/
bool
BResources_GetResourceInfo_3
(BResources *Resources, type_code type, const char *name, int32 *idFound, size_t *size)
{
   return Resources->GetResourceInfo(type, name, idFound, size);
}


/***********************************************************************
 *  Method: BResources::GetResourceInfo
 *  Params: const void *resource, type_code *out_type, int32 *out_id, size_t *out_size, const char **out_name
 * Returns: bool
 * Effects: 
 ***********************************************************************/
bool
BResources_GetResourceInfo_4
(BResources *Resources, const void *resource, type_code *out_type, int32 *out_id, size_t *out_size, const char **out_name)
{
   return Resources->GetResourceInfo(resource, out_type, out_id, out_size, out_name);
}


/***********************************************************************
 *  Method: BResources::RemoveResource
 *  Params: const void *resource
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BResources_RemoveResource(BResources *Resources, const void *resource)
{
   return Resources->RemoveResource(resource);
}


/***********************************************************************
 *  Method: BResources::RemoveResource
 *  Params: type_code type, int32 id
 * Returns: int
 * Effects: 
 ***********************************************************************/
int
BResources_RemoveResource_1
(BResources *Resources, type_code type, int32 id)
{
   return Resources->RemoveResource(type, id);
}


/***********************************************************************
 *  Method: BResources::WriteResource
 *  Params: type_code type, int32 id, const void *data, off_t offset, size_t data_size
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BResources_WriteResource(BResources *Resources, type_code type, int32 id, const void *data, off_t offset, size_t data_size)
{
   return Resources->WriteResource(type, id, data, offset, data_size);
}


/***********************************************************************
 *  Method: BResources::ReadResource
 *  Params: type_code type, int32 id, void *data, off_t offset, size_t data_size
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BResources_ReadResource(BResources *Resources, type_code type, int32 id, void *data, off_t offset, size_t data_size)
{
   return Resources->ReadResource(type, id, data, offset, data_size);
}


/***********************************************************************
 *  Method: BResources::FindResource
 *  Params: type_code type, int32 id, size_t *data_size
 * Returns: void *
 * Effects: 
 ***********************************************************************/
void *
BResources_FindResource(BResources *Resources, type_code type, int32 id, size_t *data_size)
{
   Resources->FindResource(type, id, data_size);
}


/***********************************************************************
 *  Method: BResources::FindResource
 *  Params: type_code type, const char *name, size_t *data_size
 * Returns: void *
 * Effects: 
 ***********************************************************************/
void *
BResources_FindResource_1
(BResources *Resources, type_code type, const char *name, size_t *data_size)
{
   Resources->FindResource(type, name, data_size);
}



#if defined(__cplusplus)
}
#endif

#endif /* _RESSOURCE_CPP_ */
