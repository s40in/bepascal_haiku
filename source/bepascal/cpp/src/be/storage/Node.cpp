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


#ifndef _NODE_CPP_
#define _NODE_CPP_

/***********************************************************************
 * AUTHOR:  <baron>
 *   FILE: Entry.cpp
 *   DATE: Wed Jul  2 22:28:34 2003
 *  DESCR: 
 ***********************************************************************/
#include "Node.h"
#include <beobj.h>



class BPNode : public BNode, public virtual BPasObject {
public:
							BPNode(TPasObject PasObject);
							BPNode(TPasObject PasObject,const entry_ref *ref);
							BPNode(TPasObject PasObject,const BEntry *entry);
							BPNode(TPasObject PasObject,const char *path);
							BPNode(TPasObject PasObject,const BDirectory *dir, const char *path);
							BPNode(TPasObject PasObject,const BNode &node);

	virtual					~BPNode();
};


BPNode::BPNode(TPasObject PasObject)
		:BNode(),
		BPasObject(PasObject)
{
}
BPNode::BPNode(TPasObject PasObject,const entry_ref *ref)
		:BNode(ref),
		BPasObject(PasObject)
{
}
BPNode::BPNode(TPasObject PasObject,const BEntry *entry)
		:BNode(entry),
		BPasObject(PasObject)
{
}
BPNode::BPNode(TPasObject PasObject,const char *path)
		:BNode(path),
		BPasObject(PasObject)
{
}
BPNode::BPNode(TPasObject PasObject,const BDirectory *dir, const char *path)
		:BNode(dir,path),
		BPasObject(PasObject)
{
}
BPNode::BPNode(TPasObject PasObject,const BNode &node)
		:BNode(node),
		BPasObject(PasObject)
{
}
	
BPNode::~BPNode()
{
}

#if defined(__cplusplus)
extern "C" {
#endif



/***********************************************************************
 *  Method: BNode::BNode
 *  Params: 
 * Effects: 
 ***********************************************************************/
TCPlusObject BNode_Create(TPasObject PasObject)
{
	return new BPNode(PasObject);
}


/***********************************************************************
 *  Method: BNode::BNode
 *  Params: const entry_ref *ref
 * Effects: 
 ***********************************************************************/
TCPlusObject BNode_Create_1
(TPasObject PasObject, const entry_ref *ref)
{
	return new BPNode(PasObject, ref);
}


/***********************************************************************
 *  Method: BNode::BNode
 *  Params: const BEntry *entry
 * Effects: 
 ***********************************************************************/
TCPlusObject BNode_Create_2
(TPasObject PasObject, const BEntry *entry)
{
	return new BPNode(PasObject, entry);
}


/***********************************************************************
 *  Method: BNode::BNode
 *  Params: const char *path
 * Effects: 
 ***********************************************************************/
TCPlusObject BNode_Create_3
(TPasObject PasObject, const char *path)
{
	return new BPNode(PasObject, path);
}


/***********************************************************************
 *  Method: BNode::BNode
 *  Params: const BDirectory *dir, const char *path
 * Effects: 
 ***********************************************************************/
TCPlusObject BNode_Create_4
(TPasObject PasObject, const BDirectory *dir, const char *path)
{
	return new BPNode(PasObject, dir, path);
}


/***********************************************************************
 *  Method: BNode::BNode
 *  Params: const BNode &node
 * Effects: 
 ***********************************************************************/
TCPlusObject BNode_Create_5
(TPasObject PasObject, const BNode &node)
{
	return new BPNode(PasObject, node);
}


/***********************************************************************
 *  Method: BNode::~BNode
 *  Params: 
 * Effects: 
 ***********************************************************************/
void BNode_Free(BNode *Node)
{
   delete Node;
}


/***********************************************************************
 *  Method: BNode::InitCheck
 *  Params: 
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BNode_InitCheck(BNode *Node) 
{
   return Node->InitCheck();
}


/***********************************************************************
 *  Method: BNode::GetStat
 *  Params: struct stat *st
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BNode_GetStat(BNode *Node, struct stat *st) 
{
   return Node->GetStat(st);
}


/***********************************************************************
 *  Method: BNode::SetTo
 *  Params: const entry_ref *ref
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BNode_SetTo(BNode *Node, const entry_ref *ref)
{
   return Node->SetTo(ref);
}


/***********************************************************************
 *  Method: BNode::SetTo
 *  Params: const BEntry *entry
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BNode_SetTo_1
(BNode *Node, const BEntry *entry)
{
   return Node->SetTo(entry);
}


/***********************************************************************
 *  Method: BNode::SetTo
 *  Params: const char *path
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BNode_SetTo_2
(BNode *Node, const char *path)
{
   return Node->SetTo(path);
}


/***********************************************************************
 *  Method: BNode::SetTo
 *  Params: const BDirectory *dir, const char *path
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BNode_SetTo_3
(BNode *Node, const BDirectory *dir, const char *path)
{
   return Node->SetTo(dir, path);
}


/***********************************************************************
 *  Method: BNode::Unset
 *  Params: 
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BNode_Unset(BNode *Node)
{
   Node->Unset();
}


/***********************************************************************
 *  Method: BNode::Lock
 *  Params: 
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BNode_Lock(BNode *Node)
{
   return Node->Lock();
}


/***********************************************************************
 *  Method: BNode::Unlock
 *  Params: 
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BNode_Unlock(BNode *Node)
{
   return Node->Unlock();
}


/***********************************************************************
 *  Method: BNode::Sync
 *  Params: 
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BNode_Sync(BNode *Node)
{
   return Node->Sync();
}


/***********************************************************************
 *  Method: BNode::WriteAttr
 *  Params: const char *attr, type_code type, off_t off, const void *buf, size_t l
 * Returns: ssize_t
 * Effects: 
 ***********************************************************************/
ssize_t
BNode_WriteAttr(BNode *Node, const char *attr, type_code type, off_t off, const void *buf, size_t l)
{
   return Node->WriteAttr(attr, type, off, buf, l);
}


/***********************************************************************
 *  Method: BNode::ReadAttr
 *  Params: const char *attr, type_code type, off_t off, void *buf, size_t l
 * Returns: ssize_t
 * Effects: 
 ***********************************************************************/
ssize_t
BNode_ReadAttr(BNode *Node, const char *attr, type_code type, off_t off, void *buf, size_t l) 
{
   return Node->ReadAttr(attr, type, off, buf, l);
}


/***********************************************************************
 *  Method: BNode::RemoveAttr
 *  Params: const char *attr
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BNode_RemoveAttr(BNode *Node, const char *attr)
{
   return Node->RemoveAttr(attr);
}


/***********************************************************************
 *  Method: BNode::RenameAttr
 *  Params: const char *oldname, const char *newname
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BNode_RenameAttr(BNode *Node, const char *oldname, const char *newname)
{
   return Node->RenameAttr(oldname, newname);
}


/***********************************************************************
 *  Method: BNode::GetAttrInfo
 *  Params: const char *attr, struct attr_info *buf
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BNode_GetAttrInfo(BNode *Node, const char *attr, struct attr_info *buf) 
{
   return Node->GetAttrInfo(attr, buf);
}


/***********************************************************************
 *  Method: BNode::GetNextAttrName
 *  Params: char *buf
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BNode_GetNextAttrName(BNode *Node, char *buf)
{
   return Node->GetNextAttrName(buf);
}


/***********************************************************************
 *  Method: BNode::RewindAttrs
 *  Params: 
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BNode_RewindAttrs(BNode *Node)
{
   return Node->RewindAttrs();
}


/***********************************************************************
 *  Method: BNode::WriteAttrString
 *  Params: const char *attr, const BString *
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BNode_WriteAttrString(BNode *Node, const char *attr, const BString *a)
{
   return Node->WriteAttrString(attr, a);
}


/***********************************************************************
 *  Method: BNode::ReadAttrString
 *  Params: const char *attr, BString *result
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BNode_ReadAttrString(BNode *Node, const char *attr, BString *result) 
{
   return Node->ReadAttrString(attr, result);
}



/***********************************************************************
 *  Method: BNode::Dup
 *  Params: 
 * Returns: int
 * Effects: 
 ***********************************************************************/
int
BNode_Dup(BNode *Node)
{
   return Node->Dup();
}




#if defined(__cplusplus)
}
#endif

#endif /* _NODE_CPP_ */
