/*  BePascal - A pascal wrapper around the BeOS API
    Copyright (C) 2002 Olivier Coursiere
                       Eric Jourde

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

#ifndef _TEXTVIEW_CPP_
#define _TEXTVIEW_CPP_
/***********************************************************************
 * AUTHOR: nobody <baron>
 *   FILE: StringView.cpp
 *   DATE: Mon Jan 13 21:52:29 2003
 *  DESCR: 
 ***********************************************************************/
#include "TextView.h"
#include "view.h"
#include <beobj.h>



#if defined(__cplusplus)
extern "C" {
#endif


#if defined(__cplusplus)
}
#endif

class BPTextView : public BTextView, public BPView {
public:
						BPTextView(TPasObject PasObject,
								   BRect			frame,
								  const char	*name,
								  BRect			textRect,
								  uint32		resizeMask,
								  uint32		flags = B_WILL_DRAW | B_PULSE_NEEDED);
						BPTextView(TPasObject PasObject,
							      BRect				frame, 
								  const char		*name, 
								  BRect				textRect,
						 	 	  const BFont		*initialFont,
								  const rgb_color	*initialColor, 
								  uint32			resizeMask, 
								  uint32			flags);
						BPTextView(TPasObject PasObject,BMessage *data);
	
static	BArchivable*	Instantiate(BMessage *data);
//virtual	status_t		Archive(BMessage *data, bool deep = true) const;

virtual	void			AttachedToWindow();
virtual	void			DetachedFromWindow();
virtual	void			Draw(BRect inRect);
virtual	void			MouseDown(BPoint where);
virtual void			MouseUp(BPoint where);
virtual	void			MouseMoved(BPoint			where, 
								   uint32			code, 
							   	   const BMessage	*message);
virtual	void			WindowActivated(bool state);
virtual	void			KeyDown(const char *bytes, int32 numBytes);
virtual	void			Pulse();
virtual	void			FrameResized(float width, float height);
//virtual	void			MakeFocus(bool focusState = true);
virtual	void			MessageReceived(BMessage *message);
/*virtual BHandler*		ResolveSpecifier(BMessage *message,
										 int32 index,
										 BMessage *specifier,
										 int32 form,
										 const char *property);*/
//virtual status_t		GetSupportedSuites(BMessage *data);
//virtual status_t		Perform(perform_code d, void *arg);
	
		void			SetText(const char *inText, 
								const text_run_array *inRuns = NULL);
		void			SetText(const char *inText, 
								int32 inLength,
								const text_run_array *inRuns = NULL);
		void			SetText(BFile *inFile,
								int32 startOffset,
								int32 inLength,
								const text_run_array *inRuns = NULL);

		void			Insert(const char *inText, 
							   const text_run_array *inRuns = NULL);
		void			Insert(const char *inText, 
							   int32 inLength,
							   const text_run_array *inRuns = NULL);
		void			Insert(int32 startOffset,
							   const char *inText,
							   int32 inLength,
							   const text_run_array *inRuns = NULL);

		void			Delete();
		void			Delete(int32 startOffset, int32 endOffset);
	
		const char*		Text() const;
		int32			TextLength() const;
		void			GetText(int32 offset, 
								int32 length,
								char *buffer) const;
		uchar			ByteAt(int32 offset) const;
	
		int32			CountLines() const;
		int32			CurrentLine() const;
		void			GoToLine(int32 lineNum);
	
//virtual	void			Cut(BClipboard *clipboard);
//virtual	void			Copy(BClipboard *clipboard);
//virtual	void			Paste(BClipboard *clipboard);
		void			Clear();

//virtual	bool			AcceptsPaste(BClipboard *clipboard);
//virtual	bool			AcceptsDrop(const BMessage *inMessage);
			
//virtual	void			Select(int32 startOffset, int32 endOffset);
		void			SelectAll();
		void			GetSelection(int32 *outStart, int32 *outEnd) const;

		void			SetFontAndColor(const BFont		*inFont, 
										uint32			inMode = B_FONT_ALL,
										const rgb_color	*inColor = NULL);
		void			SetFontAndColor(int32			startOffset, 
										int32			endOffset, 
										const BFont		*inFont,
										uint32			inMode = B_FONT_ALL,
										const rgb_color	*inColor = NULL);

		void			GetFontAndColor(int32		inOffset, 
										BFont		*outFont,
										rgb_color	*outColor = NULL) const;
		void			GetFontAndColor(BFont		*outFont,
										uint32		*outMode, 
										rgb_color	*outColor = NULL,
										bool		*outEqColor = NULL) const;

		void			SetRunArray(int32					startOffset, 
									int32					endOffset, 
									const text_run_array	*inRuns);
		text_run_array*	RunArray(int32	startOffset, 
								 int32	endOffset,
								 int32	*outSize = NULL) const;
	
		int32			LineAt(int32 offset) const;
		int32			LineAt(BPoint point) const;
		BPoint			PointAt(int32 inOffset, float *outHeight = NULL) const;
		int32			OffsetAt(BPoint point) const; 
		int32			OffsetAt(int32 line) const;

/*virtual	void			FindWord(int32	inOffset, 
								 int32	*outFromOffset, 
							 	 int32	*outToOffset);

virtual	bool			CanEndLine(int32 offset);
*/	
		float			LineWidth(int32 lineNum = 0) const;
		float			LineHeight(int32 lineNum = 0) const;
		float			TextHeight(int32 startLine, int32 endLine) const;
	
		void			GetTextRegion(int32		startOffset, 
									  int32		endOffset,
									  BRegion	*outRegion) const;
										
//virtual	void			ScrollToOffset(int32 inOffset);
		void			ScrollToSelection();

		void			Highlight(int32 startOffset, int32 endOffset);	

		void			SetTextRect(BRect rect);
		BRect			TextRect() const;
		void			SetStylable(bool stylable);
		bool			IsStylable() const;
		void			SetTabWidth(float width);
		float			TabWidth() const;
		void			MakeSelectable(bool selectable = true);
		bool			IsSelectable() const;
		void			MakeEditable(bool editable = true);
		bool			IsEditable() const;
		void			SetWordWrap(bool wrap);
		bool			DoesWordWrap() const;
		void			SetMaxBytes(int32 max);
		int32			MaxBytes() const;
		void			DisallowChar(uint32 aChar);
		void			AllowChar(uint32 aChar);
		void			SetAlignment(alignment flag);
		alignment		Alignment() const;
		void			SetAutoindent(bool state);
		bool			DoesAutoindent() const;
		void			SetColorSpace(color_space colors);
		color_space		ColorSpace() const;
		void			MakeResizable(bool resize, BView *resizeView = NULL);
		bool			IsResizable() const;
		void			SetDoesUndo(bool undo);
		bool			DoesUndo() const;		
		void			HideTyping(bool enabled);
		bool			IsTypingHidden(void) const;	

//virtual void			ResizeToPreferred();
//virtual void			GetPreferredSize(float *width, float *height);
virtual void			AllAttached();
virtual void			AllDetached();

static	void*			FlattenRunArray(const text_run_array *inArray, 
										int32				 *outSize = NULL);
static	text_run_array*	UnflattenRunArray(const void	*data,
										  int32			*outSize = NULL);
	private :
};

BPTextView::BPTextView(TPasObject PasObject,
					   BRect			frame,
					   const char	*name,
					   BRect			textRect,
					   uint32		resizeMask,
					   uint32		flags)
          : 
          BTextView( frame,
					name, 
					textRect,
					 resizeMask, 
					 flags), 
          BPView(PasObject, BRect(0,0,0,0), name, 0, flags),
          BPHandler(PasObject, name)
//       BPasObject(PasObject)
{

}

BPTextView::BPTextView(TPasObject PasObject,
		  			BRect frame,
					const char *name, 
					BRect textRect,
  		 	 	  	const BFont		*initialFont,
					const rgb_color	*initialColor, 
					uint32 resizeFlags, 
					uint32 flags)
          : 
          BTextView( frame,
					name, 
					textRect,
					initialFont,
					initialColor,
					 resizeFlags, 
					 flags), 
          BPView(PasObject, BRect(0,0,0,0), name, 0, flags),
          BPHandler(PasObject, name)
//       BPasObject(PasObject)
{

}


BPTextView::BPTextView(TPasObject PasObject, BMessage *data)
          :BTextView(data),
          BPView(PasObject, data),
          BPHandler(PasObject, data)
//       BPasObject(PasObject)
{
}

void BPTextView::Pulse(void)
{
	Pulse_hookCall();

	BTextView::Pulse();
}


void BPTextView::KeyDown(const char *bytes, int32 numBytes)
{
	KeyDown_hookCall(bytes,numBytes);
	BTextView::KeyDown(bytes,numBytes);
}




void BPTextView::MessageReceived(BMessage *message)
{
	MessageReceived_hookCall(message);
	BTextView::MessageReceived(message);
}

void BPTextView::Draw(BRect updateRect)
{
	BTextView::Draw(updateRect);
	Draw_hookCall(updateRect);
}

void BPTextView::AttachedToWindow(void)
{
	//BTextView::AttachedToWindow();
	AttachedToWindow_hookCall();
}



void BPTextView::AllAttached(void)
{
  	//AllAttached_hookCall();
	BTextView::AllAttached();
}

void BPTextView::AllDetached(void)
{
	//AllDetached_hookCall();
	BTextView::AllDetached();
}


void BPTextView::WindowActivated(bool active)
{
	BTextView::WindowActivated(active);
}



void BPTextView::FrameResized(float width, float height)
{
    FrameResized_hookCall(width, height);
	BTextView::FrameResized(width, height);
}

void BPTextView::DetachedFromWindow(void)
{
	BTextView::DetachedFromWindow();
}



void BPTextView::MouseDown(BPoint point)
{
	BTextView::MouseDown(point);
}

void BPTextView::MouseMoved(BPoint point, uint32 transit, const BMessage *message)
{
	BTextView::MouseMoved(point, transit, message);
}

void BPTextView::MouseUp(BPoint point)
{
	BTextView::MouseUp(point);
}




#if defined(__cplusplus)
extern "C" {
#endif

/***********************************************************************
 *  Method: BTextView::BTextView
 *  Params: BRect frame, const char *name, BRect textRect, const BFont *initialFont, const rgb_color *initialColor, uint32 resizeMask, uint32 flags
 * Effects: 
 ***********************************************************************/
TCPlusObject BTextView_Create(TPasObject PasObject,
								   BRect			frame,
								  const char	*name,
								  BRect			textRect,
								  uint32		resizeMask,
								  uint32		flags )

{
	return new BPTextView(PasObject, frame, name, textRect, resizeMask, flags);
}

TCPlusObject BTextView_Create_1(TPasObject PasObject, BRect frame, const char *name, BRect textRect, const BFont *initialFont, const rgb_color *initialColor, uint32 resizeMask, uint32 flags)
{
	return new BPTextView(PasObject, frame, name, textRect, initialFont, initialColor, resizeMask, flags);
}


/***********************************************************************
 *  Method: BTextView::BTextView
 *  Params: BMessage *data
 * Effects: 
 ***********************************************************************/
TCPlusObject BTextView_Create_2
(TPasObject PasObject, BMessage *data)
{
	return new BPTextView(PasObject, data);
}


/***********************************************************************
 *  Method: BTextView::~BTextView
 *  Params: 
 * Effects: 
 ***********************************************************************/
void BTextView_FREE(BTextView *TextView)
{
   delete TextView;
}


/***********************************************************************
 *  Method: BTextView::Instantiate
 *  Params: BMessage *data
 * Returns: BArchivable *
 * Effects: 
 ***********************************************************************/
BArchivable *
BTextView_Instantiate(BTextView *TextView, BMessage *data)
{
   return TextView->Instantiate(data);
}


/***********************************************************************
 *  Method: BTextView::Archive
 *  Params: BMessage *data, bool deep
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BTextView_Archive(BTextView *TextView, BMessage *data, bool deep) 
{
   return TextView->Archive(data, deep);
}


/***********************************************************************
 *  Method: BTextView::AttachedToWindow
 *  Params: 
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BTextView_AttachedToWindow(BTextView *TextView)
{
   TextView->AttachedToWindow();
}


/***********************************************************************
 *  Method: BTextView::DetachedFromWindow
 *  Params: 
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BTextView_DetachedFromWindow(BTextView *TextView)
{
   TextView->DetachedFromWindow();
}


/***********************************************************************
 *  Method: BTextView::Draw
 *  Params: BRect inRect
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BTextView_Draw(BTextView *TextView, BRect inRect)
{
   TextView->Draw(inRect);
}


/***********************************************************************
 *  Method: BTextView::MouseDown
 *  Params: BPoint where
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BTextView_MouseDown(BTextView *TextView, BPoint where)
{
   TextView->MouseDown(where);
}


/***********************************************************************
 *  Method: BTextView::MouseUp
 *  Params: BPoint where
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BTextView_MouseUp(BTextView *TextView, BPoint where)
{
   TextView->MouseUp(where);
}


/***********************************************************************
 *  Method: BTextView::MouseMoved
 *  Params: BPoint where, uint32 code, const BMessage *message
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BTextView_MouseMoved(BTextView *TextView, BPoint where, uint32 code, const BMessage *message)
{
   TextView->MouseMoved(where, code, message);
}


/***********************************************************************
 *  Method: BTextView::WindowActivated
 *  Params: bool state
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BTextView_WindowActivated(BTextView *TextView, bool state)
{
   TextView->WindowActivated(state);
}


/***********************************************************************
 *  Method: BTextView::KeyDown
 *  Params: const char *bytes, int32 numBytes
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BTextView_KeyDown(BTextView *TextView, const char *bytes, int32 numBytes)
{
   TextView->KeyDown(bytes, numBytes);
}


/***********************************************************************
 *  Method: BTextView::Pulse
 *  Params: 
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BTextView_Pulse(BTextView *TextView)
{
   TextView->Pulse();
}


/***********************************************************************
 *  Method: BTextView::FrameResized
 *  Params: float width, float height
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BTextView_FrameResized(BTextView *TextView, float width, float height)
{
   TextView->FrameResized(width, height);
}


/***********************************************************************
 *  Method: BTextView::MakeFocus
 *  Params: bool focusState
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BTextView_MakeFocus(BTextView *TextView, bool focusState)
{
   TextView->MakeFocus(focusState);
}


/***********************************************************************
 *  Method: BTextView::MessageReceived
 *  Params: BMessage *message
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BTextView_MessageReceived(BTextView *TextView, BMessage *message)
{
   TextView->MessageReceived(message);
}


/***********************************************************************
 *  Method: BTextView::ResolveSpecifier
 *  Params: BMessage *message, int32 index, BMessage *specifier, int32 form, const char *property
 * Returns: BHandler *
 * Effects: 
 ***********************************************************************/
BHandler *
BTextView_ResolveSpecifier(BTextView *TextView, BMessage *message, int32 index, BMessage *specifier, int32 form, const char *property)
{
   return TextView->ResolveSpecifier(message, index, specifier, form, property);
}


/***********************************************************************
 *  Method: BTextView::GetSupportedSuites
 *  Params: BMessage *data
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BTextView_GetSupportedSuites(BTextView *TextView, BMessage *data)
{
   return TextView->GetSupportedSuites(data);
}


/***********************************************************************
 *  Method: BTextView::Perform
 *  Params: perform_code d, void *arg
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BTextView_Perform(BTextView *TextView, perform_code d, void *arg)
{
   return TextView->Perform(d, arg);
}


/***********************************************************************
 *  Method: BTextView::SetText
 *  Params: const char *inText, const text_run_array *inRuns
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BTextView_SetText(BTextView *TextView, const char *inText, const text_run_array *inRuns)
{
   TextView->SetText(inText, inRuns);
}


/***********************************************************************
 *  Method: BTextView::SetText
 *  Params: const char *inText, int32 inLength, const text_run_array *inRuns
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BTextView_SetText_1
(BTextView *TextView, const char *inText, int32 inLength, const text_run_array *inRuns)
{
   TextView->SetText(inText, inLength, inRuns);
}


/***********************************************************************
 *  Method: BTextView::SetText
 *  Params: BFile *inFile, int32 startOffset, int32 inLength, const text_run_array *inRuns
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BTextView_SetText_2
(BTextView *TextView, BFile *inFile, int32 startOffset, int32 inLength, const text_run_array *inRuns)
{
   TextView->SetText(inFile, startOffset, inLength, inRuns);
}


/***********************************************************************
 *  Method: BTextView::Insert
 *  Params: const char *inText, const text_run_array *inRuns
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BTextView_Insert(BTextView *TextView, const char *inText, const text_run_array *inRuns)
{
   TextView->Insert(inText, inRuns);
}


/***********************************************************************
 *  Method: BTextView::Insert
 *  Params: const char *inText, int32 inLength, const text_run_array *inRuns
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BTextView_Insert_1
(BTextView *TextView, const char *inText, int32 inLength, const text_run_array *inRuns)
{
   TextView->Insert(inText, inLength, inRuns);
}


/***********************************************************************
 *  Method: BTextView::Insert
 *  Params: int32 startOffset, const char *inText, int32 inLength, const text_run_array *inRuns
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BTextView_Insert_2
(BTextView *TextView, int32 startOffset, const char *inText, int32 inLength, const text_run_array *inRuns)
{
   TextView->Insert(startOffset, inText, inLength, inRuns);
}


/***********************************************************************
 *  Method: BTextView::Delete
 *  Params: 
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BTextView_Delete(BTextView *TextView)
{
   TextView->Delete();
}


/***********************************************************************
 *  Method: BTextView::Delete
 *  Params: int32 startOffset, int32 endOffset
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BTextView_Delete_1
(BTextView *TextView, int32 startOffset, int32 endOffset)
{
   TextView->Delete(startOffset, endOffset);
}


/***********************************************************************
 *  Method: BTextView::Text
 *  Params: 
 * Returns: const char *
 * Effects: 
 ***********************************************************************/
const char *
BTextView_Text(BTextView *TextView) 
{
   return TextView->Text();
}


/***********************************************************************
 *  Method: BTextView::TextLength
 *  Params: 
 * Returns: int32
 * Effects: 
 ***********************************************************************/
int32
BTextView_TextLength
(BTextView *TextView) 
{
   return TextView->TextLength();
}


/***********************************************************************
 *  Method: BTextView::GetText
 *  Params: int32 offset, int32 length, char *buffer
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BTextView_GetText(BTextView *TextView, int32 offset, int32 length, char *buffer) 
{
   TextView->GetText(offset, length, buffer);
}


/***********************************************************************
 *  Method: BTextView::ByteAt
 *  Params: int32 offset
 * Returns: uchar
 * Effects: 
 ***********************************************************************/
uchar
BTextView_ByteAt(BTextView *TextView, int32 offset) 
{
   return TextView->ByteAt(offset);
}


/***********************************************************************
 *  Method: BTextView::CountLines
 *  Params: 
 * Returns: int32
 * Effects: 
 ***********************************************************************/
int32
BTextView_CountLines(BTextView *TextView) 
{
   return TextView->CountLines();
}


/***********************************************************************
 *  Method: BTextView::CurrentLine
 *  Params: 
 * Returns: int32
 * Effects: 
 ***********************************************************************/
int32
BTextView_CurrentLine(BTextView *TextView) 
{
   return TextView->CurrentLine();
}


/***********************************************************************
 *  Method: BTextView::GoToLine
 *  Params: int32 lineNum
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BTextView_GoToLine(BTextView *TextView, int32 lineNum)
{
   TextView->GoToLine(lineNum);
}


/***********************************************************************
 *  Method: BTextView::Cut
 *  Params: BClipboard *clipboard
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BTextView_Cut(BTextView *TextView, BClipboard *clipboard)
{
   TextView->Cut(clipboard);
}


/***********************************************************************
 *  Method: BTextView::Copy
 *  Params: BClipboard *clipboard
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BTextView_Copy(BTextView *TextView, BClipboard *clipboard)
{
   TextView->Copy(clipboard);
}


/***********************************************************************
 *  Method: BTextView::Paste
 *  Params: BClipboard *clipboard
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BTextView_Paste(BTextView *TextView, BClipboard *clipboard)
{
   TextView->Paste(clipboard);
}


/***********************************************************************
 *  Method: BTextView::Clear
 *  Params: 
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BTextView_Clear(BTextView *TextView)
{
   TextView->Clear();
}


/***********************************************************************
 *  Method: BTextView::AcceptsPaste
 *  Params: BClipboard *clipboard
 * Returns: bool
 * Effects: 
 ***********************************************************************/
bool
BTextView_AcceptsPaste(BTextView *TextView, BClipboard *clipboard)
{
   return TextView->AcceptsPaste(clipboard);
}


/***********************************************************************
 *  Method: BTextView::AcceptsDrop
 *  Params: const BMessage *inMessage
 * Returns: bool
 * Effects: 
 ***********************************************************************/
bool
BTextView_AcceptsDrop(BTextView *TextView, const BMessage *inMessage)
{
   return TextView->AcceptsDrop(inMessage);
}


/***********************************************************************
 *  Method: BTextView::Select
 *  Params: int32 startOffset, int32 endOffset
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BTextView_Select(BTextView *TextView, int32 startOffset, int32 endOffset)
{
   TextView->Select(startOffset, endOffset);
}


/***********************************************************************
 *  Method: BTextView::SelectAll
 *  Params: 
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BTextView_SelectAll
(BTextView *TextView)
{
   TextView->SelectAll();
}


/***********************************************************************
 *  Method: BTextView::GetSelection
 *  Params: int32 *outStart, int32 *outEnd
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BTextView_GetSelection(BTextView *TextView, int32 *outStart, int32 *outEnd) 
{
   TextView->GetSelection(outStart, outEnd);
}


/***********************************************************************
 *  Method: BTextView::SetFontAndColor
 *  Params: const BFont *inFont, uint32 inMode, const rgb_color *inColor
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BTextView_SetFontAndColor(BTextView *TextView, const BFont *inFont, uint32 inMode, const rgb_color *inColor)
{
   TextView->SetFontAndColor(inFont, inMode, inColor);
}


/***********************************************************************
 *  Method: BTextView::SetFontAndColor
 *  Params: int32 startOffset, int32 endOffset, const BFont *inFont, uint32 inMode, const rgb_color *inColor
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BTextView_SetFontAndColor_1
(BTextView *TextView, int32 startOffset, int32 endOffset, const BFont *inFont, uint32 inMode, const rgb_color *inColor)
{
   TextView->SetFontAndColor(startOffset, endOffset, inFont, inMode, inColor);
}


/***********************************************************************
 *  Method: BTextView::GetFontAndColor
 *  Params: int32 inOffset, BFont *outFont, rgb_color *outColor
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BTextView_GetFontAndColor(BTextView *TextView, int32 inOffset, BFont *outFont, rgb_color *outColor) 
{
   TextView->GetFontAndColor(inOffset, outFont, outColor);
}


/***********************************************************************
 *  Method: BTextView::GetFontAndColor
 *  Params: BFont *outFont, uint32 *outMode, rgb_color *outColor, bool *outEqColor
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BTextView_GetFontAndColor_1
(BTextView *TextView, BFont *outFont, uint32 *outMode, rgb_color *outColor, bool *outEqColor) 
{
   TextView->GetFontAndColor(outFont, outMode, outColor, outEqColor);
}


/***********************************************************************
 *  Method: BTextView::SetRunArray
 *  Params: int32 startOffset, int32 endOffset, const text_run_array *inRuns
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BTextView_SetRunArray(BTextView *TextView, int32 startOffset, int32 endOffset, const text_run_array *inRuns)
{
   TextView->SetRunArray(startOffset, endOffset, inRuns);
}


/***********************************************************************
 *  Method: BTextView::RunArray
 *  Params: int32 startOffset, int32 endOffset, int32 *outSize
 * Returns: text_run_array *
 * Effects: 
 ***********************************************************************/
text_run_array *
BTextView_RunArray(BTextView *TextView, int32 startOffset, int32 endOffset, int32 *outSize) 
{
   return TextView->RunArray(startOffset, endOffset, outSize);
}


/***********************************************************************
 *  Method: BTextView::LineAt
 *  Params: int32 offset
 * Returns: int32
 * Effects: 
 ***********************************************************************/
int32
BTextView_LineAt(BTextView *TextView, int32 offset) 
{
   return TextView->LineAt(offset);
}


/***********************************************************************
 *  Method: BTextView::LineAt
 *  Params: BPoint point
 * Returns: int32
 * Effects: 
 ***********************************************************************/
int32
BTextView_LineAt_1
(BTextView *TextView, BPoint point) 
{
   return TextView->LineAt(point);
}


/***********************************************************************
 *  Method: BTextView::PointAt
 *  Params: int32 inOffset, float *outHeight
 * Returns: BPoint
 * Effects: 
 ***********************************************************************/
BPoint
BTextView_PointAt(BTextView *TextView, int32 inOffset, float *outHeight) 
{
   return TextView->PointAt(inOffset, outHeight);
}


/***********************************************************************
 *  Method: BTextView::OffsetAt
 *  Params: BPoint point
 * Returns: int32
 * Effects: 
 ***********************************************************************/
int32
BTextView_OffsetAt(BTextView *TextView, BPoint point) 
{
   return TextView->OffsetAt(point);
}


/***********************************************************************
 *  Method: BTextView::OffsetAt
 *  Params: int32 line
 * Returns: int32
 * Effects: 
 ***********************************************************************/
int32
BTextView_OffsetAt_1
(BTextView *TextView, int32 line) 
{
   return TextView->OffsetAt(line);
}


/***********************************************************************
 *  Method: BTextView::FindWord
 *  Params: int32 inOffset, int32 *outFromOffset, int32 *outToOffset
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BTextView_FindWord(BTextView *TextView, int32 inOffset, int32 *outFromOffset, int32 *outToOffset)
{
   TextView->FindWord(inOffset, outFromOffset, outToOffset);
}


/***********************************************************************
 *  Method: BTextView::CanEndLine
 *  Params: int32 offset
 * Returns: bool
 * Effects: 
 ***********************************************************************/
bool
BTextView_CanEndLine(BTextView *TextView, int32 offset)
{
   return TextView->CanEndLine(offset);
}


/***********************************************************************
 *  Method: BTextView::LineWidth
 *  Params: int32 lineNum
 * Returns: float
 * Effects: 
 ***********************************************************************/
float
BTextView_LineWidth(BTextView *TextView, int32 lineNum) 
{
   return TextView->LineWidth(lineNum);
}


/***********************************************************************
 *  Method: BTextView::LineHeight
 *  Params: int32 lineNum
 * Returns: float
 * Effects: 
 ***********************************************************************/
float
BTextView_LineHeight(BTextView *TextView, int32 lineNum) 
{
   return TextView->LineHeight(lineNum);
}


/***********************************************************************
 *  Method: BTextView::TextHeight
 *  Params: int32 startLine, int32 endLine
 * Returns: float
 * Effects: 
 ***********************************************************************/
float
BTextView_TextHeight(BTextView *TextView, int32 startLine, int32 endLine) 
{
   return TextView->TextHeight(startLine, endLine);
}


/***********************************************************************
 *  Method: BTextView::GetTextRegion
 *  Params: int32 startOffset, int32 endOffset, BRegion *outRegion
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BTextView_GetTextRegion(BTextView *TextView, int32 startOffset, int32 endOffset, BRegion *outRegion) 
{
   TextView->GetTextRegion(startOffset, endOffset, outRegion);
}


/***********************************************************************
 *  Method: BTextView::ScrollToOffset
 *  Params: int32 inOffset
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BTextView_ScrollToOffset(BTextView *TextView, int32 inOffset)
{
   TextView->ScrollToOffset(inOffset);
}


/***********************************************************************
 *  Method: BTextView::ScrollToSelection
 *  Params: 
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BTextView_ScrollToSelection(BTextView *TextView)
{
   TextView->ScrollToSelection();
}


/***********************************************************************
 *  Method: BTextView::Highlight
 *  Params: int32 startOffset, int32 endOffset
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BTextView_Highlight(BTextView *TextView, int32 startOffset, int32 endOffset)
{
   TextView->Highlight(startOffset, endOffset);
}


/***********************************************************************
 *  Method: BTextView::SetTextRect
 *  Params: BRect rect
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BTextView_SetTextRect(BTextView *TextView, BRect rect)
{
   TextView->SetTextRect(rect);
}


/***********************************************************************
 *  Method: BTextView::TextRect
 *  Params: 
 * Returns: BRect
 * Effects: 
 ***********************************************************************/
BRect
BTextView_TextRect(BTextView *TextView) 
{
   return TextView->TextRect();
}


/***********************************************************************
 *  Method: BTextView::SetStylable
 *  Params: bool stylable
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BTextView_SetStylable(BTextView *TextView, bool stylable)
{
   TextView->SetStylable(stylable);
}


/***********************************************************************
 *  Method: BTextView::IsStylable
 *  Params: 
 * Returns: bool
 * Effects: 
 ***********************************************************************/
bool
BTextView_IsStylable(BTextView *TextView) 
{
   return TextView->IsStylable();
}


/***********************************************************************
 *  Method: BTextView::SetTabWidth
 *  Params: float width
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BTextView_SetTabWidth(BTextView *TextView, float width)
{
   TextView->SetTabWidth(width);
}


/***********************************************************************
 *  Method: BTextView::TabWidth
 *  Params: 
 * Returns: float
 * Effects: 
 ***********************************************************************/
float
BTextView_TabWidth(BTextView *TextView) 
{
   return TextView->TabWidth();
}


/***********************************************************************
 *  Method: BTextView::MakeSelectable
 *  Params: bool selectable
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BTextView_MakeSelectable(BTextView *TextView, bool selectable)
{
   TextView->MakeSelectable(selectable);
}


/***********************************************************************
 *  Method: BTextView::IsSelectable
 *  Params: 
 * Returns: bool
 * Effects: 
 ***********************************************************************/
bool
BTextView_IsSelectable(BTextView *TextView) 
{
   return TextView->IsSelectable();
}


/***********************************************************************
 *  Method: BTextView::MakeEditable
 *  Params: bool editable
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BTextView_MakeEditable(BTextView *TextView, bool editable)
{
   TextView->MakeEditable(editable);
}


/***********************************************************************
 *  Method: BTextView::IsEditable
 *  Params: 
 * Returns: bool
 * Effects: 
 ***********************************************************************/
bool
BTextView_IsEditable(BTextView *TextView) 
{
   return TextView->IsEditable();
}


/***********************************************************************
 *  Method: BTextView::SetWordWrap
 *  Params: bool wrap
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BTextView_SetWordWrap(BTextView *TextView, bool wrap)
{
   TextView->SetWordWrap(wrap);
}


/***********************************************************************
 *  Method: BTextView::DoesWordWrap
 *  Params: 
 * Returns: bool
 * Effects: 
 ***********************************************************************/
bool
BTextView_DoesWordWrap(BTextView *TextView) 
{
   return TextView->DoesWordWrap();
}


/***********************************************************************
 *  Method: BTextView::SetMaxBytes
 *  Params: int32 max
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BTextView_SetMaxBytes(BTextView *TextView, int32 max)
{
   TextView->SetMaxBytes(max);
}


/***********************************************************************
 *  Method: BTextView::MaxBytes
 *  Params: 
 * Returns: int32
 * Effects: 
 ***********************************************************************/
int32
BTextView_MaxBytes(BTextView *TextView) 
{
   return TextView->MaxBytes();
}


/***********************************************************************
 *  Method: BTextView::DisallowChar
 *  Params: uint32 aChar
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BTextView_DisallowChar(BTextView *TextView, uint32 aChar)
{
   TextView->DisallowChar(aChar);
}


/***********************************************************************
 *  Method: BTextView::AllowChar
 *  Params: uint32 aChar
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BTextView_AllowChar(BTextView *TextView, uint32 aChar)
{
   TextView->AllowChar(aChar);
}


/***********************************************************************
 *  Method: BTextView::SetAlignment
 *  Params: alignment flag
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BTextView_SetAlignment(BTextView *TextView, alignment flag)
{
   TextView->SetAlignment(flag);
}


/***********************************************************************
 *  Method: BTextView::Alignment
 *  Params: 
 * Returns: alignment
 * Effects: 
 ***********************************************************************/
alignment
BTextView_Alignment(BTextView *TextView) 
{
   return TextView->Alignment();
}


/***********************************************************************
 *  Method: BTextView::SetAutoindent
 *  Params: bool state
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BTextView_SetAutoindent(BTextView *TextView, bool state)
{
   TextView->SetAutoindent(state);
}


/***********************************************************************
 *  Method: BTextView::DoesAutoindent
 *  Params: 
 * Returns: bool
 * Effects: 
 ***********************************************************************/
bool
BTextView_DoesAutoindent(BTextView *TextView) 
{
   return TextView->DoesAutoindent();
}


/***********************************************************************
 *  Method: BTextView::SetColorSpace
 *  Params: color_space colors
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BTextView_SetColorSpace(BTextView *TextView, color_space colors)
{
   TextView->SetColorSpace(colors);
}


/***********************************************************************
 *  Method: BTextView::ColorSpace
 *  Params: 
 * Returns: color_space
 * Effects: 
 ***********************************************************************/
color_space
BTextView_ColorSpace(BTextView *TextView) 
{
   return TextView->ColorSpace();
}


/***********************************************************************
 *  Method: BTextView::MakeResizable
 *  Params: bool resize, BView *resizeView
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BTextView_MakeResizable(BTextView *TextView, bool resize, BView *resizeView)
{
   TextView->MakeResizable(resize, resizeView);
}


/***********************************************************************
 *  Method: BTextView::IsResizable
 *  Params: 
 * Returns: bool
 * Effects: 
 ***********************************************************************/
bool
BTextView_IsResizable(BTextView *TextView) 
{
   return TextView->IsResizable();
}


/***********************************************************************
 *  Method: BTextView::SetDoesUndo
 *  Params: bool undo
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BTextView_SetDoesUndo(BTextView *TextView, bool undo)
{
   TextView->SetDoesUndo(undo);
}


/***********************************************************************
 *  Method: BTextView::DoesUndo
 *  Params: 
 * Returns: bool
 * Effects: 
 ***********************************************************************/
bool
BTextView_DoesUndo(BTextView *TextView) 
{
   return TextView->DoesUndo();
}


/***********************************************************************
 *  Method: BTextView::HideTyping
 *  Params: bool enabled
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BTextView_HideTyping(BTextView *TextView, bool enabled)
{
   TextView->HideTyping(enabled);
}


/***********************************************************************
 *  Method: BTextView::IsTypingHidden
 *  Params: void
 * Returns: bool
 * Effects: 
 ***********************************************************************/
bool
BTextView_IsTypingHidden(BTextView *TextView) 
{
   return TextView->IsTypingHidden();
}


/***********************************************************************
 *  Method: BTextView::ResizeToPreferred
 *  Params: 
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BTextView_ResizeToPreferred(BTextView *TextView)
{
   TextView->ResizeToPreferred();
}


/***********************************************************************
 *  Method: BTextView::GetPreferredSize
 *  Params: float *width, float *height
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BTextView_GetPreferredSize(BTextView *TextView, float *width, float *height)
{
   TextView->GetPreferredSize(width, height);
}


/***********************************************************************
 *  Method: BTextView::AllAttached
 *  Params: 
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BTextView_AllAttached(BTextView *TextView)
{
   TextView->AllAttached();
}


/***********************************************************************
 *  Method: BTextView::AllDetached
 *  Params: 
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BTextView_AllDetached(BTextView *TextView)
{
   TextView->AllDetached();
}


/***********************************************************************
 *  Method: BTextView::FlattenRunArray
 *  Params: const text_run_array *inArray, int32 *outSize
 * Returns: void *
 * Effects: 
 ***********************************************************************/
void *
BTextView_FlattenRunArray(BTextView *TextView, const text_run_array *inArray, int32 *outSize)
{
   TextView->FlattenRunArray(inArray, outSize);
}


/***********************************************************************
 *  Method: BTextView::UnflattenRunArray
 *  Params: const void *data, int32 *outSize
 * Returns: text_run_array *
 * Effects: 
 ***********************************************************************/
text_run_array *
BTextView_UnflattenRunArray(BTextView *TextView, const void *data, int32 *outSize)
{
   return TextView->UnflattenRunArray(data, outSize);
}



/*void
BTextView_InsertText(BTextView *TextView, const char *inText, int32 inLength, int32 inOffset, const text_run_array *inRuns)
{
   TextView->InsertText(inText, inLength, inOffset, inRuns);
}


void
BTextView_DeleteText(BTextView *TextView, int32 fromOffset, int32 toOffset)
{
   TextView->DeleteText(fromOffset, toOffset);
}
*/


void
BTextView_Undo(BTextView *TextView, BClipboard *clipboard)
{
   TextView->Undo(clipboard);
}


#if defined(__cplusplus)
}
#endif

#endif /* _TEXTVIEW_CPP_ */

