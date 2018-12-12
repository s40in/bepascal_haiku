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

#ifndef _APPLICATION_CPP_
#define _APPLICATION_CPP_

#include <Application.h>
#include <Archivable.h>
#include <Message.h>

#include <application.h>

// #include <Control.cpp>

#include <window.h>
#include <view.h>
#include <point.h>
#include <rect.h>

#include <handler.h>
#include <looper.h>
#include <archivable.h>
#include <message.h>
#include <beobj.h>

// definition of callback function in BApplication
typedef void (*BApplication_AppActivated_hook) (TPasObject PasObject, bool active);
typedef void (*BApplication_ReadyToRun_hook) (TPasObject PasObject);
typedef void (*BApplication_RefsReceived_hook) (TPasObject PasObject, BMessage *message);
typedef void (*BApplication_ArgvReceived_hook) (TPasObject PasObject, int32 argc, char **argv);
typedef void (*BApplication_AboutRequested_hook) (TPasObject PasObject);
typedef void (*BApplication_Pulse_hook) (TPasObject PasObject);
// typedef bool (*BApplication_QuitRequested_hook) (TPasObject PasObject);
// typedef void (*BApplication_MessageReceived_hook) (TPasObject PasObject, TCPlusObject message);

#if defined(__cplusplus)
extern "C" {
#endif

BApplication_AppActivated_hook Application_AppActivated_hook;
BApplication_ReadyToRun_hook Application_ReadyToRun_hook;
BApplication_RefsReceived_hook Application_RefsReceived_hook;
BApplication_ArgvReceived_hook Application_ArgvReceived_hook;
BApplication_AboutRequested_hook Application_AboutRequested_hook;
BApplication_Pulse_hook Application_Pulse_hook;
//BApplication_QuitRequested_hook Application_QuitRequested_hook;
//BApplication_MessageReceived_hook Application_MessageReceived_hook;

BMessenger *be_app_messengerCPlus;

#if defined(__cplusplus)
}
#endif

BPApplication::BPApplication(TPasObject PasObject, const char *signature) 
	: BApplication(signature), 
//	BPHandler(PasObject), 
	BPLooper(PasObject) 
//	BPasObject(PasObject)
{
	be_app_messengerCPlus = &be_app_messenger;
}

BPApplication::BPApplication(TPasObject PasObject, const char *signature,
	 status_t *error) : BApplication(signature, error), 
//	 BPHandler(PasObject),
	 BPLooper(PasObject)
//	 BPasObject(PasObject)
{
	be_app_messengerCPlus = &be_app_messenger;
}

void BPApplication::AppActivated(bool active)
{
	AppActivated_hookCall(active);
	BApplication::AppActivated(active);
}

void BPApplication::AppActivated_hookCall(bool active)
{
	Application_AppActivated_hook(GetPasObject(), active);	
}

void BPApplication::ReadyToRun(void)
{
	ReadyToRun_hookCall();
	BApplication::ReadyToRun();
}

void BPApplication::ReadyToRun_hookCall(void)
{
	Application_ReadyToRun_hook(GetPasObject());
}

bool BPApplication::QuitRequested(void)
{
	return QuitRequested_hookCall();
//	return BApplication::QuitRequested();
} 

void BPApplication::MessageReceived(BMessage *message)
{
	MessageReceived_hookCall(message);
	BApplication::MessageReceived(message);
}

void BPApplication::DispatchMessage(BMessage *message, BHandler *target)
{
	DispatchMessage_hookCall(message, target);
//	message->PrintToStream();
	BApplication::DispatchMessage(message, target);
}

void BPApplication::RefsReceived(BMessage *message)
{
	RefsReceived_hookCall(message);
//	message->PrintToStream();
	BApplication::RefsReceived(message);
}

void BPApplication::RefsReceived_hookCall(BMessage *message)
{
	Application_RefsReceived_hook(GetPasObject(), message);
}

void BPApplication::ArgvReceived(int32 argc, char **argv)
{
	ArgvReceived_hookCall(argc, argv);
	BApplication::ArgvReceived(argc, argv);
}

void BPApplication::ArgvReceived_hookCall(int32 argc, char **argv)
{
	Application_ArgvReceived_hook(GetPasObject(), argc, argv);
}

void BPApplication::AboutRequested(void)
{
	AboutRequested_hookCall();
	BApplication::AboutRequested();
}

void BPApplication::AboutRequested_hookCall(void)
{
	Application_AboutRequested_hook(GetPasObject());
}

void BPApplication::Pulse(void)
{
	Pulse_hookCall();
	BApplication::Pulse();
}

void BPApplication::Pulse_hookCall(void)
{
	Application_Pulse_hook(GetPasObject());
}

#if defined(__cplusplus)
extern "C" {
#endif

TCPlusObject BApplication_Create_1(TPasObject PasObject)
{
	return new BPApplication(PasObject, "application/x-vnd.RuBe");
}

TCPlusObject BApplication_Create_2(TPasObject PasObject, const char *Signature)
{
	return new BPApplication(PasObject, Signature);
}

TCPlusObject BApplication_Create_3(TPasObject PasObject, const char *Signature,
	status_t *error)
{
	return new BPApplication(PasObject, Signature, error);
}

void BApplication_Free(TCPlusObject Application)
{
	delete reinterpret_cast<BPApplication*>(Application);
}

void BApplication_HideCursor(TCPlusObject Application)
{
	reinterpret_cast<BApplication*>(Application)->HideCursor();
}

void BApplication_ShowCursor(TCPlusObject Application)
{
	reinterpret_cast<BApplication*>(Application)->ShowCursor();
}

thread_id BApplication_Run(TCPlusObject Application)
{
	return reinterpret_cast<BApplication*>(Application)->Run();
}

void BApplication_Quit(TCPlusObject Application)
{
	reinterpret_cast<BApplication*>(Application)->Quit();	
}

status_t BApplication_GetAppInfo(TCPlusObject Application,app_info *info)
{
	reinterpret_cast<BApplication*>(Application)->GetAppInfo(info);	
}


#if defined(__cplusplus)
}
#endif

#endif /* _APPLICATION_CPP_ */
