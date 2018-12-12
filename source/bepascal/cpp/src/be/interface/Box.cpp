/*  BePascal - A pascal wrapper around the BeOS API
    Copyright (C) 2003	Olivier Coursiere
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

#ifndef _BOX_CPP_
#define _BOX_CPP_

#include "Box.h"

#include "view.h"
#include <beobj.h>


class BPBox : public BBox, public BPView
{
public:
	BPBox(TPasObject PasObject,
			BRect bounds,
			const char *name = NULL,
			uint32 resizeFlags = B_FOLLOW_LEFT | B_FOLLOW_TOP,
			uint32 flags = B_WILL_DRAW | B_FRAME_EVENTS | B_NAVIGABLE_JUMP,
			border_style border = B_FANCY_BORDER);

//	virtual	~BBox(void);

/* Archiving */
	BPBox(TPasObject PasObject, BMessage *data);
						
	static	BArchivable	*Instantiate(BMessage *data);
//	virtual	status_t	Archive(BMessage *data, bool deep = true) const;

/* BBox guts */
	virtual	void	SetBorder(border_style style);
	border_style	Border() const;

	void			SetLabel(const char *label);
	status_t		SetLabel(BView *view_label);

	const char		*Label() const;
	BView			*LabelView() const;

	virtual	void	Draw(BRect bounds);
	virtual	void	AttachedToWindow();
	virtual	void	DetachedFromWindow();
	virtual	void	AllAttached();
	virtual	void	AllDetached();
	virtual void	FrameResized(float new_width, float new_height);
	virtual void	MessageReceived(BMessage *msg);
	virtual	void	MouseDown(BPoint pt);
	virtual	void	MouseUp(BPoint pt);
	virtual	void	WindowActivated(bool state);
	virtual	void	MouseMoved(BPoint pt, uint32 code, const BMessage *msg);
	virtual	void	FrameMoved(BPoint new_position);
/*
	virtual BHandler	*ResolveSpecifier(BMessage *msg,
										int32 index,
										BMessage *specifier,
										int32 form,
										const char *property);
*/
	virtual void		ResizeToPreferred();
	virtual void		GetPreferredSize(float *width, float *height);
//	virtual void		MakeFocus(bool state = true);
//	virtual status_t	GetSupportedSuites(BMessage *data);

/*----- Private or reserved -----------------------------------------*/

//	virtual status_t	Perform(perform_code d, void *arg);

private:
/*
	virtual	void	_ReservedBox1();
	virtual	void	_ReservedBox2();

	BBox	&operator=(const BBox &);

	void	InitObject(BMessage *data = NULL);
	void	DrawPlain();
	void	DrawFancy();
	void	ClearAnyLabel();

	char			*fLabel;
	BRect			fBounds;
	border_style	fStyle;
	BView			*fLabelView;
	uint32			_reserved[1];
*/
};

BPBox::BPBox(TPasObject PasObject, 
			BRect bounds,
			const char *name,
			uint32 resizeFlags,
			uint32 flags,
			border_style border)
		:
		BBox(bounds, name, resizeFlags, flags, border),
		BPView(PasObject, bounds, name, resizeFlags, flags),
		BPHandler(PasObject, name)
//		BPasObject(PasObject)
{

}

BPBox::BPBox(TPasObject PasObject, BMessage *archive)
		:
		BBox(archive),
		BPView(PasObject, archive),
		BPHandler(PasObject, archive)
//		BPasObject(PasObject)
{

}

void
BPBox::SetBorder(border_style style)
{
	BBox::SetBorder(style);
}


border_style
BPBox::Border(void) const
{
	return BBox::Border();
}

void
BPBox::SetLabel(const char *label)
{
	BBox::SetLabel(label);
}

status_t
BPBox::SetLabel(BView *view_label)
{
	return BBox::SetLabel(view_label);
}

void
BPBox::Draw(BRect bounds)
{
	BBox::Draw(bounds);
}

void
BPBox::AttachedToWindow(void)
{
	BBox::AttachedToWindow();
}

void
BPBox::DetachedFromWindow(void)
{
	BBox::DetachedFromWindow();
}

void
BPBox::AllAttached(void)
{
	BBox::AllAttached();
}

void
BPBox::AllDetached(void)
{
	BBox::AllDetached();
}

void
BPBox::FrameResized(float new_width, float new_height)
{
	BBox::FrameResized(new_width, new_height);
}

void
BPBox::MessageReceived(BMessage *msg)
{
	BBox::MessageReceived(msg);
}

void
BPBox::MouseDown(BPoint pt)
{
	BBox::MouseDown(pt);
}

void
BPBox::MouseUp(BPoint pt)
{
	BBox::MouseUp(pt);
}

void
BPBox::WindowActivated(bool state)
{
	BBox::WindowActivated(state);
}

void
BPBox::MouseMoved(BPoint pt, uint32 code, const BMessage *msg)
{
	BBox::MouseMoved(pt, code, msg);
}

void
BPBox::FrameMoved(BPoint new_position)
{
	BBox::FrameMoved(new_position);
}

void
BPBox::ResizeToPreferred(void)
{
	BBox::ResizeToPreferred();
}

void
BPBox::GetPreferredSize(float *width, float *height)
{
	BBox::GetPreferredSize(width, height);
}


#if defined(__cplusplus)
extern "C" {
#endif

/***********************************************************************
 * AUTHOR: nobody <baron>
 *   FILE: Box.cpp
 *   DATE: Tue Jan 21 00:15:28 2003
 *  DESCR: 
 ***********************************************************************/

/*
 *  Method: BBox::~BBox()
 *   Descr: 
 */

void BBox_Free(BBox *Box)
{
   delete Box;
}

/*
 *  Method: BBox::BBox()
 *   Descr:
 */

TCPlusObject BBox_Create(TPasObject PasObject, BRect frame,
							const char *name,
							uint32 resizeMask,
							uint32 flags,
							border_style border)
{
	return new BPBox(PasObject,
					frame,
					name,
					resizeMask,
					flags,
					border);
}

/*
 *  Method: BBox::BBox()
 *   Descr:
 */

TCPlusObject BBox_Create_1(TPasObject PasObject, BMessage *data)
{
	return new BPBox(PasObject, data);
}

/*
 *  Method: BBox::Instantiate()
 *   Descr:
 */
BArchivable *
BBox_Instantiate(BBox *Box, BMessage *data)
{
   return Box->Instantiate(data);
}


/*
 *  Method: BBox::Archive()
 *   Descr:
 */
status_t
BBox_Archive(BBox *Box, BMessage *data, bool deep)
{
   return Box->Archive(data, deep);
}


/*
 *  Method: BBox::SetBorder()
 *   Descr: 
 */
void
BBox_SetBorder(BBox *Box, border_style style)
{
   Box->SetBorder(style);
}


/*
 *  Method: BBox::Border()
 *   Descr: 
 */
border_style
BBox_Border(BBox *Box)
{
   return Box->Border();
}


/*
 *  Method: BBox::SetLabel()
 *   Descr: 
 */
void
BBox_SetLabel(BBox *Box, const char *label)
{
   Box->SetLabel(label);
}


/*
 *  Method: BBox::SetLabel()
 *   Descr: 
 */
status_t
BBox_SetLabel_1
(BBox *Box, BView *view_label)
{
   return Box->SetLabel(view_label);
}


/*
 *  Method: BBox::Label()
 *   Descr: 
 */
const char *
BBox_Label(BBox *Box)
{
   return Box->Label();
}


/*
 *  Method: BBox::LabelView()
 *   Descr: 
 */
BView *
BBox_LabelView_1(BBox *Box)
{
   return Box->LabelView();
}


/*
 *  Method: BBox::Draw()
 *   Descr: 
 */
void
BBox_Draw(BBox *Box, BRect bounds)
{
   Box->Draw(bounds);
}


/*
 *  Method: BBox::AttachedToWindow()
 *   Descr: 
 */
void
BBox_AttachedToWindow(BBox *Box)
{
   Box->AttachedToWindow();
}


/*
 *  Method: BBox::DetachedFromWindow()
 *   Descr: 
 */
void
BBox_DetachedFromWindow(BBox *Box)
{
   Box->DetachedFromWindow();
}


/*
 *  Method: BBox::AllAttached()
 *   Descr: 
 */
void
BBox_AllAttached(BBox *Box)
{
   Box->AllAttached();
}


/*
 *  Method: BBox::AllDetached()
 *   Descr: 
 */
void
BBox_AllDetached(BBox *Box)
{
   Box->AllDetached();
}


/*
 *  Method: BBox::FrameResized()
 *   Descr: 
 */
void
BBox_FrameResized(BBox *Box, float new_width,
                   float new_height)
{
   Box->FrameResized(new_width, new_height);
}


/*
 *  Method: BBox::MessageReceived()
 *   Descr: 
 */
void
BBox_MessageReceived(BBox *Box, BMessage *msg)
{
   Box->MessageReceived(msg);
}


/*
 *  Method: BBox::MouseDown()
 *   Descr: 
 */
void
BBox_MouseDown(BBox *Box, BPoint pt)
{
   Box->MouseDown(pt);
}


/*
 *  Method: BBox::MouseUp()
 *   Descr: 
 */
void
BBox_MouseUp(BBox *Box, BPoint pt)
{
   Box->MouseUp(pt);
}


/*
 *  Method: BBox::WindowActivated()
 *   Descr: 
 */
void
BBox_WindowActivated(BBox *Box, bool state)
{
   Box->WindowActivated(state);
}


/*
 *  Method: BBox::MouseMoved()
 *   Descr: 
 */
void
BBox_MouseMoved(BBox *Box, BPoint pt,
                 uint32 code,
                 const BMessage *msg)
{
   Box->MouseMoved(pt, code, msg);
}


/*
 *  Method: BBox::FrameMoved()
 *   Descr: 
 */
void
BBox_FrameMoved(BBox *Box, BPoint new_position)
{
   Box->FrameMoved(new_position);
}


/*
 *  Method: BBox::ResolveSpecifier()
 *   Descr: 
 */
BHandler *
BBox_ResolveSpecifier(BBox *Box, BMessage *msg,
                       int32 index,
                       BMessage *specifier,
                       int32 form,
                       const char *property)
{
   return Box->ResolveSpecifier(msg, index, specifier, form, property);
}


/*
 *  Method: BBox::ResizeToPreferred()
 *   Descr: 
 */
void
BBox_ResizeToPreferred(BBox *Box)
{
   Box->ResizeToPreferred();
}


/*
 *  Method: BBox::GetPreferredSize()
 *   Descr: 
 */
void
BBox_GetPreferredSize(BBox *Box, float *width,
                       float *height)
{
   Box->GetPreferredSize(width, height);
}


/*
 *  Method: BBox::MakeFocus()
 *   Descr: 
 */
void
BBox_MakeFocus(BBox *Box, bool state)
{
   Box->MakeFocus(state);
}


/*
 *  Method: BBox::GetSupportedSuites()
 *   Descr: 
 */
status_t
BBox_GetSupportedSuites(BBox *Box, BMessage *data)
{
   return Box->GetSupportedSuites(data);
}


/*
 *  Method: BBox::Perform()
 *   Descr: 
 */
status_t
BBox_Perform(BBox *Box, perform_code d,
              void *arg)
{
   return Box->Perform(d, arg);
}


/*
 *  Method: BBox::_ReservedBox1()
 *   Descr: 
 */
/*
void
BBox__ReservedBox1(BBox *Box)
{
   Box->_ReservedBox1();
}
*/

/*
 *  Method: BBox::_ReservedBox2()
 *   Descr: 
 */
/*
void
BBox__ReservedBox2(BBox *Box)
{
   Box->_ReservedBox2();
}
*/

/*
 *  Method: BBox::operator=()
 *   Descr: 
 */
/*
BBox &
BBox_operator=(BBox *Box, const BBox &)
{
   return Box->operator=();
}
*/


/*
 *  Method: BBox::InitObject()
 *   Descr: 
 */
/*
void
BBox_InitObject(BBox *Box, BMessage *data)
{
   Box->InitObject(data);
}
*/

/*
 *  Method: BBox::DrawPlain()
 *   Descr: 
 */
/*
void
BBox_DrawPlain(BBox *Box)
{
   Box->DrawPlain();
}
*/

/*
 *  Method: BBox::DrawFancy()
 *   Descr: 
 */
/*
void
BBox_DrawFancy(BBox *Box)
{
   Box->DrawFancy();
}
*/

/*
 *  Method: BBox::ClearAnyLabel()
 *   Descr: 
 */
/*
void
BBox_ClearAnyLabel(BBox *Box)
{
   Box->ClearAnyLabel();
}
*/

#if defined(__cplusplus)
}
#endif

#endif /* _BOX_CPP_ */
