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

#ifndef _LISTVIEW_H_
#define _LISTVIEW_H_

#include <ListView.h>
#include <view.h>

#include <beobj.h>
#include <OS.h>

#include <handler.h>
#include <beobj.h>

class BPListView : public BListView, public BPView
{

public:
						BPListView(TPasObject PasObject,BRect frame,
								const char *name,
								list_view_type type = B_SINGLE_SELECTION_LIST,
								uint32 resizeMask = B_FOLLOW_LEFT |
													B_FOLLOW_TOP,
								uint32 flags = B_WILL_DRAW | B_FRAME_EVENTS |
													B_NAVIGABLE);
						BPListView(TPasObject PasObject,BMessage *data);
static	BArchivable		*Instantiate(BMessage *data);
//virtual	status_t		Archive(BMessage *data, bool deep = true) const;
virtual	void			Draw(BRect updateRect);
virtual	void			MessageReceived(BMessage *msg);
virtual	void			MouseDown(BPoint where);
virtual	void			KeyDown(const char *bytes, int32 numBytes);
//virtual	void			MakeFocus(bool state = true);
virtual	void			FrameResized(float newWidth, float newHeight);
virtual	void			AttachedToWindow();
//virtual	void			FrameMoved(BPoint new_position);

/*virtual BHandler		*ResolveSpecifier(BMessage *msg,
										int32 index,
										BMessage *specifier,
										int32 form,
										const char *property);*/

//virtual status_t		Perform(perform_code d, void *arg);

virtual void			WindowActivated(bool state);
virtual	void			MouseUp(BPoint pt);
virtual	void			MouseMoved(BPoint pt, uint32 code, const BMessage *msg);
virtual	void			DetachedFromWindow();
			
//virtual void		ResizeToPreferred();
//virtual void		GetPreferredSize(float *width, float *height);
virtual void		AllAttached();
virtual void		AllDetached();

 bool			InitiateDrag(BPoint pt, int32 itemIndex, 
										bool initialySelected);
 void			SelectionChanged();

protected:
};

#endif /* _LISTVIEW_H_ */
