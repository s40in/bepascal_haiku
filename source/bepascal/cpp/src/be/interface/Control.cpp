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

#ifndef _CONTROL_CPP_
#define _CONTROL_CPP_

#include "Control.h"
#include "Rect.h"
#include "View.h"
#include "Message.h"

#include <beobj.h>

#include "view.h"
#include "control.h"

#if defined(__cplusplus)
extern "C" {
#endif

BControl_SetEnabled_hook Control_SetEnabled_hook;
BControl_SetValue_hook Control_SetValue_hook;

#if defined(__cplusplus)
}
#endif


BPControl::BPControl(TPasObject PasObject, BRect frame, 
		  const char *name,
		  const char *label,
          BMessage *message,
          uint32 resizeMask,
          uint32 flags)
          : 
          BControl(frame, name, label, message,
          resizeMask, flags), 
          BPView(PasObject, frame, name, resizeMask, flags),
          BPHandler(PasObject, name)
//       BPasObject(PasObject)
{

}

BPControl::BPControl(TPasObject PasObject, BMessage *message):
          BControl(message),           
          BPView(PasObject, message), 
          BPHandler(PasObject, message)          
//       BPasObject(PasObject)
{
}

void BPControl::MessageReceived(BMessage *message)
{
	MessageReceived_hookCall(message);
	BControl::MessageReceived(message);
}

void BPControl::Draw(BRect updateRect)
{
	BControl::Draw(updateRect);
	Draw_hookCall(updateRect);
}

void BPControl::AttachedToWindow(void)
{
	BControl::AttachedToWindow();
	AttachedToWindow_hookCall();
}

void BPControl::SetEnabled(bool enabled)
{
	SetEnabled_hookCall(enabled);
}

void BPControl::SetEnabled_hookCall(bool enabled)
{
	Control_SetEnabled_hook(GetPasObject(), enabled);
}

void BPControl::SetValue(int32 value)
{
	SetValue_hookCall(value);
}

void BPControl::SetValue_hookCall(int32 value)
{
	Control_SetValue_hook(GetPasObject(), value);
}

#if defined(__cplusplus)
extern "C" {
#endif

/*
 *  Method: BControl::BControl()
 *   Descr: 
 */
TCPlusObject BControl_Create(TPasObject PasObject, BRect frame,
                   const char *name,
                   const char *label,
                   BMessage *message,
                   uint32 resizeMask,
                   uint32 flags)
{
      return new BPControl(PasObject, frame,
                   name,
                   label,
                   message,
                   resizeMask,
                   flags);
}


/*
 *  Method: BControl::~BControl()
 *   Descr: 
*/

void BControl_Free(BControl *Control)
{
   delete Control;
}


/*
 *  Method: BControl::BControl()
 *   Descr: 
 */
/*TCPlusObject BControl_Create(TPasObject PasObject, BMessage *data)
{
      return new BPControl(PasObject, data);
}
*/


/*
 *  Method: BControl::Instantiate()
 *   Descr: 
 */
BArchivable *
BControl_Instantiate(BControl *Control, BMessage *data)
{
   return Control->Instantiate(data);
}


/*
 *  Method: BControl::Archive()
 *   Descr: 
 */
status_t
BControl_Archive(BControl *Control, BMessage *data,
                  bool deep) 
{
   return Control->Archive(data,
                  deep);
}


/*
 *  Method: BControl::WindowActivated()
 *   Descr: 
 */
void
BControl_WindowActivated(BControl *Control, bool state)
{
   Control->WindowActivated(state);
}


/*
 *  Method: BControl::AttachedToWindow()
 *   Descr: 
 */
void
BControl_AttachedToWindow(BControl *Control)
{
   Control->AttachedToWindow();
}


/*
 *  Method: BControl::MessageReceived()
 *   Descr: 
 */
void
BControl_MessageReceived(BControl *Control, BMessage *msg)
{
   Control->MessageReceived(msg);
}


/*
 *  Method: BControl::MakeFocus()
 *   Descr: 
 */
void
BControl_MakeFocus(BControl *Control, bool state)
{
   Control->MakeFocus(state);
}


/*
 *  Method: BControl::KeyDown()
 *   Descr: 
 */
void
BControl_KeyDown(BControl *Control, const char *bytes,
                  int32 numBytes)
{
   Control->KeyDown(bytes,
                  numBytes);
}


/*
 *  Method: BControl::MouseDown()
 *   Descr: 
 */
void
BControl_MouseDown(BControl *Control, BPoint pt)
{
   Control->MouseDown(pt);
}


/*
 *  Method: BControl::MouseUp()
 *   Descr: 
 */
void
BControl_MouseUp(BControl *Control, BPoint pt)
{
   Control->MouseUp(pt);
}


/*
 *  Method: BControl::MouseMoved()
 *   Descr: 
 */
void
BControl_MouseMoved(BControl *Control, BPoint pt,
                     uint32 code,
                     const BMessage *msg)
{
   Control->MouseMoved(pt,
                     code,
                     msg);
}


/*
 *  Method: BControl::DetachedFromWindow()
 *   Descr: 
 */
void
BControl_DetachedFromWindow(BControl *Control)
{
   Control->DetachedFromWindow();
}


/*
 *  Method: BControl::SetLabel()
 *   Descr: 
 */
void
BControl_SetLabel(BControl *Control, const char *text)
{
   Control->SetLabel(text);
}


/*
 *  Method: BControl::Label()
 *   Descr: 
 */
const char *
BControl_Label(BControl *Control) 
{
   return Control->Label();
}


/*
 *  Method: BControl::SetValue()
 *   Descr: 
 */
void
BControl_SetValue(BControl *Control, int32 value)
{
   Control->SetValue(value);
}


/*
 *  Method: BControl::Value()
 *   Descr: 
 */
int32
BControl_Value(BControl *Control)
{
   return Control->Value();
}


/*
 *  Method: BControl::SetEnabled()
 *   Descr: 
 */
void
BControl_SetEnabled(BControl *Control, bool on)
{
   Control->SetEnabled(on);
}


/*
 *  Method: BControl::IsEnabled()
 *   Descr: 
 */
bool
BControl_IsEnabled(BControl *Control) 
{
   return Control->IsEnabled();
}


/*
 *  Method: BControl::GetPreferredSize()
 *   Descr: 
 */
void
BControl_GetPreferredSize(BControl *Control, float *width,
                           float *height)
{
   Control->GetPreferredSize(width,
                           height);
}


/*
 *  Method: BControl::ResizeToPreferred()
 *   Descr: 
 */
void
BControl_ResizeToPreferred(BControl *Control)
{
   Control->ResizeToPreferred();
}


/*
 *  Method: BControl::Invoke()
 *   Descr: 
 */
status_t
BControl_Invoke(BControl *Control, BMessage *msg)
{
   return Control->Invoke(msg);
}


/*
 *  Method: BControl::ResolveSpecifier()
 *   Descr: 
 */
BHandler *
BControl_ResolveSpecifier(BControl *Control, BMessage *msg,
                           int32 index,
                           BMessage *specifier,
                           int32 form,
                           const char *property)
{
   return Control->ResolveSpecifier(msg,
                           index,
                           specifier,
                           form,
                           property);
}


/*
 *  Method: BControl::GetSupportedSuites()
 *   Descr: 
 */
status_t
BControl_GetSupportedSuites(BControl *Control, BMessage *data)
{
   return Control->GetSupportedSuites(data);
}


/*
 *  Method: BControl::AllAttached()
 *   Descr: 
 */
void
BControl_AllAttached(BControl *Control)
{
   Control->AllAttached();
}


/*
 *  Method: BControl::AllDetached()
 *   Descr: 
 */
void
BControl_AllDetached(BControl *Control)
{
   Control->AllDetached();
}


/*
 *  Method: BControl::Perform()
 *   Descr: 
 */
status_t
BControl_Perform(BControl *Control, perform_code d,
                  void *arg)
{
   return Control->Perform(d,
                  arg);
}


/*
 *  Method: BControl::IsFocusChanging()
 *   Descr: 
 */
/*bool
BControl_IsFocusChanging(BControl *Control) 
{
   return Control->IsFocusChanging();
}*/


/*
 *  Method: BControl::IsTracking()
 *   Descr: 
 */
/*bool
BControl_IsTracking(BControl *Control) 
{
   return Control->IsTracking();
}*/


/*
 *  Method: BControl::SetTracking()
 *   Descr: 
 */
/*void
BControl_SetTracking(BControl *Control, bool state)
{
   Control->SetTracking(state);
}*/


/*
 *  Method: BControl::SetValueNoUpdate()
 *   Descr: 
 */
/*void
BControl_SetValueNoUpdate(BControl *Control, int32 value)
{
   Control->SetValueNoUpdate(value);
}*/


/*
 *  Method: BControl::_ReservedControl1()
 *   Descr: 
 */
/*void
BControl__ReservedControl1(BControl *Control)
{
   Control->_ReservedControl1();
}*/


/*
 *  Method: BControl::_ReservedControl2()
 *   Descr: 
 */
/*void
BControl__ReservedControl2(BControl *Control)
{
   Control->_ReservedControl2();
}*/


/*
 *  Method: BControl::_ReservedControl3()
 *   Descr: 
 */
/*void
BControl__ReservedControl3(BControl *Control)
{
   Control->_ReservedControl3();
}*/


/*
 *  Method: BControl::_ReservedControl4()
 *   Descr: 
 */
/*void
BControl__ReservedControl4(BControl *Control)
{
   Control->_ReservedControl4();
}*/


/*
 *  Method: BControl::operator=()
 *   Descr: 
 */
/*BControl &
BControl_operator=(BControl *Control, const BControl &)
{
   return Control->operator=();
}*/


/*
 *  Method: BControl::InitData()
 *   Descr: 
 */
/*void
BControl_InitData(BControl *Control, BMessage *data)
{
   Control->InitData(data);
}*/

#if defined(__cplusplus)
}
#endif

#endif /* _CONTROL_CPP_ */
