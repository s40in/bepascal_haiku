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
#ifndef _LIST_CPP_
#define _LIST_CPP_

#include "List.h"
#include <beobj.h>


#if defined(__cplusplus)
extern "C" {
#endif

/*
 *  Method: BList::BList()
 *   Descr: 
 */
TCPlusObject BList_Create( int32 itemsPerBlock)
{
	return new BList( itemsPerBlock);
}


/*
 *  Method: BList::BList()
 *   Descr: 
 */
/*TCPlusObject BList_Create_1
(TPasObject PasObject, const BList &)
{
	return new BPList(PasObject, );
}
*/

/*
 *  Method: BList::~BList()
 *   Descr: 
 */
void BList_Free(BList *List)
{
   delete List;
}


/*
 *  Method: BList::operator=()
 *   Descr: 
 */
/*BList &
BList_operator=(BList *List, const BList &from)
{
   return List->operator=(from);
}
*/

/*
 *  Method: BList::AddItem()
 *   Descr: 
 */
bool
BList_AddItem(BList *List, void *item)
{
   return List->AddItem(item);
}


/*
 *  Method: BList::AddItem()
 *   Descr: 
 */
bool
BList_AddItem_1
(BList *List, void *item,
               int32 atIndex)
{
   return List->AddItem(item,
               atIndex);
}


/*
 *  Method: BList::AddList()
 *   Descr: 
 */
bool
BList_AddList(BList *List, BList *newItems)
{
   return List->AddList(newItems);
}


/*
 *  Method: BList::AddList()
 *   Descr: 
 */
bool
BList_AddList_1
(BList *List, BList *newItems,
               int32 atIndex)
{
   return List->AddList(newItems,
               atIndex);
}


/*
 *  Method: BList::RemoveItem()
 *   Descr: 
 */
bool
BList_RemoveItem(BList *List, void *item)
{
   return List->RemoveItem(item);
}


/*
 *  Method: BList::RemoveItem()
 *   Descr: 
 */
void *
BList_RemoveItem_1
(BList *List, int32 index)
{
   return List->RemoveItem(index);
}


/*
 *  Method: BList::RemoveItems()
 *   Descr: 
 */
bool
BList_RemoveItems_2
(BList *List, int32 index,
                   int32 count)
{
   return List->RemoveItems(index,
                   count);
}


/*
 *  Method: BList::ReplaceItem()
 *   Descr: 
 */
bool
BList_ReplaceItem(BList *List, int32 index,
                   void *newItem)
{
   return List->ReplaceItem(index,
                   newItem);
}


/*
 *  Method: BList::MakeEmpty()
 *   Descr: 
 */
void
BList_MakeEmpty(BList *List)
{
   List->MakeEmpty();
}


/*
 *  Method: BList::SwapItems()
 *   Descr: 
 */
bool
BList_SwapItems(BList *List, int32 indexA,
                 int32 indexB)
{
   return List->SwapItems(indexA,
                 indexB);
}


/*
 *  Method: BList::MoveItem()
 *   Descr: 
 */
bool
BList_MoveItem(BList *List, int32 fromIndex,
                int32 toIndex)
{
   return List->MoveItem(fromIndex,
                toIndex);
}


/*
 *  Method: BList::ItemAt()
 *   Descr: 
 */
void *
BList_ItemAt(BList *List, int32 at)
{
   return List->ItemAt(at);
}


/*
 *  Method: BList::ItemAtFast()
 *   Descr: 
 */
void *
BList_ItemAtFast_1
(BList *List, int32 at) 
{
  return List->ItemAtFast(at);
}


/*
 *  Method: BList::FirstItem()
 *   Descr: 
 */
void *
BList_FirstItem(BList *List) 
{
   return List->FirstItem();
}


/*
 *  Method: BList::LastItem()
 *   Descr: 
 */
void *
BList_LastItem(BList *List) 
{
   return List->LastItem();
}


/*
 *  Method: BList::Items()
 *   Descr: 
 */
void *
BList_Items(BList *List) 
{
   return List->Items();
}


/*
 *  Method: BList::HasItem()
 *   Descr: 
 */
bool
BList_HasItem(BList *List, void *item) 
{
   return List->HasItem(item);
}


/*
 *  Method: BList::IndexOf()
 *   Descr: 
 */
int32
BList_IndexOf(BList *List, void *item) 
{
   return List->IndexOf(item);
}


/*
 *  Method: BList::CountItems()
 *   Descr: 
 */
int32
BList_CountItems(BList *List) 
{
   return List->CountItems();
}


/*
 *  Method: BList::IsEmpty()
 *   Descr: 
 */
bool
BList_IsEmpty(BList *List) 
{
   return List->IsEmpty();
}


/*
 *  Method: BList::_ReservedList1()
 *   Descr: 
 */
/*void
BList__ReservedList1(BList *List)
{
   List->_ReservedList1();
}
*/

/*
 *  Method: BList::_ReservedList2()
 *   Descr: 
 */
/*void
BList__ReservedList2(BList *List)
{
   List->_ReservedList2();
}
*/

/*
 *  Method: BList::Resize()
 *   Descr: 
 */
/*void
BList_Resize(BList *List, int32 count)
{
   List->Resize(count);
}
*/
#if defined(__cplusplus)
}
#endif

#endif /* _LIST_CPP_ */


