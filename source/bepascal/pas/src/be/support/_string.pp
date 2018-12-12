{   BePascal - A pascal wrapper around the BeOS API
    Copyright (C) 2002-2003 Eric Jourde
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
unit _String;

interface

uses
  BeObj, SupportDefs, OS;

type
  BString = class(TBeObject)
  public
    constructor Create; override;
   // constructor Create(value : PChar); override;
    destructor Destroy; override;

   function CountChars : Integer;
   function Length     : Integer;
   function String_pchar : PChar;

   // Affectation
   procedure SetTo(value : PChar; _length : Cardinal);
   procedure SetTo(from : BString);
   procedure SetTo(value : BString; _length : Cardinal);
   procedure Adopt(from : BString);
  end;

function BString_Create(AObject : TBeObject) : TCPlusObject;
         cdecl; external BePascalLibName name 'BString_Create';
function BString_Create(AObject : TBeObject; value : PChar) : TCPlusObject;
         cdecl; external BePascalLibName name 'BString_Create_1';
procedure BString_Free(AObject : TCPlusObject);
          cdecl; external BePascalLibName name 'BString_Free';
function BString_CountChars(AObject : TCPlusObject) : Cardinal;
         cdecl; external BePascalLibName name 'BString_CountChars';
function BString_Length(AObject : TCPlusObject) : Cardinal;
         cdecl; external BePascalLibName name 'BString_Length';
function BString_String(AObject : TCPlusObject) : Pchar;
         cdecl; external BePascalLibName name 'BString_String';

procedure BString_SetTo(AObject : TCPlusObject; value : Pchar; length : Cardinal);
          cdecl; external BePascalLibName name 'BString_SetTo';
procedure BString_SetTo_1(AObject : TCPlusObject; from : TBeObject);
          cdecl; external BePascalLibName name 'BString_SetTo_1';
procedure BString_SetTo_2(AObject : TCPlusObject; value : TBeObject; length : Cardinal);
          cdecl; external BePascalLibName name 'BString_SetTo_2';

procedure BString_Adopt(AObject : TCPlusObject; from : TBeObject);
          cdecl; external BePascalLibName name 'BString_Adopt';

{
BString &
BString_Adopt_1(BString *String, BString &from,
               int32 length)

BString &
BString_SetTo_3(BString *String, char value,
               int32 count)

BString &
BString_CopyInto(BString *String, BString &into,
                  int32 fromOffset,
                  int32 length)

void
BString_CopyInto_1
(BString *String, char *into,
                  int32 fromOffset,
                  int32 length)

BString &
BString_Append(BString *String, const BString &value,
                int32 length)

BString &
BString_Append_1
(BString *String, const char *value,
                int32 length)

BString &
BString_Append_2
(BString *String, char value,
                int32 count)

BString &
BString_Prepend(BString *String, const char *value)

BString &
BString_Prepend_1
(BString *String, const BString &value)

BString &
BString_Prepend_2
(BString *String, const char *value,
                 int32 length)

BString &
BString_Prepend_3
(BString *String, const BString &value,
                 int32 length)

BString &
BString_Prepend_4
(BString *String, char value,
                 int32 count)

BString &
BString_Insert(BString *String, const char *value,
                int32 pos)

BString &
BString_Insert_1
(BString *String, const char *value,
                int32 length,
                int32 pos)

BString &
BString_Insert_2
(BString *String, const char *value,
                int32 fromOffset,
                int32 length,
                int32 pos)

BString &
BString_Insert_3
(BString *String, const BString &value,
                int32 pos)

BString &
BString_Insert_4
(BString *String, const BString &value,
                int32 length,
                int32 pos)

BString &
BString_Insert_5
(BString *String, const BString &value,
                int32 fromOffset,
                int32 length,
                int32 pos)

BString &
BString_Insert_6
(BString *String, char value,
                int32 count,
                int32 pos)

BString &
BString_Truncate(BString *String, int32 newLength,
                  bool lazy)

BString &
BString_Remove(BString *String, int32 from,
                int32 length)

BString &
BString_RemoveFirst_1
(BString *String, const BString &value)

BString &
BString_RemoveLast(BString *String, const BString &value)

BString &
BString_RemoveAll(BString *String, const BString &value)

BString &
BString_RemoveFirst(BString *String, const char *value)

BString &
BString_RemoveLast_1(BString *String, const char *value)

BString &
BString_RemoveAll_1(BString *String, const char *value)

BString &
BString_RemoveSet(BString *String, const char *setOfCharsToRemove)

BString &
BString_MoveInto(BString *String, BString &into,
                  int32 from,
                  int32 length)

void
BString_MoveInto_1
(BString *String, char *into,
                  int32 from,
                  int32 length)

int
BString_Compare(BString *String, const BString &value)

int
BString_Compare_1
(BString *String, const char *value)

int
BString_Compare_2
(BString *String, const BString &value,
                 int32 n)

int
BString_Compare_3
(BString *String, const char *value,
                 int32 n)

int
BString_ICompare(BString *String, const BString &value)

int
BString_ICompare_1
(BString *String, const char *value)

int
BString_ICompare_2
(BString *String, const BString &value,
                  int32 n)

int
BString_ICompare_3
(BString *String, const char *value,
                  int32 n)

int32
BString_FindFirst(BString *String, const BString &value)

int32
BString_FindFirst_1
(BString *String, const char *value)

int32
BString_FindFirst_2
(BString *String, const BString &value,
                   int32 fromOffset)

int32
BString_FindFirst_3
(BString *String, const char *value,
                   int32 fromOffset)

int32
BString_FindFirst_4
(BString *String, char value)

int32
BString_FindFirst_5
(BString *String, char value,
                   int32 fromOffset)

int32
BString_FindLast(BString *String, const BString &value)

int32
BString_FindLast_1
(BString *String, const char *value)

int32
BString_FindLast_2
(BString *String, const BString &value,
                  int32 beforeOffset)

int32
BString_FindLast_3
(BString *String, const char *value,
                  int32 beforeOffset)

int32
BString_FindLast_4
(BString *String, char value)

int32
BString_FindLast_5
(BString *String, char value,
                  int32 fromOffset)

int32
BString_IFindFirst(BString *String, const BString &value)

int32
BString_IFindFirst_1
(BString *String, const char *value)

int32
BString_IFindFirst_2
(BString *String, const BString &value,
                    int32 fromOffset)

int32
BString_IFindFirst_3
(BString *String, const char *value,
                    int32 fromOffset)

int32
BString_IFindLast(BString *String, const BString &value)

int32
BString_IFindLast_1
(BString *String, const char *value)

int32
BString_IFindLast_2
(BString *String, const BString &value,
                   int32 beforeOffset)

int32
BString_IFindLast_3
(BString *String, const char *value,
                   int32 beforeOffset)

BString &
BString_ReplaceFirst(BString *String, char replaceThis,
                      char withThis)

BString &
BString_ReplaceLast(BString *String, char replaceThis,
                     char withThis)

BString &
BString_ReplaceAll(BString *String, char replaceThis,
                    char withThis,
                    int32 fromOffset)

BString &
BString_Replace(BString *String, char replaceThis,
                 char withThis,
                 int32 maxReplaceCount,
                 int32 fromOffset)

BString &
BString_ReplaceFirst_1
(BString *String, const char *replaceThis,
                      const char *withThis)

BString &
BString_ReplaceLast_1(BString *String, const char *replaceThis,
                     const char *withThis)

BString &
BString_ReplaceAll_1(BString *String, const char *replaceThis,
                    const char *withThis,
                    int32 fromOffset)

BString &
BString_Replace_1(BString *String, const char *replaceThis,
                 const char *withThis,
                 int32 maxReplaceCount,
                 int32 fromOffset)

BString &
BString_IReplaceFirst(BString *String, char replaceThis,
                       char withThis)

BString &
BString_IReplaceLast(BString *String, char replaceThis,
                      char withThis)

BString &
BString_IReplaceAll(BString *String, char replaceThis,
                     char withThis,
                     int32 fromOffset)

BString &
BString_IReplace(BString *String, char replaceThis,
                  char withThis,
                  int32 maxReplaceCount,
                  int32 fromOffset)

BString &
BString_IReplaceFirst_1
(BString *String, const char *replaceThis,
                       const char *withThis)

BString &
BString_IReplaceLast_1(BString *String, const char *replaceThis,
                      const char *withThis)

BString &
BString_IReplaceAll_1(BString *String, const char *replaceThis,
                     const char *withThis,
                     int32 fromOffset)

BString &
BString_IReplace_1(BString *String, const char *replaceThis,
                  const char *withThis,
                  int32 maxReplaceCount,
                  int32 fromOffset)

BString &
BString_ReplaceSet(BString *String, const char *setOfChars,
                    char with)

BString &
BString_ReplaceSet_1
(BString *String, const char *setOfChars,
                    const char *with)

char *
BString_LockBuffer(BString *String, int32 maxLength)

BString &
BString_UnlockBuffer(BString *String, int32 length)

BString &
BString_ToLower(BString *String)

BString &
BString_ToUpper(BString *String)

BString &
BString_Capitalize(BString *String)

BString &
BString_CapitalizeEachWord_1
(BString *String)

BString &
BString_CharacterEscape(BString *String, const char *original,
                         const char *setOfCharsToEscape,
                         char escapeWith)

BString &
BString_CharacterEscape_1
(BString *String, const char *setOfCharsToEscape,
                         char escapeWith)

BString &
BString_CharacterDeescape(BString *String, const char *original,
                           char escapeChar)

BString &
BString_CharacterDeescape_1
(BString *String, char escapeChar)
}

implementation

constructor BString.Create;
begin
  inherited;
  CPlusObject := BString_Create(Self);
end;

{
constructor BString.Create_1(value : PChar);
begin
  inherited;
  CPlusObject := BString_Create_1(Self, value);
end;
}

destructor BString.Destroy;
begin
  if CPlusObject <> nil then
    BString_Free(CPlusObject);
  inherited;
end;

function BString.CountChars : Integer;
begin
  Result := BString_CountChars(CPlusObject);
end;

function BString.Length : Integer;
begin
  Result := BString_Length(CPlusObject);
end;

function BString.String_pchar : PChar;
begin
  Result := BString_String(CPlusObject);
end;

procedure BString.SetTo(value : PChar; _length : Cardinal);
begin
  BString_SetTo(CPlusObject, value, _length);
end;

procedure BString.SetTo(from : BString);
begin
  BString_SetTo_1(CPlusObject, from);
end;

procedure BString.SetTo(value : BString; _length : Cardinal);
begin
  BString_SetTo_2(CPlusObject, value, _length);
end;

procedure BString.Adopt(from : BString);
begin
  BString_Adopt(CPlusObject, from);
end;

end.