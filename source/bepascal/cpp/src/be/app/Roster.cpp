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

#ifndef _ROSTER_CPP_
#define _ROSTER_CPP_

#include <Roster.h>
#include <Message.h>

#include <beobj.h>
#include <roster.h>

#if defined(__cplusplus)
extern "C" {
#endif

const TCPlusObject Get_be_roster(void)
{
		// Pas très propre ! Si quelqu'un a mieux...
	return TCPlusObject(be_roster);
}

TCPlusObject BRoster_Create(TPasObject PasObject)
{
	return new BRoster();
}

void BRoster_Destroy(TPasObject PasObject)
{
	delete reinterpret_cast<BRoster*>(PasObject);
}

//status_t BRoster_Broadcast(TCPlusObject Roster, TCPlusObject *message)
//{
//	return reinterpret_cast<BRoster*>(Roster)->Broadcast(reinterpret_cast<BMessage*>(message));
//}

/***********************************************************************
 *  Method: BRoster::IsRunning
 *  Params: const char *mime_sig
 * Returns: bool
 * Effects: 
 ***********************************************************************/
bool
BRoster_IsRunning(BRoster *Roster, const char *mime_sig)
{
   return Roster->IsRunning(mime_sig);
}


/***********************************************************************
 *  Method: BRoster::IsRunning
 *  Params: entry_ref *ref
 * Returns: bool
 * Effects: 
 ***********************************************************************/
bool
BRoster_IsRunning_1
(BRoster *Roster, entry_ref *ref)
{
   return Roster->IsRunning(ref);
}


/***********************************************************************
 *  Method: BRoster::TeamFor
 *  Params: const char *mime_sig
 * Returns: team_id
 * Effects: 
 ***********************************************************************/
team_id
BRoster_TeamFor(BRoster *Roster, const char *mime_sig)
{
   return Roster->TeamFor(mime_sig);
}


/***********************************************************************
 *  Method: BRoster::TeamFor
 *  Params: entry_ref *ref
 * Returns: team_id
 * Effects: 
 ***********************************************************************/
team_id
BRoster_TeamFor_1
(BRoster *Roster, entry_ref *ref)
{
   return Roster->TeamFor(ref);
}


/***********************************************************************
 *  Method: BRoster::GetAppList
 *  Params: BList *team_id_list
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BRoster_GetAppList(BRoster *Roster, BList *team_id_list)
{
   Roster->GetAppList(team_id_list);
}


/***********************************************************************
 *  Method: BRoster::GetAppList
 *  Params: const char *sig, BList *team_id_list
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BRoster_GetAppList_1
(BRoster *Roster, const char *sig, BList *team_id_list)
{
   Roster->GetAppList(sig, team_id_list);
}


/***********************************************************************
 *  Method: BRoster::GetAppInfo
 *  Params: const char *sig, app_info *info
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BRoster_GetAppInfo(BRoster *Roster, const char *sig, app_info *info)
{
   return Roster->GetAppInfo(sig, info);
}


/***********************************************************************
 *  Method: BRoster::GetAppInfo
 *  Params: entry_ref *ref, app_info *info
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BRoster_GetAppInfo_1
(BRoster *Roster, entry_ref *ref, app_info *info)
{
   return Roster->GetAppInfo(ref, info);
}


/***********************************************************************
 *  Method: BRoster::GetRunningAppInfo
 *  Params: team_id team, app_info *info
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BRoster_GetRunningAppInfo(BRoster *Roster, team_id team, app_info *info)
{
   return Roster->GetRunningAppInfo(team, info);
}


/***********************************************************************
 *  Method: BRoster::GetActiveAppInfo
 *  Params: app_info *info
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BRoster_GetActiveAppInfo(BRoster *Roster, app_info *info)
{
   return Roster->GetActiveAppInfo(info);
}


/***********************************************************************
 *  Method: BRoster::FindApp
 *  Params: const char *mime_type, entry_ref *app
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BRoster_FindApp(BRoster *Roster, const char *mime_type, entry_ref *app)
{
   return Roster->FindApp(mime_type, app);
}


/***********************************************************************
 *  Method: BRoster::FindApp
 *  Params: entry_ref *ref, entry_ref *app
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BRoster_FindApp_1
(BRoster *Roster, entry_ref *ref, entry_ref *app)
{
   return Roster->FindApp(ref, app);
}


/***********************************************************************
 *  Method: BRoster::Broadcast
 *  Params: BMessage *msg
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BRoster_Broadcast(BRoster *Roster, BMessage *msg)
{
   return Roster->Broadcast(msg);
}


/***********************************************************************
 *  Method: BRoster::Broadcast
 *  Params: BMessage *msg, BMessenger reply_to
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BRoster_Broadcast_1
(BRoster *Roster, BMessage *msg, BMessenger reply_to)
{
   return Roster->Broadcast(msg, reply_to);
}


/***********************************************************************
 *  Method: BRoster::StopWatching
 *  Params: BMessenger target
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BRoster_StopWatching(BRoster *Roster, BMessenger target)
{
   return Roster->StopWatching(target);
}


/***********************************************************************
 *  Method: BRoster::ActivateApp
 *  Params: team_id team
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BRoster_ActivateApp(BRoster *Roster, team_id team)
{
   return Roster->ActivateApp(team);
}


/***********************************************************************
 *  Method: BRoster::Launch
 *  Params: const char *mime_type, BMessage *initial_msgs, team_id *app_team
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BRoster_Launch(BRoster *Roster, const char *mime_type, BMessage *initial_msgs, team_id *app_team)
{
   return Roster->Launch(mime_type, initial_msgs, app_team);
}


/***********************************************************************
 *  Method: BRoster::Launch
 *  Params: const char *mime_type, BList *message_list, team_id *app_team
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BRoster_Launch_1
(BRoster *Roster, const char *mime_type, BList *message_list, team_id *app_team)
{
   return Roster->Launch(mime_type, message_list, app_team);
}


/***********************************************************************
 *  Method: BRoster::Launch
 *  Params: const char *mime_type, int argc, char **args, team_id *app_team
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BRoster_Launch_2
(BRoster *Roster, const char *mime_type, int argc, char **args, team_id *app_team)
{
   return Roster->Launch(mime_type, argc, args, app_team);
}


/***********************************************************************
 *  Method: BRoster::Launch
 *  Params: const entry_ref *ref, const BMessage *initial_message, team_id *app_team
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BRoster_Launch_3
(BRoster *Roster, const entry_ref *ref, const BMessage *initial_message, team_id *app_team)
{
   return Roster->Launch(ref, initial_message, app_team);
}


/***********************************************************************
 *  Method: BRoster::Launch
 *  Params: const entry_ref *ref, const BList *message_list, team_id *app_team
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BRoster_Launch_4
(BRoster *Roster, const entry_ref *ref, const BList *message_list, team_id *app_team)
{
   return Roster->Launch(ref, message_list, app_team);
}


/***********************************************************************
 *  Method: BRoster::Launch
 *  Params: const entry_ref *ref, int argc, const char *const *args, team_id *app_team
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BRoster_Launch_5
(BRoster *Roster, const entry_ref *ref, int argc, const char *const *args, team_id *app_team)
{
   return Roster->Launch(ref, argc, args, app_team);
}


/***********************************************************************
 *  Method: BRoster::GetRecentDocuments
 *  Params: BMessage *refList, int32 maxCount, const char *ofType, const char *openedByAppSig
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BRoster_GetRecentDocuments(BRoster *Roster, BMessage *refList, int32 maxCount, const char *ofType, const char *openedByAppSig)
{
   Roster->GetRecentDocuments(refList, maxCount, ofType, openedByAppSig);
}


/***********************************************************************
 *  Method: BRoster::GetRecentDocuments
 *  Params: BMessage *refList, int32 maxCount, const char *ofTypeList[], int32 ofTypeListCount, const char *openedByAppSig
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BRoster_GetRecentDocuments_1
(BRoster *Roster, BMessage *refList, int32 maxCount, const char *ofTypeList[], int32 ofTypeListCount, const char *openedByAppSig)
{
//   Roster->GetRecentDocuments(refList, maxCount, ofTypeList[], ofTypeListCount, openedByAppSig);
}


/***********************************************************************
 *  Method: BRoster::GetRecentFolders
 *  Params: BMessage *refList, int32 maxCount, const char *openedByAppSig
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BRoster_GetRecentFolders(BRoster *Roster, BMessage *refList, int32 maxCount, const char *openedByAppSig)
{
   Roster->GetRecentFolders(refList, maxCount, openedByAppSig);
}


/***********************************************************************
 *  Method: BRoster::GetRecentApps
 *  Params: BMessage *refList, int32 maxCount
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BRoster_GetRecentApps(BRoster *Roster, BMessage *refList, int32 maxCount)
{
   Roster->GetRecentApps(refList, maxCount);
}


/***********************************************************************
 *  Method: BRoster::AddToRecentDocuments
 *  Params: const entry_ref *doc, const char *appSig
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BRoster_AddToRecentDocuments(BRoster *Roster, const entry_ref *doc, const char *appSig)
{
   Roster->AddToRecentDocuments(doc, appSig);
}


/***********************************************************************
 *  Method: BRoster::AddToRecentFolders
 *  Params: const entry_ref *folder, const char *appSig
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BRoster_AddToRecentFolders(BRoster *Roster, const entry_ref *folder, const char *appSig)
{
   Roster->AddToRecentFolders(folder, appSig);
}

/***********************************************************************
 *  Method: BRoster::_StartWatching
 *  Params: mtarget t, BMessenger *roster_mess, uint32 what, BMessenger notify, uint32 event_mask
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
/*status_t
BRoster__StartWatching(BRoster *Roster, mtarget t, BMessenger *roster_mess, uint32 what, BMessenger notify, uint32 event_mask) const
{
   return Roster->_StartWatching(t, roster_mess, what, notify, event_mask);
}
*/

/***********************************************************************
 *  Method: BRoster::_StopWatching
 *  Params: mtarget t, BMessenger *roster_mess, uint32 what, BMessenger notify
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
/*status_t
BRoster__StopWatching(BRoster *Roster, mtarget t, BMessenger *roster_mess, uint32 what, BMessenger notify) const
{
   return Roster->_StopWatching(t, roster_mess, what, notify);
}
*/

/***********************************************************************
 *  Method: BRoster::AddApplication
 *  Params: const char *mime_sig, entry_ref *ref, uint32 flags, team_id team, thread_id thread, port_id port, bool full_reg
 * Returns: uint32
 * Effects: 
 ***********************************************************************/
/*uint32
BRoster_AddApplication(BRoster *Roster, const char *mime_sig, entry_ref *ref, uint32 flags, team_id team, thread_id thread, port_id port, bool full_reg) const
{
   return Roster->AddApplication(mime_sig, ref, flags, team, thread, port, full_reg);
}
*/

/***********************************************************************
 *  Method: BRoster::SetSignature
 *  Params: team_id team, const char *mime_sig
 * Returns: void
 * Effects: 
 ***********************************************************************/
/*void
BRoster_SetSignature(BRoster *Roster, team_id team, const char *mime_sig) const
{
   Roster->SetSignature(team, mime_sig);
}
*/

/***********************************************************************
 *  Method: BRoster::SetThread
 *  Params: team_id team, thread_id tid
 * Returns: void
 * Effects: 
 ***********************************************************************/
/*void
BRoster_SetThread(BRoster *Roster, team_id team, thread_id tid) const
{
   Roster->SetThread(team, tid);
}
*/

/***********************************************************************
 *  Method: BRoster::SetThreadAndTeam
 *  Params: uint32 entry_token, thread_id tid, team_id team
 * Returns: void
 * Effects: 
 ***********************************************************************/
/*void
BRoster_SetThreadAndTeam_1
(BRoster *Roster, uint32 entry_token, thread_id tid, team_id team) const
{
   Roster->SetThreadAndTeam(entry_token, tid, team);
}
*/

/***********************************************************************
 *  Method: BRoster::CompleteRegistration
 *  Params: team_id team, thread_id, port_id port
 * Returns: void
 * Effects: 
 ***********************************************************************/
/*void
BRoster_CompleteRegistration(BRoster *Roster, team_id team, thread_id, port_id port) const
{
   Roster->CompleteRegistration(team, , port);
}
*/

/***********************************************************************
 *  Method: BRoster::IsAppPreRegistered
 *  Params: entry_ref *ref, team_id team, app_info *info
 * Returns: bool
 * Effects: 
 ***********************************************************************/
/*bool
BRoster_IsAppPreRegistered(BRoster *Roster, entry_ref *ref, team_id team, app_info *info) const
{
   return Roster->IsAppPreRegistered(ref, team, info);
}
*/

/***********************************************************************
 *  Method: BRoster::RemovePreRegApp
 *  Params: uint32 entry_token
 * Returns: void
 * Effects: 
 ***********************************************************************/
/*void
BRoster_RemovePreRegApp(BRoster *Roster, uint32 entry_token) const
{
   Roster->RemovePreRegApp(entry_token);
}
*/

/***********************************************************************
 *  Method: BRoster::RemoveApp
 *  Params: team_id team
 * Returns: void
 * Effects: 
 ***********************************************************************/
/*void
BRoster_RemoveApp(BRoster *Roster, team_id team) const
{
   Roster->RemoveApp(team);
}
*/

/***********************************************************************
 *  Method: BRoster::xLaunchAppPrivate
 *  Params: const char *mime_sig, const entry_ref *ref, BList *msg_list, int cargs, char **args, team_id *app_team
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
/*status_t
BRoster_xLaunchAppPrivate(BRoster *Roster, const char *mime_sig, const entry_ref *ref, BList *msg_list, int cargs, char **args, team_id *app_team) const
{
   return Roster->xLaunchAppPrivate(mime_sig, ref, msg_list, cargs, args, app_team);
}
*/

/***********************************************************************
 *  Method: BRoster::UpdateActiveApp
 *  Params: team_id team
 * Returns: bool
 * Effects: 
 ***********************************************************************/
/*bool
BRoster_UpdateActiveApp(BRoster *Roster, team_id team) const
{
   return Roster->UpdateActiveApp(team);
}
*/

/***********************************************************************
 *  Method: BRoster::SetAppFlags
 *  Params: team_id team, uint32 flags
 * Returns: void
 * Effects: 
 ***********************************************************************/
/*void
BRoster_SetAppFlags(BRoster *Roster, team_id team, uint32 flags) const
{
   Roster->SetAppFlags(team, flags);
}
*/

/***********************************************************************
 *  Method: BRoster::DumpRoster
 *  Params: 
 * Returns: void
 * Effects: 
 ***********************************************************************/
/*void
BRoster_DumpRoster(BRoster *Roster) const
{
   Roster->DumpRoster();
}
*/

/***********************************************************************
 *  Method: BRoster::resolve_app
 *  Params: const char *in_type, const entry_ref *ref, entry_ref *app_ref, char *app_sig, uint32 *app_flags, bool *was_document
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
/*status_t
BRoster_resolve_app(BRoster *Roster, const char *in_type, const entry_ref *ref, entry_ref *app_ref, char *app_sig, uint32 *app_flags, bool *was_document) const
{
   return Roster->resolve_app(in_type, ref, app_ref, app_sig, app_flags, was_document);
}
*/

/***********************************************************************
 *  Method: BRoster::translate_ref
 *  Params: const entry_ref *ref, BMimeType *app_meta, entry_ref *app_ref, BFile *app_file, char *app_sig, bool *was_document
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
/*status_t
BRoster_translate_ref(BRoster *Roster, const entry_ref *ref, BMimeType *app_meta, entry_ref *app_ref, BFile *app_file, char *app_sig, bool *was_document) const
{
   return Roster->translate_ref(ref, app_meta, app_ref, app_file, app_sig, was_document);
}
*/

/***********************************************************************
 *  Method: BRoster::translate_type
 *  Params: const char *mime_type, BMimeType *meta, entry_ref *app_ref, BFile *app_file, char *app_sig
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
/*status_t
BRoster_translate_type(BRoster *Roster, const char *mime_type, BMimeType *meta, entry_ref *app_ref, BFile *app_file, char *app_sig) const
{
   return Roster->translate_type(mime_type, meta, app_ref, app_file, app_sig);
}
*/

/***********************************************************************
 *  Method: BRoster::sniff_file
 *  Params: const entry_ref *file, BNodeInfo *finfo, char *mime_type
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
/*status_t
BRoster_sniff_file(BRoster *Roster, const entry_ref *file, BNodeInfo *finfo, char *mime_type) const
{
   return Roster->sniff_file(file, finfo, mime_type);
}
*/

/***********************************************************************
 *  Method: BRoster::is_wildcard
 *  Params: const char *sig
 * Returns: bool
 * Effects: 
 ***********************************************************************/
/*bool
BRoster_is_wildcard(BRoster *Roster, const char *sig) const
{
   return Roster->is_wildcard(sig);
}
*/

/***********************************************************************
 *  Method: BRoster::get_unique_supporting_app
 *  Params: const BMessage *apps, char *out_sig
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
/*status_t
BRoster_get_unique_supporting_app(BRoster *Roster, const BMessage *apps, char *out_sig) const
{
   return Roster->get_unique_supporting_app(apps, out_sig);
}
*/

/***********************************************************************
 *  Method: BRoster::get_random_supporting_app
 *  Params: const BMessage *apps, char *out_sig
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
/*status_t
BRoster_get_random_supporting_app(BRoster *Roster, const BMessage *apps, char *out_sig) const
{
   return Roster->get_random_supporting_app(apps, out_sig);
}
*/

/***********************************************************************
 *  Method: BRoster::build_arg_vector
 *  Params: char **args, int *pargs, const entry_ref *app_ref, const entry_ref *doc_ref
 * Returns: char **
 * Effects: 
 ***********************************************************************/
/*char **
BRoster_build_arg_vector(BRoster *Roster, char **args, int *pargs, const entry_ref *app_ref, const entry_ref *doc_ref) const
{
   return Roster->build_arg_vector(args, pargs, app_ref, doc_ref);
}
*/

/***********************************************************************
 *  Method: BRoster::send_to_running
 *  Params: team_id tema, const entry_ref *app_ref, int cargs, char **args, const BList *msg_list, const entry_ref *ref
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
/*status_t
BRoster_send_to_running(BRoster *Roster, team_id tema, const entry_ref *app_ref, int cargs, char **args, const BList *msg_list, const entry_ref *ref) const
{
   return Roster->send_to_running(tema, app_ref, cargs, args, msg_list, ref);
}
*/

/***********************************************************************
 *  Method: BRoster::InitMessengers
 *  Params: 
 * Returns: void
 * Effects: 
 ***********************************************************************/
/*void
BRoster_InitMessengers(BRoster *Roster)
{
   Roster->InitMessengers();
}
*/
#if defined(__cplusplus)
}
#endif

#endif /* _ROSTER_CPP_ */
