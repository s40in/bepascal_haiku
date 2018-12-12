{   BePascal - A pascal wrapper around the BeOS API
    Copyright (C) 2002-2003 Olivier Coursiere                                        
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
}                                                                               
unit Font;

interface

uses
  BeObj, Flattenable, InterfaceDefs, Rect, _String, SupportDefs;

const
  B_FONT_FAMILY_LENGTH = 63;
  B_FONT_STYLE_LENGTH = 63;

type
  font_family = string[B_FONT_FAMILY_LENGTH + 1]; //array[0..B_FONT_FAMILY_LENGTH] of char;
  font_style = string[B_FONT_STYLE_LENGTH + 1];   //array[0..B_FONT_STYLE_LENGTH] of char;

const
  B_CHAR_SPACING   = 0;
  B_STRING_SPACING = 1;
  B_BITMAP_SPACING = 2;
  B_FIXED_SPACING  = 3;

type
  font_direction = (
    B_FONT_LEFT_TO_RIGHT,
    B_FONT_RIGHT_TO_LEFT
  );

const
  B_DISABLE_ANTIALIASING = $00000001;
  B_FORCE_ANTIALIASING   = $00000002;


  B_TRUNCATE_END       = 0;
  B_TRUNCATE_BEGINNING = 1;
  B_TRUNCATE_MIDDLE    = 2;
  B_TRUNCATE_SMART     = 3;


  B_UNICODE_UTF8    = 0;
  B_ISO_8859_1      = 1;
  B_ISO_8859_2      = 2;
  B_ISO_8859_3      = 3;
  B_ISO_8859_4      = 4;
  B_ISO_8859_5      = 5;
  B_ISO_8859_6      = 6;
  B_ISO_8859_7      = 7;
  B_ISO_8859_8      = 8;
  B_ISO_8859_9      = 9;
  B_ISO_8859_10     = 10;
  B_MACINTOSH_ROMAN = 11;


  B_SCREEN_FONT_CACHE      = $0001;
  B_PRINTING_FONT_CACHE    = $0002;
  B_DEFAULT_CACHE_SETTING  = $0004;
  B_APP_CACHE_SETTING      = $0008;


  B_HAS_TUNED_FONT = $0001;
  B_IS_FIXED       = $0002;


//  B__NUM_FONT       = 5;

  B_ITALIC_FACE     = $0001;
  B_UNDERSCORE_FACE = $0002;
  B_NEGATIVE_FACE   = $0004;
  B_OUTLINED_FACE   = $0008;
  B_STRIKEOUT_FACE  = $0010;
  B_BOLD_FACE       = $0020;
  B_REGULAR_FACE    = $0040;

type
  font_metric_mode = (
    B_SCREEN_METRIC,
    B_PRINTING_METRIC
  );

  font_file_format = (
    B_TRUETYPE_WINDOWS,
    B_POSTSCRIPT_TYPE1_WINDOWS
  );
{
 font_which = (font_which_nil,
   B_PLAIN_FONT,
   B_BOLD_FONT,
   B_FIXED_FONT,
   B_SYMBOL_FONT,
   B_SERIF_FONT
 );
}

type
  edge_info = record
    left,
    right : Single;
  end;

  font_height = record
    ascent,
    descent,
    leading: Single;
  end;

  escapement_delta = record
    nonspace,
    space     : Single;
  end;

  font_cache_info = record
    sheared_font_penalty,
    rotated_font_penalty   : Longint;
    oversize_threshold     : Single;
    oversize_penalty,
    cache_size             : Longint;
    spacing_size_threshold : Single;
  end;

  tuned_font_info = record
    size,
    shear,
    rotation : Single;
    flags : Longword;
    face  : Word;
  end;

type
  BFont = class(TBeObject)
  public
    constructor Create;
    constructor Create(font : BFont); virtual;
    destructor  Destroy;override;
    function SetFamilyAndStyle(family : Font_FAMILY; style : font_style) : status_t;
    procedure SetFamilyAndStyle(code : Longword);
    function SetFamilyAndFace(family : Font_FAMILY; aface : Word) : status_t;
    procedure SetSize(asize : Single);
    procedure SetShear(ashear : Single);
    procedure SetRotation(arotation : Single);
    procedure SetSpacing(aspacing : Byte);
    procedure SetEncoding(aencoding : Byte);
    procedure SetFace(aface : Word);
    procedure SetFlags(aflags : Longword);
    procedure GetFamilyAndStyle(family : font_family; style : font_style);
    function FamilyAndStyle : Longword;
    function Size : Single;
    function Shear : Single;
    function Rotation : Single;
    function Spacing : Byte;
    function Encoding : Byte;
    function Face : Word;
    function Flags : Longword;
    function Direction : Font_direction;
    function IsFixed : Boolean;
    function IsFullAndHalfFixed : Boolean;
    function BoundingBox : BRect;
//    function Blocks : ;
    function FileFormat : Font_file_format;
    function CountTuned : Longint;
    procedure GetTunedInfo(index : Longint; info : tuned_font_info);
    procedure TruncateString(in_out : BString; mode : Longword; width : Single);
//    procedure GetTruncatedStrings(stringArray : PChar; numStrings : integer; mode : Cardinal; width : single; resultArray : Pchar);
//    procedure GetTruncatedStrings(stringArray : PChar; numStrings : integer; mode : Cardinal; width : single; resultArray : PChar);
    function StringWidth(astring : PChar) : Single;
    function StringWidth(astring : PChar; length : Longint) : Single;
//    procedure GetStringWidths(stringArray : PChar; lengthArray : integer; numStrings : integer; widthArray : single);
//    procedure GetEscapements(charArray : ; numChars : integer; escapementArray : single);
//    procedure GetEscapements(charArray : ; numChars : integer; delta : ; escapementArray : single);
 //   procedure GetEscapements(charArray : ; numChars : integer; delta : ; escapementArray : TPoint);
 //   procedure GetEscapements(charArray : ; numChars : integer; delta : ; escapementArray : TPoint; offsetArray : TPoint);
  //  procedure GetEdges(charArray : ; numBytes : integer; edgeArray : );
   procedure GetHeight(height : Font_height);
 //   procedure GetBoundingBoxesAsGlyphs(charArray : ; numChars : integer; mode : ; boundingBoxArray : BRect);
  //  procedure GetBoundingBoxesAsString(charArray : ; numChars : integer; mode : ; delta : ; boundingBoxArray : BRect);
  //  procedure GetBoundingBoxesForStrings(stringArray : PChar; numStrings : integer; mode : ; deltas : ; boundingBoxArray : BRect);
//    procedure GetGlyphShapes(charArray : ; numChars : integer; glyphShapeArray : );
 //   procedure GetHasGlyphs(charArray : ; numChars : integer; hasArray : boolean);
    procedure PrintToStream;
  end;

{procedure edge_info_float left(AObject : TCPlusObject); cdecl; external BePascalLibName name 'edge_info_float left';
procedure edge_info_float right(AObject : TCPlusObject); cdecl; external BePascalLibName name 'edge_info_float right';
procedure font_height_float ascent(AObject : TCPlusObject); cdecl; external BePascalLibName name 'font_height_float ascent';
procedure font_height_float descent(AObject : TCPlusObject); cdecl; external BePascalLibName name 'font_height_float descent';
procedure font_height_float leading(AObject : TCPlusObject); cdecl; external BePascalLibName name 'font_height_float leading';
procedure escapement_delta_float nonspace(AObject : TCPlusObject); cdecl; external BePascalLibName name 'escapement_delta_float nonspace';
procedure escapement_delta_float space(AObject : TCPlusObject); cdecl; external BePascalLibName name 'escapement_delta_float space';
procedure font_cache_info_int32 sheared_font_penalty(AObject : TCPlusObject); cdecl; external BePascalLibName name 'font_cache_info_int32 sheared_font_penalty';
procedure font_cache_info_int32 rotated_font_penalty(AObject : TCPlusObject); cdecl; external BePascalLibName name 'font_cache_info_int32 rotated_font_penalty';
procedure font_cache_info_float oversize_threshold(AObject : TCPlusObject); cdecl; external BePascalLibName name 'font_cache_info_float oversize_threshold';
procedure font_cache_info_int32 oversize_penalty(AObject : TCPlusObject); cdecl; external BePascalLibName name 'font_cache_info_int32 oversize_penalty';
procedure font_cache_info_int32 cache_size(AObject : TCPlusObject); cdecl; external BePascalLibName name 'font_cache_info_int32 cache_size';
procedure font_cache_info_float spacing_size_threshold(AObject : TCPlusObject); cdecl; external BePascalLibName name 'font_cache_info_float spacing_size_threshold';
procedure tuned_font_info_float size(AObject : TCPlusObject); cdecl; external BePascalLibName name 'tuned_font_info_float size';
procedure tuned_font_info_float shear(AObject : TCPlusObject); cdecl; external BePascalLibName name 'tuned_font_info_float shear';
procedure tuned_font_info_float rotation(AObject : TCPlusObject); cdecl; external BePascalLibName name 'tuned_font_info_float rotation';
procedure tuned_font_info_uint32 flags(AObject : TCPlusObject); cdecl; external BePascalLibName name 'tuned_font_info_uint32 flags';
procedure tuned_font_info_uint16 face(AObject : TCPlusObject); cdecl; external BePascalLibName name 'tuned_font_info_uint16 face';
}

function BFont_Create(AObject : TBeObject) : TCPlusObject;
         cdecl; external BePascalLibName name 'BFont_Create';
function BFont_Create(AObject : TBeObject; font : BFont) : TCPlusObject;
         cdecl; external BePascalLibName name 'BFont_Create_1';
procedure BFont_Free(AObject : TCPlusObject);
          cdecl; external BePascalLibName name 'BFont_Free';
function BFont_SetFamilyAndStyle(AObject : TCPlusObject; family : font_family;
                                 style : font_style) : status_t;
         cdecl; external BePascalLibName name 'BFont_SetFamilyAndStyle';
procedure BFont_SetFamilyAndStyle(AObject : TCPlusObject; code : Longword);
          cdecl; external BePascalLibName name 'BFont_SetFamilyAndStyle';
function BFont_SetFamilyAndFace(AObject : TCPlusObject; family : font_family;
                                face : Word) : status_t;
         cdecl; external BePascalLibName name 'BFont_SetFamilyAndFace';
procedure BFont_SetSize(AObject : TCPlusObject; size : Single);
          cdecl; external BePascalLibName name 'BFont_SetSize';
procedure BFont_SetShear(AObject : TCPlusObject; shear : Single);
          cdecl; external BePascalLibName name 'BFont_SetShear';
procedure BFont_SetRotation(AObject : TCPlusObject; rotation : Single);
          cdecl; external BePascalLibName name 'BFont_SetRotation';
procedure BFont_SetSpacing(AObject : TCPlusObject; spacing : Byte);
          cdecl; external BePascalLibName name 'BFont_SetSpacing';
procedure BFont_SetEncoding(AObject : TCPlusObject; encoding : Byte);
          cdecl; external BePascalLibName name 'BFont_SetEncoding';
procedure BFont_SetFace(AObject : TCPlusObject; face : Word);
          cdecl; external BePascalLibName name 'BFont_SetFace';
procedure BFont_SetFlags(AObject : TCPlusObject; flags : Longword);
          cdecl; external BePascalLibName name 'BFont_SetFlags';
procedure BFont_GetFamilyAndStyle(AObject : TCPlusObject; family : font_family;
                                  style : font_style);
          cdecl; external BePascalLibName name 'BFont_GetFamilyAndStyle';
function BFont_FamilyAndStyle(AObject : TCPlusObject) : Longword;
         cdecl; external BePascalLibName name 'BFont_FamilyAndStyle';
function BFont_Size(AObject : TCPlusObject) : Single;
         cdecl; external BePascalLibName name 'BFont_Size';
function BFont_Shear(AObject : TCPlusObject) : Single;
         cdecl; external BePascalLibName name 'BFont_Shear';
function BFont_Rotation(AObject : TCPlusObject) : Single;
         cdecl; external BePascalLibName name 'BFont_Rotation';
function BFont_Spacing(AObject : TCPlusObject) : Byte;
         cdecl; external BePascalLibName name 'BFont_Spacing';
function BFont_Encoding(AObject : TCPlusObject) : Byte;
         cdecl; external BePascalLibName name 'BFont_Encoding';
function BFont_Face(AObject : TCPlusObject) : Word;
         cdecl; external BePascalLibName name 'BFont_Face';
function BFont_Flags(AObject : TCPlusObject) : Longword;
         cdecl; external BePascalLibName name 'BFont_Flags';
function BFont_Direction(AObject : TCPlusObject) : Font_direction; cdecl; external BePascalLibName name 'BFont_Direction';
function BFont_IsFixed(AObject : TCPlusObject) : Boolean; cdecl; external BePascalLibName name 'BFont_IsFixed';
function BFont_IsFullAndHalfFixed(AObject : TCPlusObject) : Boolean;
         cdecl; external BePascalLibName name 'BFont_IsFullAndHalfFixed';
function BFont_BoundingBox(AObject : TCPlusObject) : BRect;
         cdecl; external BePascalLibName name 'BFont_BoundingBox';
//function BFont_Blocks(AObject : TCPlusObject) : ; cdecl; external BePascalLibName name 'BFont_Blocks';
function BFont_FileFormat(AObject : TCPlusObject) : font_file_format;
         cdecl; external BePascalLibName name 'BFont_FileFormat';
function BFont_CountTuned(AObject : TCPlusObject) : Longint;
         cdecl; external BePascalLibName name 'BFont_CountTuned';
procedure BFont_GetTunedInfo(AObject : TCPlusObject; index : Longint;
                             info : tuned_font_info);
          cdecl; external BePascalLibName name 'BFont_GetTunedInfo';
procedure BFont_TruncateString(AObject : TCPlusObject; in_out : TCPlusObject;
                               mode : Longword; width : Single);
          cdecl; external BePascalLibName name 'BFont_TruncateString';
//procedure BFont_GetTruncatedStrings(AObject : TCPlusObject; stringArray : PChar; numStrings : integer; mode : Cardinal; width : single; resultArray : ); cdecl; external BePascalLibName name 'BFont_GetTruncatedStrings';
//procedure BFont_GetTruncatedStrings(AObject : TCPlusObject; stringArray : PChar; numStrings : integer; mode : Cardinal; width : single; resultArray : PChar); cdecl; external BePascalLibName name 'BFont_GetTruncatedStrings';
function BFont_StringWidth(AObject : TCPlusObject; astring : PChar) : Single;
         cdecl; external BePascalLibName name 'BFont_StringWidth';
function BFont_StringWidth(AObject : TCPlusObject; astring : PChar;
                           length : Longint) : Single;
         cdecl; external BePascalLibName name 'BFont_StringWidth';
//procedure BFont_GetStringWidths(AObject : TCPlusObject; stringArray : PChar; lengthArray : ; numStrings : integer; widthArray : single); cdecl; external BePascalLibName name 'BFont_GetStringWidths';
//procedure BFont_GetEscapements(AObject : TCPlusObject; charArray : ; numChars : integer; escapementArray : single); cdecl; external BePascalLibName name 'BFont_GetEscapements';
//procedure BFont_GetEscapements(AObject : TCPlusObject; charArray : ; numChars : integer; delta : ; escapementArray : single); cdecl; external BePascalLibName name 'BFont_GetEscapements';
//procedure BFont_GetEscapements(AObject : TCPlusObject; charArray : ; numChars : integer; delta : ; escapementArray : TPoint); cdecl; external BePascalLibName name 'BFont_GetEscapements';
//procedure BFont_GetEscapements(AObject : TCPlusObject; charArray : ; numChars : integer; delta : ; escapementArray : TPoint; offsetArray : TPoint); cdecl; external BePascalLibName name 'BFont_GetEscapements';
//procedure BFont_GetEdges(AObject : TCPlusObject; charArray : ; numBytes : integer; edgeArray : ); cdecl; external BePascalLibName name 'BFont_GetEdges';
procedure BFont_GetHeight(AObject : TCPlusObject; height : font_height );
          cdecl; external BePascalLibName name 'BFont_GetHeight';

{procedure BFont_GetBoundingBoxesAsGlyphs(AObject : TCPlusObject; charArray : ; numChars : integer; mode : ; boundingBoxArray : BRect); cdecl; external BePascalLibName name 'BFont_GetBoundingBoxesAsGlyphs';
procedure BFont_GetBoundingBoxesAsString(AObject : TCPlusObject; charArray : ; numChars : integer; mode : ; delta : ; boundingBoxArray : BRect); cdecl; external BePascalLibName name 'BFont_GetBoundingBoxesAsString';
procedure BFont_GetBoundingBoxesForStrings(AObject : TCPlusObject; stringArray : PChar; numStrings : integer; mode : ; deltas : ; boundingBoxArray : BRect); cdecl; external BePascalLibName name 'BFont_GetBoundingBoxesForStrings';
procedure BFont_GetGlyphShapes(AObject : TCPlusObject; charArray : ; numChars : integer; glyphShapeArray : ); cdecl; external BePascalLibName name 'BFont_GetGlyphShapes';
procedure BFont_GetHasGlyphs(AObject : TCPlusObject; charArray : ; numChars : integer; hasArray : boolean); cdecl; external BePascalLibName name 'BFont_GetHasGlyphs';
function BFont_operator=(AObject : TCPlusObject; font : ) : ; cdecl; external BePascalLibName name 'BFont_operator=';
function BFont_operator==(AObject : TCPlusObject; font : ) : boolean; cdecl; external BePascalLibName name 'BFont_operator==';
function BFont_operator!=(AObject : TCPlusObject; font : ) : boolean; cdecl; external BePascalLibName name 'BFont_operator!=';
}
procedure BFont_PrintToStream(AObject : TCPlusObject);
          cdecl; external BePascalLibName name 'BFont_PrintToStream';
{procedure BFont_uint16 fFamilyID(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BFont_uint16 fFamilyID';
procedure BFont_uint16 fStyleID(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BFont_uint16 fStyleID';
procedure BFont_float fSize(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BFont_float fSize';
procedure BFont_float fShear(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BFont_float fShear';
procedure BFont_float fRotation(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BFont_float fRotation';
procedure BFont_uint8 fSpacing(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BFont_uint8 fSpacing';
procedure BFont_uint8 fEncoding(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BFont_uint8 fEncoding';
procedure BFont_uint16 fFace(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BFont_uint16 fFace';
procedure BFont_uint32 fFlags(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BFont_uint32 fFlags';
procedure BFont_font_height fHeight(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BFont_font_height fHeight';
procedure BFont_int32 fPrivateFlags(AObject : TCPlusObject); cdecl; external BePascalLibName name 'BFont_int32 fPrivateFlags';
procedure BFont_uint32 _reserved[2](AObject : TCPlusObject); cdecl; external BePascalLibName name 'BFont_uint32 _reserved[2]';
procedure BFont_SetPacket(AObject : TCPlusObject; packet : Pointer); cdecl; external BePascalLibName name 'BFont_SetPacket';
procedure BFont_GetTruncatedStrings64(AObject : TCPlusObject; stringArray : PChar; numStrings : integer; mode : Cardinal; width : single; resultArray : PChar); cdecl; external BePascalLibName name 'BFont_GetTruncatedStrings64';
procedure BFont_GetTruncatedStrings64(AObject : TCPlusObject; stringArray : PChar; numStrings : integer; mode : Cardinal; width : single; resultArray : ); cdecl; external BePascalLibName name 'BFont_GetTruncatedStrings64';
procedure BFont__GetEscapements_(AObject : TCPlusObject; charArray : ; numChars : integer; delta : ; mode : ; escapements : single; offsets : single); cdecl; external BePascalLibName name 'BFont__GetEscapements_';
procedure BFont__GetBoundingBoxes_(AObject : TCPlusObject; charArray : ; numChars : integer; mode : ; string_escapement : boolean; delta : ; boundingBoxArray : BRect); cdecl; external BePascalLibName name 'BFont__GetBoundingBoxes_';
}

//----- BFont related declarations -------------------------------
var
  be_plain_font : BFont; cvar; external;
  be_bold_font  : BFont; cvar; external;
  be_fixed_font : BFont; cvar; external;

function count_font_families : Longint;
         cdecl; external 'be' name 'count_font_families__Fv';
function get_font_family(index : Longint; var name : font_family;
                         var flags : Longword {$ifndef VER1_0}= nil{$endif})
         : status_t; cdecl; external 'be' name 'get_font_family__FlPA64_cPUl';

function count_font_styles(name : font_family) : Longint;
         cdecl; external 'be' name 'count_font_styles__FPc';

function get_font_style(family : font_family; index : Longint;
                        var name : font_style; var flags : Longword {$ifndef VER1_0}= nil{$endif})
         : status_t; cdecl; external 'be' name 'get_font_style__FPclPA64_cPUl';

function get_font_style(family : font_family; index : Longint;
                        var name : font_style; var face : Word;
                        var flags : Longword {$ifndef VER1_0}= nil{$endif})
         : status_t; cdecl; external 'be' name 'get_font_style__FPclPA64_cPUsPUl';

function update_font_families(check_only : Boolean) : Boolean;
         cdecl; external 'be' name 'update_font_families__Fb';

function get_font_cache_info(id : Longword; var _set : Pointer) : status_t;
         cdecl; external 'be' name 'get_font_cache_info__FUlPv';
function set_font_cache_info(id : Longword; var _set : Pointer) : status_t;
         cdecl; external 'be' name 'set_font_cache_info__FUlPv';

implementation

constructor  BFont.Create;
begin
  inherited Create;
  CPlusObject := BFont_Create(Self);
end;

constructor  BFont.Create(font : BFont);
begin
  inherited Create;
  CPlusObject := BFont_Create(Self, font);
end;

destructor  BFont.Destroy;
begin
  if CPlusObject <> nil then
    BFont_Free(CPlusObject);
  inherited;
end;

function  BFont.SetFamilyAndStyle(family : font_family; style : font_style) : status_t;
begin
  Result := BFont_SetFamilyAndStyle(CPlusObject, family, style);
end;

procedure  BFont.SetFamilyAndStyle(code : Longword);
begin
  BFont_SetFamilyAndStyle(CPlusObject, code);
end;

function  BFont.SetFamilyAndFace(family : Font_family; aface : Word) : status_t;
begin
  Result := BFont_SetFamilyAndFace(CPlusObject, family, aface);
end;

procedure  BFont.SetSize(asize : Single);
begin
  BFont_SetSize(CPlusObject, asize);
end;

procedure  BFont.SetShear(ashear : Single);
begin
  BFont_SetShear(CPlusObject, ashear);
end;

procedure  BFont.SetRotation(arotation : Single);
begin
  BFont_SetRotation(CPlusObject, arotation);
end;

procedure  BFont.SetSpacing(aspacing : Byte);
begin
  BFont_SetSpacing(CPlusObject, aspacing);
end;

procedure  BFont.SetEncoding(aencoding : Byte);
begin
  BFont_SetEncoding(CPlusObject, aencoding);
end;

procedure  BFont.SetFace(aface : Word);
begin
  BFont_SetFace(CPlusObject, aface);
end;

procedure  BFont.SetFlags(aflags : Longword);
begin
  BFont_SetFlags(CPlusObject, aflags);
end;

procedure  BFont.GetFamilyAndStyle(family : font_family; style : font_style);
begin
  BFont_GetFamilyAndStyle(CPlusObject, family, style);
end;

function  BFont.FamilyAndStyle : Longword;
begin
  Result := BFont_FamilyAndStyle(CPlusObject);
end;

function  BFont.Size : Single;
begin
  Result := BFont_Size(CPlusObject);
end;

function  BFont.Shear : Single;
begin
  Result := BFont_Shear(CPlusObject);
end;

function  BFont.Rotation : Single;
begin
  Result := BFont_Rotation(CPlusObject);
end;

function  BFont.Spacing : Byte;
begin
  Result := BFont_Spacing(CPlusObject);
end;

function  BFont.Encoding : Byte;
begin
  Result := BFont_Encoding(CPlusObject);
end;

function  BFont.Face : Word;
begin
  Result := BFont_Face(CPlusObject);
end;

function  BFont.Flags : Longword;
begin
  Result := BFont_Flags(CPlusObject);
end;

function  BFont.Direction : font_direction;
begin
  Result := BFont_Direction(CPlusObject);
end;

function  BFont.IsFixed : Boolean;
begin
  Result := BFont_IsFixed(CPlusObject);
end;

function  BFont.IsFullAndHalfFixed : Boolean;
begin
  Result := BFont_IsFullAndHalfFixed(CPlusObject);
end;

function  BFont.BoundingBox : BRect;
begin
  Result := BFont_BoundingBox(CPlusObject);
end;

{
function  BFont.Blocks : ;
begin
  Result := BFont_Blocks(CPlusObject);
end;
}

function  BFont.FileFormat : font_file_format;
begin
  Result := BFont_FileFormat(CPlusObject);
end;

function  BFont.CountTuned : Integer;
begin
  Result := BFont_CountTuned(CPlusObject);
end;

procedure  BFont.GetTunedInfo(index : Longint; info : tuned_font_info);
begin
  BFont_GetTunedInfo(CPlusObject, index, info);
end;

procedure  BFont.TruncateString(in_out : BString; mode : Longword; width : Single);
begin
  BFont_TruncateString(CPlusObject, in_out.CPlusObject, mode, width);
end;

{procedure  BFont.GetTruncatedStrings(stringArray : PChar; numStrings : integer; mode : Cardinal; width : single; resultArray : );
begin
  BFont_GetTruncatedStrings(CPlusObject, stringArray, numStrings, mode, width, resultArray.CPlusObject);
end;

procedure  BFont.GetTruncatedStrings(stringArray : PChar; numStrings : integer; mode : Cardinal; width : single; resultArray : PChar);
begin
  BFont_GetTruncatedStrings(CPlusObject, stringArray, numStrings, mode, width, resultArray);
end;
}

function  BFont.StringWidth(astring : PChar) : Single;
begin
  Result := BFont_StringWidth(CPlusObject, astring);
end;

function  BFont.StringWidth(astring : PChar; length : Longint) : Single;
begin
  Result := BFont_StringWidth(CPlusObject, astring, length);
end;

{procedure  BFont.GetStringWidths(stringArray : PChar; lengthArray : integer ; numStrings : integer; widthArray : single);
begin
  BFont_GetStringWidths(CPlusObject, stringArray, lengthArray, numStrings, widthArray);
end;

procedure  BFont.GetEscapements(charArray : PChar; numChars : integer; escapementArray : single);
begin
  BFont_GetEscapements(CPlusObject, charArray, numChars, escapementArray);
end;

procedure  BFont.GetEscapements(charArray : ; numChars : integer; delta : ; escapementArray : single);
begin
  BFont_GetEscapements(CPlusObject, charArray, numChars, delta, escapementArray);
end;

procedure  BFont.GetEscapements(charArray : ; numChars : integer; delta : ; escapementArray : TPoint);
begin
  BFont_GetEscapements(CPlusObject, charArray, numChars, delta, escapementArray.CPlusObject);
end;

procedure  BFont.GetEscapements(charArray : ; numChars : integer; delta : ; escapementArray : TPoint; offsetArray : TPoint);
begin
  BFont_GetEscapements(CPlusObject, charArray, numChars, delta, escapementArray.CPlusObject, offsetArray.CPlusObject);
end;

procedure  BFont.GetEdges(charArray : ; numBytes : integer; edgeArray : );
begin
  BFont_GetEdges(CPlusObject, charArray, numBytes, edgeArray);
end;
}

procedure  BFont.GetHeight(height : font_height);
begin
  BFont_GetHeight(CPlusObject, height);
end;

{
procedure  BFont.GetBoundingBoxesAsGlyphs(charArray : ; numChars : integer; mode : ; boundingBoxArray : BRect);
begin
  BFont_GetBoundingBoxesAsGlyphs(CPlusObject, charArray, numChars, mode, boundingBoxArray.CPlusObject);
end;

procedure  BFont.GetBoundingBoxesAsString(charArray : ; numChars : integer; mode : ; delta : ; boundingBoxArray : BRect);
begin
  BFont_GetBoundingBoxesAsString(CPlusObject, charArray, numChars, mode, delta, boundingBoxArray.CPlusObject);
end;

procedure  BFont.GetBoundingBoxesForStrings(stringArray : PChar; numStrings : integer; mode : ; deltas : ; boundingBoxArray : BRect);
begin
  BFont_GetBoundingBoxesForStrings(CPlusObject, stringArray, numStrings, mode, deltas, boundingBoxArray.CPlusObject);
end;

procedure  BFont.GetGlyphShapes(charArray : ; numChars : integer; glyphShapeArray : );
begin
  BFont_GetGlyphShapes(CPlusObject, charArray, numChars, glyphShapeArray.CPlusObject);
end;

procedure  BFont.GetHasGlyphs(charArray : ; numChars : integer; hasArray : boolean);
begin
  BFont_GetHasGlyphs(CPlusObject, charArray, numChars, hasArray);
end;
}
procedure  BFont.PrintToStream;
begin
  BFont_PrintToStream(CPlusObject);
end;

end.