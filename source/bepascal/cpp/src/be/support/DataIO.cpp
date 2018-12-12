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

#include <DataIO.h>
#include <beobj.h>

#if defined(__cplusplus)
extern "C" {
#endif

/***********************************************************************
 *  Method: BDataIO::BDataIO
 *  Params: 
 * Effects: 
 ***********************************************************************/
TCPlusObject BDataIO_Create_1(TPasObject PasObject)
{
//	return new BDataIO(PasObject);
	return NULL;
}


/***********************************************************************
 *  Method: BDataIO::~BDataIO
 *  Params: 
 * Effects: 
 ***********************************************************************/
void BDataIO_Free(BDataIO *DataIO)
{
   delete DataIO;
}

/***********************************************************************
 *  Method: BDataIO::BDataIO
 *  Params: const BDataIO &
 * Effects: 
 ***********************************************************************/
TCPlusObject BDataIO_Create_2(TPasObject PasObject, const BDataIO &)
{
//	return new BPDataIO(PasObject, );
	return NULL;
}

/***********************************************************************
 *  Method: BDataIO::operator=
 *  Params: const BDataIO &
 * Returns: BDataIO &
 * Effects: 
 ***********************************************************************/
/*BDataIO &
BDataIO_operator=(BDataIO *DataIO, const BDataIO &)
{
   return DataIO->operator=();
}*/


/***********************************************************************
 *  Method: BPositionIO::BPositionIO
 *  Params: 
 * Effects: 
 ***********************************************************************/
TCPlusObject BPositionIO_Create(TPasObject PasObject)
{
//	return new BPositionIO(PasObject);
	return NULL;
}


/***********************************************************************
 *  Method: BPositionIO::~BPositionIO
 *  Params: 
 * Effects: 
 ***********************************************************************/
void BPositionIO_Free(BPositionIO *PositionIO)
{
   delete PositionIO;
}


/***********************************************************************
 *  Method: BPositionIO::Read
 *  Params: void *buffer, size_t size
 * Returns: ssize_t
 * Effects: 
 ***********************************************************************/
ssize_t
BPositionIO_Read(BPositionIO *PositionIO, void *buffer, size_t size)
{
   return PositionIO->Read(buffer, size);
}


/***********************************************************************
 *  Method: BPositionIO::Write
 *  Params: const void *buffer, size_t size
 * Returns: ssize_t
 * Effects: 
 ***********************************************************************/
ssize_t
BPositionIO_Write(BPositionIO *PositionIO, const void *buffer, size_t size)
{
   return PositionIO->Write(buffer, size);
}


/***********************************************************************
 *  Method: BPositionIO::SetSize
 *  Params: off_t size
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BPositionIO_SetSize(BPositionIO *PositionIO, off_t size)
{
   return PositionIO->SetSize(size);
}

/***********************************************************************
 *  Method: BMallocIO::BMallocIO
 *  Params: 
 * Effects: 
 ***********************************************************************/
TCPlusObject BMallocIO_Create(TPasObject PasObject)
{
	return new BMallocIO();
}


/***********************************************************************
 *  Method: BMallocIO::~BMallocIO
 *  Params: 
 * Effects: 
 ***********************************************************************/
void BMallocIO_Free(BMallocIO *MallocIO)
{
   delete MallocIO;
}


/***********************************************************************
 *  Method: BMallocIO::ReadAt
 *  Params: off_t pos, void *buffer, size_t size
 * Returns: ssize_t
 * Effects: 
 ***********************************************************************/
ssize_t
BMallocIO_ReadAt(BMallocIO *MallocIO, off_t pos, void *buffer, size_t size)
{
   return MallocIO->ReadAt(pos, buffer, size);
}


/***********************************************************************
 *  Method: BMallocIO::WriteAt
 *  Params: off_t pos, const void *buffer, size_t size
 * Returns: ssize_t
 * Effects: 
 ***********************************************************************/
ssize_t
BMallocIO_WriteAt(BMallocIO *MallocIO, off_t pos, const void *buffer, size_t size)
{
   return MallocIO->WriteAt(pos, buffer, size);
}


/***********************************************************************
 *  Method: BMallocIO::Seek
 *  Params: off_t pos, uint32 seek_mode
 * Returns: off_t
 * Effects: 
 ***********************************************************************/
off_t
BMallocIO_Seek(BMallocIO *MallocIO, off_t pos, uint32 seek_mode)
{
   return MallocIO->Seek(pos, seek_mode);
}


/***********************************************************************
 *  Method: BMallocIO::Position
 *  Params: 
 * Returns: off_t
 * Effects: 
 ***********************************************************************/
off_t
BMallocIO_Position(BMallocIO *MallocIO)
{
   return MallocIO->Position();
}


/***********************************************************************
 *  Method: BMallocIO::SetSize
 *  Params: off_t size
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BMallocIO_SetSize(BMallocIO *MallocIO, off_t size)
{
   return MallocIO->SetSize(size);
}


/***********************************************************************
 *  Method: BMallocIO::SetBlockSize
 *  Params: size_t blocksize
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BMallocIO_SetBlockSize(BMallocIO *MallocIO, size_t blocksize)
{
   MallocIO->SetBlockSize(blocksize);
}


/***********************************************************************
 *  Method: BMallocIO::Buffer
 *  Params: 
 * Returns: const void *
 * Effects: 
 ***********************************************************************/
const void *
BMallocIO_Buffer(BMallocIO *MallocIO) 
{
   return MallocIO->Buffer();
}


/***********************************************************************
 *  Method: BMallocIO::BufferLength
 *  Params: 
 * Returns: size_t
 * Effects: 
 ***********************************************************************/
size_t
BMallocIO_BufferLength_1(BMallocIO *MallocIO) 
{
   return MallocIO->BufferLength();
}

/***********************************************************************
 *  Method: BMallocIO::operator=
 *  Params: const BMallocIO &
 * Returns: BMallocIO &
 * Effects: 
 ***********************************************************************/
/*BMallocIO &
BMallocIO_operator=(BMallocIO *MallocIO, const BMallocIO &)
{
   return MallocIO->operator=();
}*/


/***********************************************************************
 *  Method: BMemoryIO::BMemoryIO
 *  Params: void *p, size_t len
 * Effects: 
 ***********************************************************************/
TCPlusObject BMemoryIO_Create(TPasObject PasObject, void *p, size_t len)
{
	return new BMemoryIO(p, len);
}


/***********************************************************************
 *  Method: BMemoryIO::BMemoryIO
 *  Params: const void *p, size_t len
 * Effects: 
 ***********************************************************************/
TCPlusObject BMemoryIO_Create_1
(TPasObject PasObject, const void *p, size_t len)
{
	return new BMemoryIO(p, len);
}


/***********************************************************************
 *  Method: BMemoryIO::~BMemoryIO
 *  Params: 
 * Effects: 
 ***********************************************************************/
void BMemoryIO_Free(BMemoryIO *MemoryIO)
{
   delete MemoryIO;
}


/***********************************************************************
 *  Method: BMemoryIO::ReadAt
 *  Params: off_t pos, void *buffer, size_t size
 * Returns: ssize_t
 * Effects: 
 ***********************************************************************/
ssize_t
BMemoryIO_ReadAt(BMemoryIO *MemoryIO, off_t pos, void *buffer, size_t size)
{
   return MemoryIO->ReadAt(pos, buffer, size);
}


/***********************************************************************
 *  Method: BMemoryIO::WriteAt
 *  Params: off_t pos, const void *buffer, size_t size
 * Returns: ssize_t
 * Effects: 
 ***********************************************************************/
ssize_t
BMemoryIO_WriteAt(BMemoryIO *MemoryIO, off_t pos, const void *buffer, size_t size)
{
   return MemoryIO->WriteAt(pos, buffer, size);
}


/***********************************************************************
 *  Method: BMemoryIO::Seek
 *  Params: off_t pos, uint32 seek_mode
 * Returns: off_t
 * Effects: 
 ***********************************************************************/
off_t
BMemoryIO_Seek(BMemoryIO *MemoryIO, off_t pos, uint32 seek_mode)
{
   return MemoryIO->Seek(pos, seek_mode);
}


/***********************************************************************
 *  Method: BMemoryIO::Position
 *  Params: 
 * Returns: off_t
 * Effects: 
 ***********************************************************************/
off_t
BMemoryIO_Position(BMemoryIO *MemoryIO)
{
   return MemoryIO->Position();
}


/***********************************************************************
 *  Method: BMemoryIO::SetSize
 *  Params: off_t size
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BMemoryIO_SetSize(BMemoryIO *MemoryIO, off_t size)
{
   return MemoryIO->SetSize(size);
}

/***********************************************************************
 *  Method: BMemoryIO::operator=
 *  Params: const BMemoryIO &
 * Returns: BMemoryIO &
 * Effects: 
 ***********************************************************************/
/*BMemoryIO &
BMemoryIO_operator=(BMemoryIO *MemoryIO, const BMemoryIO &)
{
   return MemoryIO->operator=();
}*/

#if defined(__cplusplus)
}
#endif

