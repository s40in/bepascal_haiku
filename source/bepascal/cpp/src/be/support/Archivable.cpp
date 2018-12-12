/*  BePascal - A pascal wrapper around the BeOS API
    Copyright (C) 2002 Olivier Coursiere

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

#ifndef _ARCHIVABLE_CPP_
#define _ARCHIVABLE_CPP_

#include <Archivable.h>

#include <message.h>
#include <archivable.h>
#include <beobj.h>

typedef TCPlusObject (*BArchivable_Instantiate_hook) (BMessage *from);
typedef status_t (*BArchivable_Archive_hook)(TPasObject PasObject, BMessage *into, bool deep);

#if defined(__cplusplus)
extern "C" {
#endif
 
BArchivable_Instantiate_hook Archivable_Instantiate_hook;
BArchivable_Archive_hook Archivable_Archive_hook;

#if defined(__cplusplus)
}
#endif

BPArchivable::BPArchivable(TPasObject PasObject)
	: BArchivable(), BPasObject(PasObject)
{

}

BPArchivable::BPArchivable(TPasObject PasObject, BMessage *from)
	: BArchivable(from), BPasObject(PasObject)
{

}

BPArchivable::~BPArchivable(void)
{
}

status_t BPArchivable::Archive(BMessage *into, bool deep) const 
{
	if (GetPasObject() != NULL)
	{
		// Demande l'archivage de l'objet Pascal
		return BArchivable::Archive(into, deep);
	} 
	else
	{
		into->AddString("class", "BPArchivable");
		return BArchivable::Archive(into, deep);
	}
}

status_t BPArchivable::ArchiveFromPascal(BMessage *into, bool deep)
{
	into->AddString("class", "BPArchivable");
	return BArchivable::Archive(into, deep);
}

BArchivable	*BPArchivable::Instantiate(BMessage *from)
{
	// Appel à la fonction de création de l'objet pascal correspondant 
	// au contenu du message 
//	return new BPArchivable(<pascal_func>, from);
	if (validate_instantiation(from, "BPArchivable"))
		return reinterpret_cast<BPArchivable*>(Archivable_Instantiate_hook(from));
	return NULL;
}

#if defined(__cplusplus)
extern "C" {
#endif

TCPlusObject BArchivable_Create_1(TPasObject PasObject)
{
	return new BPArchivable(PasObject);
}

TCPlusObject BArchivable_Create_2(TPasObject PasObject, TCPlusObject from)
{
	return new BPArchivable(PasObject, reinterpret_cast<BMessage*>(from));
}

status_t BArchivable_Archive(TCPlusObject archivable, TCPlusObject into, bool deep = true)
{
		// On ajoute BPArchivable dans l'entrée class du message 
		// pour que l'API BeOS appelle BPArchivable pour instancier
		// les objets pascal qui supportent BArchivable.
	reinterpret_cast<BMessage*>(into)->AddString("class", "BPArchivable");
	return reinterpret_cast<BPArchivable*>(archivable)->ArchiveFromPascal(reinterpret_cast<BMessage*>(into), deep);
}

#if defined(__cplusplus)
}
#endif

#endif /* _ARCHIVABLE_CPP_ */
