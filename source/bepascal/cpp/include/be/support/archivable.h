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

#ifndef _ARCHIVABLE_H_
#define _ARCHIVABLE_H_

#include <Archivable.h>

#include <message.h>

#include <beobj.h>


class _EXPORT BPArchivable : public BArchivable, private BPasObject
{
	public:
		BPArchivable(TPasObject PasObject);
		BPArchivable(TPasObject PasObject, BMessage *from);
		~BPArchivable(void);
virtual	status_t	Archive(BMessage *into, bool deep = true) const;
virtual status_t	ArchiveFromPascal(BMessage *into, bool deep = true);
static	BArchivable	*Instantiate(BMessage *from);
	
	private:
};

#endif /* _ARCHIVABLE_H_ */
