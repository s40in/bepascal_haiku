/*  BePascal - A pascal wrapper around the BeOS API
    Copyright (C) 2002 Eric Jourde

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
#ifndef _MAIL_CPP_
#define _MAIL_CPP_

#include "E-mail.h"
#include <beobj.h>


#if defined(__cplusplus)
extern "C" {
#endif


/*
 *  Method: BMailMessage::BMailMessage()
 *   Descr: 
 */
TCPlusObject BMailMessage_Create()
{
	return new BMailMessage();
}

void BMail_Free(BMailMessage *Mail)
{
   delete Mail;
}
/*
 *  Method: BMailMessage::AddContent()
 *   Descr: 
 */
status_t
BMailMessage_AddContent(BMailMessage *MailMessage, const char *text,
                         int32 length,
                         uint32 encoding,
                         bool clobber)
{
   return MailMessage->AddContent(text,
                         length,
                         encoding,
                         clobber);
}


/*
 *  Method: BMailMessage::AddContent()
 *   Descr: 
 */
status_t
BMailMessage_AddContent_1
(BMailMessage *MailMessage, const char *text,
                         int32 length,
                         const char *encoding,
                         bool clobber)
{
   return MailMessage->AddContent(text,
                         length,
                         encoding,
                         clobber);
}


/*
 *  Method: BMailMessage::AddEnclosure()
 *   Descr: 
 */
status_t
BMailMessage_AddEnclosure(BMailMessage *MailMessage, entry_ref *ref,
                           bool clobber)
{
   return MailMessage->AddEnclosure(ref,
                           clobber);
}


/*
 *  Method: BMailMessage::AddEnclosure()
 *   Descr: 
 */
status_t
BMailMessage_AddEnclosure_1
(BMailMessage *MailMessage, const char *path,
                           bool clobber)
{
   return MailMessage->AddEnclosure(path,
                           clobber);
}


/*
 *  Method: BMailMessage::AddEnclosure()
 *   Descr: 
 */
status_t
BMailMessage_AddEnclosure_2
(BMailMessage *MailMessage, const char *MIME_type,
                           void *data,
                           int32 len,
                           bool clobber)
{
   return MailMessage->AddEnclosure(MIME_type,
                           data,
                           len,
                           clobber);
}


/*
 *  Method: BMailMessage::AddHeaderField()
 *   Descr: 
 */
status_t
BMailMessage_AddHeaderField(BMailMessage *MailMessage, uint32 encoding,
                             const char *field_name,
                             const char *str,
                             bool clobber)
{
   return MailMessage->AddHeaderField(encoding,
                             field_name,
                             str,
                             clobber);
}


/*
 *  Method: BMailMessage::AddHeaderField()
 *   Descr: 
 */
status_t
BMailMessage_AddHeaderField_1
(BMailMessage *MailMessage, const char *field_name,
                             const char *str,
                             bool clobber)
{
   return MailMessage->AddHeaderField(field_name,
                             str,
                             clobber);
}


/*
 *  Method: BMailMessage::Send()
 *   Descr: 
 */
status_t
BMailMessage_Send(BMailMessage *MailMessage, bool send_now,
                   bool remove_when_I_have_completed_sending_this_message_to_your_preferred_SMTP_server)
{
   return MailMessage->Send(send_now,
                   remove_when_I_have_completed_sending_this_message_to_your_preferred_SMTP_server);
}


/*
 *  Method: BMailMessage::concatinate()
 *   Descr: 
 */
/*int32
BMailMessage_concatinate(BMailMessage *MailMessage, char **,
                          int32,
                          char *)
{
   return MailMessage->concatinate(,
                          ,
                          );
}
*/

/*
 *  Method: BMailMessage::count_fields()
 *   Descr: 
 */
/*int32
BMailMessage_count_fields(BMailMessage *MailMessage, char *name)
{
   return MailMessage->count_fields(name);
}

*/
/*
 *  Method: BMailMessage::find_field()
 *   Descr: 
 */
/*status_t
BMailMessage_find_field(BMailMessage *MailMessage, char *,
                         type_code *,
                         char **,
                         void **,
                         int32 *,
                         uint32 *,
                         char **,
                         bool *,
                         int32)
{
   return MailMessage->find_field(,
                         ,
                         ,
                         ,
                         ,
                         ,
                         ,
                         ,
                         );
}
*/

/*
 *  Method: BMailMessage::find_field()
 *   Descr: 
 */
/*BList *
BMailMessage_find_field_1
(BMailMessage *MailMessage, const char *)
{
   return MailMessage->find_field();
}
*/

/*
 *  Method: BMailMessage::get_field_name()
 *   Descr: 
 */
/*status_t
BMailMessage_get_field_name(BMailMessage *MailMessage, char **,
                             int32)
{
   return MailMessage->get_field_name(,
                             );
}
*/

/*
 *  Method: BMailMessage::set_field()
 *   Descr: 
 */
/*status_t
BMailMessage_set_field(BMailMessage *MailMessage, const char *,
                        type_code,
                        const char *,
                        const void *,
                        int32,
                        uint32,
                        const char *,
                        bool)
{
   return MailMessage->set_field(,
                        ,
                        ,
                        ,
                        ,
                        ,
                        ,
                        );
}
*/
#if defined(__cplusplus)
}
#endif

#endif /* _MAIL_CPP_ */


