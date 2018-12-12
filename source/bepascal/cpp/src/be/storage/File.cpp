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

#ifndef _FILE_CPP_
#define _FILE_CPP_

/***********************************************************************
 * AUTHOR:  <baron>
 *   FILE: Entry.cpp
 *   DATE: Wed Jul  2 22:28:34 2003
 *  DESCR: 
 ***********************************************************************/
#include "Resources.h"
#include <beobj.h>



class BPFile : public BFile, public virtual BPasObject {
public:
						BPFile(TPasObject PasObject);
						BPFile(TPasObject PasObject,const entry_ref *ref, uint32 open_mode);
						BPFile(TPasObject PasObject,const BEntry *entry, uint32 open_mode);
						BPFile(TPasObject PasObject,const char *path, uint32 open_mode);
						BPFile(TPasObject PasObject,const BDirectory *dir, const char *path,
							  uint32 open_mode);
						BPFile(TPasObject PasObject,const BFile &file);

virtual					~BPFile();
};
	
BPFile::BPFile(TPasObject PasObject)
	:BFile(),
	BPasObject(PasObject)
{
}	
BPFile::BPFile(TPasObject PasObject,const entry_ref *ref, uint32 open_mode)
	:BFile(ref,open_mode),
	BPasObject(PasObject)
{
}	
BPFile::BPFile(TPasObject PasObject,const BEntry *entry, uint32 open_mode)
	:BFile(entry,open_mode),
	BPasObject(PasObject)
{
}	
BPFile::BPFile(TPasObject PasObject,const char *path, uint32 open_mode)
	:BFile(path,open_mode),
	BPasObject(PasObject)
{
}	
BPFile::BPFile(TPasObject PasObject,const BDirectory *dir, const char *path,
							  uint32 open_mode)
	:BFile(dir,path,open_mode),
	BPasObject(PasObject)
{
}	
BPFile::BPFile(TPasObject PasObject,const BFile &file)
	:BFile(file),
	BPasObject(PasObject)
{
}	

BPFile::~BPFile()
{
}

#if defined(__cplusplus)
extern "C" {
#endif

                                                                  
/***********************************************************************
 *  Method: BFile::BFile
 *  Params: 
 * Effects: 
 ***********************************************************************/
TCPlusObject BFile_Create(TPasObject PasObject)
{
	return new BPFile(PasObject);
}


/***********************************************************************
 *  Method: BFile::BFile
 *  Params: const entry_ref *ref, uint32 open_mode
 * Effects: 
 ***********************************************************************/
TCPlusObject BFile_Create_1
(TPasObject PasObject, const entry_ref *ref, uint32 open_mode)
{
	return new BPFile(PasObject, ref, open_mode);
}


/***********************************************************************
 *  Method: BFile::BFile
 *  Params: const BEntry *entry, uint32 open_mode
 * Effects: 
 ***********************************************************************/
TCPlusObject BFile_Create_2
(TPasObject PasObject, const BEntry *entry, uint32 open_mode)
{
	return new BPFile(PasObject, entry, open_mode);
}


/***********************************************************************
 *  Method: BFile::BFile
 *  Params: const char *path, uint32 open_mode
 * Effects: 
 ***********************************************************************/
TCPlusObject BFile_Create_3
(TPasObject PasObject, const char *path, uint32 open_mode)
{
	return new BPFile(PasObject, path, open_mode);
}


/***********************************************************************
 *  Method: BFile::BFile
 *  Params: const BDirectory *dir, const char *path, uint32 open_mode
 * Effects: 
 ***********************************************************************/
TCPlusObject BFile_Create_4
(TPasObject PasObject, const BDirectory *dir, const char *path, uint32 open_mode)
{
	return new BPFile(PasObject, dir, path, open_mode);
}


/***********************************************************************
 *  Method: BFile::BFile
 *  Params: const BFile &file
 * Effects: 
 ***********************************************************************/
TCPlusObject BFile_Create_5
(TPasObject PasObject, const BFile &file)
{
	return new BPFile(PasObject, file);
}


/***********************************************************************
 *  Method: BFile::~BFile
 *  Params: 
 * Effects: 
 ***********************************************************************/
void BFile_FREE(BFile *File)
{
   delete  File;
}


/***********************************************************************
 *  Method: BFile::SetTo
 *  Params: const entry_ref *ref, uint32 open_mode
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BFile_SetTo(BFile *File, const entry_ref *ref, uint32 open_mode)
{
   return File->SetTo(ref, open_mode);
}


/***********************************************************************
 *  Method: BFile::SetTo
 *  Params: const BEntry *entry, uint32 open_mode
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BFile_SetTo_1
(BFile *File, const BEntry *entry, uint32 open_mode)
{
   return File->SetTo(entry, open_mode);
}


/***********************************************************************
 *  Method: BFile::SetTo
 *  Params: const char *path, uint32 open_mode
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BFile_SetTo_2
(BFile *File, const char *path, uint32 open_mode)
{
   return File->SetTo(path, open_mode);
}


/***********************************************************************
 *  Method: BFile::SetTo
 *  Params: const BDirectory *dir, const char *path, uint32 open_mode
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BFile_SetTo_3
(BFile *File, const BDirectory *dir, const char *path, uint32 open_mode)
{
   return File->SetTo(dir, path, open_mode);
}


/***********************************************************************
 *  Method: BFile::IsReadable
 *  Params: 
 * Returns: bool
 * Effects: 
 ***********************************************************************/
bool
BFile_IsReadable(BFile *File) 
{
   return File->IsReadable();
}


/***********************************************************************
 *  Method: BFile::IsWritable
 *  Params: 
 * Returns: bool
 * Effects: 
 ***********************************************************************/
bool
BFile_IsWritable(BFile *File) 
{
   return File->IsWritable();
}


/***********************************************************************
 *  Method: BFile::Read
 *  Params: void *buffer, size_t size
 * Returns: ssize_t
 * Effects: 
 ***********************************************************************/
ssize_t
BFile_Read(BFile *File, void *buffer, size_t size)
{
   return File->Read(buffer, size);
}


/***********************************************************************
 *  Method: BFile::ReadAt
 *  Params: off_t pos, void *buffer, size_t size
 * Returns: ssize_t
 * Effects: 
 ***********************************************************************/
ssize_t
BFile_ReadAt_1
(BFile *File, off_t pos, void *buffer, size_t size)
{
   return File->ReadAt(pos, buffer, size);
}


/***********************************************************************
 *  Method: BFile::Write
 *  Params: const void *buffer, size_t size
 * Returns: ssize_t
 * Effects: 
 ***********************************************************************/
ssize_t
BFile_Write(BFile *File, const void *buffer, size_t size)
{
   return File->Write(buffer, size);
}


/***********************************************************************
 *  Method: BFile::WriteAt
 *  Params: off_t pos, const void *buffer, size_t size
 * Returns: ssize_t
 * Effects: 
 ***********************************************************************/
ssize_t
BFile_WriteAt_1
(BFile *File, off_t pos, const void *buffer, size_t size)
{
   return File->WriteAt(pos, buffer, size);
}


/***********************************************************************
 *  Method: BFile::Seek
 *  Params: off_t position, uint32 seek_mode
 * Returns: off_t
 * Effects: 
 ***********************************************************************/
off_t
BFile_Seek(BFile *File, off_t position, uint32 seek_mode)
{
   return File->Seek(position, seek_mode);
}


/***********************************************************************
 *  Method: BFile::Position
 *  Params: 
 * Returns: off_t
 * Effects: 
 ***********************************************************************/
off_t
BFile_Position(BFile *File) 
{
   return File->Position();
}


/***********************************************************************
 *  Method: BFile::SetSize
 *  Params: off_t size
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BFile_SetSize(BFile *File, off_t size)
{
   return File->SetSize(size);
}





#if defined(__cplusplus)
}
#endif

#endif /* _FILE_CPP_ */