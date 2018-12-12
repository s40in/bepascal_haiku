/*  BePascal - A pascal wrapper around the BeOS API
    Copyright (C) 2003-2004 Olivier Coursiere
                            Eric Jourde
                            Oscar Lesta
                            Mika Lindqvist

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
#ifndef	_ALERT_CPP_
#define	_ALERT_CPP_

#include <Alert.h>
#include "window.h"
#include "looper.h"
#include <beobj.h>

//--- BAlert class -------------------------------------------------------------

class BPAlert : public BAlert, public BPWindow
// Is this OK? or should be public virtual?
{
public:
					BPAlert(TPasObject PasObject,
							const char *title,
							const char *text,
							const char *button1,
							const char *button2 = NULL,
							const char *button3 = NULL,
							button_width width = B_WIDTH_AS_USUAL,
							alert_type type = B_INFO_ALERT);
					BPAlert(TPasObject PasObject,
							const char *title,
							const char *text,
							const char *button1,
							const char *button2,
							const char *button3,
							button_width width,
							button_spacing spacing,
							alert_type type = B_INFO_ALERT);
					BPAlert(TPasObject PasObject, BMessage *data);

//virtual				~BAlert();

// Archiving
static	BArchivable	*Instantiate(BMessage *data);
//virtual	status_t	Archive(BMessage *data, bool deep = true) const;
	
// BAlert guts
		void		SetShortcut(int32 button_index, char key);
		char		Shortcut(int32 button_index) const;

		int32		Go();
		status_t	Go(BInvoker *invoker);

virtual	void		MessageReceived(BMessage *an_event);
virtual	void		FrameResized(float new_width, float new_height);
		BButton		*ButtonAt(int32 index) const;
		BTextView	*TextView() const;
/*
virtual BHandler	*ResolveSpecifier(BMessage *msg,
									int32 index,
									BMessage *specifier,
									int32 form,
									const char *property);
virtual	status_t	GetSupportedSuites(BMessage *data);
*/
virtual void		DispatchMessage(BMessage *msg, BHandler *handler);
virtual	void		Quit();
virtual	bool		QuitRequested();

static	BPoint		AlertPosition(float width, float height);

/*----- Private or reserved -----------------------------------------*/
//virtual status_t	Perform(perform_code d, void *arg);

private:
/*
friend class _BAlertFilter_;

virtual	void		_ReservedAlert1();
virtual	void		_ReservedAlert2();
virtual	void		_ReservedAlert3();

		void		InitObject(const char *text,
							const char *button1,
							const char *button2 = NULL,
							const char *button3 = NULL,
							button_width width = B_WIDTH_AS_USUAL,
							button_spacing spacing = B_EVEN_SPACING,
							alert_type type = B_INFO_ALERT);
		BBitmap		*InitIcon();

		sem_id			fAlertSem;
		int32			fAlertVal;
		BButton			*fButtons[3];
		BTextView		*fTextView;
		char			fKeys[3];
		alert_type		fMsgType;
		button_width	fButtonWidth;
		BInvoker		*fInvoker;
		uint32			_reserved[4];
*/
};

//------------------------------------------------------------------------------

BPAlert::BPAlert(TPasObject PasObject,
				const char *title,
				const char *text,
				const char *button1,
				const char *button2,
				const char *button3,
				button_width width,
				alert_type type)
		: BAlert(title, text, button1, button2, button3, width, type),
		BPWindow(PasObject, BRect(), title, B_UNTYPED_WINDOW, 0, 0)

// oco or Baldur :
// why this doesn't work? compiler says:
// BPWindow doesn't have a BPLooper member. The same with BPArchivable.

//		BPLooper(PasObject),
//		BPHandler(PasObject, title),
//		BPArchivable(PasObject),
//		BPasObject(PasObject)
{

}

BPAlert::BPAlert(TPasObject PasObject,
				const char *title,
				const char *text,
				const char *button1,
				const char *button2,
				const char *button3,
				button_width width,
				button_spacing spacing,
				alert_type type)
		: BAlert(title, text, button1, button2, button3, width, spacing, type),
		BPWindow(PasObject, BRect(), title, B_UNTYPED_WINDOW, 0, 0)
//		BPLooper(PasObject),
//		BPHandler(PasObject, title),
//		BPArchivable(PasObject),
//		BPasObject(PasObject)
{

}

BPAlert::BPAlert(TPasObject PasObject, BMessage *data)
		: BAlert(data),
// UGLY HACK!!! FIX ME!!! (should be "BPWindow(PasObject, data)" )
		BPWindow(PasObject, BRect(), "Ugly_Hack!", B_UNTYPED_WINDOW, 0, 0)
//		BPLooper(PasObject),
//		BPHandler(PasObject),
//		BPArchivable(PasObject),
//		BPasObject(PasObject)
{

}

void
BPAlert::SetShortcut(int32 button_index, char key)
{
	BAlert::SetShortcut(button_index, key);
}


char
BPAlert::Shortcut(int32 button_index) const
{
	return BAlert::Shortcut(button_index);
}


int32
BPAlert::Go(void)
{
	return BAlert::Go();
}

status_t
BPAlert::Go(BInvoker *invoker)
{
	return BAlert::Go(invoker);
}

void
BPAlert::MessageReceived(BMessage *an_event)
{
	BAlert::MessageReceived(an_event);
}

void
BPAlert::FrameResized(float new_width, float new_height)
{
	BAlert::FrameResized(new_width, new_height);
}

void
BPAlert::DispatchMessage(BMessage *msg, BHandler *handler)
{
	BAlert::DispatchMessage(msg, handler);
}

void
BPAlert::Quit(void)
{
	BAlert::Quit();
}

bool
BPAlert::QuitRequested(void)
{
	return BAlert::QuitRequested();
}


/*-------------------------------------------------------------*/

#if defined(__cplusplus)
extern "C" {
#endif

/*----------------------------------------------------------------*/

/*
 *  Method: BAlert::BAlert()
 *   Descr: 
 */
TCPlusObject BAlert_Create(TPasObject PasObject, const char *title, const char *text, const char *button1, const char *button2, const char *button3, button_width width, alert_type type)
{
//	return new BPAlert(PasObject, title, text, button1, button2, button3, width, type);
	return new BAlert(title, text, button1, button2, button3, width, type);
}


/*
 *  Method: BAlert::BAlert()
 *   Descr: 
 */
TCPlusObject BAlert_Create_1
(TPasObject PasObject, const char *title, const char *text, const char *button1, const char *button2, const char *button3, button_width width, button_spacing spacing, alert_type type)
{
//	return new BPAlert(PasObject, title, text, button1, button2, button3, width, spacing, type);
	return new BAlert(title, text, button1, button2, button3, width, spacing, type);	
}

/*
 *  Method: BAlert::BAlert()
 *   Descr: 
 */
TCPlusObject BAlert_Create_2(TPasObject PasObject, BMessage *data)
{
//	return new BPAlert(PasObject, data);
	return new BAlert(data);	
}


/*
 *  Method: BAlert::~BAlert()
 *   Descr: 
 */
TCPlusObject BAlert_Free(BAlert *Alert)
{
   delete Alert;
}


/*
 *  Method: BAlert::Instantiate()
 *   Descr: 
 */
BArchivable *
BAlert_Instantiate(BAlert *Alert, BMessage *data)
{
   return Alert->Instantiate(data);
}


/*
 *  Method: BAlert::Archive()
 *   Descr: 
 */
status_t
BAlert_Archive(BAlert *Alert, BMessage *data, bool deep)
{
   return Alert->Archive(data, deep);
}


/*
 *  Method: BAlert::SetShortcut()
 *   Descr: 
 */
void
BAlert_SetShortcut(BAlert *Alert, int32 button_index, char key)
{
   Alert->SetShortcut(button_index, key);
}


/*
 *  Method: BAlert::Shortcut()
 *   Descr: 
 */
char
BAlert_Shortcut(BAlert *Alert, int32 button_index)
{
   return Alert->Shortcut(button_index);
}


/*
 *  Method: BAlert::Go()
 *   Descr: 
 */
int32
BAlert_Go(BAlert *Alert)
{
   return Alert->Go();
}


/*
 *  Method: BAlert::Go()
 *   Descr: 
 */
status_t
BAlert_Go_1
(BAlert *Alert, BInvoker *invoker)
{
   return Alert->Go(invoker);
}


/*
 *  Method: BAlert::MessageReceived()
 *   Descr: 
 */
void
BAlert_MessageReceived(BAlert *Alert, BMessage *an_event)
{
   Alert->MessageReceived(an_event);
}


/*
 *  Method: BAlert::FrameResized()
 *   Descr: 
 */
void
BAlert_FrameResized(BAlert *Alert, float new_width, float new_height)
{
   Alert->FrameResized(new_width, new_height);
}


/*
 *  Method: BAlert::ButtonAt()
 *   Descr: 
 */
BButton *
BAlert_ButtonAt(BAlert *Alert, int32 index)
{
   return Alert->ButtonAt(index);
}


/*
 *  Method: BAlert::TextView()
 *   Descr: 
 */
BTextView *
BAlert_TextView(BAlert *Alert)
{
   return Alert->TextView();
}


/*
 *  Method: BAlert::ResolveSpecifier()
 *   Descr: 
 */
BHandler *
BAlert_ResolveSpecifier(BAlert *Alert, BMessage *msg, int32 index, BMessage *specifier, int32 form, const char *property)
{
   return Alert->ResolveSpecifier(msg, index, specifier, form, property);
}


/*
 *  Method: BAlert::GetSupportedSuites()
 *   Descr: 
 */
status_t
BAlert_GetSupportedSuites(BAlert *Alert, BMessage *data)
{
   return Alert->GetSupportedSuites(data);
}


/*
 *  Method: BAlert::DispatchMessage()
 *   Descr: 
 */
void
BAlert_DispatchMessage(BAlert *Alert, BMessage *msg, BHandler *handler)
{
   Alert->DispatchMessage(msg, handler);
}


/*
 *  Method: BAlert::Quit()
 *   Descr: 
 */
void
BAlert_Quit(BAlert *Alert)
{
   Alert->Quit();
}


/*
 *  Method: BAlert::QuitRequested()
 *   Descr: 
 */
bool
BAlert_QuitRequested(BAlert *Alert)
{
   return Alert->QuitRequested();
}


/*
 *  Method: BAlert::AlertPosition()
 *   Descr: 
 */
BPoint
BAlert_AlertPosition(BAlert *Alert, float width, float height)
{
   return Alert->AlertPosition(width, height);
}


/*
 *  Method: BAlert::Perform()
 *   Descr: 
 */
/*
status_t
BAlert_Perform(BAlert *Alert, perform_code d, void *arg)
{
   return Alert->Perform(d, arg);
}
*/

/*
 *  Method: BAlert::_ReservedAlert1()
 *   Descr: 
 */
/*
void
BAlert__ReservedAlert1(BAlert *Alert)
{
   Alert->_ReservedAlert1();
}
*/

/*
 *  Method: BAlert::_ReservedAlert2()
 *   Descr: 
 */
/*
void
BAlert__ReservedAlert2(BAlert *Alert)
{
   Alert->_ReservedAlert2();
}
*/

/*
 *  Method: BAlert::_ReservedAlert3()
 *   Descr: 
 */
/*
void
BAlert__ReservedAlert3(BAlert *Alert)
{
   Alert->_ReservedAlert3();
}
*/

/*
 *  Method: BAlert::InitObject()
 *   Descr: 
 */
/*
void
BAlert_InitObject(BAlert *Alert, const char *text, const char *button1, const char *button2, const char *button3, button_width width, button_spacing spacing, alert_type type)
{
   Alert->InitObject(text, button1, button2, button3, width, spacing, type);
}
*/

/*
 *  Method: BAlert::InitIcon()
 *   Descr: 
 */
/*
BBitmap *
BAlert_InitIcon(BAlert *Alert)
{
   return Alert->InitIcon();
}
*/

/*----------------------------------------------------------------*/

#if defined(__cplusplus)
}
#endif

/*----------------------------------------------------------------*/

#endif /* _ALERT_CPP_ */
