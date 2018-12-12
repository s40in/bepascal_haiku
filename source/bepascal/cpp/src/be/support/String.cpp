/*  BePascal - A pascal wrapper around the BeOS API
    Copyright (C) 2002 Eric Jourde

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
#ifndef _STRING_CPP_
#define _STRING_CPP_

#include "String.h"
#include <beobj.h>


#if defined(__cplusplus)
extern "C" {
#endif

/*
 *  Method: BString::BString()
 *   Descr: 
 */
TCPlusObject BString_Create()
{
	return new BString();
}


/*
 *  Method: BString::BString()
 *   Descr: 
 */
TCPlusObject BString_Create_1
(TPasObject PasObject, const char *value)
{
	return new BString(value);
}


/*
 *  Method: BString::BString()
 *   Descr: 
 */
/*TCPlusObject BString_Create_2
(TPasObject PasObject, const BString &)
{
	return new BPString(PasObject, );
}
*/

/*
 *  Method: BString::BString()
 *   Descr: 
 */
/*TCPlusObject BString_Create_3
(TPasObject PasObject, const char *,
                 int32 maxLength)
{
	return new BPString(PasObject, ,
                 maxLength);
}

*/
/*
 *  Method: BString::~BString()
 *   Descr: 
 */
void BString_Free(BString *String)
{
   delete String;
}


/*
 *  Method: BString::CountChars()
 *   Descr: 
 */

const char *BString_String(BString *String) 
{
   return String->String();
}

int32
BString_Length(BString *String) 
{
   return String->Length();
}

int32
BString_CountChars(BString *String) 
{
   return String->CountChars();
}


/*
 *  Method: BString::operator=()
 *   Descr: 
 */
/*BString &
BString_operator=(BString *String, const BString &)
{
   return String->operator=();
}
*/

/*
 *  Method: BString::operator=()
 *   Descr: 
 */
/*BString &
BString_operator=_1
(BString *String, const char *)
{
   return String->operator=();
}
*/

/*
 *  Method: BString::operator=()
 *   Descr: 
 */
/*BString &
BString_operator=_2
(BString *String, char)
{
   return String->operator=();
}

*/
/*
 *  Method: BString::SetTo()
 *   Descr: 
 */
BString &
BString_SetTo(BString *String, const char *value,
               int32 length)
{
   return String->SetTo(value,length);
}


/*
 *  Method: BString::SetTo()
 *   Descr: 
 */
BString &
BString_SetTo_1
(BString *String, const BString &from)
{
   return String->SetTo(from);
}


/*
 *  Method: BString::Adopt()
 *   Descr: 
 */
BString &
BString_Adopt(BString *String, BString &from)
{
   return String->Adopt(from);
}


/*
 *  Method: BString::SetTo()
 *   Descr: 
 */
BString &
BString_SetTo_2(BString *String, const BString &value,
               int32 length)
{
   return String->SetTo(value,
               length);
}


/*
 *  Method: BString::Adopt()
 *   Descr: 
 */
BString &
BString_Adopt_1(BString *String, BString &from,
               int32 length)
{
   return String->Adopt(from,
               length);
}


/*
 *  Method: BString::SetTo()
 *   Descr: 
 */
BString &
BString_SetTo_3(BString *String, char value,
               int32 count)
{
   return String->SetTo(value,
               count);
}


/*
 *  Method: BString::CopyInto()
 *   Descr: 
 */
BString &
BString_CopyInto(BString *String, BString &into,
                  int32 fromOffset,
                  int32 length) 
{
   return String->CopyInto(into,
                  fromOffset,
                  length);
}


/*
 *  Method: BString::CopyInto()
 *   Descr: 
 */
void
BString_CopyInto_1
(BString *String, char *into,
                  int32 fromOffset,
                  int32 length) 
{
   String->CopyInto(into,
                  fromOffset,
                  length);
}


/*
 *  Method: BString::operator+=()
 *   Descr: 
 */
/*BString &
BString_operator+=(BString *String, const char *)
{
   return String->operator+=();
}
*/

/*
 *  Method: BString::operator+=()
 *   Descr: 
 */
/*BString &
BString_operator+=_1
(BString *String, char)
{
   return String->operator+=();
}
*/

/*
 *  Method: BString::Append()
 *   Descr: 
 */
BString &
BString_Append(BString *String, const BString &value,
                int32 length)
{
   return String->Append(value,
                length);
}


/*
 *  Method: BString::Append()
 *   Descr: 
 */
BString &
BString_Append_1
(BString *String, const char *value,
                int32 length)
{
   return String->Append(value,
                length);
}


/*
 *  Method: BString::Append()
 *   Descr: 
 */
BString &
BString_Append_2
(BString *String, char value,
                int32 count)
{
   return String->Append(value,
                count);
}


/*
 *  Method: BString::Prepend()
 *   Descr: 
 */
BString &
BString_Prepend(BString *String, const char *value)
{
   return String->Prepend(value);
}


/*
 *  Method: BString::Prepend()
 *   Descr: 
 */
BString &
BString_Prepend_1
(BString *String, const BString &value)
{
   return String->Prepend(value);
}


/*
 *  Method: BString::Prepend()
 *   Descr: 
 */
BString &
BString_Prepend_2
(BString *String, const char *value,
                 int32 length)
{
   return String->Prepend(value,length);
}


/*
 *  Method: BString::Prepend()
 *   Descr: 
 */
BString &
BString_Prepend_3
(BString *String, const BString &value,
                 int32 length)
{
   return String->Prepend(value,length
                 );
}


/*
 *  Method: BString::Prepend()
 *   Descr: 
 */
BString &
BString_Prepend_4
(BString *String, char value,
                 int32 count)
{
   return String->Prepend(value,
                 count);
}


/*
 *  Method: BString::Insert()
 *   Descr: 
 */
BString &
BString_Insert(BString *String, const char *value,
                int32 pos)
{
   return String->Insert(value,
                pos);
}


/*
 *  Method: BString::Insert()
 *   Descr: 
 */
BString &
BString_Insert_1
(BString *String, const char *value,
                int32 length,
                int32 pos)
{
   return String->Insert(value,
                length,
                pos);
}


/*
 *  Method: BString::Insert()
 *   Descr: 
 */
BString &
BString_Insert_2
(BString *String, const char *value,
                int32 fromOffset,
                int32 length,
                int32 pos)
{
   return String->Insert(value,
                fromOffset,
                length,
                pos);
}


/*
 *  Method: BString::Insert()
 *   Descr: 
 */
BString &
BString_Insert_3
(BString *String, const BString &value,
                int32 pos)
{
   return String->Insert(value,
                pos);
}


/*
 *  Method: BString::Insert()
 *   Descr: 
 */
BString &
BString_Insert_4
(BString *String, const BString &value,
                int32 length,
                int32 pos)
{
   return String->Insert(value,
                length,
                pos);
}


/*
 *  Method: BString::Insert()
 *   Descr: 
 */
BString &
BString_Insert_5
(BString *String, const BString &value,
                int32 fromOffset,
                int32 length,
                int32 pos)
{
   return String->Insert(value,
                fromOffset,
                length,
                pos);
}


/*
 *  Method: BString::Insert()
 *   Descr: 
 */
BString &
BString_Insert_6
(BString *String, char value,
                int32 count,
                int32 pos)
{
   return String->Insert(value,
                count,
                pos);
}


/*
 *  Method: BString::Truncate()
 *   Descr: 
 */
BString &
BString_Truncate(BString *String, int32 newLength,
                  bool lazy)
{
#ifdef B_BEOS_VERSION_DANO
	// Dano's Truncate doesn't have the 'lazy' parameter
	return String->Truncate(newLength);
#else
   return String->Truncate(newLength, lazy);
#endif
}



/*
 *  Method: BString::Remove()
 *   Descr: 
 */
BString &
BString_Remove(BString *String, int32 from,
                int32 length)
{
   return String->Remove(from,
                length);
}


/*
 *  Method: BString::RemoveFirst()
 *   Descr: 
 */
BString &
BString_RemoveFirst_1
(BString *String, const BString &value)
{
   return String->RemoveFirst(value);
}


/*
 *  Method: BString::RemoveLast()
 *   Descr: 
 */
BString &
BString_RemoveLast(BString *String, const BString &value)
{
   return String->RemoveLast(value);
}


/*
 *  Method: BString::RemoveAll()
 *   Descr: 
 */
BString &
BString_RemoveAll(BString *String, const BString &value)
{
   return String->RemoveAll(value);
}


/*
 *  Method: BString::RemoveFirst()
 *   Descr: 
 */
BString &
BString_RemoveFirst(BString *String, const char *value)
{
   return String->RemoveFirst(value);
}


/*
 *  Method: BString::RemoveLast()
 *   Descr: 
 */
BString &
BString_RemoveLast_1(BString *String, const char *value)
{
   return String->RemoveLast(value);
}


/*
 *  Method: BString::RemoveAll()
 *   Descr: 
 */
BString &
BString_RemoveAll_1(BString *String, const char *value)
{
   return String->RemoveAll(value);
}


/*
 *  Method: BString::RemoveSet()
 *   Descr: 
 */
BString &
BString_RemoveSet(BString *String, const char *setOfCharsToRemove)
{
   return String->RemoveSet(setOfCharsToRemove);
}


/*
 *  Method: BString::MoveInto()
 *   Descr: 
 */
BString &
BString_MoveInto(BString *String, BString &into,
                  int32 from,
                  int32 length)
{
   return String->MoveInto(into,
                  from,
                  length);
}


/*
 *  Method: BString::MoveInto()
 *   Descr: 
 */
void
BString_MoveInto_1
(BString *String, char *into,
                  int32 from,
                  int32 length)
{
   String->MoveInto(into,
                  from,
                  length);
}


/*
 *  Method: BString::operator<()
 *   Descr: 
 */
/*bool
BString_operator<(BString *String, const char *) const
{
   return String->operator<();
}
*/

/*
 *  Method: BString::operator<=()
 *   Descr: 
 */
/*bool
BString_operator<=_1
(BString *String, const char *) const
{
   return String->operator<=();
}
*/

/*
 *  Method: BString::operator==()
 *   Descr: 
 */
/*bool
BString_operator==(BString *String, const char *) const
{
   return String->operator==();
}
*/

/*
 *  Method: BString::operator>=()
 *   Descr: 
 */
/*bool
BString_operator>=(BString *String, const char *) const
{
   return String->operator>=();
}
*/

/*
 *  Method: BString::operator>()
 *   Descr: 
 */
/*bool
BString_operator>(BString *String, const char *) const
{
   return String->operator>();
}
*/

/*
 *  Method: BString::Compare()
 *   Descr: 
 */
int
BString_Compare(BString *String, const BString &value) 
{
   return String->Compare(value);
}


/*
 *  Method: BString::Compare()
 *   Descr: 
 */
int
BString_Compare_1
(BString *String, const char *value) 
{
   return String->Compare(value);
}


/*
 *  Method: BString::Compare()
 *   Descr: 
 */
int
BString_Compare_2
(BString *String, const BString &value,
                 int32 n) 
{
   return String->Compare(value,
                 n);
}


/*
 *  Method: BString::Compare()
 *   Descr: 
 */
int
BString_Compare_3
(BString *String, const char *value,
                 int32 n) 
{
   return String->Compare(value,
                 n);
}


/*
 *  Method: BString::ICompare()
 *   Descr: 
 */
int
BString_ICompare(BString *String, const BString &value) 
{
   return String->ICompare(value);
}


/*
 *  Method: BString::ICompare()
 *   Descr: 
 */
int
BString_ICompare_1
(BString *String, const char *value) 
{
   return String->ICompare(value);
}


/*
 *  Method: BString::ICompare()
 *   Descr: 
 */
int
BString_ICompare_2
(BString *String, const BString &value,
                  int32 n) 
{
   return String->ICompare(value,
                  n);
}


/*
 *  Method: BString::ICompare()
 *   Descr: 
 */
int
BString_ICompare_3
(BString *String, const char *value,
                  int32 n) 
{
   return String->ICompare(value,
                  n);
}


/*
 *  Method: BString::FindFirst()
 *   Descr: 
 */
int32
BString_FindFirst(BString *String, const BString &value) 
{
   return String->FindFirst(value);
}


/*
 *  Method: BString::FindFirst()
 *   Descr: 
 */
int32
BString_FindFirst_1
(BString *String, const char *value) 
{
   return String->FindFirst(value);
}


/*
 *  Method: BString::FindFirst()
 *   Descr: 
 */
int32
BString_FindFirst_2
(BString *String, const BString &value,
                   int32 fromOffset) 
{
   return String->FindFirst(value,
                   fromOffset);
}


/*
 *  Method: BString::FindFirst()
 *   Descr: 
 */
int32
BString_FindFirst_3
(BString *String, const char *value,
                   int32 fromOffset) 
{
   return String->FindFirst(value,
                   fromOffset);
}


/*
 *  Method: BString::FindFirst()
 *   Descr: 
 */
int32
BString_FindFirst_4
(BString *String, char value) 
{
   return String->FindFirst(value);
}


/*
 *  Method: BString::FindFirst()
 *   Descr: 
 */
int32
BString_FindFirst_5
(BString *String, char value,
                   int32 fromOffset) 
{
   return String->FindFirst(value,
                   fromOffset);
}


/*
 *  Method: BString::FindLast()
 *   Descr: 
 */
int32
BString_FindLast(BString *String, const BString &value) 
{
   return String->FindLast(value);
}


/*
 *  Method: BString::FindLast()
 *   Descr: 
 */
int32
BString_FindLast_1
(BString *String, const char *value) 
{
   return String->FindLast(value);
}


/*
 *  Method: BString::FindLast()
 *   Descr: 
 */
int32
BString_FindLast_2
(BString *String, const BString &value,
                  int32 beforeOffset) 
{
   return String->FindLast(value,
                  beforeOffset);
}


/*
 *  Method: BString::FindLast()
 *   Descr: 
 */
int32
BString_FindLast_3
(BString *String, const char *value,
                  int32 beforeOffset) 
{
   return String->FindLast(value,
                  beforeOffset);
}


/*
 *  Method: BString::FindLast()
 *   Descr: 
 */
int32
BString_FindLast_4
(BString *String, char value) 
{
   return String->FindLast(value);
}


/*
 *  Method: BString::FindLast()
 *   Descr: 
 */
int32
BString_FindLast_5
(BString *String, char value,
                  int32 fromOffset) 
{
   return String->FindLast(value,
                  fromOffset);
}


/*
 *  Method: BString::IFindFirst()
 *   Descr: 
 */
int32
BString_IFindFirst(BString *String, const BString &value) 
{
   return String->IFindFirst(value);
}


/*
 *  Method: BString::IFindFirst()
 *   Descr: 
 */
int32
BString_IFindFirst_1
(BString *String, const char *value) 
{
   return String->IFindFirst(value);
}


/*
 *  Method: BString::IFindFirst()
 *   Descr: 
 */
int32
BString_IFindFirst_2
(BString *String, const BString &value,
                    int32 fromOffset) 
{
   return String->IFindFirst(value,
                    fromOffset);
}


/*
 *  Method: BString::IFindFirst()
 *   Descr: 
 */
int32
BString_IFindFirst_3
(BString *String, const char *value,
                    int32 fromOffset) 
{
   return String->IFindFirst(value,
                    fromOffset);
}


/*
 *  Method: BString::IFindLast()
 *   Descr: 
 */
int32
BString_IFindLast(BString *String, const BString &value) 
{
   return String->IFindLast(value);
}


/*
 *  Method: BString::IFindLast()
 *   Descr: 
 */
int32
BString_IFindLast_1
(BString *String, const char *value) 
{
   return String->IFindLast(value);
}


/*
 *  Method: BString::IFindLast()
 *   Descr: 
 */
int32
BString_IFindLast_2
(BString *String, const BString &value,
                   int32 beforeOffset) 
{
   return String->IFindLast(value,
                   beforeOffset);
}


/*
 *  Method: BString::IFindLast()
 *   Descr: 
 */
int32
BString_IFindLast_3
(BString *String, const char *value,
                   int32 beforeOffset) 
{
   return String->IFindLast(value,
                   beforeOffset);
}


/*
 *  Method: BString::ReplaceFirst()
 *   Descr: 
 */
BString &
BString_ReplaceFirst(BString *String, char replaceThis,
                      char withThis)
{
   return String->ReplaceFirst(replaceThis,
                      withThis);
}


/*
 *  Method: BString::ReplaceLast()
 *   Descr: 
 */
BString &
BString_ReplaceLast(BString *String, char replaceThis,
                     char withThis)
{
   return String->ReplaceLast(replaceThis,
                     withThis);
}


/*
 *  Method: BString::ReplaceAll()
 *   Descr: 
 */
BString &
BString_ReplaceAll(BString *String, char replaceThis,
                    char withThis,
                    int32 fromOffset)
{
   return String->ReplaceAll(replaceThis,
                    withThis,
                    fromOffset);
}


/*
 *  Method: BString::Replace()
 *   Descr: 
 */
BString &
BString_Replace(BString *String, char replaceThis,
                 char withThis,
                 int32 maxReplaceCount,
                 int32 fromOffset)
{
   return String->Replace(replaceThis,
                 withThis,
                 maxReplaceCount,
                 fromOffset);
}


/*
 *  Method: BString::ReplaceFirst()
 *   Descr: 
 */
BString &
BString_ReplaceFirst_1
(BString *String, const char *replaceThis,
                      const char *withThis)
{
   return String->ReplaceFirst(replaceThis,
                      withThis);
}


/*
 *  Method: BString::ReplaceLast()
 *   Descr: 
 */
BString &
BString_ReplaceLast_1(BString *String, const char *replaceThis,
                     const char *withThis)
{
   return String->ReplaceLast(replaceThis,
                     withThis);
}


/*
 *  Method: BString::ReplaceAll()
 *   Descr: 
 */
BString &
BString_ReplaceAll_1(BString *String, const char *replaceThis,
                    const char *withThis,
                    int32 fromOffset)
{
   return String->ReplaceAll(replaceThis,
                    withThis,
                    fromOffset);
}


/*
 *  Method: BString::Replace()
 *   Descr: 
 */
BString &
BString_Replace_1(BString *String, const char *replaceThis,
                 const char *withThis,
                 int32 maxReplaceCount,
                 int32 fromOffset)
{
   return String->Replace(replaceThis,
                 withThis,
                 maxReplaceCount,
                 fromOffset);
}


/*
 *  Method: BString::IReplaceFirst()
 *   Descr: 
 */
BString &
BString_IReplaceFirst(BString *String, char replaceThis,
                       char withThis)
{
   return String->IReplaceFirst(replaceThis,
                       withThis);
}


/*
 *  Method: BString::IReplaceLast()
 *   Descr: 
 */
BString &
BString_IReplaceLast(BString *String, char replaceThis,
                      char withThis)
{
   return String->IReplaceLast(replaceThis,
                      withThis);
}


/*
 *  Method: BString::IReplaceAll()
 *   Descr: 
 */
BString &
BString_IReplaceAll(BString *String, char replaceThis,
                     char withThis,
                     int32 fromOffset)
{
   return String->IReplaceAll(replaceThis,
                     withThis,
                     fromOffset);
}


/*
 *  Method: BString::IReplace()
 *   Descr: 
 */
BString &
BString_IReplace(BString *String, char replaceThis,
                  char withThis,
                  int32 maxReplaceCount,
                  int32 fromOffset)
{
   return String->IReplace(replaceThis,
                  withThis,
                  maxReplaceCount,
                  fromOffset);
}


/*
 *  Method: BString::IReplaceFirst()
 *   Descr: 
 */
BString &
BString_IReplaceFirst_1
(BString *String, const char *replaceThis,
                       const char *withThis)
{
   return String->IReplaceFirst(replaceThis,
                       withThis);
}


/*
 *  Method: BString::IReplaceLast()
 *   Descr: 
 */
BString &
BString_IReplaceLast_1(BString *String, const char *replaceThis,
                      const char *withThis)
{
   return String->IReplaceLast(replaceThis,
                      withThis);
}


/*
 *  Method: BString::IReplaceAll()
 *   Descr: 
 */
BString &
BString_IReplaceAll_1(BString *String, const char *replaceThis,
                     const char *withThis,
                     int32 fromOffset)
{
   return String->IReplaceAll(replaceThis,
                     withThis,
                     fromOffset);
}


/*
 *  Method: BString::IReplace()
 *   Descr: 
 */
BString &
BString_IReplace_1(BString *String, const char *replaceThis,
                  const char *withThis,
                  int32 maxReplaceCount,
                  int32 fromOffset)
{
   return String->IReplace(replaceThis,
                  withThis,
                  maxReplaceCount,
                  fromOffset);
}


/*
 *  Method: BString::ReplaceSet()
 *   Descr: 
 */
BString &
BString_ReplaceSet(BString *String, const char *setOfChars,
                    char with)
{
   return String->ReplaceSet(setOfChars,
                    with);
}


/*
 *  Method: BString::ReplaceSet()
 *   Descr: 
 */
BString &
BString_ReplaceSet_1
(BString *String, const char *setOfChars,
                    const char *with)
{
   return String->ReplaceSet(setOfChars,
                    with);
}


/*
 *  Method: BString::operator[]()
 *   Descr: 
 */
/*char &
BString_operator[](BString *String, int32 index)
{
   return String->operator[](index);
}
*/

/*
 *  Method: BString::LockBuffer()
 *   Descr: 
 */
char *
BString_LockBuffer(BString *String, int32 maxLength)
{
   return String->LockBuffer(maxLength);
}


/*
 *  Method: BString::UnlockBuffer()
 *   Descr: 
 */
BString &
BString_UnlockBuffer(BString *String, int32 length)
{
   return String->UnlockBuffer(length);
}


/*
 *  Method: BString::ToLower()
 *   Descr: 
 */
BString &
BString_ToLower(BString *String)
{
   return String->ToLower();
}


/*
 *  Method: BString::ToUpper()
 *   Descr: 
 */
BString &
BString_ToUpper(BString *String)
{
   return String->ToUpper();
}


/*
 *  Method: BString::Capitalize()
 *   Descr: 
 */
BString &
BString_Capitalize(BString *String)
{
   return String->Capitalize();
}


/*
 *  Method: BString::CapitalizeEachWord()
 *   Descr: 
 */
BString &
BString_CapitalizeEachWord_1
(BString *String)
{
   return String->CapitalizeEachWord();
}


/*
 *  Method: BString::CharacterEscape()
 *   Descr: 
 */
BString &
BString_CharacterEscape(BString *String, const char *original,
                         const char *setOfCharsToEscape,
                         char escapeWith)
{
   return String->CharacterEscape(original,
                         setOfCharsToEscape,
                         escapeWith);
}


/*
 *  Method: BString::CharacterEscape()
 *   Descr: 
 */
BString &
BString_CharacterEscape_1
(BString *String, const char *setOfCharsToEscape,
                         char escapeWith)
{
   return String->CharacterEscape(setOfCharsToEscape,
                         escapeWith);
}


/*
 *  Method: BString::CharacterDeescape()
 *   Descr: 
 */
BString &
BString_CharacterDeescape(BString *String, const char *original,
                           char escapeChar)
{
   return String->CharacterDeescape(original,
                           escapeChar);
}


/*
 *  Method: BString::CharacterDeescape()
 *   Descr: 
 */
BString &
BString_CharacterDeescape_1
(BString *String, char escapeChar)
{
   return String->CharacterDeescape(escapeChar);
}


/*
 *  Method: BString::operator<<()
 *   Descr: 
 */
/*BString &
BString_operator<<(BString *String, const char *)
{
   return String->operator<<();
}
*/

/*
 *  Method: BString::operator<<()
 *   Descr: 
 */
/*BString &
BString_operator<<_1
(BString *String, const BString &)
{
   return String->operator<<();
}
*/

/*
 *  Method: BString::operator<<()
 *   Descr: 
 */
/*BString &
BString_operator<<_2
(BString *String, char)
{
   return String->operator<<();
}
*/

/*
 *  Method: BString::operator<<()
 *   Descr: 
 */
/*BString &
BString_operator<<_3
(BString *String, int)
{
   return String->operator<<();
}
*/

/*
 *  Method: BString::operator<<()
 *   Descr: 
 */
/*BString &
BString_operator<<_4
(BString *String, unsigned int)
{
   return String->operator<<();
}

*/
/*
 *  Method: BString::operator<<()
 *   Descr: 
 */
/*BString &
BString_operator<<_5
(BString *String, uint32)
{
   return String->operator<<();
*/

/*
 *  Method: BString::operator<<()
 *   Descr: 
 */
/*BString &
BString_operator<<_6
(BString *String, int32)
{
   return String->operator<<();
}
*/

/*
 *  Method: BString::operator<<()
 *   Descr: 
 */
/*BString &
BString_operator<<_7
(BString *String, uint64)
{
   return String->operator<<();
}
*/

/*
 *  Method: BString::operator<<()
 *   Descr: 
 */
/*BString &
BString_operator<<_8
(BString *String, int64)
{
   return String->operator<<();
}
*/

/*
 *  Method: BString::operator<<()
 *   Descr: 
 */
/*BString &
BString_operator<<_9
(BString *String, float)
{
   return String->operator<<();
}
*/

/*
 *  Method: BString::_Init()
 *   Descr: 
 */
/*void
BString__Init(BString *String, const char *value,
               int32 lenght)
{
   String->_Init(value,lenght
               );
}
*/

/*
 *  Method: BString::_DoAssign()
 *   Descr: 
 */
/*void
BString__DoAssign(BString *String, const char *value,
                   int32 lenght)
{
   String->_DoAssign(value,lenght
                   );
}
*/

/*
 *  Method: BString::_DoAppend()
 *   Descr: 
 */
/*void
BString__DoAppend(BString *String, const char *,
                   int32)
{
   String->_DoAppend(,
                   );
}

*/
/*
 *  Method: BString::_GrowBy()
 *   Descr: 
 */
/*char *
BString__GrowBy(BString *String, int32)
{
   return String->_GrowBy();
}
*/

/*
 *  Method: BString::_OpenAtBy()
 *   Descr: 
 */
/*char *
BString__OpenAtBy(BString *String, int32,
                   int32)
{
   return String->_OpenAtBy(,
                   );
}
*/

/*
 *  Method: BString::_ShrinkAtBy()
 *   Descr: 
 */
/*char *
BString__ShrinkAtBy(BString *String, int32,
                     int32)
{
   return String->_ShrinkAtBy(,
                     );
}
*/

/*
 *  Method: BString::_DoPrepend()
 *   Descr: 
 */
/*void
BString__DoPrepend(BString *String, const char *,
                    int32)
{
   String->_DoPrepend(,
                    );
}
*/

/*
 *  Method: BString::_FindAfter()
 *   Descr: 
 */
/*int32
BString__FindAfter(BString *String, const char *,
                    int32,
                    int32) const
{
   return String->_FindAfter(,
                    ,
                    );
}
*/

/*
 *  Method: BString::_IFindAfter()
 *   Descr: 
 */
/*int32
BString__IFindAfter(BString *String, const char *,
                     int32,
                     int32) const
{
   return String->_IFindAfter(,
                     ,
                     );
}

*/
/*
 *  Method: BString::_ShortFindAfter()
 *   Descr: 
 */
/*int32
BString__ShortFindAfter(BString *String, const char *,
                         int32) const
{
   return String->_ShortFindAfter(,
                         );
}
*/

/*
 *  Method: BString::_FindBefore()
 *   Descr: 
 */
/*int32
BString__FindBefore(BString *String, const char *,
                     int32,
                     int32) const
{
   return String->_FindBefore(,
                     ,
                     );
}
*/

/*
 *  Method: BString::_IFindBefore()
 *   Descr: 
 */
/*int32
BString__IFindBefore(BString *String, const char *,
                      int32,
                      int32) const
{
   return String->_IFindBefore(,
                      ,
                      );
}
*/

/*
 *  Method: BString::_SetLength()
 *   Descr: 
 */
/*void
BString__SetLength(BString *String, int32)
{
   String->_SetLength();
}
*/

/*
 *  Method: BString::_SetUsingAsCString()
 *   Descr: 
 */
/*void
BString__SetUsingAsCString(BString *String, bool)
{
   String->_SetUsingAsCString();
}
*/

/*
 *  Method: BString::_AssertNotUsingAsCString()
 *   Descr: 
 */
/*void
BString__AssertNotUsingAsCString(BString *String) const
{
   String->_AssertNotUsingAsCString();
}
*/
#if defined(__cplusplus)
}
#endif

#endif /* _STRING_CPP_ */


