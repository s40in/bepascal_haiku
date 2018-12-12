/*  BePascal - A pascal wrapper around the BeOS API
    Copyright (C) 2003 Olivier Coursiere
                       Eric Jourde
                       Oscar Lesta

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

#ifndef	_BITMAP_CPP
#define	_BITMAP_CPP

#include "Bitmap.h"

#include "view.h"
#include <archivable.h>
#include <beobj.h>

/*----------------------------------------------------------------*/
/*----- BBitmap class --------------------------------------------*/
class BPBitmap : public BBitmap, public BPArchivable
{
public:
					BPBitmap(TPasObject PasObject,
							BRect bounds,
							uint32 flags,
							color_space depth,
							int32 bytesPerRow=B_ANY_BYTES_PER_ROW,
							screen_id screenID=B_MAIN_SCREEN_ID);
					BPBitmap(TPasObject PasObject,
							BRect bounds,
							color_space depth,
							bool accepts_views = false,
							bool need_contiguous = false);
					BPBitmap(TPasObject PasObject,
							const BBitmap* source,
							bool accepts_views = false,
							bool need_contiguous = false);
					BPBitmap(TPasObject PasObject, BMessage *data);

//virtual				~BBitmap();

/* Archiving */
static	BArchivable	*Instantiate(BMessage *data);
//virtual	status_t	Archive(BMessage *data, bool deep = true) const;

		status_t	InitCheck() const;
		bool		IsValid() const;

		status_t	LockBits(uint32 *state=NULL);
		void		UnlockBits();

		area_id		Area() const;
		void *		Bits() const;
		int32		BitsLength() const;
		int32		BytesPerRow() const;
		color_space	ColorSpace() const;
		BRect		Bounds() const;

		void		SetBits(const void *data,
							int32 length,
							int32 offset,
							color_space cs);

		status_t	GetOverlayRestrictions(overlay_restrictions *restrict) const;

/* to mimic a BWindow */
virtual	void		AddChild(BView *view);
virtual	bool		RemoveChild(BView *view);
		int32		CountChildren() const;
		BView		*ChildAt(int32 index) const;
		BView		*FindView(const char *view_name) const;
		BView		*FindView(BPoint point) const;
		bool		Lock();
		void		Unlock();
		bool		IsLocked() const;

virtual status_t	Perform(perform_code d, void *arg);

/*----- Private or reserved -----------------------------------------*/
private:
/*
friend class BView;
friend class BApplication;
friend void  _IMPEXP_BE _get_screen_bitmap_(BBitmap *,BRect,bool);

virtual	void		_ReservedBitmap1();
virtual	void		_ReservedBitmap2();
virtual	void		_ReservedBitmap3();

		BBitmap(const BBitmap &);
		BBitmap		&operator=(const BBitmap &);

		char		*get_shared_pointer() const;
		void		set_bits(long offset, char *data, long length);
		void		set_bits_24(long offset, char *data, long length);
		void		set_bits_24_local_gray(long offset, char *data, long len);
		void		set_bits_24_local_256(long offset, uchar *data, long len);
		void		set_bits_24_24(long offset, char *data, long length,
									bool big_endian_dst);
		void		set_bits_8_24(long offset, char *data, long length,
									bool big_endian_dst);
		void		set_bits_gray_24(long offset, char *data, long length,
									bool big_endian_dst);
		int32		get_server_token() const;
		void 		InitObject(	BRect frame, color_space depth,
								uint32 flags, int32 bytesPerRow, screen_id screenID);
		void		AssertPtr();

		void		*fBasePtr;
		int32		fSize;
		color_space	fType;
		BRect		fBound;
		int32		fRowBytes;
		BWindow		*fWindow;
		int32		fServerToken;
		int32		fToken;
		uint8		unused;
		area_id		fArea;
		area_id		fOrigArea;
		uint32		fFlags;
		status_t	fInitError;
*/
};
/*-------------------------------------------------------------*/
/*-------------------------------------------------------------*/

BPBitmap::BPBitmap(TPasObject PasObject,
					BRect bounds,
					uint32 flags,
					color_space depth,
					int32 bytesPerRow,
					screen_id screenID)
			: BBitmap(bounds, flags, depth, bytesPerRow, screenID),
			BPArchivable(PasObject)//,
//			BPasObject(PasObject)
{

}

BPBitmap::BPBitmap(TPasObject PasObject,
					BRect bounds,
					color_space depth,
					bool accepts_views,
					bool need_contiguous)
			: BBitmap(bounds, depth, accepts_views, need_contiguous),
			BPArchivable(PasObject)//,
//			BPasObject(PasObject)
{

}

BPBitmap::BPBitmap(TPasObject PasObject,
					const BBitmap* source,
					bool accepts_views,
					bool need_contiguous)
			: BBitmap(source, accepts_views, need_contiguous),
			BPArchivable(PasObject)//,
//			BPasObject(PasObject)
{

}

BPBitmap::BPBitmap(TPasObject PasObject, BMessage *data)
			: BBitmap(data),
			BPArchivable(PasObject)//,
//			BPasObject(PasObject)
{

}

status_t
BPBitmap::InitCheck(void) const
{
	return BBitmap::InitCheck();
}

bool
BPBitmap::IsValid(void) const
{
	return BBitmap::IsValid();
}

status_t
BPBitmap::LockBits(uint32 *state)
{
	return BBitmap::LockBits(state);
}

void
BPBitmap::UnlockBits(void)
{
	BBitmap::UnlockBits();
}

area_id
BPBitmap::Area(void) const
{
	return BBitmap::Area();
}

void *
BPBitmap::Bits(void) const
{
	return BBitmap::Bits();
}

int32
BPBitmap::BitsLength(void) const
{
	return BBitmap::BitsLength();
}

int32
BPBitmap::BytesPerRow(void) const
{
	return BBitmap::BytesPerRow();
}

color_space
BPBitmap::ColorSpace(void) const
{
	return BBitmap::ColorSpace();
}

BRect
BPBitmap::Bounds(void) const
{
	return BBitmap::Bounds();
}

void
BPBitmap::SetBits(const void *data, int32 length, int32 offset, color_space cs)
{
	BBitmap::SetBits(data, length, offset, cs);
}

status_t
BPBitmap::GetOverlayRestrictions(overlay_restrictions *restrict) const
{
	return BBitmap::GetOverlayRestrictions(restrict);
}

void
BPBitmap::AddChild(BView *view)
{
	BBitmap::AddChild(view);
}

bool
BPBitmap::RemoveChild(BView *view)
{
	BBitmap::RemoveChild(view);
}

int32
BPBitmap::CountChildren(void) const
{
	return BBitmap::CountChildren();
}

bool
BPBitmap::Lock(void)
{
	return BBitmap::Lock();
}

void
BPBitmap::Unlock(void)
{
	BBitmap::Unlock();
}

bool
BPBitmap::IsLocked(void) const
{
	return BBitmap::IsLocked();
}

#ifndef __HAIKU__
status_t
BPBitmap::Perform(perform_code d, void *arg)
{
	return BBitmap::Perform(d, arg);
}
#endif

/*-------------------------------------------------------------*/

#if defined(__cplusplus)
extern "C" {
#endif

/*
 *  Method: BBitmap::BBitmap
 *  Descr:
 */
TCPlusObject BBitmap_Create(TPasObject PasObject, BRect bounds, uint32 flags, color_space depth, int32 bytesPerRow, screen_id screenID)
{
	return new BPBitmap(PasObject, bounds, flags, depth, bytesPerRow, screenID);
}

/*
 *  Method: BBitmap::BBitmap
 *  Descr:
 */
TCPlusObject BBitmap_Create_1
(TPasObject PasObject, BRect bounds, color_space depth, bool accepts_views, bool need_contiguous)
{
	return new BPBitmap(PasObject, bounds, depth, accepts_views, need_contiguous);
}


/*
 *  Method: BBitmap::BBitmap
 *  Descr:
 */
TCPlusObject BBitmap_Create_2
(TPasObject PasObject, const BBitmap *source, bool accepts_views, bool need_contiguous)
{
	return new BPBitmap(PasObject, source, accepts_views, need_contiguous);
}


/*  BBitmap(BMessage *data);
 *  Method: BBitmap::BBitmap
 *  Descr:
 */
TCPlusObject BBitmap_Create_3(TPasObject PasObject, BMessage *data)
{
	return new BPBitmap(PasObject, data);
}


/*
 *  Method: BBitmap::~BBitmap
 *  Descr:
 */
void BBitmap_Free(BBitmap *Bitmap)
{
   delete Bitmap;
}


/*
 *  Method: BBitmap::Instantiate
 *  Descr:
 */
BArchivable *
BBitmap_Instantiate(BBitmap *Bitmap, BMessage *data)
{
   return Bitmap->Instantiate(data);
}


/*
 *  Method: BBitmap::Archive
 *  Descr:
 */
status_t
BBitmap_Archive(BBitmap *Bitmap, BMessage *data, bool deep)
{
   return Bitmap->Archive(data, deep);
}


/*
 *  Method: BBitmap::InitCheck
 *  Descr:
 */
status_t
BBitmap_InitCheck(BBitmap *Bitmap)
{
   return Bitmap->InitCheck();
}


/*
 *  Method: BBitmap::IsValid
 *  Descr:
 */
bool
BBitmap_IsValid(BBitmap *Bitmap)
{
   return Bitmap->IsValid();
}


/*
 *  Method: BBitmap::LockBits
 *  Descr:
 */
status_t
BBitmap_LockBits(BBitmap *Bitmap, uint32 *state)
{
   return Bitmap->LockBits(state);
}


/*
 *  Method: BBitmap::UnlockBits
 *  Descr:
 */
void
BBitmap_UnlockBits(BBitmap *Bitmap)
{
   Bitmap->UnlockBits();
}


/*
 *  Method: BBitmap::Area
 *  Descr:
 */
area_id
BBitmap_Area(BBitmap *Bitmap)
{
   return Bitmap->Area();
}


/*
 *  Method: BBitmap::Bits
 *  Descr:
 */
void *
BBitmap_Bits(BBitmap *Bitmap)
{
   Bitmap->Bits();
}


/*
 *  Method: BBitmap::BitsLength
 *  Descr:
 */
int32
BBitmap_BitsLength(BBitmap *Bitmap)
{
   return Bitmap->BitsLength();
}


/*
 *  Method: BBitmap::BytesPerRow
 *  Descr:
 */
int32
BBitmap_BytesPerRow(BBitmap *Bitmap)
{
   return Bitmap->BytesPerRow();
}


/*
 *  Method: BBitmap::ColorSpace
 *  Descr:
 */
color_space
BBitmap_ColorSpace(BBitmap *Bitmap)
{
   return Bitmap->ColorSpace();
}


/*
 *  Method: BBitmap::Bounds
 *  Descr:
 */
BRect
BBitmap_Bounds(BBitmap *Bitmap)
{
   return Bitmap->Bounds();
}


/*
 *  Method: BBitmap::SetBits
 *  Descr:
 */
void
BBitmap_SetBits(BBitmap *Bitmap, const void *data, int32 length, int32 offset, color_space cs)
{
   Bitmap->SetBits(data, length, offset, cs);
}


/*
 *  Method: BBitmap::GetOverlayRestrictions
 *  Descr:
 */
status_t
BBitmap_GetOverlayRestrictions(BBitmap *Bitmap, overlay_restrictions *restrict)
{
   return Bitmap->GetOverlayRestrictions(restrict);
}


/*
 *  Method: BBitmap::AddChild
 *  Descr:
 */
void
BBitmap_AddChild(BBitmap *Bitmap, BView *view)
{
   Bitmap->AddChild(view);
}


/*
 *  Method: BBitmap::RemoveChild
 *  Descr:
 */
bool
BBitmap_RemoveChild(BBitmap *Bitmap, BView *view)
{
   return Bitmap->RemoveChild(view);
}


/*
 *  Method: BBitmap::CountChildren
 *  Descr:
 */
int32
BBitmap_CountChildren(BBitmap *Bitmap)
{
   return Bitmap->CountChildren();
}


/*
 *  Method: BBitmap::ChildAt
 *  Descr:
 */
BView *
BBitmap_ChildAt(BBitmap *Bitmap, int32 index)
{
   return Bitmap->ChildAt(index);
}


/*
 *  Method: BBitmap::FindView
 *  Descr:
 */
BView *
BBitmap_FindView(BBitmap *Bitmap, const char *view_name)
{
   return Bitmap->FindView(view_name);
}


/*
 *  Method: BBitmap::FindView
 *  Descr:
 */
BView *
BBitmap_FindView_1(BBitmap *Bitmap, BPoint point)
{
   return Bitmap->FindView(point);
}


/*
 *  Method: BBitmap::Lock
 * Descr:
 */
bool
BBitmap_Lock(BBitmap *Bitmap)
{
   return Bitmap->Lock();
}


/*
 *  Method: BBitmap::Unlock
 *  Descr:
 */

void
BBitmap_Unlock(BBitmap *Bitmap)
{
   Bitmap->Unlock();
}


/*
 *  Method: BBitmap::IsLocked
 *  Descr:
 */

bool
BBitmap_IsLocked(BBitmap *Bitmap)
{
   return Bitmap->IsLocked();
}


/*
 *  Method: BBitmap::Perform
 *  Descr:
 */
#ifndef __HAIKU__
status_t
BBitmap_Perform(BBitmap *Bitmap, perform_code d, void *arg)
{
   return Bitmap->Perform(d, arg);
}
#endif

/*
 *  Method: BBitmap::_ReservedBitmap1
 *  Descr:
 */
/*
void
BBitmap__ReservedBitmap1(BBitmap *Bitmap)
{
   Bitmap->_ReservedBitmap1();
}
*/

/*
 *  Method: BBitmap::_ReservedBitmap2
 *  Descr:
 */
/*
void
BBitmap__ReservedBitmap2(BBitmap *Bitmap)
{
   Bitmap->_ReservedBitmap2();
}
*/

/*
 *  Method: BBitmap::_ReservedBitmap3
 *  Descr:
 */
/*
void
BBitmap__ReservedBitmap3(BBitmap *Bitmap)
{
   Bitmap->_ReservedBitmap3();
}
*/

/*
 *  Method: BBitmap::operator=
 *  Descr:
 */
/*
BBitmap &
BBitmap_operator=(BBitmap *Bitmap, const BBitmap &)
{
   return Bitmap->operator=();
}
*/

/*
 *  Method: BBitmap::get_shared_pointer
 *  Descr:
 */
/*
char *
BBitmap_get_shared_pointer(BBitmap *Bitmap) const
{
   return Bitmap->get_shared_pointer();
}
*/

/*
 *  Method: BBitmap::set_bits
 *  Descr:
 */
/*
void
BBitmap_set_bits(BBitmap *Bitmap, long offset, char *data, long length)
{
   Bitmap->set_bits(offset, data, length);
}
*/

/*
 *  Method: BBitmap::set_bits_24
 *  Descr:
 */
/*
void
BBitmap_set_bits_24_1
(BBitmap *Bitmap, long offset, char *data, long length)
{
   Bitmap->set_bits_24(offset, data, length);
}
*/

/*
 *  Method: BBitmap::set_bits_24_local_gray
 *  Descr:
 */
/*
void
BBitmap_set_bits_24_local_gray_2
(BBitmap *Bitmap, long offset, char *data, long len)
{
   Bitmap->set_bits_24_local_gray(offset, data, len);
}
*/

/*
 *  Method: BBitmap::set_bits_24_local_256
 *  Descr:
 */
/*
void
BBitmap_set_bits_24_local_256(BBitmap *Bitmap, long offset, uchar *data, long len)
{
   Bitmap->set_bits_24_local_256(offset, data, len);
}
*/

/*
 *  Method: BBitmap::set_bits_24_24
 *  Descr:
 */
/*
void
BBitmap_set_bits_24_24(BBitmap *Bitmap, long offset, char *data, long length, bool big_endian_dst)
{
   Bitmap->set_bits_24_24(offset, data, length, big_endian_dst);
}
*/

/*
 *  Method: BBitmap::set_bits_8_24
 *  Descr:
 */
/*
void
BBitmap_set_bits_8_24(BBitmap *Bitmap, long offset, char *data, long length, bool big_endian_dst)
{
   Bitmap->set_bits_8_24(offset, data, length, big_endian_dst);
}
*/

/*
 *  Method: BBitmap::set_bits_gray_24
 *  Descr:
 */
/*
void
BBitmap_set_bits_gray_24(BBitmap *Bitmap, long offset, char *data, long length, bool big_endian_dst)
{
   Bitmap->set_bits_gray_24(offset, data, length, big_endian_dst);
}
*/

/*
 *  Method: BBitmap::get_server_token
 *  Descr:
 */
/*
int32
BBitmap_get_server_token(BBitmap *Bitmap) const
{
   return Bitmap->get_server_token();
}
*/

/*
 *  Method: BBitmap::InitObject
 *  Descr:
 */
/*
void
BBitmap_InitObject(BBitmap *Bitmap, BRect frame, color_space depth, uint32 flags, int32 bytesPerRow, screen_id screenID)
{
   Bitmap->InitObject(frame, depth, flags, bytesPerRow, screenID);
}
*/

/*
 *  Method: BBitmap::AssertPtr
 *  Descr:
 */
/*
void
BBitmap_AssertPtr(BBitmap *Bitmap)
{
   Bitmap->AssertPtr();
}
*/

#if defined(__cplusplus)
}
#endif

#endif /* _BITMAP_H */
