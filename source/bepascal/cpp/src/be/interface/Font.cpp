/*  BePascal - A pascal wrapper around the BeOS API
    Copyright (C) 2002  Olivier Coursiere
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

#ifndef _FONT_CPP_
#define _FONT_CPP_


#include "Font.h"
#include "font.h"
#include "Rect.h"
#include <beobj.h>



BPFont::BPFont(TPasObject PasObject, const BFont &font) : BFont( font), BPasObject(PasObject)
{
}

BPFont::BPFont(TPasObject PasObject) : BFont(), BPasObject(PasObject)
{
}


#if defined(__cplusplus)
extern "C" {
#endif

/***********************************************************************
 * AUTHOR: nobody <baron>
 *   FILE: Font.cpp
 *   DATE: Wed Jan 29 20:08:34 2003
 *  DESCR: 
 ***********************************************************************/
#include "Font.h"

/***********************************************************************
 *  Method: BFont::BFont
 *  Params: 
 * Effects: 
 ***********************************************************************/
TCPlusObject BFont_Create(TPasObject PasObject)
{
	return new BPFont(PasObject);
}


/***********************************************************************
 *  Method: BFont::BFont
 *  Params: const BFont &font
 * Effects: 
 ***********************************************************************/
TCPlusObject BFont_Create_1
(TPasObject PasObject, const BFont &font)
{
	return new BPFont(PasObject, font);
}


/***********************************************************************
 *  Method: BFont::BFont
 *  Params: const BFont *font
 * Effects: 
 ***********************************************************************/
TCPlusObject BFont_Create_2
(TPasObject PasObject, const BFont *font)
{
	return new BPFont(PasObject, font);
}

void BFont_Free
(BFont *font)
{
	//delete font;
}


/***********************************************************************
 *  Method: BFont::SetFamilyAndStyle
 *  Params: const font_family family, const font_style style
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BFont_SetFamilyAndStyle(BFont *Font, const font_family family, const font_style style)
{
   //return Font->SetFamilyAndStyle(family, style);
}


/***********************************************************************
 *  Method: BFont::SetFamilyAndStyle
 *  Params: uint32 code
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BFont_SetFamilyAndStyle_1
(BFont *Font, uint32 code)
{
   //Font->SetFamilyAndStyle(code);
}


/***********************************************************************
 *  Method: BFont::SetFamilyAndFace
 *  Params: const font_family family, uint16 face
 * Returns: status_t
 * Effects: 
 ***********************************************************************/
status_t
BFont_SetFamilyAndFace(BFont *Font, const font_family family, uint16 face)
{
   return Font->SetFamilyAndFace(family, face);
}


/***********************************************************************
 *  Method: BFont::SetSize
 *  Params: float size
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BFont_SetSize(BFont *Font, float size)
{
   Font->SetSize(size);
}


/***********************************************************************
 *  Method: BFont::SetShear
 *  Params: float shear
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BFont_SetShear(BFont *Font, float shear)
{
   Font->SetShear(shear);
}


/***********************************************************************
 *  Method: BFont::SetRotation
 *  Params: float rotation
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BFont_SetRotation(BFont *Font, float rotation)
{
   Font->SetRotation(rotation);
}


/***********************************************************************
 *  Method: BFont::SetSpacing
 *  Params: uint8 spacing
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BFont_SetSpacing(BFont *Font, uint8 spacing)
{
   Font->SetSpacing(spacing);
}


/***********************************************************************
 *  Method: BFont::SetEncoding
 *  Params: uint8 encoding
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BFont_SetEncoding(BFont *Font, uint8 encoding)
{
   Font->SetEncoding(encoding);
}


/***********************************************************************
 *  Method: BFont::SetFace
 *  Params: uint16 face
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BFont_SetFace(BFont *Font, uint16 face)
{
   Font->SetFace(face);
}


/***********************************************************************
 *  Method: BFont::SetFlags
 *  Params: uint32 flags
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BFont_SetFlags(BFont *Font, uint32 flags)
{
   Font->SetFlags(flags);
}


/***********************************************************************
 *  Method: BFont::GetFamilyAndStyle
 *  Params: font_family *family, font_style *style
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BFont_GetFamilyAndStyle(BFont *Font, font_family *family, font_style *style) 
{
   //Font->GetFamilyAndStyle(family, style);
}


/***********************************************************************
 *  Method: BFont::FamilyAndStyle
 *  Params: 
 * Returns: uint32
 * Effects: 
 ***********************************************************************/
uint32
BFont_FamilyAndStyle(BFont *Font) 
{
  // return Font->FamilyAndStyle();
}


/***********************************************************************
 *  Method: BFont::Size
 *  Params: 
 * Returns: float
 * Effects: 
 ***********************************************************************/
float
BFont_Size(BFont *Font) 
{
   return Font->Size();
}


/***********************************************************************
 *  Method: BFont::Shear
 *  Params: 
 * Returns: float
 * Effects: 
 ***********************************************************************/
float
BFont_Shear(BFont *Font) 
{
   return Font->Shear();
}


/***********************************************************************
 *  Method: BFont::Rotation
 *  Params: 
 * Returns: float
 * Effects: 
 ***********************************************************************/
float
BFont_Rotation(BFont *Font) 
{
   return Font->Rotation();
}


/***********************************************************************
 *  Method: BFont::Spacing
 *  Params: 
 * Returns: uint8
 * Effects: 
 ***********************************************************************/
uint8
BFont_Spacing(BFont *Font) 
{
   return Font->Spacing();
}


/***********************************************************************
 *  Method: BFont::Encoding
 *  Params: 
 * Returns: uint8
 * Effects: 
 ***********************************************************************/
uint8
BFont_Encoding(BFont *Font) 
{
   return Font->Encoding();
}


/***********************************************************************
 *  Method: BFont::Face
 *  Params: 
 * Returns: uint16
 * Effects: 
 ***********************************************************************/
uint16
BFont_Face(BFont *Font) 
{
   return Font->Face();
}


/***********************************************************************
 *  Method: BFont::Flags
 *  Params: 
 * Returns: uint32
 * Effects: 
 ***********************************************************************/
uint32
BFont_Flags(BFont *Font) 
{
   return Font->Flags();
}


/***********************************************************************
 *  Method: BFont::Direction
 *  Params: 
 * Returns: font_direction
 * Effects: 
 ***********************************************************************/
font_direction
BFont_Direction(BFont *Font) 
{
   return Font->Direction();
}


/***********************************************************************
 *  Method: BFont::IsFixed
 *  Params: 
 * Returns: bool
 * Effects: 
 ***********************************************************************/
bool
BFont_IsFixed(BFont *Font) 
{
   return Font->IsFixed();
}


/***********************************************************************
 *  Method: BFont::IsFullAndHalfFixed
 *  Params: 
 * Returns: bool
 * Effects: 
 ***********************************************************************/
bool
BFont_IsFullAndHalfFixed(BFont *Font) 
{
   return Font->IsFullAndHalfFixed();
}


/***********************************************************************
 *  Method: BFont::BoundingBox
 *  Params: 
 * Returns: BRect
 * Effects: 
 ***********************************************************************/
BRect
BFont_BoundingBox(BFont *Font) 
{
   return Font->BoundingBox();
}


/***********************************************************************
 *  Method: BFont::Blocks
 *  Params: 
 * Returns: unicode_block
 * Effects: 
 ***********************************************************************/
unicode_block
BFont_Blocks(BFont *Font) 
{
   return Font->Blocks();
}


/***********************************************************************
 *  Method: BFont::FileFormat
 *  Params: 
 * Returns: font_file_format
 * Effects: 
 ***********************************************************************/
font_file_format
BFont_FileFormat(BFont *Font) 
{
   return Font->FileFormat();
}


/***********************************************************************
 *  Method: BFont::CountTuned
 *  Params: 
 * Returns: int32
 * Effects: 
 ***********************************************************************/
int32
BFont_CountTuned(BFont *Font) 
{
   return Font->CountTuned();
}


/***********************************************************************
 *  Method: BFont::GetTunedInfo
 *  Params: int32 index, tuned_font_info *info
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BFont_GetTunedInfo(BFont *Font, int32 index, tuned_font_info *info) 
{
   Font->GetTunedInfo(index, info);
}


/***********************************************************************
 *  Method: BFont::TruncateString
 *  Params: BString *in_out, uint32 mode, float width
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BFont_TruncateString(BFont *Font, BString *in_out, uint32 mode, float width) 
{
   Font->TruncateString(in_out, mode, width);
}


/***********************************************************************
 *  Method: BFont::GetTruncatedStrings
 *  Params: const char *stringArray[], int32 numStrings, uint32 mode, float width, BString resultArray[]
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BFont_GetTruncatedStrings(BFont *Font, const char *stringArray[], int32 numStrings, uint32 mode, float width, BString resultArray[]) 
{
   Font->GetTruncatedStrings(stringArray, numStrings, mode, width, resultArray);
}


/***********************************************************************
 *  Method: BFont::GetTruncatedStrings
 *  Params: const char *stringArray[], int32 numStrings, uint32 mode, float width, char *resultArray[]
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BFont_GetTruncatedStrings_1
(BFont *Font, const char *stringArray[], int32 numStrings, uint32 mode, float width, char *resultArray[]) 
{
   Font->GetTruncatedStrings(stringArray, numStrings, mode, width, resultArray);
}


/***********************************************************************
 *  Method: BFont::StringWidth
 *  Params: const char *string
 * Returns: float
 * Effects: 
 ***********************************************************************/
float
BFont_StringWidth(BFont *Font, const char *string) 
{
   return Font->StringWidth(string);
}


/***********************************************************************
 *  Method: BFont::StringWidth
 *  Params: const char *string, int32 length
 * Returns: float
 * Effects: 
 ***********************************************************************/
float
BFont_StringWidth_1
(BFont *Font, const char *string, int32 length) 
{
   return Font->StringWidth(string, length);
}


/***********************************************************************
 *  Method: BFont::GetStringWidths
 *  Params: const char *stringArray[], const int32 lengthArray[], int32 numStrings, float widthArray[]
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BFont_GetStringWidths(BFont *Font, const char *stringArray[], const int32 lengthArray[], int32 numStrings, float widthArray[]) 
{
   Font->GetStringWidths(stringArray, lengthArray, numStrings, widthArray);
}


/***********************************************************************
 *  Method: BFont::GetEscapements
 *  Params: const char charArray[], int32 numChars, float escapementArray[]
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BFont_GetEscapements(BFont *Font, const char charArray[], int32 numChars, float escapementArray[]) 
{
   Font->GetEscapements(charArray, numChars, escapementArray);
}


/***********************************************************************
 *  Method: BFont::GetEscapements
 *  Params: const char charArray[], int32 numChars, escapement_delta *delta, float escapementArray[]
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BFont_GetEscapements_1
(BFont *Font, const char charArray[], int32 numChars, escapement_delta *delta, float escapementArray[]) 
{
   Font->GetEscapements(charArray, numChars, delta, escapementArray);
}


/***********************************************************************
 *  Method: BFont::GetEscapements
 *  Params: const char charArray[], int32 numChars, escapement_delta *delta, BPoint escapementArray[]
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BFont_GetEscapements_2
(BFont *Font, const char charArray[], int32 numChars, escapement_delta *delta, BPoint escapementArray[]) 
{
   Font->GetEscapements(charArray, numChars, delta, escapementArray);
}


/***********************************************************************
 *  Method: BFont::GetEscapements
 *  Params: const char charArray[], int32 numChars, escapement_delta *delta, BPoint escapementArray[], BPoint offsetArray[]
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BFont_GetEscapements_3
(BFont *Font, const char charArray[], int32 numChars, escapement_delta *delta, BPoint escapementArray[], BPoint offsetArray[]) 
{
   Font->GetEscapements(charArray, numChars, delta, escapementArray, offsetArray);
}


/***********************************************************************
 *  Method: BFont::GetEdges
 *  Params: const char charArray[], int32 numBytes, edge_info edgeArray[]
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BFont_GetEdges(BFont *Font, const char charArray[], int32 numBytes, edge_info edgeArray[]) 
{
   Font->GetEdges(charArray, numBytes, edgeArray);
}


/***********************************************************************
 *  Method: BFont::GetHeight
 *  Params: font_height *height
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BFont_GetHeight(BFont *Font, font_height *height) 
{
   Font->GetHeight(height);
}


/***********************************************************************
 *  Method: BFont::GetBoundingBoxesAsGlyphs
 *  Params: const char charArray[], int32 numChars, font_metric_mode mode, BRect boundingBoxArray[]
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BFont_GetBoundingBoxesAsGlyphs(BFont *Font, const char charArray[], int32 numChars, font_metric_mode mode, BRect boundingBoxArray[]) 
{
   Font->GetBoundingBoxesAsGlyphs(charArray, numChars, mode, boundingBoxArray);
}


/***********************************************************************
 *  Method: BFont::GetBoundingBoxesAsString
 *  Params: const char charArray[], int32 numChars, font_metric_mode mode, escapement_delta *delta, BRect boundingBoxArray[]
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BFont_GetBoundingBoxesAsString(BFont *Font, const char charArray[], int32 numChars, font_metric_mode mode, escapement_delta *delta, BRect boundingBoxArray[]) 
{
   Font->GetBoundingBoxesAsString(charArray, numChars, mode, delta, boundingBoxArray);
}


/***********************************************************************
 *  Method: BFont::GetBoundingBoxesForStrings
 *  Params: const char *stringArray[], int32 numStrings, font_metric_mode mode, escapement_delta deltas[], BRect boundingBoxArray[]
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BFont_GetBoundingBoxesForStrings(BFont *Font, const char *stringArray[], int32 numStrings, font_metric_mode mode, escapement_delta deltas[], BRect boundingBoxArray[]) 
{
   Font->GetBoundingBoxesForStrings(stringArray, numStrings, mode, deltas, boundingBoxArray);
}


/***********************************************************************
 *  Method: BFont::GetGlyphShapes
 *  Params: const char charArray[], int32 numChars, BShape *glyphShapeArray[]
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BFont_GetGlyphShapes(BFont *Font, const char charArray[], int32 numChars, BShape *glyphShapeArray[]) 
{
   Font->GetGlyphShapes(charArray, numChars, glyphShapeArray);
}


/***********************************************************************
 *  Method: BFont::GetHasGlyphs
 *  Params: const char charArray[], int32 numChars, bool hasArray[]
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BFont_GetHasGlyphs(BFont *Font, const char charArray[], int32 numChars, bool hasArray[]) 
{
   Font->GetHasGlyphs(charArray, numChars, hasArray);
}



/***********************************************************************
 *  Method: BFont::PrintToStream
 *  Params: 
 * Returns: void
 * Effects: 
 ***********************************************************************/
void
BFont_PrintToStream(BFont *Font) 
{
   Font->PrintToStream();
}




#if defined(__cplusplus)
}
#endif

#endif /* _FONT_CPP_ */

